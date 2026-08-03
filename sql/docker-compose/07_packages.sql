SET SERVEROUTPUT ON;
PROMPT [07_packages] Creating or replacing package specs and bodies...

CREATE OR REPLACE PACKAGE ResearchMatchManager AS
    PROCEDURE ShowMatchingResearchers;
END ResearchMatchManager;
/

CREATE OR REPLACE PACKAGE BODY ResearchMatchManager AS

    -- Global constant for index name
    c_index_name CONSTANT VARCHAR2(30) := 'idx_missions_lead_date';

    -- Private procedure to create index
    PROCEDURE CreateLeadDateIndex IS
    BEGIN
        EXECUTE IMMEDIATE '
            CREATE INDEX ' || c_index_name || '
            ON missions(lead_researcher_id, start_date)
        ';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL; -- Index already exists
            ELSE
                RAISE;
            END IF;
    END;

    -- Public procedure to find matching researchers
    PROCEDURE ShowMatchingResearchers IS
    BEGIN
        -- Ensure index is in place
        CreateLeadDateIndex;

        -- Display matching researchers
        FOR rec IN (
            SELECT researcher_id, researcher_name
            FROM researchers
            WHERE researcher_id IN (
                SELECT m.lead_researcher_id
                FROM (
                        SELECT lead_researcher_id, start_date 
                        FROM missions
                    ) m,
                    (
                        SELECT researcher_id, observation_date 
                        FROM observations
                    ) o
                WHERE m.lead_researcher_id = o.researcher_id
                  AND m.start_date = o.observation_date
            )
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('ID: ' || rec.researcher_id || ' | Name: ' || rec.researcher_name);
        END LOOP;
    END;

END ResearchMatchManager;
/

CREATE OR REPLACE PACKAGE HabitableResearchAnalysis AS
    PROCEDURE ShowMultiAffiliatedResearchers;
END HabitableResearchAnalysis;
/

CREATE OR REPLACE PACKAGE BODY HabitableResearchAnalysis AS

    -- ? Global constant for index name
    c_index_name CONSTANT VARCHAR2(30) := 'idx_r_id_affiliation';

    -- ? Private procedure to create index if not exists
    PROCEDURE CreateResearcherIndex IS
    BEGIN
        EXECUTE IMMEDIATE '
            CREATE INDEX ' || c_index_name || '
            ON researchers(researcher_id, affiliation_id)
        ';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL; -- Index already exists
            ELSE
                RAISE;
            END IF;
    END;

    --  Public procedure to show researchers with multiple planets and affiliations > 1
    PROCEDURE ShowMultiAffiliatedResearchers IS
    BEGIN
        -- Ensure index is created
        CreateResearcherIndex;

        -- Run the query and print the result
        FOR rec IN (
            SELECT 
              r.researcher_name,
              hp.research_id,
              COUNT(*) AS planet_count
            FROM habitable_planets hp
            JOIN researchers r ON r.researcher_id = hp.research_id
            WHERE (
              SELECT affiliation_id 
              FROM researchers r2 
              WHERE r2.researcher_id = r.researcher_id
            ) > 1
            GROUP BY r.researcher_name, hp.research_id
            HAVING COUNT(*) > 1
        ) LOOP
            DBMS_OUTPUT.PUT_LINE(
                'Researcher: ' || rec.researcher_name || 
                ' | ID: ' || rec.research_id || 
                ' | Planets: ' || rec.planet_count
            );
        END LOOP;
    END;

END HabitableResearchAnalysis;
/

CREATE OR REPLACE PACKAGE SIMPLE_HABITABILITY_PKG AS
 
        -- Global constant defining the minimum score for an object to be considered habitable
        G_MIN_HABITABLE_SCORE CONSTANT NUMBER := 5.0;
 
        -- Function to check if a celestial object meets basic habitability criteria
        FUNCTION IS_POTENTIALLY_HABITABLE(
                P_OBJECT_ID IN NUMBER -- Input: ID of the celestial object
        ) RETURN VARCHAR2;
 
        -- Function to retrieve all habitability-related data for a celestial object
        -- Returns a full row from CelestialObjects table using %ROWTYPE
        FUNCTION GET_HABITABILITY_INFO(
                P_OBJECT_ID IN NUMBER -- Input: ID of the celestial object
        ) RETURN CELESTIALOBJECTS%ROWTYPE;
END SIMPLE_HABITABILITY_PKG;
/

CREATE OR REPLACE PACKAGE BODY SIMPLE_HABITABILITY_PKG AS
 
        -- Private variable to track the last object checked (for debugging/logging)
        V_LAST_CHECKED_ID NUMBER := NULL;
 
        -- **Private Helper Function**
        -- Checks if a planet has essential elements (oxygen or water vapor)
        -- Returns TRUE if either oxygen or water vapor is present ('Y')
        FUNCTION HAS_ESSENTIAL_ELEMENTS(
                P_OXYGEN IN CHAR, -- 'Y' if oxygen is present, 'N' otherwise
                P_WATER_VAPOR IN CHAR -- 'Y' if water vapor is present, 'N' otherwise
        ) RETURN BOOLEAN IS
        BEGIN
                RETURN (P_OXYGEN = 'Y'
                OR P_WATER_VAPOR = 'Y');
        END HAS_ESSENTIAL_ELEMENTS;
 

        -- **Public Function 1: Check if an object is potentially habitable**
        FUNCTION IS_POTENTIALLY_HABITABLE(
                P_OBJECT_ID IN NUMBER
        ) RETURN VARCHAR2 IS
 
                -- Declare a variable to hold the full celestial object record
                V_OBJECT CELESTIALOBJECTS%ROWTYPE;
 
                -- Default result is 'No' unless conditions are met
                V_RESULT VARCHAR2(3) := 'No';
        BEGIN
 
                -- Store the last checked ID (for tracking)
                V_LAST_CHECKED_ID := P_OBJECT_ID;
 
                -- Retrieve all habitability data for the given object
                V_OBJECT := GET_HABITABILITY_INFO(P_OBJECT_ID);
 
                -- **Habitability Conditions:**
                -- 1. Score must be >= minimum threshold (5.0)
                -- 2. Must have oxygen or water vapor
                -- 3. Surface temperature must be between -50Â°C and 100Â°C
                IF V_OBJECT.HABITABILITY_SCORE >= G_MIN_HABITABLE_SCORE AND HAS_ESSENTIAL_ELEMENTS(V_OBJECT.OXYGEN, V_OBJECT.WATER_VAPOR) AND V_OBJECT.SURFACE_TEMPERATURE BETWEEN -50 AND 100 THEN
                        V_RESULT := 'Yes'; -- Object meets habitability criteria
                END IF;

                RETURN V_RESULT;
        EXCEPTION
 
                -- Handle case where object ID does not exist
                WHEN NO_DATA_FOUND THEN
                        RAISE_APPLICATION_ERROR(-20001, 'Object ID '
                                                        || P_OBJECT_ID
                                                        || ' not found');
 
                        -- Handle any other unexpected errors
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20002, 'Error checking habitability: '
                                                        || SQLERRM);
        END IS_POTENTIALLY_HABITABLE;
 

        -- **Public Function 2: Retrieve full habitability data for an object**
        FUNCTION GET_HABITABILITY_INFO(
                P_OBJECT_ID IN NUMBER
        ) RETURN CELESTIALOBJECTS%ROWTYPE IS
 
                -- Variable to store the entire row from CelestialObjects
                V_OBJECT CELESTIALOBJECTS%ROWTYPE;
        BEGIN
 
                -- Fetch all columns for the given object ID
                SELECT
                        * INTO V_OBJECT
                FROM
                        CELESTIALOBJECTS
                WHERE
                        OBJECT_ID = P_OBJECT_ID;
                RETURN V_OBJECT; -- Return the complete record
        EXCEPTION
 
                -- Handle missing object
                WHEN NO_DATA_FOUND THEN
                        RAISE_APPLICATION_ERROR(-20003, 'Celestial object not found');
 
                        -- Handle other database errors
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20004, 'Error retrieving object data: '
                                                        || SQLERRM);
        END GET_HABITABILITY_INFO;
