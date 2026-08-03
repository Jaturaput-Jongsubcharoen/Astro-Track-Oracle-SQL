SET SERVEROUTPUT ON;
PROMPT [03_seed_data] Inserting baseline seed data (non-destructive)...

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (1, 'Earth', 'Planet', 0.000000, NULL, 'Y', 10.00, 15.0, 1.00,
          'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (2, 'Mars', 'Planet', 0.000015, TO_DATE('1659-12-28', 'YYYY-MM-DD'), 'Y', 4.00, -60.0, 0.38,
          'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (3, 'Venus', 'Planet', 0.000011, TO_DATE('1610-01-09', 'YYYY-MM-DD'), 'Y', 1.00, 464.0, 0.91,
          'N', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (4, 'Neptune', 'Planet', 0.000029, TO_DATE('1846-09-23', 'YYYY-MM-DD'), 'Y', 0.00, -214.0, 1.14,
          'N', 'N', 'N', 'N', 'Y', 'Y', 'Y', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (5, 'Gliese 581g', 'Exoplanet', 20.5, TO_DATE('2010-09-29', 'YYYY-MM-DD'), 'N', 7.90, 20.0, 1.10,
          'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (6, 'Kepler-442b', 'Exoplanet', 1206.0, TO_DATE('2015-01-06', 'YYYY-MM-DD'), 'N', 8.50, 15.5, 0.98,
          'Y', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (7, 'TRAPPIST-1e', 'Exoplanet', 39.0, TO_DATE('2017-02-22', 'YYYY-MM-DD'), 'N', 6.90, -18.0, 0.93,
          'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (8, 'TOI 700 d', 'Exoplanet', 101.4, TO_DATE('2020-01-06', 'YYYY-MM-DD'), 'N', 7.10, 19.0, 1.02,
          'Y', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (9, 'Europa', 'Moon', 0.000628, TO_DATE('1610-01-07', 'YYYY-MM-DD'), 'Y', 5.50, -160.0, 1.31,
          'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (10, 'Titan', 'Moon', 1.222, TO_DATE('1655-03-25', 'YYYY-MM-DD'), 'Y', 4.80, -179.2, 1.35,
          'Y', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (11, 'Ganymede', 'Moon', 0.000628, TO_DATE('1610-01-07', 'YYYY-MM-DD'), 'Y', 3.80, -160.0, 1.43,
          'N', 'Y', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (12, 'Enceladus', 'Moon', 0.000048, TO_DATE('1789-08-28', 'YYYY-MM-DD'), 'Y', 4.00, -201.0, 1.14,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (13, 'Pluto', 'Dwarf Planet', 0.0006, TO_DATE('1930-02-18', 'YYYY-MM-DD'), 'Y', 2.50, -229.0, 0.62,
          'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (14, 'Ceres', 'Asteroid', 0.0006, TO_DATE('1801-01-01', 'YYYY-MM-DD'), 'Y', 1.30, -38.0, 0.27,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (15, 'Eros', 'Asteroid', 1.458, TO_DATE('1898-08-13', 'YYYY-MM-DD'), 'Y', 0.00, -73.0, NULL,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'Y', 'Y');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (16, 'Halley Comet', 'Comet', 0.586, TO_DATE('1705-01-01', 'YYYY-MM-DD'), 'Y', 0.00, -200.0, NULL,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (17, 'Comet NEOWISE', 'Comet', 0.5, TO_DATE('2020-03-27', 'YYYY-MM-DD'), 'Y', 0.00, -190.0, NULL,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (18, 'Sirius A', 'Star', 8.6, TO_DATE('1718-03-02', 'YYYY-MM-DD'), 'N', 0.00, 9940.0, 1.71,
          'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (19, 'Betelgeuse', 'Star', 642.5, TO_DATE('1836-12-05', 'YYYY-MM-DD'), 'N', 0.00, 3500.0, 20.00,
          'N', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (20, 'Crab Pulsar', 'Neutron Star', 6500.0, TO_DATE('1968-08-12', 'YYYY-MM-DD'), 'N', 0.00, 1000000.0, NULL,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO CelestialObjects 
  VALUES (21, 'M87 Black Hole', 'Black Hole', 53000000, TO_DATE('2019-04-10', 'YYYY-MM-DD'), 'N', 0.00, NULL, NULL,
          'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (1, 'Total Solar Eclipse', 'Eclipse', TO_DATE('2024-04-08', 'YYYY-MM-DD'), 9.5, 'None', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (2, 'Lunar Eclipse', 'Eclipse', TO_DATE('2023-11-19', 'YYYY-MM-DD'), 8.2, 'None', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (3, 'Perseid Meteor Shower', 'Meteor Shower', TO_DATE('2024-08-12', 'YYYY-MM-DD'), 9.0, 'None', 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (4, 'Leonid Meteor Shower', 'Meteor Shower', TO_DATE('2024-11-17', 'YYYY-MM-DD'), 7.5, 'None', 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (5, 'Supernova SN 2023a', 'Supernova', TO_DATE('2023-07-05', 'YYYY-MM-DD'), 10.0, 'Severe Radiation', 100);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (6, 'GRB 210905A', 'Gamma-Ray Burst', TO_DATE('2021-09-05', 'YYYY-MM-DD'), 6.5, 'Severe Radiation', 0.1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (7, 'Geomagnetic Storm G5', 'Solar Storm', TO_DATE('2025-02-14', 'YYYY-MM-DD'), 5.0, 'Mild Radiation', 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (8, 'Comet NEOWISE Perihelion', 'Comet Appearance', TO_DATE('2020-07-23', 'YYYY-MM-DD'), 8.8, 'Atmospheric Changes', 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (9, 'Asteroid 2023 DW Close Approach', 'Asteroid Approach', TO_DATE('2023-03-14', 'YYYY-MM-DD'), 7.0, 'Climate Shift', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (10, 'Planetary Alignment of 5 Planets', 'Planetary Event', TO_DATE('2024-06-17', 'YYYY-MM-DD'), 9.7, 'None', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (11, 'GW170817 Neutron Star Collision', 'Black Hole Merger', TO_DATE('2017-08-17', 'YYYY-MM-DD'), 6.0, 'Severe Radiation', 0.5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (12, 'CME Solar Storm X9.3', 'Solar Storm', TO_DATE('2017-09-06', 'YYYY-MM-DD'), 4.8, 'Mild Radiation', 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (13, 'Transit of Venus', 'Planetary Transit', TO_DATE('2012-06-05', 'YYYY-MM-DD'), 9.5, 'None', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (14, 'Discovery of Arrokoth', 'Astronomical Discovery', TO_DATE('2014-06-26', 'YYYY-MM-DD'), 3.5, 'None', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Events 
  VALUES (15, 'Aurora Borealis Strong Activity', 'Aurora Event', TO_DATE('2023-10-10', 'YYYY-MM-DD'), 8.0, 'Atmospheric Changes', 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (1, 'Independent');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (2, 'NASA');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (3, 'ESA');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (4, 'Harvard University');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (5, 'MIT');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (6, 'Caltech');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (7, 'SETI Institute');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (8, 'JAXA');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (9, 'CNSA');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Affiliations VALUES (10, 'ISRO');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (1, 'Dr. Jane Smith', 'jane.smith@nasa.gov', '+1-202-3987145', 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (2, 'Dr. Carlos Mendes', 'carlos.mendes@esa.int', '+33-1-64837129', 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (3, 'Dr. Olivia Huang', 'olivia.huang@astroresearch.com', '+86-10-73549216', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (4, 'Dr. Robert Taylor', 'robert.taylor@harvard.edu', '+1-617-2098567', 4);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (5, 'Dr. Emily Carter', 'emily.carter@mit.edu', '+1-617-4728394', 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (6, 'Dr. Michael Zhang', 'michael.zhang@caltech.edu', '+1-626-9832714', 6);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (7, 'Dr. Samuel Johnson', 'samuel.johnson@seti.org', '+1-650-7823519', 7);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (8, 'Dr. Yuki Tanaka', 'yuki.tanaka@jaxa.jp', '+81-3-94561278', 8);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (9, 'Dr. Wei Liu', 'wei.liu@cnsa.cn', '+86-10-85391742', 9);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (10, 'Dr. Arjun Rao', 'arjun.rao@isro.in', '+91-22-73489261', 10);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (11, 'Dr. Sophia Reynolds', 'sophia.reynolds@nasa.gov', '+1-202-6128947', 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (12, 'Dr. Marco Ricci', 'marco.ricci@esa.int', '+33-1-58324967', 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (13, 'Dr. Nathan Lewis', 'nathan.lewis@astroindependent.com', '+1-415-7923658', 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (14, 'Dr. Alicia Gomez', 'alicia.gomez@harvard.edu', '+1-617-4678923', 4);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (15, 'Dr. Victor Patel', 'victor.patel@mit.edu', '+1-617-5934821', 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (16, 'Dr. Zhang Wei', 'zhang.wei@cnsa.cn', '+86-10-64823715', 9);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (17, 'Dr. Thomas Bennett', 'thomas.bennett@seti.org', '+1-650-3827194', 7);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Researchers 
  VALUES (18, 'Dr. Meera Anand', 'meera.anand@isro.in', '+91-22-94827361', 10);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (1, 'Exoplanet Habitability', TO_DATE('2023-03-21', 'YYYY-MM-DD'), 'Exoplanets', 'Astrophysical Journal', '10.1234/astro.2023a', 9.1, 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (2, 'Terraforming Mars', TO_DATE('2022-10-12', 'YYYY-MM-DD'), 'Terraforming', 'Nature Astronomy', '10.5678/natastro.2022m', 8.9, 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (3, 'Radiation and DNA', TO_DATE('2021-07-25', 'YYYY-MM-DD'), 'Space Radiation', 'Science', '10.8765/sci.2021r', 8.2, 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (4, 'Life on Titan', TO_DATE('2020-05-05', 'YYYY-MM-DD'), 'Astrobiology', 'Journal of Geophysical Research: Planets', '10.5432/jgr.2020t', 9.3, 4);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (5, 'Galactic Evolution', TO_DATE('2019-12-11', 'YYYY-MM-DD'), 'General Astronomy', 'Monthly Notices of the Royal Astronomical Society', '10.6543/mnras.2019g', 8.5, 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (6, 'Black Hole Mergers', TO_DATE('2023-06-18', 'YYYY-MM-DD'), 'General Astronomy', 'Astronomy and Astrophysics', '10.4444/astro.2023b', 9.6, 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (7, 'SETI Radio Signals', TO_DATE('2022-11-14', 'YYYY-MM-DD'), 'Exoplanets', 'Space Science Reviews', '10.3321/ssr.2022s', 8.8, 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (8, 'Moon Base Study', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'Terraforming', 'Icarus', '10.7766/icarus.2024m', 8.7, 8);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (9, 'Mars Surface Study', TO_DATE('2021-08-28', 'YYYY-MM-DD'), 'Terraforming', 'Acta Astronautica', '10.9988/acta.2021m', 9.0, 9);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (10, 'Venus Atmosphere', TO_DATE('2023-02-20', 'YYYY-MM-DD'), 'General Astronomy', 'Planetary and Space Science', '10.4321/pss.2023v', 8.4, 10);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (11, 'Interstellar Objects', TO_DATE('2023-05-05', 'YYYY-MM-DD'), 'Unknown', 'Unknown Journal', '10.7890/unknown.2023i', 6.5, 11);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (12, 'AI in Space', TO_DATE('2022-09-18', 'YYYY-MM-DD'), 'General Astronomy', 'Science', '10.2023/sci.2022a', 8.1, 12);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (13, 'Exoplanet Terraforming', TO_DATE('2020-12-30', 'YYYY-MM-DD'), 'Terraforming', 'Journal of Geophysical Research: Planets', '10.3456/jgr.2020e', 8.9, 13);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (14, 'Advanced Propulsion', TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'General Astronomy', 'Monthly Notices of the Royal Astronomical Society', '10.5678/mnras.2024p', 9.7, 14);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (15, 'Exoplanet Biosignatures', TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Exoplanets', 'Astronomy and Astrophysics', '10.9087/astro.2021b', 9.4, 15);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO ResearchPapers 
  VALUES (16, 'Galactic Clusters', NULL, 'General Astronomy', 'Unknown Journal', '10.1111/unpublished.2024g', 7.1, 16);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (1, 'Gran Telescopio Canarias', 'La Palma, Spain', 'Optical', 10.40, 13000000000, 'Y', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (2, 'Keck I', 'Mauna Kea, Hawaii, USA', 'Optical', 10.00, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (3, 'Keck II', 'Mauna Kea, Hawaii, USA', 'Optical', 10.00, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (4, 'South African Large Telescope', 'Northern Cape, South Africa', 'Optical', 10.00, 13000000000, 'Y', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (5, 'Large Binocular Telescope', 'Mount Graham, Arizona, USA', 'Optical', 11.80, 13000000000, 'Y', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (6, 'Atacama Large Millimeter Array', 'Atacama Desert, Chile', 'Radio', 12.00, 13000000000, 'N', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (7, 'Very Large Telescope', 'Paranal Observatory, Chile', 'Optical', 8.20, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (8, 'Subaru Telescope', 'Mauna Kea, Hawaii, USA', 'Optical', 8.20, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (9, 'Hobby-Eberly Telescope', 'Mount Fowlkes, Texas, USA', 'Optical', 10.00, 13000000000, 'Y', 'N', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (10, 'Giant Magellan Telescope', 'Las Campanas, Chile', 'Optical', 24.50, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (11, 'Thirty Meter Telescope', 'Mauna Kea, Hawaii, USA', 'Optical', 30.00, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (12, 'James Webb Space Telescope', 'Space (L2 point)', 'Infrared', 6.50, 13600000000, 'N', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (13, 'Hubble Space Telescope', 'Low Earth Orbit', 'Optical', 2.40, 13400000000, 'Y', 'Y', 'Y');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Telescopes 
  VALUES (14, 'European Extremely Large Telescope', 'Cerro Armazones, Chile', 'Optical', 39.30, 13000000000, 'Y', 'Y', 'N');
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (1, 1, 1, 1, TO_DATE('2009-03-07', 'YYYY-MM-DD'), 2.314, 0.00231);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (2, 2, 1, 2, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 5.678, 0.00457);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (3, 3, 2, 3, TO_DATE('2024-02-12', 'YYYY-MM-DD'), 8.934, 0.00781);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (4, 4, 2, 4, TO_DATE('2022-11-08', 'YYYY-MM-DD'), 4.672, 0.00328);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (5, 5, 3, 5, TO_DATE('2015-09-10', 'YYYY-MM-DD'), 15.249, 0.01293);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (6, 6, 3, 6, TO_DATE('2020-09-30', 'YYYY-MM-DD'), 12.387, 0.00932);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (7, 7, 4, 7, TO_DATE('2022-07-17', 'YYYY-MM-DD'), 3.567, 0.00292);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (8, 8, 4, 8, TO_DATE('2021-03-05', 'YYYY-MM-DD'), 2.901, 0.00145);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (9, 9, 5, 9, TO_DATE('2023-08-28', 'YYYY-MM-DD'), 9.231, 0.00653);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (10, 10, 5, 10, TO_DATE('2023-01-14', 'YYYY-MM-DD'), 7.653, 0.00512);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (11, 11, 6, 11, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 4.235, 0.00302);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (12, 12, 6, 12, TO_DATE('2020-12-10', 'YYYY-MM-DD'), 5.812, 0.00467);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (13, 13, 7, 1, TO_DATE('2021-02-18', 'YYYY-MM-DD'), 11.478, 0.00821);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (14, 14, 7, 2, TO_DATE('2019-07-25', 'YYYY-MM-DD'), 10.321, 0.00745);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (15, 15, 8, 3, TO_DATE('2018-06-30', 'YYYY-MM-DD'), 6.134, 0.00412);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (16, 16, 8, 4, TO_DATE('2017-11-11', 'YYYY-MM-DD'), 7.451, 0.00587);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (17, 17, 9, 5, TO_DATE('2019-05-19', 'YYYY-MM-DD'), 13.912, 0.00987);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (18, 18, 9, 6, TO_DATE('2016-08-03', 'YYYY-MM-DD'), 9.654, 0.00712);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (19, 19, 10, 7, TO_DATE('2015-04-22', 'YYYY-MM-DD'), 8.732, 0.00634);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Observations 
  VALUES (20, 20, 10, 8, TO_DATE('2014-10-14', 'YYYY-MM-DD'), 10.467, 0.00791);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (1, 'Kepler Mission', 'Exoplanet Detection', TO_DATE('2009-03-07', 'YYYY-MM-DD'), TO_DATE('2018-10-30', 'YYYY-MM-DD'), 1, 2);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (2, 'Mars Terraforming', 'Terraforming Mars Research', TO_DATE('2021-06-15', 'YYYY-MM-DD'), NULL, 2, 3);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (3, 'Deep Space Radiation', 'Space Radiation Research', TO_DATE('2018-11-22', 'YYYY-MM-DD'), TO_DATE('2022-05-10', 'YYYY-MM-DD'), 3, 1);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (4, 'Titan Life Probe', 'Search for Life on Titan', TO_DATE('2024-07-01', 'YYYY-MM-DD'), NULL, 4, 4);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (5, 'Milky Way Mapping', 'Galactic Survey', TO_DATE('2015-09-10', 'YYYY-MM-DD'), TO_DATE('2020-12-20', 'YYYY-MM-DD'), 5, 5);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (6, 'Event Horizon', 'Black Hole Imaging', TO_DATE('2017-04-05', 'YYYY-MM-DD'), TO_DATE('2021-09-15', 'YYYY-MM-DD'), 6, 6);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (7, 'SETI Listening', 'Search for Extraterrestrial Signals', TO_DATE('2010-05-18', 'YYYY-MM-DD'), NULL, 7, 7);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (8, 'JAXA Moon Base', 'Lunar Settlement Research', TO_DATE('2022-02-10', 'YYYY-MM-DD'), NULL, 8, 8);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (9, 'CNSA Tianwen-1', 'Mars Surface Exploration', TO_DATE('2020-07-23', 'YYYY-MM-DD'), NULL, 9, 9);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Missions 
  VALUES (10, 'Shukrayaan-1', 'Venus Atmosphere Study', TO_DATE('2023-11-10', 'YYYY-MM-DD'), NULL, 10, 10);
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 1 AND observation_id = 2;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (1, 2, 'Kepler Mission', 'Exoplanet Detection', 150.75, 'Y', TO_DATE('2015-01-10', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 2 AND observation_id = 4;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (2, 4, 'Mars Terraforming', 'Terraforming Studies', 200.50, 'Y', TO_DATE('2021-07-20', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 3 AND observation_id = 3;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (3, 3, 'Deep Space Radiation', 'Radiation Research', 120.30, 'N', TO_DATE('2019-06-25', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 4 AND observation_id = 5;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (4, 5, 'Titan Life Probe', 'Search for Microbial Life', 300.80, 'Y', TO_DATE('2024-08-05', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 5 AND observation_id = 11;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (5, 11, 'Milky Way Mapping', 'Galactic Cartography', 500.00, 'Y', TO_DATE('2017-03-15', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 6 AND observation_id = 7;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (6, 7, 'Event Horizon', 'Black Hole Imaging', 900.45, 'Y', TO_DATE('2019-04-10', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 7 AND observation_id = 1;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (7, 1, 'SETI Listening', 'Extraterrestrial Signals Search', 250.00, 'N', TO_DATE('2011-06-30', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 8 AND observation_id = 8;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (8, 8, 'JAXA Moon Base', 'Venus Atmospheric Analysis', 180.40, 'Y', TO_DATE('2023-12-14', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 9 AND observation_id = 15;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (9, 15, 'CNSA Tianwen-1', 'Pluto Surface Study', 350.60, 'N', TO_DATE('2021-10-18', 'YYYY-MM-DD'));
  END IF;
END;
/


DECLARE
  v_exists NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO v_exists
  FROM Mission_Observations
  WHERE mission_id = 10 AND observation_id = 9;

  IF v_exists = 0 THEN
      INSERT INTO Mission_Observations 
      VALUES (10, 9, 'Shukrayaan-1', 'Exoplanetary Atmosphere Study', 275.85, 'Y', TO_DATE('2024-03-22', 'YYYY-MM-DD'));
  END IF;
END;
/


BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (1, 1, 1, 'Y', 'Potentially Habitable', 1000000, TO_DATE('2023-08-15', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (2, 2, 2, 'Y', 'Ideal Conditions', 500000, TO_DATE('2022-10-20', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (3, 3, 3, 'N', 'Atmosphere Composition Suitable', 2000, TO_DATE('2023-03-10', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (4, 2, 4, 'N', 'Thin Atmosphere', NULL, TO_DATE('2020-12-05', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (5, 4, 5, 'Y', 'Subsurface Water Ocean', 150000, TO_DATE('2021-05-22', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (6, 6, 6, 'N', 'Extreme Heat', NULL, TO_DATE('2019-07-18', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (9, 7, 7, 'Y', 'Nitrogen-Rich Atmosphere', NULL, TO_DATE('2024-01-12', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (10, 1, 8, 'Y', 'Perfect Conditions', 8000000000, TO_DATE('2024-02-01', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (8, 8, 9, 'N', 'Extreme Greenhouse Effect', NULL, TO_DATE('2021-09-09', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (15, 9, 10, 'N', 'Too Cold and Thin Atmosphere', NULL, TO_DATE('2018-11-14', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (18, 8, 11, 'N', 'Low Gravity and Thin Atmosphere', NULL, TO_DATE('2023-06-25', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (17, 10, 12, 'N', 'Icy Body, No Atmosphere', NULL, TO_DATE('2019-04-17', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (5, 4, 13, 'Y', 'Potential Hydrocarbon Lakes', 100000, TO_DATE('2023-05-30', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (11, 5, 14, 'N', 'Main Sequence Star, No Surface', NULL, TO_DATE('2022-02-28', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (12, 6, 15, 'N', 'Extreme Radiation and Magnetism', NULL, TO_DATE('2020-11-07', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (19, 2, 16, 'N', 'No Atmosphere, Volatile Surface', 5000, TO_DATE('2020-03-29', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (3, 5, 15, 'N', 'High Radiation from Host Star', NULL, TO_DATE('2022-07-20', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (14, 1, 1, 'Y', 'Thick Atmosphere and Liquid Water', 2000000, TO_DATE('2023-10-15', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (5, 7, 15, 'N', 'Sulfur Dioxide Detected in Atmosphere', NULL, TO_DATE('2023-11-05', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

BEGIN
  INSERT INTO Habitable_Planets 
  VALUES (14, 9, 13, 'Y', 'Potentially Habitable with Water Vapor', 300000, TO_DATE('2024-01-20', 'YYYY-MM-DD'));
EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    NULL;
END;
/

COMMIT;
