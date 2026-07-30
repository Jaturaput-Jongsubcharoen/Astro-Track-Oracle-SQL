/*----------------------------------------------------------------------------------------------------------------------*/
-- Using SEQUENCES to insert table
CREATE SEQUENCE celestial_add_seq
START WITH 22
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Create the Package Specification
CREATE OR REPLACE PACKAGE CelestialManager AS
    PROCEDURE CreateCelestialSequence;
    PROCEDURE AddDefaultCelestialObjects;
END CelestialManager;
/

-- Create the Package Body
CREATE OR REPLACE PACKAGE BODY CelestialManager AS

    -- Procedure to create the sequence
    PROCEDURE CreateCelestialSequence IS
    BEGIN
        EXECUTE IMMEDIATE '
            CREATE SEQUENCE celestial_add_seq
            START WITH 22
            INCREMENT BY 1
            NOCACHE
            NOCYCLE
        ';
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -955 THEN
                NULL; -- Sequence already exists
            ELSE
                RAISE;
            END IF;
    END CreateCelestialSequence;

    -- Procedure to insert two celestial objects
    PROCEDURE AddDefaultCelestialObjects IS
        v_id NUMBER;
    BEGIN
        -- First object
        SELECT celestial_add_seq.NEXTVAL INTO v_id FROM dual;
        INSERT INTO CelestialObjects (
            object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
            habitability_score, surface_temperature, gravity,
            nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
        )
        VALUES (
            v_id, 'Proxima b', 'Exoplanet', 4.24, TO_DATE('2016-08-24', 'YYYY-MM-DD'), 'N',
            7.00, 0.0, 1.10,
            'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
        );

        -- Second object
        SELECT celestial_add_seq.NEXTVAL INTO v_id FROM dual;
        INSERT INTO CelestialObjects (
            object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
            habitability_score, surface_temperature, gravity,
            nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
        )
        VALUES (
            v_id, 'OGLE-2016-BLG-1195Lb', 'Exoplanet', 13000, TO_DATE('2017-04-26', 'YYYY-MM-DD'), 'N',
            6.50, -220.0, 0.75,
            'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
        );
    END AddDefaultCelestialObjects;

END CelestialManager;
/

CREATE OR REPLACE PROCEDURE InitDefaultCelestialObjects IS
BEGIN
    -- Step 1: Create the sequence if it doesn't exist
    CelestialManager.CreateCelestialSequence;

    -- Step 2: Insert two default celestial objects
    CelestialManager.AddDefaultCelestialObjects;
END;
/


BEGIN
    InitDefaultCelestialObjects;
END;
/

SELECT * FROM CelestialObjects;

/*----------------------------------------------------------------------------------------------------------------------*/


/*==================================================================================================================================*/
-- Delete the SEQUENCES
DROP SEQUENCE celestial_add_seq;
DROP SEQUENCE mission_add_seq;
/*==================================================================================================================================*/