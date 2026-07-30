DROP INDEX idx_missions_lead_date;
DROP INDEX idx_r_id_affiliation;
/*----------------------------------------------------------------------------------------------------------------------*/
SELECT * FROM missions; 
SELECT * FROM observations; 

-- a.  Search is one of common functionalities, index plays a critical role in search
-- b.  create few (min 2) indexes for those tables where search is performed frequently 
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
