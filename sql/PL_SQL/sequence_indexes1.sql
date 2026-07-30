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
DROP INDEX idx_rp_researcher_id;


CREATE INDEX idx_rp_researcher_id ON researchpapers(researcher_id);

SELECT researcher_name, COUNT(paper_id) AS paper_count
FROM (
    SELECT r.researcher_name, p.paper_id
    FROM researchpapers p,
         (SELECT * FROM researchers) r
    WHERE p.researcher_id = r.researcher_id
)
GROUP BY researcher_name
HAVING COUNT(paper_id) > 2;

SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

SELECT * FROM researchers;

SELECT r.researcher_name,
       (
         SELECT COUNT(*)
         FROM researchpapers rp
         WHERE rp.researcher_id = r.researcher_id
           AND rp.researcher_id IN (
             SELECT hp.research_id
             FROM habitable_planets hp
           )
       ) AS paper_count
FROM researchers r
WHERE r.researcher_id IN (
    SELECT rp.researcher_id
    FROM researchpapers rp
    WHERE rp.researcher_id IN (
        SELECT hp.research_id
        FROM habitable_planets hp
    )
);

SELECT * FROM researchers;
SELECT * FROM Habitable_Planets;

SELECT r.researcher_name, rp.title, hp.is_habitable
FROM Researchers r
JOIN ResearchPapers rp ON r.researcher_id = rp.researcher_id
JOIN Habitable_Planets hp ON rp.paper_id = hp.research_id
WHERE is_habitable = 'Y';

SELECT r.researcher_name
FROM Researchers r
WHERE r.researcher_id IN (SELECT DISTINCT rp.researcher_id FROM ResearchPapers rp);

SELECT DISTINCT researcher_id FROM ResearchPapers;
SELECT rp.researcher_id FROM ResearchPapers rp;

SELECT DISTINCT rp.researcher_id 
FROM ResearchPapers rp
WHERE salary = (SELECT MAX(recommended_population) FROM Habitable_Planets);


CREATE INDEX idx_hp_research_id ON habitable_planets(research_id);

SELECT researcher_name
FROM researchers
WHERE researcher_id IN (
    SELECT research_id
    FROM (
        SELECT research_id
        FROM habitable_planets
        GROUP BY research_id
        HAVING COUNT(*) > 1
    )
);
