SET SERVEROUTPUT ON;
PROMPT [04_indexes] Creating indexes if missing...

DECLARE
  PROCEDURE create_index_if_missing(p_index_name IN VARCHAR2, p_ddl IN CLOB) IS
    v_exists NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM user_indexes
    WHERE index_name = UPPER(p_index_name);

    IF v_exists = 0 THEN
      EXECUTE IMMEDIATE p_ddl;
      DBMS_OUTPUT.PUT_LINE('Created index ' || UPPER(p_index_name));
    ELSE
      DBMS_OUTPUT.PUT_LINE('Index ' || UPPER(p_index_name) || ' already exists; skipped.');
    END IF;
  END;
BEGIN
  create_index_if_missing('IDX_MISSIONS_LEAD_DATE', 'CREATE INDEX idx_missions_lead_date ON missions(lead_researcher_id, start_date)');
  create_index_if_missing('IDX_R_ID_AFFILIATION', 'CREATE INDEX idx_r_id_affiliation ON researchers(researcher_id, affiliation_id)');
END;
/
