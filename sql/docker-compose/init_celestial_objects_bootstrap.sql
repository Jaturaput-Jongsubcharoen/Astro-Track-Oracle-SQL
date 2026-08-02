SET SERVEROUTPUT ON;

PROMPT ==============================================================
PROMPT Astro Track local Docker bootstrap for CELESTIALOBJECTS
PROMPT Non-destructive and repeatable: safe to rerun.
PROMPT ==============================================================

DECLARE
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM user_tables
  WHERE table_name = 'CELESTIALOBJECTS';

  IF v_exists = 0 THEN
    EXECUTE IMMEDIATE q'[
      CREATE TABLE CelestialObjects (
          object_id NUMBER PRIMARY KEY,
          object_name VARCHAR2(30) NOT NULL,
          category VARCHAR2(50) NOT NULL,
          distance_light_years NUMBER(16,6) DEFAULT 0,
          discovery_date DATE DEFAULT NULL,
          in_solar_system CHAR(1) DEFAULT 'N',
          habitability_score NUMBER(4,2) DEFAULT 0,
          surface_temperature NUMBER(12,2) DEFAULT NULL,
          gravity NUMBER(5,2) DEFAULT NULL,
          nitrogen CHAR(1) DEFAULT 'N',
          oxygen CHAR(1) DEFAULT 'N',
          co2 CHAR(1) DEFAULT 'N',
          sulfuric_acid CHAR(1) DEFAULT 'N',
          hydrogen CHAR(1) DEFAULT 'N',
          helium CHAR(1) DEFAULT 'N',
          methane CHAR(1) DEFAULT 'N',
          water_vapor CHAR(1) DEFAULT 'N',
          silicates CHAR(1) DEFAULT 'N',
          iron CHAR(1) DEFAULT 'N',
          nickel CHAR(1) DEFAULT 'N'
      )
    ]';
    DBMS_OUTPUT.PUT_LINE('Created table CELESTIALOBJECTS.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Table CELESTIALOBJECTS already exists; keeping existing table and data.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    IF SQLCODE = -955 THEN
      DBMS_OUTPUT.PUT_LINE('ORA-00955 encountered; table already exists. Continuing safely.');
    ELSE
      RAISE;
    END IF;
END;
/

DECLARE
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM user_constraints
  WHERE constraint_name = 'CHK_CATEGORY'
    AND table_name = 'CELESTIALOBJECTS';

  IF v_exists = 0 THEN
    EXECUTE IMMEDIATE q'[
      ALTER TABLE CelestialObjects
      ADD CONSTRAINT chk_category CHECK (category IN (
          'Planet', 'Exoplanet', 'Moon', 'Dwarf Planet',
          'Asteroid', 'Comet', 'Black Hole', 'Neutron Star', 'Star'
      ))
    ]';
    DBMS_OUTPUT.PUT_LINE('Added constraint CHK_CATEGORY.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Constraint CHK_CATEGORY already exists.');
  END IF;
END;
/

DECLARE
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM user_constraints
  WHERE constraint_name = 'CHK_IN_SOLAR_SYSTEM'
    AND table_name = 'CELESTIALOBJECTS';

  IF v_exists = 0 THEN
    EXECUTE IMMEDIATE q'[
      ALTER TABLE CelestialObjects
      ADD CONSTRAINT chk_in_solar_system CHECK (in_solar_system IN ('Y', 'N'))
    ]';
    DBMS_OUTPUT.PUT_LINE('Added constraint CHK_IN_SOLAR_SYSTEM.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Constraint CHK_IN_SOLAR_SYSTEM already exists.');
  END IF;
END;
/

DECLARE
  v_exists NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM user_constraints
  WHERE constraint_name = 'CHK_HABITABILITY_SCORE'
    AND table_name = 'CELESTIALOBJECTS';

  IF v_exists = 0 THEN
    EXECUTE IMMEDIATE q'[
      ALTER TABLE CelestialObjects
      ADD CONSTRAINT chk_habitability_score CHECK (habitability_score BETWEEN 0.00 AND 10.00)
    ]';
    DBMS_OUTPUT.PUT_LINE('Added constraint CHK_HABITABILITY_SCORE.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Constraint CHK_HABITABILITY_SCORE already exists.');
  END IF;
END;
/

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  1, 'Earth', 'Planet', 0.000000, NULL, 'Y',
  10.00, 15.0, 1.00, 'Y', 'Y', 'N',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 1
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  2, 'Mars', 'Planet', 0.000015, TO_DATE('1659-12-28', 'YYYY-MM-DD'), 'Y',
  4.00, -60.0, 0.38, 'N', 'N', 'Y',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 2
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  3, 'TRAPPIST-1e', 'Exoplanet', 39.0, TO_DATE('2017-02-22', 'YYYY-MM-DD'), 'N',
  6.90, -18.0, 0.93, 'Y', 'N', 'Y',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 3
);

COMMIT;

PROMPT Bootstrap complete. Existing data preserved; no destructive operations executed.
