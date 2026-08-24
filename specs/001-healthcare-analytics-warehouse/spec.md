# Healthcare Analytics Warehouse
## Overview

Build a healthcare analytics warehouse using Go, PostgreSQL, Docker, Spec Kit, and GitHub Copilot.

The warehouse will ingest operational healthcare datasets, transform raw records into analytical models, and support reporting workloads focused on therapist productivity, documentation compliance, staffing utilization, and operational performance analysis.

The project is intended to demonstrate data engineering practices, analytics engineering workflows, PostgreSQL optimization techniques, and AI-assisted software development.

## Goals
### Goal 1: Data Ingestion

The system shall ingest healthcare operational datasets from source files into a raw data layer.

### Goal 2: Data Transformation

The system shall transform raw operational data into analytics-ready warehouse structures.

### Goal 3: Analytical Reporting

The system shall support reporting and analysis for:

Therapist productivity
Documentation compliance
Staffing utilization
Visit volume trends
Department performance
Goal 4: Performance Analysis

The system shall support indexing exercises, query analysis, and performance benchmarking.

### Goal 5: Documentation

The system shall document architecture decisions, data flows, transformation logic, and performance findings.

### Goal 6: AI-Assisted Development

The project shall demonstrate responsible use of AI-assisted development workflows using Spec Kit and GitHub Copilot.

## Functional Requirements
### FR-1 Raw Data Storage

The system shall store source data separately from transformed warehouse structures.

### FR-2 ETL Processing

The system shall support repeatable ETL workflows for loading and transforming healthcare data.

### FR-3 Warehouse Modeling

The system shall maintain analytical models optimized for reporting workloads.

### FR-4 Reporting Queries

The system shall provide analytical queries capable of producing productivity and compliance metrics.

### FR-5 Data Lineage

The system shall preserve traceability between source records and analytical outputs.

### FR-6 Performance Measurement

The system shall provide a mechanism for measuring and comparing query performance.

## Non-Functional Requirements
### NFR-1 Reproducibility

All data loads and transformations must be reproducible.

### NFR-2 Maintainability

Transformation logic must be documented and understandable.

### NFR-3 Performance

Warehouse queries should be optimized through indexing and query tuning.

### NFR-4 Documentation

Architecture and implementation decisions must be documented.

### NFR-5 AI Governance

AI-generated code and documentation must undergo human review before acceptance.

## Clarifications

### Data Privacy

The warehouse shall use synthetic or fully de-identified healthcare data only.

No protected health information (PHI) shall be stored or processed.

### Source Data Format

The first release shall support ingestion of CSV files with documented schemas.

### Baseline Metric Definitions

**Therapist Productivity**

```text
Total Treatment Minutes
-----------------------
Hours Worked
```

**Documentation Compliance**

```text
Completed Documentation
-----------------------
Total Visits
```

**Staffing Utilization**

```text
Productive Hours
----------------
Scheduled Hours
```

These formulas serve as the baseline definitions for all reporting and validation activities in Version 1.

### Performance Targets

The warehouse shall support a minimum of 100,000 source records.

Standard analytical reports shall complete within 5 seconds on the supported local deployment environment.

### ETL Reliability

ETL loads shall be idempotent.

Duplicate source files shall be detected and rejected or safely ignored.

Repeated execution of the same load process shall not create duplicate analytical records.

## Success Criteria

The project is considered successful when:

- Raw healthcare data can be loaded into PostgreSQL.
- Data can be transformed into warehouse structures.
- Analytical reports can be generated from warehouse tables.
- Query performance improvements can be demonstrated and measured.
- Architecture and implementation decisions are documented.
- The project demonstrates Spec Kit and AI-assisted development workflows.

## Out of Scope

- Frontend applications
- Authentication systems
- Cloud deployment
- Real-time streaming pipelines
- Machine learning models
