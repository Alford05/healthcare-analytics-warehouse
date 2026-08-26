# Quick Start

## Prerequisites

- Go 1.25+
- Docker Desktop
- Docker Compose
- PostgreSQL (via Docker)
- Git

---

## Clone Repository

```bash
git clone git@github.com:Alford05/healthcare-analytics-warehouse.git
cd healthcare-analytics-warehouse
```

## Start PostgreSQL

```bash
docker compose up -d
```

Verify database is running:

```bash
docker ps
```

## Run Migrations

```bash
make migrate
```

## Generate Sample Data

```bash
go run cmd/generator/main.go
```

Generated files are written to:

```text
data/generated/
```

## Execute ETL Load

```bash
go run cmd/etl/main.go
```

This will:

1. Load CSV files
2. Validate source records
3. Populate warehouse dimensions
4. Populate warehouse fact tables

## Run Reports

```bash
go run cmd/reports/main.go
```

Available reports:

- Therapist Productivity
- Documentation Compliance
- Staffing Utilization
- Department Performance

## Performance Analysis

Run benchmark queries:

```bash
go run cmd/benchmarks/main.go
```

Compare:

- Before indexing
- After indexing

Review query plans:

```sql
EXPLAIN ANALYZE
```

## Expected Outcomes

The system should:

- Successfully load 100,000 source records
- Complete standard reports within 5 seconds
- Maintain idempotent ETL processing
- Preserve source-to-report traceability
