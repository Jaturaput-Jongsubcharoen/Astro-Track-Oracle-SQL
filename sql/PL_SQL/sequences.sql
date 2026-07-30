-- Use it to insert sample data
CREATE SEQUENCE mission_add_seq
START WITH 11
INCREMENT BY 1
NOCACHE
NOCYCLE;

INSERT INTO missions (mission_id, mission_name, mission_purpose, start_date, end_date, lead_researcher_id, affiliation_id)
VALUES (mission_add_seq.NEXTVAL, 'Europa Ice Survey', 'Study of Subsurface Oceans', TO_DATE('2025-01-01', 'YYYY-MM-DD'), NULL, 5, 1);

INSERT INTO missions (mission_id, mission_name, mission_purpose, start_date, end_date, lead_researcher_id, affiliation_id)
VALUES (mission_add_seq.NEXTVAL, 'Artemis II', 'Return Humans to the Moon', TO_DATE('2025-05-01', 'YYYY-MM-DD'), NULL, 6, 2);

SELECT * FROM missions;

/*----------------------------------------------------------------------------------------------------------------------*/
-- Use it to update table(s)
CREATE SEQUENCE mission_update_seq
START WITH 13
INCREMENT BY 1
NOCACHE
NOCYCLE;

UPDATE Missions
SET mission_id = mission_update_seq.NEXTVAL,
    mission_purpose = 'Human Survival on the Moon',
    start_date = SYSDATE,
    lead_researcher_id = 3,
    affiliation_id = 1
WHERE mission_name = 'Artemis II';

UPDATE Missions
SET mission_id = mission_update_seq.NEXTVAL,
    mission_purpose = 'Human Survival on the Moon',
    start_date = SYSDATE
WHERE mission_name = 'Artemis II';


SELECT * FROM missions;
/*----------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------*/
DROP SEQUENCE mission_add_seq;
DROP SEQUENCE mission_update_seq;

/*----------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------*/
-- Create a sequence for CelestialObjects
CREATE SEQUENCE celestial_add_seq
START WITH 22
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Insert first celestial object
INSERT INTO CelestialObjects (
    object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
    habitability_score, surface_temperature, gravity,
    nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
VALUES (
    celestial_add_seq.NEXTVAL, 'Proxima b', 'Exoplanet', 4.24, TO_DATE('2016-08-24', 'YYYY-MM-DD'), 'N',
    7.00, 0.0, 1.10,
    'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
);

-- Insert second celestial object
INSERT INTO CelestialObjects (
    object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
    habitability_score, surface_temperature, gravity,
    nitrogen, oxygen, co2, sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
VALUES (
    celestial_add_seq.NEXTVAL, 'OGLE-2016-BLG-1195Lb', 'Exoplanet', 13000, TO_DATE('2017-04-26', 'YYYY-MM-DD'), 'N',
    6.50, -220.0, 0.75,
    'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
);

-- Optional: View inserted rows
SELECT * FROM CelestialObjects;

