SET SERVEROUTPUT ON;
PROMPT [legacy_packages] Optional legacy demonstration packages.
PROMPT [legacy_packages] This script is NOT called by bootstrap_all.sql.
PROMPT [legacy_packages] Compile manually only when demonstration APIs are needed.

/*
  Optional scope:
  - CELESTIALMANAGER: demo package that inserts sample celestial objects when explicitly called.
  - SPACERESEARCHPACKAGE: demo CRUD-style wrappers limited to add/update operations.

  Explicitly excluded:
  - CELESTIALUPDATER: retired from demo compile because it rewrites OBJECT_ID values and can break FK integrity.

  This file intentionally does not execute any procedure calls.
*/

CREATE OR REPLACE PACKAGE CelestialManager AS
    PROCEDURE AddDefaultCelestialObjects;
END CelestialManager;
/

CREATE OR REPLACE PACKAGE BODY CelestialManager AS

    c_default_score CONSTANT NUMBER := 7.0;

    PROCEDURE AddDefaultCelestialObjects IS
        v_id NUMBER;
        v_name VARCHAR2(30);
        v_cat VARCHAR2(50);
        v_dist NUMBER;
        v_score NUMBER;
        v_grav NUMBER;
    BEGIN
        SELECT celestial_add_seq.NEXTVAL INTO v_id FROM dual;
        INSERT INTO CelestialObjects (
            object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
            habitability_score, surface_temperature, gravity,
            nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
        )
        VALUES (
            v_id, 'Proxima b', 'Exoplanet', 4.24, TO_DATE('2016-08-24', 'YYYY-MM-DD'), 'N',
            c_default_score, 0.0, 1.10,
            'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
        );

        SELECT object_name, category, distance_light_years, habitability_score, gravity
          INTO v_name, v_cat, v_dist, v_score, v_grav
          FROM CelestialObjects
         WHERE object_id = v_id;

        DBMS_OUTPUT.PUT_LINE('Inserted Object 1:');
        DBMS_OUTPUT.PUT_LINE('  ID: ' || v_id);
        DBMS_OUTPUT.PUT_LINE('  Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('  Category: ' || v_cat);
        DBMS_OUTPUT.PUT_LINE('  Distance: ' || v_dist || ' ly');
        DBMS_OUTPUT.PUT_LINE('  Habitability Score: ' || v_score);
        DBMS_OUTPUT.PUT_LINE('  Gravity: ' || v_grav);
        DBMS_OUTPUT.PUT_LINE('---------------------------');

        SELECT celestial_add_seq.NEXTVAL INTO v_id FROM dual;
        INSERT INTO CelestialObjects (
            object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
            habitability_score, surface_temperature, gravity,
            nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
        )
        VALUES (
            v_id, 'OGLE-2016-BLG-1195Lb', 'Exoplanet', 13000, TO_DATE('2017-04-26', 'YYYY-MM-DD'), 'N',
            c_default_score - 0.5, -220.0, 0.75,
            'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
        );

        SELECT object_name, category, distance_light_years, habitability_score, gravity
          INTO v_name, v_cat, v_dist, v_score, v_grav
          FROM CelestialObjects
         WHERE object_id = v_id;

        DBMS_OUTPUT.PUT_LINE('Inserted Object 2:');
        DBMS_OUTPUT.PUT_LINE('  ID: ' || v_id);
        DBMS_OUTPUT.PUT_LINE('  Name: ' || v_name);
        DBMS_OUTPUT.PUT_LINE('  Category: ' || v_cat);
        DBMS_OUTPUT.PUT_LINE('  Distance: ' || v_dist || ' ly');
        DBMS_OUTPUT.PUT_LINE('  Habitability Score: ' || v_score);
        DBMS_OUTPUT.PUT_LINE('  Gravity: ' || v_grav);
        DBMS_OUTPUT.PUT_LINE('---------------------------');
    END AddDefaultCelestialObjects;

END CelestialManager;
/

CREATE OR REPLACE PACKAGE SpaceResearchPackage AS
    PROCEDURE AddCelestialObject(
        p_object_id NUMBER,
        p_object_name VARCHAR2,
        p_category VARCHAR2,
        p_distance_light_years NUMBER,
        p_discovery_date DATE,
        p_in_solar_system CHAR,
        p_habitability_score NUMBER,
        p_surface_temperature NUMBER,
        p_gravity NUMBER,
        p_nitrogen CHAR,
        p_oxygen CHAR,
        p_co2 CHAR,
        p_sulfuric_acid CHAR,
        p_hydrogen CHAR,
        p_helium CHAR,
        p_methane CHAR,
        p_water_vapor CHAR,
        p_silicates CHAR,
        p_iron CHAR,
        p_nickel CHAR
    );

    PROCEDURE UpdateCelestialObject(
        p_object_id NUMBER,
        p_object_name VARCHAR2,
        p_category VARCHAR2,
        p_distance_light_years NUMBER,
        p_discovery_date DATE,
        p_in_solar_system CHAR,
        p_habitability_score NUMBER,
        p_surface_temperature NUMBER,
        p_gravity NUMBER,
        p_nitrogen CHAR,
        p_oxygen CHAR,
        p_co2 CHAR,
        p_sulfuric_acid CHAR,
        p_hydrogen CHAR,
        p_helium CHAR,
        p_methane CHAR,
        p_water_vapor CHAR,
        p_silicates CHAR,
        p_iron CHAR,
        p_nickel CHAR
    );

    PROCEDURE AddEvent(
        p_event_id NUMBER,
        p_event_name VARCHAR2,
        p_event_type VARCHAR2,
        p_event_date DATE,
        p_visibility_score NUMBER,
        p_impact_on_habitability VARCHAR2,
        p_estimated_duration_days NUMBER
    );

    PROCEDURE UpdateEvent(
        p_event_id NUMBER,
        p_event_name VARCHAR2,
        p_event_type VARCHAR2,
        p_event_date DATE,
        p_visibility_score NUMBER,
        p_impact_on_habitability VARCHAR2,
        p_estimated_duration_days NUMBER
    );

    PROCEDURE AddResearcher(
        p_researcher_id NUMBER,
        p_researcher_name VARCHAR2,
        p_contact_email VARCHAR2,
        p_phone_number VARCHAR2,
        p_affiliation_id NUMBER
    );

    PROCEDURE UpdateResearcher(
        p_researcher_id NUMBER,
        p_researcher_name VARCHAR2,
        p_contact_email VARCHAR2,
        p_phone_number VARCHAR2,
        p_affiliation_id NUMBER
    );

    PROCEDURE AddMission(
        p_mission_id NUMBER,
        p_mission_name VARCHAR2,
        p_mission_purpose VARCHAR2,
        p_start_date DATE,
        p_end_date DATE,
        p_lead_researcher_id NUMBER,
        p_affiliation_id NUMBER
    );

    PROCEDURE UpdateMission(
        p_mission_id NUMBER,
        p_mission_name VARCHAR2,
        p_mission_purpose VARCHAR2,
        p_start_date DATE,
        p_end_date DATE,
        p_lead_researcher_id NUMBER,
        p_affiliation_id NUMBER
    );
END SpaceResearchPackage;
/

CREATE OR REPLACE PACKAGE BODY SpaceResearchPackage AS

    PROCEDURE AddCelestialObject(
        p_object_id NUMBER,
        p_object_name VARCHAR2,
        p_category VARCHAR2,
        p_distance_light_years NUMBER,
        p_discovery_date DATE,
        p_in_solar_system CHAR,
        p_habitability_score NUMBER,
        p_surface_temperature NUMBER,
        p_gravity NUMBER,
        p_nitrogen CHAR,
        p_oxygen CHAR,
        p_co2 CHAR,
        p_sulfuric_acid CHAR,
        p_hydrogen CHAR,
        p_helium CHAR,
        p_methane CHAR,
        p_water_vapor CHAR,
        p_silicates CHAR,
        p_iron CHAR,
        p_nickel CHAR
    ) IS
    BEGIN
        INSERT INTO CelestialObjects (
            object_id, object_name, category, distance_light_years,
            discovery_date, in_solar_system, habitability_score,
            surface_temperature, gravity, nitrogen, oxygen, co2,
            sulfuric_acid, hydrogen, helium, methane, water_vapor,
            silicates, iron, nickel
        ) VALUES (
            p_object_id, p_object_name, p_category, p_distance_light_years,
            p_discovery_date, p_in_solar_system, p_habitability_score,
            p_surface_temperature, p_gravity, p_nitrogen, p_oxygen, p_co2,
            p_sulfuric_acid, p_hydrogen, p_helium, p_methane, p_water_vapor,
            p_silicates, p_iron, p_nickel
        );
    END AddCelestialObject;

    PROCEDURE UpdateCelestialObject(
        p_object_id NUMBER,
        p_object_name VARCHAR2,
        p_category VARCHAR2,
        p_distance_light_years NUMBER,
        p_discovery_date DATE,
        p_in_solar_system CHAR,
        p_habitability_score NUMBER,
        p_surface_temperature NUMBER,
        p_gravity NUMBER,
        p_nitrogen CHAR,
        p_oxygen CHAR,
        p_co2 CHAR,
        p_sulfuric_acid CHAR,
        p_hydrogen CHAR,
        p_helium CHAR,
        p_methane CHAR,
        p_water_vapor CHAR,
        p_silicates CHAR,
        p_iron CHAR,
        p_nickel CHAR
    ) IS
    BEGIN
        UPDATE CelestialObjects
           SET object_name = p_object_name,
               category = p_category,
               distance_light_years = p_distance_light_years,
               discovery_date = p_discovery_date,
               in_solar_system = p_in_solar_system,
               habitability_score = p_habitability_score,
               surface_temperature = p_surface_temperature,
               gravity = p_gravity,
               nitrogen = p_nitrogen,
               oxygen = p_oxygen,
               co2 = p_co2,
               sulfuric_acid = p_sulfuric_acid,
               hydrogen = p_hydrogen,
               helium = p_helium,
               methane = p_methane,
               water_vapor = p_water_vapor,
               silicates = p_silicates,
               iron = p_iron,
               nickel = p_nickel
         WHERE object_id = p_object_id;
    END UpdateCelestialObject;

    PROCEDURE AddEvent(
        p_event_id NUMBER,
        p_event_name VARCHAR2,
        p_event_type VARCHAR2,
        p_event_date DATE,
        p_visibility_score NUMBER,
        p_impact_on_habitability VARCHAR2,
        p_estimated_duration_days NUMBER
    ) IS
    BEGIN
        INSERT INTO Events (
            event_id, event_name, event_type, event_date,
            visibility_score, impact_on_habitability, estimated_duration_days
        ) VALUES (
            p_event_id, p_event_name, p_event_type, p_event_date,
            p_visibility_score, p_impact_on_habitability, p_estimated_duration_days
        );
    END AddEvent;

    PROCEDURE UpdateEvent(
        p_event_id NUMBER,
        p_event_name VARCHAR2,
        p_event_type VARCHAR2,
        p_event_date DATE,
        p_visibility_score NUMBER,
        p_impact_on_habitability VARCHAR2,
        p_estimated_duration_days NUMBER
    ) IS
    BEGIN
        UPDATE Events
           SET event_name = p_event_name,
               event_type = p_event_type,
               event_date = p_event_date,
               visibility_score = p_visibility_score,
               impact_on_habitability = p_impact_on_habitability,
               estimated_duration_days = p_estimated_duration_days
         WHERE event_id = p_event_id;
    END UpdateEvent;

    PROCEDURE AddResearcher(
        p_researcher_id NUMBER,
        p_researcher_name VARCHAR2,
        p_contact_email VARCHAR2,
        p_phone_number VARCHAR2,
        p_affiliation_id NUMBER
    ) IS
    BEGIN
        INSERT INTO Researchers (
            researcher_id, researcher_name, contact_email,
            phone_number, affiliation_id
        ) VALUES (
            p_researcher_id, p_researcher_name, p_contact_email,
            p_phone_number, p_affiliation_id
        );
    END AddResearcher;

    PROCEDURE UpdateResearcher(
        p_researcher_id NUMBER,
        p_researcher_name VARCHAR2,
        p_contact_email VARCHAR2,
        p_phone_number VARCHAR2,
        p_affiliation_id NUMBER
    ) IS
    BEGIN
        UPDATE Researchers
           SET researcher_name = p_researcher_name,
               contact_email = p_contact_email,
               phone_number = p_phone_number,
               affiliation_id = p_affiliation_id
         WHERE researcher_id = p_researcher_id;
    END UpdateResearcher;

    PROCEDURE AddMission(
        p_mission_id NUMBER,
        p_mission_name VARCHAR2,
        p_mission_purpose VARCHAR2,
        p_start_date DATE,
        p_end_date DATE,
        p_lead_researcher_id NUMBER,
        p_affiliation_id NUMBER
    ) IS
    BEGIN
        INSERT INTO Missions (
            mission_id, mission_name, mission_purpose,
            start_date, end_date, lead_researcher_id, affiliation_id
        ) VALUES (
            p_mission_id, p_mission_name, p_mission_purpose,
            p_start_date, p_end_date, p_lead_researcher_id, p_affiliation_id
        );
    END AddMission;

    PROCEDURE UpdateMission(
        p_mission_id NUMBER,
        p_mission_name VARCHAR2,
        p_mission_purpose VARCHAR2,
        p_start_date DATE,
        p_end_date DATE,
        p_lead_researcher_id NUMBER,
        p_affiliation_id NUMBER
    ) IS
    BEGIN
        UPDATE Missions
           SET mission_name = p_mission_name,
               mission_purpose = p_mission_purpose,
               start_date = p_start_date,
               end_date = p_end_date,
               lead_researcher_id = p_lead_researcher_id,
               affiliation_id = p_affiliation_id
         WHERE mission_id = p_mission_id;
    END UpdateMission;

END SpaceResearchPackage;
/
