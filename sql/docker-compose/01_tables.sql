SET SERVEROUTPUT ON;
PROMPT [01_tables] Creating required tables if missing...

DECLARE
  PROCEDURE create_table_if_missing(p_table_name IN VARCHAR2, p_ddl IN CLOB) IS
    v_exists NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM user_tables
    WHERE table_name = UPPER(p_table_name);

    IF v_exists = 0 THEN
      EXECUTE IMMEDIATE p_ddl;
      DBMS_OUTPUT.PUT_LINE('Created table ' || UPPER(p_table_name));
    ELSE
      DBMS_OUTPUT.PUT_LINE('Table ' || UPPER(p_table_name) || ' already exists; skipped.');
    END IF;
  END;
BEGIN
  create_table_if_missing('CELESTIALOBJECTS', q'[
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
  ]');

  create_table_if_missing('EVENTS', q'[
    CREATE TABLE Events (
      event_id NUMBER PRIMARY KEY,
      event_name VARCHAR2(50) NOT NULL UNIQUE,
      event_type VARCHAR2(50) NOT NULL,
      event_date DATE NOT NULL,
      visibility_score NUMBER(3,1) DEFAULT 5.0,
      impact_on_habitability VARCHAR2(19) DEFAULT 'None',
      estimated_duration_days NUMBER(5,2) DEFAULT 1
    )
  ]');

  create_table_if_missing('AFFILIATIONS', q'[
    CREATE TABLE Affiliations (
      affiliation_id NUMBER PRIMARY KEY,
      affiliation_name VARCHAR2(50) NOT NULL UNIQUE
    )
  ]');

  create_table_if_missing('RESEARCHERS', q'[
    CREATE TABLE Researchers (
      researcher_id NUMBER PRIMARY KEY,
      researcher_name VARCHAR2(30) NOT NULL,
      contact_email VARCHAR2(50) UNIQUE,
      phone_number VARCHAR2(15) UNIQUE,
      affiliation_id NUMBER NOT NULL
    )
  ]');

  create_table_if_missing('RESEARCHPAPERS', q'[
    CREATE TABLE ResearchPapers (
      paper_id NUMBER PRIMARY KEY,
      title VARCHAR2(30) NOT NULL,
      publication_date DATE DEFAULT NULL,
      focus_area VARCHAR2(50) DEFAULT 'General Astronomy',
      journal VARCHAR2(50) DEFAULT 'Unknown Journal',
      doi VARCHAR2(50) UNIQUE,
      paper_score NUMBER(3,2) DEFAULT 0,
      researcher_id NUMBER
    )
  ]');

  create_table_if_missing('TELESCOPES', q'[
    CREATE TABLE Telescopes (
      telescope_id NUMBER PRIMARY KEY,
      telescope_name VARCHAR2(40) NOT NULL UNIQUE,
      location VARCHAR2(50) DEFAULT 'Unknown Location',
      type VARCHAR2(16) NOT NULL,
      aperture_size NUMBER(5,2) DEFAULT 1.0,
      observation_range_ly NUMBER(11) DEFAULT NULL,
      optical CHAR(1) DEFAULT 'N',
      infrared CHAR(1) DEFAULT 'N',
      ultraviolet CHAR(1) DEFAULT 'N'
    )
  ]');

  create_table_if_missing('OBSERVATIONS', q'[
    CREATE TABLE Observations (
      observation_id NUMBER PRIMARY KEY,
      object_id NUMBER NOT NULL,
      telescope_id NUMBER NOT NULL,
      researcher_id NUMBER NOT NULL,
      observation_date DATE NOT NULL,
      xray_flux NUMBER(10,3) DEFAULT 0,
      redshift NUMBER(6,5) DEFAULT 0
    )
  ]');

  create_table_if_missing('MISSIONS', q'[
    CREATE TABLE Missions (
      mission_id NUMBER PRIMARY KEY,
      mission_name VARCHAR2(30) NOT NULL UNIQUE,
      mission_purpose VARCHAR2(100) DEFAULT 'Unknown',
      start_date DATE NOT NULL,
      end_date DATE DEFAULT NULL,
      lead_researcher_id NUMBER NOT NULL,
      affiliation_id NUMBER NOT NULL
    )
  ]');

  create_table_if_missing('MISSION_OBSERVATIONS', q'[
    CREATE TABLE Mission_Observations (
      mission_id NUMBER NOT NULL,
      observation_id NUMBER NOT NULL,
      mission_name VARCHAR2(20) NOT NULL,
      observation_role VARCHAR2(50) DEFAULT 'General Observation',
      data_collected_size NUMBER(10,2) DEFAULT 0,
      observation_success CHAR(1) DEFAULT 'Y',
      last_updated DATE DEFAULT SYSDATE,
      PRIMARY KEY (mission_id, observation_id)
    )
  ]');

  create_table_if_missing('HABITABLE_PLANETS', q'[
    CREATE TABLE Habitable_Planets (
      object_id NUMBER NOT NULL,
      event_id NUMBER NOT NULL,
      research_id NUMBER NOT NULL,
      is_habitable CHAR(1) DEFAULT 'N',
      habitability_reason VARCHAR2(50) DEFAULT 'Unknown',
      recommended_population NUMBER DEFAULT NULL,
      last_evaluated DATE DEFAULT SYSDATE,
      PRIMARY KEY (object_id, event_id, research_id)
    )
  ]');
END;
/
