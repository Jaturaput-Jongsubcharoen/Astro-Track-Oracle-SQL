SET SERVEROUTPUT ON;
PROMPT [02_constraints] Creating constraints if missing...

DECLARE
  PROCEDURE add_constraint_if_missing(p_constraint_name IN VARCHAR2, p_ddl IN CLOB) IS
    v_exists NUMBER := 0;
  BEGIN
    SELECT COUNT(*) INTO v_exists
    FROM user_constraints
    WHERE constraint_name = UPPER(p_constraint_name);

    IF v_exists = 0 THEN
      EXECUTE IMMEDIATE p_ddl;
      DBMS_OUTPUT.PUT_LINE('Created constraint ' || UPPER(p_constraint_name));
    ELSE
      DBMS_OUTPUT.PUT_LINE('Constraint ' || UPPER(p_constraint_name) || ' already exists; skipped.');
    END IF;
  END;
BEGIN
  add_constraint_if_missing('CHK_CATEGORY', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_category CHECK (category IN ('Planet','Exoplanet','Moon','Dwarf Planet','Asteroid','Comet','Black Hole','Neutron Star','Star'))]');
  add_constraint_if_missing('CHK_IN_SOLAR_SYSTEM', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_in_solar_system CHECK (in_solar_system IN ('Y','N'))]');
  add_constraint_if_missing('CHK_HABITABILITY_SCORE', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_habitability_score CHECK (habitability_score BETWEEN 0.00 AND 10.00)]');
  add_constraint_if_missing('CHK_GRAVITY', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_gravity CHECK (gravity BETWEEN 0.0 AND 100.0)]');
  add_constraint_if_missing('CHK_NITROGEN', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_nitrogen CHECK (nitrogen IN ('Y','N'))]');
  add_constraint_if_missing('CHK_OXYGEN', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_oxygen CHECK (oxygen IN ('Y','N'))]');
  add_constraint_if_missing('CHK_CO2', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_co2 CHECK (co2 IN ('Y','N'))]');
  add_constraint_if_missing('CHK_SULFURIC_ACID', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_sulfuric_acid CHECK (sulfuric_acid IN ('Y','N'))]');
  add_constraint_if_missing('CHK_HYDROGEN', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_hydrogen CHECK (hydrogen IN ('Y','N'))]');
  add_constraint_if_missing('CHK_HELIUM', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_helium CHECK (helium IN ('Y','N'))]');
  add_constraint_if_missing('CHK_METHANE', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_methane CHECK (methane IN ('Y','N'))]');
  add_constraint_if_missing('CHK_WATER_VAPOR', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_water_vapor CHECK (water_vapor IN ('Y','N'))]');
  add_constraint_if_missing('CHK_SILICATES', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_silicates CHECK (silicates IN ('Y','N'))]');
  add_constraint_if_missing('CHK_IRON', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_iron CHECK (iron IN ('Y','N'))]');
  add_constraint_if_missing('CHK_NICKEL', q'[ALTER TABLE CelestialObjects ADD CONSTRAINT chk_nickel CHECK (nickel IN ('Y','N'))]');

  add_constraint_if_missing('CHK_VISIBILITY_SCORE', q'[ALTER TABLE Events ADD CONSTRAINT chk_visibility_score CHECK (visibility_score BETWEEN 0.0 AND 10.0)]');
  add_constraint_if_missing('CHK_ESTIMATED_DURATION', q'[ALTER TABLE Events ADD CONSTRAINT chk_estimated_duration CHECK (estimated_duration_days > 0)]');
  add_constraint_if_missing('CHK_IMPACT_ON_HABITABILITY', q'[ALTER TABLE Events ADD CONSTRAINT chk_impact_on_habitability CHECK (impact_on_habitability IN ('None','Mild Radiation','Severe Radiation','Climate Shift','Atmospheric Changes'))]');

  add_constraint_if_missing('CHK_CONTACT_EMAIL', q'[ALTER TABLE Researchers ADD CONSTRAINT chk_contact_email CHECK (REGEXP_LIKE(contact_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'))]');
  add_constraint_if_missing('CHK_PHONE_NUMBER', q'[ALTER TABLE Researchers ADD CONSTRAINT chk_phone_number CHECK (REGEXP_LIKE(phone_number, '^\+\d{1,3}-\d{1,4}-\d{4,10}$'))]');

  add_constraint_if_missing('CHK_FOCUS_AREA', q'[ALTER TABLE ResearchPapers ADD CONSTRAINT chk_focus_area CHECK (focus_area IN ('Exoplanets','Space Radiation','Terraforming','Astrobiology','General Astronomy','Unknown'))]');
  add_constraint_if_missing('CHK_JOURNAL', q'[ALTER TABLE ResearchPapers ADD CONSTRAINT chk_journal CHECK (journal IN ('Astrophysical Journal','Astronomy and Astrophysics','Monthly Notices of the Royal Astronomical Society','Nature Astronomy','Science','Icarus','Journal of Geophysical Research: Planets','Space Science Reviews','Acta Astronautica','Planetary and Space Science','Unknown Journal'))]');

  add_constraint_if_missing('CHK_APERTURE_SIZE', q'[ALTER TABLE Telescopes ADD CONSTRAINT chk_aperture_size CHECK (aperture_size > 0)]');
  add_constraint_if_missing('CHK_OBSERVATION_RANGE', q'[ALTER TABLE Telescopes ADD CONSTRAINT chk_observation_range CHECK (observation_range_ly >= 0)]');
  add_constraint_if_missing('CHK_OPTICAL', q'[ALTER TABLE Telescopes ADD CONSTRAINT chk_optical CHECK (optical IN ('Y','N'))]');
  add_constraint_if_missing('CHK_INFRARED', q'[ALTER TABLE Telescopes ADD CONSTRAINT chk_infrared CHECK (infrared IN ('Y','N'))]');
  add_constraint_if_missing('CHK_ULTRAVIOLET', q'[ALTER TABLE Telescopes ADD CONSTRAINT chk_ultraviolet CHECK (ultraviolet IN ('Y','N'))]');

  add_constraint_if_missing('CHK_XRAY_FLUX', q'[ALTER TABLE Observations ADD CONSTRAINT chk_xray_flux CHECK (xray_flux >= 0)]');
  add_constraint_if_missing('CHK_REDSHIFT', q'[ALTER TABLE Observations ADD CONSTRAINT chk_redshift CHECK (redshift BETWEEN -1 AND 10)]');

  add_constraint_if_missing('CHK_MISSION_DATES', q'[ALTER TABLE Missions ADD CONSTRAINT chk_mission_dates CHECK (end_date IS NULL OR end_date >= start_date)]');
  add_constraint_if_missing('CHK_MISSION_PURPOSE', q'[ALTER TABLE Missions ADD CONSTRAINT chk_mission_purpose CHECK (LENGTH(TRIM(mission_purpose)) > 0)]');

  add_constraint_if_missing('CHK_OBSERVATION_SUCCESS', q'[ALTER TABLE Mission_Observations ADD CONSTRAINT chk_observation_success CHECK (observation_success IN ('Y','N'))]');
  add_constraint_if_missing('CHK_DATA_COLLECTED_SIZE', q'[ALTER TABLE Mission_Observations ADD CONSTRAINT chk_data_collected_size CHECK (data_collected_size >= 0)]');

  add_constraint_if_missing('CHK_IS_HABITABLE', q'[ALTER TABLE Habitable_Planets ADD CONSTRAINT chk_is_habitable CHECK (is_habitable IN ('Y','N'))]');
  add_constraint_if_missing('CHK_RECOMMENDED_POPULATION', q'[ALTER TABLE Habitable_Planets ADD CONSTRAINT chk_recommended_population CHECK (recommended_population IS NULL OR recommended_population >= 0)]');

  add_constraint_if_missing('FK_R_AFFILIATION', q'[ALTER TABLE Researchers ADD CONSTRAINT fk_r_affiliation FOREIGN KEY (affiliation_id) REFERENCES Affiliations(affiliation_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_RP_RESEARCHER', q'[ALTER TABLE ResearchPapers ADD CONSTRAINT fk_rp_researcher FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_O_OBJECT', q'[ALTER TABLE Observations ADD CONSTRAINT fk_o_object FOREIGN KEY (object_id) REFERENCES CelestialObjects(object_id) ON DELETE CASCADE]');
  add_constraint_if_missing('FK_O_TELESCOPE', q'[ALTER TABLE Observations ADD CONSTRAINT fk_o_telescope FOREIGN KEY (telescope_id) REFERENCES Telescopes(telescope_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_O_RESEARCHER', q'[ALTER TABLE Observations ADD CONSTRAINT fk_o_researcher FOREIGN KEY (researcher_id) REFERENCES Researchers(researcher_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_M_RESEARCHER', q'[ALTER TABLE Missions ADD CONSTRAINT fk_m_researcher FOREIGN KEY (lead_researcher_id) REFERENCES Researchers(researcher_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_M_AFFILIATION', q'[ALTER TABLE Missions ADD CONSTRAINT fk_m_affiliation FOREIGN KEY (affiliation_id) REFERENCES Affiliations(affiliation_id) ON DELETE SET NULL]');
  add_constraint_if_missing('FK_M_O_MISSION', q'[ALTER TABLE Mission_Observations ADD CONSTRAINT fk_m_o_mission FOREIGN KEY (mission_id) REFERENCES Missions(mission_id) ON DELETE CASCADE]');
  add_constraint_if_missing('FK_M_O_OBSERVATION', q'[ALTER TABLE Mission_Observations ADD CONSTRAINT fk_m_o_observation FOREIGN KEY (observation_id) REFERENCES Observations(observation_id) ON DELETE CASCADE]');
  add_constraint_if_missing('FK_HP_OBJECT', q'[ALTER TABLE Habitable_Planets ADD CONSTRAINT fk_hp_object FOREIGN KEY (object_id) REFERENCES CelestialObjects(object_id)]');
  add_constraint_if_missing('FK_HP_EVENTS', q'[ALTER TABLE Habitable_Planets ADD CONSTRAINT fk_hp_events FOREIGN KEY (event_id) REFERENCES Events(event_id)]');
  add_constraint_if_missing('FK_HP_RESEARCH', q'[ALTER TABLE Habitable_Planets ADD CONSTRAINT fk_hp_research FOREIGN KEY (research_id) REFERENCES ResearchPapers(paper_id)]');
END;
/
