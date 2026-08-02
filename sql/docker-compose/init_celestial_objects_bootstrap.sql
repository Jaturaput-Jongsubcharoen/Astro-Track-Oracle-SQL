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

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  4, 'Neptune', 'Planet', 0.000029, TO_DATE('1846-09-23', 'YYYY-MM-DD'), 'Y',
  0.00, -214.0, 1.14, 'N', 'N', 'N',
  'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 4
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  5, 'Gliese 581g', 'Exoplanet', 20.5, TO_DATE('2010-09-29', 'YYYY-MM-DD'), 'N',
  7.90, 20.0, 1.10, 'Y', 'N', 'Y',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 5
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  6, 'Kepler-442b', 'Exoplanet', 1206.0, TO_DATE('2015-01-06', 'YYYY-MM-DD'), 'N',
  8.50, 15.5, 0.98, 'Y', 'Y', 'N',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 6
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  7, 'TRAPPIST-1e', 'Exoplanet', 39.0, TO_DATE('2017-02-22', 'YYYY-MM-DD'), 'N',
  6.90, -18.0, 0.93, 'Y', 'N', 'Y',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 7
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  8, 'TOI 700 d', 'Exoplanet', 101.4, TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'N',
  7.10, 19.0, 1.02, 'Y', 'N', 'Y',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 8
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  9, 'Europa', 'Moon', 0.000628, TO_DATE('1610-01-07', 'YYYY-MM-DD'), 'Y',
  5.50, -160.0, 1.31, 'N', 'Y', 'N',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 9
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  10, 'Titan', 'Moon', 1.222, TO_DATE('1655-03-25', 'YYYY-MM-DD'), 'Y',
  4.80, -179.2, 1.35, 'Y', 'N', 'N',
  'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 10
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  11, 'Ganymede', 'Moon', 0.000628, TO_DATE('1610-01-07', 'YYYY-MM-DD'), 'Y',
  3.80, -160.0, 1.43, 'N', 'Y', 'N',
  'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 11
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  12, 'Enceladus', 'Moon', 0.000048, TO_DATE('1789-08-28', 'YYYY-MM-DD'), 'Y',
  4.00, -201.0, 1.14, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 12
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  13, 'Pluto', 'Dwarf Planet', 0.0006, TO_DATE('1930-02-18', 'YYYY-MM-DD'), 'Y',
  2.50, -229.0, 0.62, 'N', 'N', 'N',
  'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 13
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  14, 'Ceres', 'Asteroid', 0.0006, TO_DATE('1801-01-01', 'YYYY-MM-DD'), 'Y',
  1.30, -38.0, 0.27, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 14
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  15, 'Eros', 'Asteroid', 1.458, TO_DATE('1898-08-13', 'YYYY-MM-DD'), 'Y',
  0.00, -73.0, NULL, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 15
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  16, 'Halley Comet', 'Comet', 0.586, TO_DATE('1705-01-01', 'YYYY-MM-DD'), 'Y',
  0.00, -200.0, NULL, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 16
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  17, 'Comet NEOWISE', 'Comet', 0.5, TO_DATE('2020-03-27', 'YYYY-MM-DD'), 'Y',
  0.00, -190.0, NULL, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 17
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  18, 'Sirius A', 'Star', 8.6, TO_DATE('1718-03-02', 'YYYY-MM-DD'), 'N',
  0.00, 9940.0, 1.71, 'N', 'N', 'N',
  'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 18
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  19, 'Betelgeuse', 'Star', 642.5, TO_DATE('1836-12-05', 'YYYY-MM-DD'), 'N',
  0.00, 3500.0, 20.00, 'N', 'N', 'N',
  'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 19
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  20, 'Crab Pulsar', 'Neutron Star', 6500.0, TO_DATE('1968-08-12', 'YYYY-MM-DD'), 'N',
  0.00, 1000000.0, NULL, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 20
);

INSERT INTO CelestialObjects (
  object_id, object_name, category, distance_light_years, discovery_date, in_solar_system,
  habitability_score, surface_temperature, gravity, nitrogen, oxygen, co2,
  sulfuric_acid, hydrogen, helium, methane, water_vapor, silicates, iron, nickel
)
SELECT
  21, 'M87 Black Hole', 'Black Hole', 53000000, TO_DATE('2019-04-10', 'YYYY-MM-DD'), 'N',
  0.00, NULL, NULL, 'N', 'N', 'N',
  'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'
FROM dual
WHERE NOT EXISTS (
  SELECT 1 FROM CelestialObjects WHERE object_id = 21
);

COMMIT;

PROMPT Bootstrap complete. Existing data preserved; no destructive operations executed.
