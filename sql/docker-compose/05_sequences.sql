SET SERVEROUTPUT ON;
PROMPT [05_sequences] Creating sequences if missing...

DECLARE
  PROCEDURE create_sequence_if_missing(p_sequence_name IN VARCHAR2, p_ddl IN CLOB) IS
    v_exists NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM user_sequences
    WHERE sequence_name = UPPER(p_sequence_name);

    IF v_exists = 0 THEN
      EXECUTE IMMEDIATE p_ddl;
      DBMS_OUTPUT.PUT_LINE('Created sequence ' || UPPER(p_sequence_name));
    ELSE
      DBMS_OUTPUT.PUT_LINE('Sequence ' || UPPER(p_sequence_name) || ' already exists; skipped.');
    END IF;
  END;
BEGIN
  create_sequence_if_missing('MISSION_ADD_SEQ', 'CREATE SEQUENCE mission_add_seq START WITH 11 INCREMENT BY 1 NOCACHE NOCYCLE');
  create_sequence_if_missing('MISSION_UPDATE_SEQ', 'CREATE SEQUENCE mission_update_seq START WITH 13 INCREMENT BY 1 NOCACHE NOCYCLE');
  create_sequence_if_missing('CELESTIAL_ADD_SEQ', 'CREATE SEQUENCE celestial_add_seq START WITH 22 INCREMENT BY 1 NOCACHE NOCYCLE');
  create_sequence_if_missing('CELESTIAL_UPDATE_SEQ', 'CREATE SEQUENCE celestial_update_seq START WITH 100 INCREMENT BY 1 NOCACHE NOCYCLE');
END;
/
