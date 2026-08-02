# 🚀 Astro Track – Oracle SQL Database Management System

![Oracle](https://img.shields.io/badge/Oracle-SQL-red)
![PLSQL](https://img.shields.io/badge/PL%2FSQL-Programming-blue)
![GitHub](https://img.shields.io/badge/Git-Version%20Control-black)
![Database](https://img.shields.io/badge/Database-Administration-green)

## 📖 Overview

Astro Track is a full-stack astronomical research database management system designed to store, manage, analyze, and visualize information related to celestial objects, astronomical events, researchers, research papers, telescopes, space missions, and potentially habitable planets.

This project was developed as part of the Advanced Database Concepts course at Centennial College and demonstrates practical database administration (DBA), relational database design, PL/SQL development, query optimization, indexing strategies, trigger implementation, and frontend integration.

The project combines database engineering principles with an interactive frontend interface to create a complete astronomy management platform.

## Docker Compose bootstrap script (local development)

For local Docker Compose integration with the frontend/backend stack, this repository owns the non-destructive bootstrap script:

- `sql/docker-compose/init_celestial_objects_bootstrap.sql`

Purpose:

- Initialize the `CELESTIALOBJECTS` table required by the read-only API.
- Preserve existing tables and data.
- Allow safe repeat execution without duplicate sample rows.

Run manually from the `Astro-Track-Frontend` compose project:

```powershell
docker compose exec -T oracle bash -lc "sqlplus ${ORACLE_APP_USER}/${ORACLE_APP_PASSWORD}@localhost/FREEPDB1 @/workspace/sql/docker-compose/init_celestial_objects_bootstrap.sql"
```

Safety characteristics:

- No `DROP TABLE`, `DROP USER`, or `PURGE` operations.
- Handles table-already-exists scenarios safely.
- Adds constraints only when missing.
- Inserts sample rows only when they do not already exist.

---

## 🎯 Objectives

The main objectives of this project are to:

- Design a scalable relational database.
- Implement normalization techniques.
- Maintain data integrity through constraints and triggers.
- Create optimized indexes and improve query performance.
- Implement reusable PL/SQL procedures and packages.
- Demonstrate CRUD operations.
- Integrate database operations with a frontend application.
- Apply software development and database administration best practices.

---

## 🛠 Technology Stack

### Database Technologies

- Oracle SQL
- PL/SQL
- Oracle SQL Developer

### Programming Languages

- SQL
- PL/SQL
- JavaScript
- HTML
- CSS

### Database Objects

- Tables
- Primary keys
- Foreign keys
- Constraints
- Indexes
- Sequences
- Triggers
- Functions
- Procedures
- Packages

### Tools

- Git
- GitHub
- Visual Studio Code
- Oracle SQL Developer
- Microsoft Visio

---

# 🏗 Project Architecture

The database consists of ten tables:

### Entity tables

- Celestial Objects
- Events
- Affiliations
- Researchers
- Research Papers
- Telescopes
- Missions

### Bridge tables

- Observations
- Mission Observations
- Habitable Planets

---

## Database Relationships

The system implements several relationship types:

- One-to-one relationships
- One-to-many relationships
- Many-to-many relationships
- Composite relationships
- Foreign key constraints

---

# 🧠 Database Design

The Astro Track database was developed in three phases:

### Phase 1 – Mind Mapping

The initial database structure was designed using an entity relationship diagram.

### Phase 2 – Logical Design

Microsoft Visio was used to define relationships, attributes, keys, and constraints.

### Phase 3 – Physical Database Design

Oracle SQL Developer was used to create tables, relationships, sequences, packages, triggers, procedures, and indexes.

---

# 📊 Entity Relationship Diagram (ERD)

The database architecture contains the following components:

| Component | Description |
|------|------|
| Celestial Objects | Stores planets, stars, galaxies, exoplanets, and other astronomical bodies |
| Events | Stores astronomical events |
| Affiliations | Stores institutions and organizations |
| Researchers | Stores researcher information |
| Research Papers | Stores published research papers |
| Telescopes | Stores telescope information |
| Missions | Stores space mission information |
| Observations | Stores collected observation data |
| Mission Observations | Connects missions and observations |
| Habitable Planets | Stores habitability analysis information |

---

# ⚡ Indexing and Query Optimization

Indexes were created to improve database performance and optimize complex queries.

### Implemented optimizations

- Search optimization
- Filtering optimization
- Join optimization
- Foreign key indexing
- Composite indexing

### Example queries

#### Query 1

Identify researchers who led missions that started on the same day as their observations.

#### Query 2

Identify researchers associated with organizations that contributed to multiple habitable planets.

---

# 🔄 Sequences

Sequences were implemented to generate unique identifiers automatically.

Examples include:

- Mission identifiers
- Researcher identifiers
- Observation identifiers
- Celestial object identifiers

These sequences ensure consistency and improve scalability.

---

# ⚙️ Triggers

Several triggers were implemented to enforce business rules and maintain data integrity.

### create_observation_trg

Automatically inserts timestamps for newly created observations.

### future_observations_trg

Prevents future observation dates from being inserted.

### mission_observation_trg

Prevents observations from being added to completed missions.

### habplanets_null_trg

Replaces NULL values with default values.

### habplanets_habitable_trg

Prevents population values from being assigned to non-habitable planets.

---

# 📦 Procedures and Packages

The project contains a reusable package called:

```sql
SpaceResearchPackage
```

The package supports CRUD operations for:

- Celestial Objects
- Researchers
- Events
- Missions

---

### Example package procedures

```sql
AddCelestialObject()
UpdateMission()
DeleteResearcher()
SearchObservation()
```

---

# 🔍 Features

### Database features

- Relational database design
- Query optimization
- Database normalization
- Trigger implementation
- Sequence generation
- Constraint enforcement
- Package development
- Stored procedure implementation

### Frontend features

- Dynamic filtering
- Search functionality
- Table management
- Data insertion
- Data visualization
- Responsive design

---

# 🖥 User Interface

Users can:

- Search celestial objects
- Filter astronomical data
- View missions
- View researchers
- Insert new records
- Execute database packages
- Display updated results

---

# 📂 Repository Structure

```text
Astro-Track-Oracle-SQL
│
├── docs
│
├── documentation
│
├── images
│
├── presentations
│
├── rational_model
│
├── script-output
│
├── sql
│   ├── Astro_Track_Project.sql
│   │
│   └── PL_SQL
│       ├── indexes.sql
│       ├── sequence.sql
│       ├── sequences.sql
│       ├── sequence_indexes1.sql
│       ├── sequence_indexes2.sql
│       ├── sequences_packages.sql
│       └── ...
│
└── README.md
```

---

# 🔐 Database Administration Concepts Demonstrated

- Relational database management systems (RDBMS)
- Data integrity enforcement
- Database normalization
- Query optimization
- Index management
- Constraint management
- Transaction management
- Stored procedures
- Packages
- Triggers
- Sequences
- Performance tuning

---

# 💻 Software Engineering Concepts Demonstrated

- Version control with Git
- Repository management with GitHub
- Documentation
- Database modeling
- Problem-solving
- System design
- Agile development workflow

---

# 🎓 Skills Demonstrated

### Database

- Oracle SQL
- PL/SQL
- Query optimization
- Indexing
- Database design
- Normalization
- Stored procedures
- Packages
- Triggers
- Sequences

### Backend

- SQL development
- Database administration
- Data modeling

### Frontend

- HTML
- CSS
- JavaScript

### Development Tools

- Git
- GitHub
- Oracle SQL Developer
- Microsoft Visio
- Visual Studio Code

---

# 🚀 Future Improvements

- Migration to MySQL and PostgreSQL
- REST API implementation using ASP.NET
- Entity Framework integration
- Angular frontend implementation
- Docker containerization
- CI/CD implementation
- Cloud deployment using AWS and Azure

---

## 👨‍💻 Author

**Jaturaput (Mac) Jongsubcharoen**

- LinkedIn: https://www.linkedin.com/in/jaturaput-jongsubcharoen/
- GitHub: https://github.com/Jaturaput-Jongsubcharoen

---

*Developed as part of the Advanced Database Concepts course at Centennial College.*