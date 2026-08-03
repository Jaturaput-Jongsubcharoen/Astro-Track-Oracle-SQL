SET SERVEROUTPUT ON;
PROMPT [06_triggers] Creating or replacing triggers...

CREATE OR REPLACE TRIGGER create_observation_trg
BEFORE INSERT ON Observations
FOR EACH ROW
BEGIN
  :NEW.observation_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER future_observations_trg
BEFORE INSERT OR UPDATE ON Observations
FOR EACH ROW
BEGIN
  IF :NEW.observation_date > SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'Observations cannot be in future.');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER mission_observation_trg
BEFORE INSERT ON Mission_Observations
FOR EACH ROW
DECLARE
  v_end_date Missions.end_date%TYPE;
BEGIN
  SELECT end_date
    INTO v_end_date
    FROM Missions
   WHERE mission_id = :NEW.mission_id;

  IF v_end_date IS NOT NULL THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cannot add observations to a completed mission.');
  END IF;
END;
/

CREATE OR REPLACE TRIGGER habplanets_null_trg
BEFORE INSERT OR UPDATE ON Habitable_Planets
FOR EACH ROW
BEGIN
  IF :NEW.recommended_population IS NULL THEN
    :NEW.recommended_population := 0;
  END IF;
END;
/

CREATE OR REPLACE TRIGGER habplanets_habitable_trg
BEFORE INSERT OR UPDATE ON Habitable_Planets
FOR EACH ROW
BEGIN
  IF :NEW.is_habitable = 'N' THEN
    :NEW.recommended_population := 0;
  END IF;
END;
/
