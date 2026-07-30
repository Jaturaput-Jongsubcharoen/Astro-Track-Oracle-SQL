DROP SEQUENCE mission_add_seq;
DROP SEQUENCE mission_update_seq;
/*----------------------------------------------------------------------------------------------------------------------*/
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