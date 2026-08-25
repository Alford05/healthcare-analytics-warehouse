# Research: Healthcare Analytics Warehouse

## Overview

This document captures architectural and technical decisions made during the planning phase of the Healthcare Analytics Warehouse project.

The objective is to build a healthcare analytics warehouse that demonstrates:

- Data engineering workflows
- Analytics engineering practices
- PostgreSQL performance optimization
- ETL pipeline design
- Data warehouse modeling
- AI-assisted software development using Spec Kit and GitHub Copilot

---

## Decision 1: Warehouse Architecture

### Decision

Use a layered warehouse architecture:

```text
Source CSV Files
        ↓
Raw Layer
        ↓
Staging Layer
        ↓
Warehouse Layer
        ↓
Reporting Layer
```

### Rationale

Separating data into layers improves:

- Traceability
- Maintainability
- Data quality validation
- Debugging

This architecture mirrors common enterprise analytics platforms.

### Alternatives Considered

#### Direct CSV → Warehouse

Pros:

- Simpler implementation

Cons:

- Limited traceability
- Difficult troubleshooting
- Reduced realism

Rejected in favor of a layered architecture.

---

## Decision 2: Warehouse Modeling Strategy

### Decision

Use a Star Schema design.

### Rationale

Star schemas are optimized for analytical workloads because they:

- Simplify reporting queries
- Improve query performance
- Reduce join complexity
- Align with BI and analytics tooling

### Alternatives Considered

#### Snowflake Schema

Pros:

- Reduced redundancy

Cons:

- Increased query complexity
- Less suitable for learning analytics workloads

Rejected due to additional complexity.

---

## Decision 3: Data Storage Platform

### Decision

Use PostgreSQL.

### Rationale

PostgreSQL provides:

- Mature SQL support
- Strong indexing capabilities
- Query execution analysis
- Real-world relevance

It aligns closely with the SQL-focused goals of the project.

### Alternatives Considered

#### SQLite

Rejected due to limited scalability and optimization capabilities.

#### Cloud Data Warehouses

Examples:

- Snowflake
- BigQuery
- Redshift

Rejected to keep the project locally deployable.

---

## Decision 4: ETL Implementation Language

### Decision

Use Go for ETL development.

### Rationale

Go provides:

- Strong performance
- Simple deployment
- Excellent CSV processing support
- Familiarity with previous portfolio projects

This also reinforces backend engineering skills.

### Alternatives Considered

#### Python

Pros:

- Popular in data engineering

Cons:

- Less aligned with current learning goals

Rejected in favor of Go.

---

## Decision 5: Data Source Format

### Decision

Use CSV files with documented schemas.

### Rationale

CSV files are:

- Easy to inspect
- Easy to version control
- Easy to generate
- Common in ETL workflows

### Alternatives Considered

#### JSON

Rejected because tabular healthcare operational data is naturally represented in CSV format.

---

## Decision 6: Data Privacy Strategy

### Decision

Use synthetic or fully de-identified healthcare data only.

### Rationale

The project focuses on analytics engineering rather than healthcare compliance.

This allows:

- Public demonstration
- Open-source publication
- Simplified development

No protected health information (PHI) will be stored.

---

## Decision 7: ETL Reliability Strategy

### Decision

ETL workflows must be idempotent.

### Rationale

Repeated execution of the same load process must not create duplicate records.

Benefits:

- Reproducibility
- Data integrity
- Easier operational recovery

### Approach

Source files will be tracked during ingestion.

Duplicate files will be rejected or safely ignored.

---

## Decision 8: Performance Strategy

### Decision

Benchmark warehouse performance using indexing and query analysis.

### Target

- 100,000 source records
- Standard reports complete within 5 seconds

### Techniques

- B-tree indexes
- Query plan analysis
- Execution timing comparisons
- Before/after optimization measurements

### Rationale

Performance tuning is a primary learning objective of the project.

---

## Decision 9: AI-Assisted Development

### Decision

Use Spec Kit and GitHub Copilot throughout development.

### Rationale

Modern software engineering increasingly incorporates AI-assisted workflows.

This project demonstrates:

- Specification-driven development
- AI-assisted implementation
- Human review of generated outputs

### Governance

All AI-generated code, documentation, and design recommendations require human review before acceptance.

---

## Research Conclusions

The selected architecture balances:

- Real-world relevance
- Learning value
- Maintainability
- Demonstrable engineering skills

The resulting warehouse will provide meaningful experience with:

- PostgreSQL
- SQL optimization
- Data modeling
- ETL development
- Analytics engineering
- AI-assisted software development
