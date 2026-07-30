/*----------------------------------------------------------------------------------------------------------------------*/
-- Using SEQUENCES to insert table
CREATE SEQUENCE mission_add_seq
START WITH 11
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Create the Package Specification
CREATE OR REPLACE PACKAGE MissionManager AS
    PROCEDURE CreateMissionSequence;
    PROCEDURE AddMission(
        p_name            IN VARCHAR2,
        p_purpose         IN VARCHAR2,
        p_start_date      IN DATE,
        p_end_date        IN DATE,
        p_lead_id         IN NUMBER,
        p_affiliation_id  IN NUMBER
    );
END MissionManager;
/

-- Create the Package Body
CREATE OR REPLACE PACKAGE BODY MissionManager AS

    PROCEDURE CreateMissionSequence IS
    BEGIN
        EXECUTE IMMEDIATE '
            CREATE SEQUENCE mission_add_seq
            START WITH 11
            INCREMENT BY 1
            NOCACHE
            NOCYCLE
        ';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN  -- Sequence already exists
                NULL;
            ELSE
                RAISE;
            END IF;
    END CreateMissionSequence;

    PROCEDURE AddMission(
        p_name            IN VARCHAR2,
        p_purpose         IN VARCHAR2,
        p_start_date      IN DATE,
        p_end_date        IN DATE,
        p_lead_id         IN NUMBER,
        p_affiliation_id  IN NUMBER
    ) IS
        v_id NUMBER;
    BEGIN
        SELECT mission_add_seq.NEXTVAL INTO v_id FROM dual;

        INSERT INTO missions (
            mission_id, mission_name, mission_purpose, 
            start_date, end_date, lead_researcher_id, affiliation_id
        ) VALUES (
            v_id, p_name, p_purpose, p_start_date, p_end_date, p_lead_id, p_affiliation_id
        );
    END AddMission;

END MissionManager;
/

-- Use the first sequences by anonymous block
CREATE OR REPLACE PROCEDURE AddNewMissions IS
BEGIN
    MissionManager.AddMission(
        'Europa Ice Survey',
        'Study of Subsurface Oceans',
        TO_DATE('2025-01-01', 'YYYY-MM-DD'),
        NULL,
        5,
        1
    );

    MissionManager.AddMission(
        'Artemis II',
        'Return Humans to the Moon',
        TO_DATE('2025-05-01', 'YYYY-MM-DD'),
        NULL,
        6,
        2
    );
END;
/

BEGIN
    AddNewMissions;
END;
/

SELECT * FROM missions;

/*----------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------*/
-- Using SEQUENCES to update table
CREATE SEQUENCE mission_update_seq
START WITH 13
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Package Specification
CREATE OR REPLACE PACKAGE MissionUpdater AS
    PROCEDURE CreateUpdateSequence;
    PROCEDURE UpdateMissionID(
        p_mission_name     IN VARCHAR2,
        p_new_purpose      IN VARCHAR2,
        p_new_lead_id      IN NUMBER,
        p_new_affiliation  IN NUMBER
    );
END MissionUpdater;
/

-- Package Body
CREATE OR REPLACE PACKAGE BODY MissionUpdater AS

    PROCEDURE CreateUpdateSequence IS
    BEGIN
        EXECUTE IMMEDIATE '
            CREATE SEQUENCE mission_update_seq
            START WITH 13
            INCREMENT BY 1
            NOCACHE
            NOCYCLE
        ';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN  -- Sequence already exists
                NULL;  -- Do nothing
            ELSE
                RAISE;
            END IF;
    END CreateUpdateSequence;

    PROCEDURE UpdateMissionID(
        p_mission_name     IN VARCHAR2,
        p_new_purpose      IN VARCHAR2,
        p_new_lead_id      IN NUMBER,
        p_new_affiliation  IN NUMBER
    ) IS
        v_new_id NUMBER;
    BEGIN
        EXECUTE IMMEDIATE 'SELECT mission_update_seq.NEXTVAL FROM dual' INTO v_new_id;

        UPDATE Missions
        SET mission_id = v_new_id,
            mission_purpose = p_new_purpose,
            start_date = SYSDATE,
            lead_researcher_id = p_new_lead_id,
            affiliation_id = p_new_affiliation
        WHERE mission_name = p_mission_name;
    END UpdateMissionID;

END MissionUpdater;
/

-- Use the second sequences by anonymous block
CREATE OR REPLACE PROCEDURE UpdateArtemisIIMission IS
BEGIN
    -- Create the update sequence (if not already created)
    MissionUpdater.CreateUpdateSequence;

    -- Perform the mission update
    MissionUpdater.UpdateMissionID(
        p_mission_name    => 'Artemis II',
        p_new_purpose     => 'Human Survival on the Moon',
        p_new_lead_id     => 3,
        p_new_affiliation => 1
    );
END;
/

BEGIN
    UpdateArtemisIIMission;
END;
/

SELECT * FROM missions;

/*----------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------*/
-- Delete the SEQUENCES
DROP SEQUENCE mission_update_seq;
DROP SEQUENCE mission_add_seq;