END SIMPLE_HABITABILITY_PKG;
/

CREATE OR REPLACE PACKAGE MISSION_ANALYSIS_PKG AS
 
        -- Global constant for mission duration thresholds
        G_LONG_MISSION_THRESHOLD CONSTANT NUMBER := 365; -- 1 year in days
        FUNCTION CALCULATE_MISSION_EFFICIENCY(
                P_MISSION_ID IN NUMBER
        ) RETURN NUMBER;
 
        -- Function to generate mission status report
        FUNCTION GET_MISSION_STATUS(
                P_MISSION_ID IN NUMBER
        ) RETURN VARCHAR2;
 
        -- Function to find missions by celestial object
        FUNCTION FIND_MISSIONS_BY_OBJECT(
                P_OBJECT_ID IN NUMBER
        ) RETURN SYS_REFCURSOR;
END MISSION_ANALYSIS_PKG;
/

CREATE OR REPLACE PACKAGE BODY MISSION_ANALYSIS_PKG AS
 
        -- Private variable to track last analyzed mission
        V_LAST_ANALYZED_ID NUMBER := NULL;
 
        -- Private function to calculate observation success rate
        FUNCTION CALCULATE_SUCCESS_RATE(
                P_MISSION_ID IN NUMBER
        ) RETURN NUMBER IS
                V_TOTAL_OBSERVATIONS      NUMBER := 0;
                V_SUCCESSFUL_OBSERVATIONS NUMBER := 0;
        BEGIN
 
                -- Count total observations for this mission
                SELECT
                        COUNT(*) INTO V_TOTAL_OBSERVATIONS
                FROM
                        MISSION_OBSERVATIONS
                WHERE
                        MISSION_ID = P_MISSION_ID;
 
                -- Count successful observations
                SELECT
                        COUNT(*) INTO V_SUCCESSFUL_OBSERVATIONS
                FROM
                        MISSION_OBSERVATIONS
                WHERE
                        MISSION_ID = P_MISSION_ID
                        AND OBSERVATION_SUCCESS = 'Y';
 
                -- Calculate success percentage
                RETURN CASE WHEN V_TOTAL_OBSERVATIONS > 0 THEN ROUND((V_SUCCESSFUL_OBSERVATIONS / V_TOTAL_OBSERVATIONS) * 100) ELSE 0 END;
        EXCEPTION
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20010, 'Error calculating success rate: '
                                                        || SQLERRM);
        END CALCULATE_SUCCESS_RATE;

        FUNCTION GET_MISSION_DURATION(
                P_MISSION_ID IN NUMBER
        ) RETURN NUMBER IS
                V_DURATION NUMBER;
        BEGIN
                SELECT
                        NVL(END_DATE, SYSDATE) - START_DATE INTO V_DURATION
                FROM
                        MISSIONS
                WHERE
                        MISSION_ID = P_MISSION_ID;
                RETURN V_DURATION;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                        RETURN 0;
        END GET_MISSION_DURATION;

        FUNCTION CALCULATE_MISSION_EFFICIENCY(
                P_MISSION_ID IN NUMBER
        ) RETURN NUMBER IS
                V_SUCCESS_RATE   NUMBER;
                V_DURATION       NUMBER;
                V_DATA_COLLECTED NUMBER := 0;
                V_EFFICIENCY     NUMBER;
        BEGIN
                V_LAST_ANALYZED_ID := P_MISSION_ID;
 
                -- Get success rate
                V_SUCCESS_RATE := CALCULATE_SUCCESS_RATE(P_MISSION_ID);
 
                -- Get mission duration
                V_DURATION := GET_MISSION_DURATION(P_MISSION_ID);
 
                -- Get total data collected (in MB)
                SELECT
                        NVL(SUM(DATA_COLLECTED_SIZE), 0) INTO V_DATA_COLLECTED
                FROM
                        MISSION_OBSERVATIONS
                WHERE
                        MISSION_ID = P_MISSION_ID;
 
                -- Get total data collected (in MB)
                SELECT
                        NVL(SUM(DATA_COLLECTED_SIZE), 0) INTO V_DATA_COLLECTED
                FROM
                        MISSION_OBSERVATIONS
                WHERE
                        MISSION_ID = P_MISSION_ID;
 
                -- Calculate efficiency score (weighted formula)
                V_EFFICIENCY := (V_SUCCESS_RATE * 0.6) + -- Success rate (60%)
                (LEAST(V_DATA_COLLECTED/100, 100) * 0.3) + -- Data collected (30%, capped at 100MB=full score)
                (CASE WHEN V_DURATION < G_LONG_MISSION_THRESHOLD THEN 100 ELSE 50 END * 0.1);
                RETURN LEAST(V_EFFICIENCY, 100); -- Cap at 100
        EXCEPTION
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20011, 'Error calculating efficiency: '
                                                        || SQLERRM);
        END CALCULATE_MISSION_EFFICIENCY;
 

        -- Public function to generate mission status report
        FUNCTION GET_MISSION_STATUS(
                P_MISSION_ID IN NUMBER
        ) RETURN VARCHAR2 IS
                V_MISSION    MISSIONS%ROWTYPE;
                V_STATUS     VARCHAR2(20);
                V_REPORT     VARCHAR2(1000);
                V_EFFICIENCY NUMBER;
        BEGIN
 
                -- Get mission details
                SELECT
                        * INTO V_MISSION
                FROM
                        MISSIONS
                WHERE
                        MISSION_ID = P_MISSION_ID;
 
                -- Determine mission status
                V_STATUS := CASE WHEN V_MISSION.END_DATE IS NULL THEN 'ACTIVE' WHEN SYSDATE - V_MISSION.END_DATE < 30 THEN 'RECENTLY COMPLETED' ELSE 'COMPLETED' END;
                V_EFFICIENCY := CALCULATE_MISSION_EFFICIENCY(P_MISSION_ID);
 
                -- Build report
                V_REPORT := 'Mission: '
                            || V_MISSION.MISSION_NAME
                            || CHR(10)
                            || 'Status: '
                            || V_STATUS
                            || CHR(10)
                            || 'Purpose: '
                            || V_MISSION.MISSION_PURPOSE
                            || CHR(10)
                            || 'Duration: '
                            || ROUND(GET_MISSION_DURATION(P_MISSION_ID))
                            || ' days'
                            || CHR(10)
                            || 'Efficiency Score: '
                            || V_EFFICIENCY
                            || '/100'
                            || CHR(10)
                            || 'Success Rate: '
                            || CALCULATE_SUCCESS_RATE(P_MISSION_ID)
                            || '%'
                            || CHR(10)
                            || 'Lead Researcher ID: '
                            || V_MISSION.LEAD_RESEARCHER_ID;
                RETURN V_REPORT;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                        RETURN 'Mission not found';
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20012, 'Error generating status report: '
                                                        || SQLERRM);
        END GET_MISSION_STATUS;

        FUNCTION FIND_MISSIONS_BY_OBJECT(
                P_OBJECT_ID IN NUMBER
        ) RETURN SYS_REFCURSOR IS
                V_CURSOR SYS_REFCURSOR; --provides a way to quickly declare a weakly typed REF cursor that can process almost any cursor
        BEGIN
                OPEN V_CURSOR FOR
                        SELECT
                                DISTINCT M.MISSION_ID,
                                M.MISSION_NAME,
                                M.MISSION_PURPOSE
                        FROM
                                MISSIONS             M
                                JOIN MISSION_OBSERVATIONS MO
                                ON M.MISSION_ID = MO.MISSION_ID
                                JOIN OBSERVATIONS O
                                ON MO.OBSERVATION_ID = O.OBSERVATION_ID
                        WHERE
                                O.OBJECT_ID = P_OBJECT_ID;
                RETURN V_CURSOR;
        EXCEPTION
                WHEN OTHERS THEN
                        RAISE_APPLICATION_ERROR(-20013, 'Error finding missions: '
                                                        || SQLERRM);
        END FIND_MISSIONS_BY_OBJECT;
END MISSION_ANALYSIS_PKG;
/

