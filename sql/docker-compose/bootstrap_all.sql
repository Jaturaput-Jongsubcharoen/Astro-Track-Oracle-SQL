SET SERVEROUTPUT ON;
PROMPT ==============================================================
PROMPT Astro Track full local Docker bootstrap (non-destructive)
PROMPT ==============================================================

@/workspace/sql/docker-compose/01_tables.sql
@/workspace/sql/docker-compose/02_constraints.sql
@/workspace/sql/docker-compose/03_seed_data.sql
@/workspace/sql/docker-compose/04_indexes.sql
@/workspace/sql/docker-compose/05_sequences.sql
@/workspace/sql/docker-compose/06_triggers.sql
@/workspace/sql/docker-compose/07_packages.sql
@/workspace/sql/docker-compose/08_procedures.sql
@/workspace/sql/docker-compose/09_functions.sql

COMMIT;
PROMPT Bootstrap completed.
