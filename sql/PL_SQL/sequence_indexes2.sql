SELECT * FROM events;
SELECT MAX(event_id) FROM events;

SELECT * FROM researchers;
SELECT * FROM observations;
SELECT * FROM missions;
SELECT * FROM mission_observations;
SELECT * FROM affiliations;
SELECT * FROM Habitable_planets;
SELECT * FROM events;
SELECT * FROM CelestialObjects;

/*----------------------------------------------------------------------------------------------------------------------*/
DROP SEQUENCE mission_add_seq;
DROP SEQUENCE mission_update_seq;

-- b.  Use it to insert sample data
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
-- c.  Use it to update table(s)
CREATE SEQUENCE mission_update_seq
START WITH 11
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

SELECT * FROM missions;

/*----------------------------------------------------------------------------------------------------------------------*/
DROP INDEX idx_missions_lead_date;
DROP INDEX idx_r_id_affiliation;

SELECT * FROM missions; 
SELECT * FROM observations; 


CREATE INDEX idx_missions_lead_date ON missions(lead_researcher_id, start_date);

SELECT researcher_id, researcher_name
FROM researchers
WHERE (researcher_id) IN (
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
);

/*----------------------------------------------------------------------------------------------------------------------*/
CREATE INDEX idx_r_id_affiliation ON researchers(researcher_id, affiliation_id);

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
HAVING COUNT(*) > 1;
