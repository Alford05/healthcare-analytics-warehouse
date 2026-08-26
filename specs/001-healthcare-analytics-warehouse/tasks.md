# Tasks: Healthcare Analytics Warehouse

**Input**: Design documents from `/specs/001-healthcare-analytics-warehouse/`

**Prerequisites**: plan.md (required), spec.md (required for user stories), research.md, data-model.md, quickstart.md

**Organization**: Tasks are grouped by user story to enable independent implementation and testing of each story.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story this task belongs to (e.g., US1, US2, US3)
- Include exact file paths in descriptions

## Phase 1: Setup (Shared Infrastructure)

**Purpose**: Project initialization and shared development environment for the warehouse

- [ ] T001 Create the Go project structure for the warehouse in healthcare-analytics-warehouse/cmd, healthcare-analytics-warehouse/internal, healthcare-analytics-warehouse/migrations, healthcare-analytics-warehouse/data, healthcare-analytics-warehouse/tests, and healthcare-analytics-warehouse/docs
- [ ] T002 Initialize the Go module and dependency set in healthcare-analytics-warehouse/go.mod and healthcare-analytics-warehouse/go.sum
- [ ] T003 [P] Configure the Docker-based PostgreSQL environment in healthcare-analytics-warehouse/docker-compose.yml
- [ ] T004 [P] Configure linting, formatting, and local task commands in healthcare-analytics-warehouse/Makefile and healthcare-analytics-warehouse/.golangci.yml

---

## Phase 2: Foundational (Blocking Prerequisites)

**Purpose**: Core infrastructure that MUST be complete before any user story can be implemented

- [ ] T005 Set up the base database schema and migration entry points in healthcare-analytics-warehouse/migrations/001_init_schema.sql and healthcare-analytics-warehouse/cmd/etl/main.go
- [ ] T006 [P] Implement environment configuration and database connectivity in healthcare-analytics-warehouse/internal/db/config.go and healthcare-analytics-warehouse/internal/db/connection.go
- [ ] T007 [P] Create base ETL orchestration and logging utilities in healthcare-analytics-warehouse/internal/etl/orchestrator.go and healthcare-analytics-warehouse/internal/etl/logging.go
- [ ] T008 Implement raw-layer and staging-layer schema contracts in healthcare-analytics-warehouse/migrations/001_init_schema.sql and healthcare-analytics-warehouse/migrations/002_staging_schema.sql
- [ ] T009 [P] Build the synthetic healthcare dataset generator in healthcare-analytics-warehouse/cmd/generator/main.go and healthcare-analytics-warehouse/data/generated/
- [ ] T010 Add idempotency, duplicate detection, and lineage metadata handling in healthcare-analytics-warehouse/internal/etl/idempotency.go and healthcare-analytics-warehouse/internal/etl/lineage.go

**Checkpoint**: Foundation ready - user story implementation can now begin in parallel

---

## Phase 3: User Story 1 - Raw ingestion and validation (Priority: P1) 🎯 MVP

**Goal**: Ingest source CSV files into the raw layer with validation, duplicate filtering, and reproducible load behavior.

**Independent Test**: Run the ETL process against sample CSV data and confirm the raw tables populate without duplicate records and with rejection counts reported.

### Implementation for User Story 1

- [ ] T011 [P] [US1] Implement the CSV source loader in healthcare-analytics-warehouse/internal/loaders/csv_loader.go
- [ ] T012 [P] [US1] Add schema validation, null checks, and source record quality rules in healthcare-analytics-warehouse/internal/loaders/validation.go
- [ ] T013 [US1] Create the raw ingestion job and orchestration flow in healthcare-analytics-warehouse/internal/etl/raw_load.go
- [ ] T014 [US1] Add rejection tracking and data quality summary output in healthcare-analytics-warehouse/internal/loaders/rejections.go
- [ ] T015 [US1] Implement idempotent raw-table inserts and duplicate detection in healthcare-analytics-warehouse/internal/db/raw_repository.go
- [ ] T016 [US1] Validate the ingestion path through the CLI entry point in healthcare-analytics-warehouse/cmd/etl/main.go

**Checkpoint**: At this point, User Story 1 should be fully functional and independently testable

---

## Phase 4: User Story 2 - Warehouse transformation and model build (Priority: P2)

**Goal**: Transform raw operational data into warehouse dimensions and facts optimized for reporting and trend analysis.

**Independent Test**: Run the warehouse transformation step and confirm dimension and fact row counts match the source data with consistent lineage keys populated.

### Implementation for User Story 2

- [ ] T017 [P] [US2] Create the dimension table definitions in healthcare-analytics-warehouse/migrations/003_dimensions.sql
- [ ] T018 [P] [US2] Create the fact table definitions in healthcare-analytics-warehouse/migrations/004_facts.sql
- [ ] T019 [US2] Implement the raw-to-dimension transformation in healthcare-analytics-warehouse/internal/warehouse/dimensions.go
- [ ] T020 [US2] Implement the raw-to-fact transformation in healthcare-analytics-warehouse/internal/warehouse/facts.go
- [ ] T021 [US2] Add source-to-target lineage mapping and traceability in healthcare-analytics-warehouse/internal/etl/lineage.go
- [ ] T022 [US2] Validate transformed warehouse counts and metric alignment in healthcare-analytics-warehouse/tests/integration/warehouse_transform_test.go

**Checkpoint**: At this point, User Story 1 and User Story 2 should both work independently

---

## Phase 5: User Story 3 - Reporting and operational analysis (Priority: P2)

**Goal**: Provide reporting queries for therapist productivity, documentation compliance, staffing utilization, visit trends, and department performance.

**Independent Test**: Run the reporting commands and confirm baseline metric calculations produce stable results for the supported synthetic dataset.

### Implementation for User Story 3

- [ ] T023 [P] [US3] Implement therapist productivity reporting SQL in healthcare-analytics-warehouse/internal/reports/productivity.go
- [ ] T024 [P] [US3] Implement documentation compliance reporting SQL in healthcare-analytics-warehouse/internal/reports/compliance.go
- [ ] T025 [US3] Implement staffing utilization reporting SQL in healthcare-analytics-warehouse/internal/reports/staffing.go
- [ ] T026 [US3] Implement department performance and visit trend queries in healthcare-analytics-warehouse/internal/reports/department.go
- [ ] T027 [US3] Build the CLI reporting entry point in healthcare-analytics-warehouse/cmd/reports/main.go
- [ ] T028 [US3] Validate report timing and output accuracy in healthcare-analytics-warehouse/tests/performance/report_benchmarks_test.go

**Checkpoint**: At this point, reporting can be executed and validated independently of earlier ETL work

---

## Phase 6: User Story 4 - Performance tuning and documentation (Priority: P3)

**Goal**: Improve warehouse performance through indexing, benchmark execution, and documented operational guidance.

**Independent Test**: Re-run benchmark queries after indexing and confirm the standard reports complete within the 5-second performance target on the local deployment.

### Implementation for User Story 4

- [ ] T029 [P] [US4] Add the indexing strategy and benchmark setup in healthcare-analytics-warehouse/migrations/005_indexes.sql
- [ ] T030 [US4] Implement the benchmark runner and execution comparison in healthcare-analytics-warehouse/cmd/benchmarks/main.go
- [ ] T031 [P] [US4] Document the ETL architecture and data-flow decisions in healthcare-analytics-warehouse/docs/architecture.md and healthcare-analytics-warehouse/docs/etl-flow.md
- [ ] T032 [US4] Update the project quickstart and operational guidance in healthcare-analytics-warehouse/README.md
- [ ] T033 [US4] Record AI governance and human review expectations in healthcare-analytics-warehouse/docs/review-checklist.md

**Checkpoint**: All user stories should now be independently functional and benchmarkable

---

## Phase 7: Polish & Cross-Cutting Concerns

**Purpose**: Final validation, cleanup, and release readiness across all stories

- [ ] T034 [P] Run the end-to-end quickstart validation by executing the Docker, migration, data generation, ETL, report, and benchmark steps from healthcare-analytics-warehouse/README.md
- [ ] T035 [P] Refactor shared ETL utilities and error handling to keep cross-story components consistent in healthcare-analytics-warehouse/internal/etl/ and healthcare-analytics-warehouse/internal/loaders/
- [ ] T036 Review final metrics, documentation quality, and MVP readiness before handoff in healthcare-analytics-warehouse/docs/ and healthcare-analytics-warehouse/README.md

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies - can start immediately
- **Phase 2 (Foundational)**: Depends on Setup completion - blocks all user stories
- **Phase 3+ (User Stories)**: All depend on the Foundational phase
- **Phase 7 (Polish)**: Depends on all desired user stories being complete

### User Story Dependencies

- **User Story 1 (P1)**: Can start after Foundational - no story dependencies
- **User Story 2 (P2)**: Can start after Foundational and can run in parallel with US1 once the shared raw layer is stable
- **User Story 3 (P2)**: Can start after the warehouse is populated and can run in parallel with US2 after validation
- **User Story 4 (P3)**: Depends on the reporting layer becoming stable and should be performed after the main user stories

### Parallel Opportunities

- Setup tasks T003 and T004 can run in parallel
- Foundational tasks T006, T007, and T009 can run in parallel once the base schema is initialized
- User Story 1 tasks T011 and T012 can run in parallel
- User Story 2 tasks T017 and T018 can run in parallel
- User Story 3 tasks T023 and T024 can run in parallel
- User Story 4 tasks T029 and T031 can run in parallel
- Final polish tasks T034 and T035 can run in parallel

### Parallel Example: User Story 1

```bash
# Run schema validation and raw loader work in parallel

Task: "Implement the CSV source loader in healthcare-analytics-warehouse/internal/loaders/csv_loader.go"

Task: "Add schema validation, null checks, and source record quality rules in healthcare-analytics-warehouse/internal/loaders/validation.go"
```

---

## Implementation Strategy

### MVP First (User Story 1 Only)

1. Complete Phase 1: Setup
2. Complete Phase 2: Foundational
3. Complete Phase 3: User Story 1
4. Stop and validate the ingestion path before continuing
5. Deliver the MVP if raw ingestion and validation are stable

### Incremental Delivery

1. Setup + Foundational → foundation ready
2. User Story 1 → raw ingestion and duplicate handling validated
3. User Story 2 → warehouse transformation validated
4. User Story 3 → reporting layer validated
5. User Story 4 → performance tuning and documentation
6. Final polish → release readiness and review

### Parallel Team Strategy

With multiple developers:

1. One engineer handles Setup + Foundational tasks
2. One engineer focuses on US1 raw ingestion
3. One engineer focuses on US2 warehouse transformation
4. One engineer handles US3 reporting
5. One engineer completes US4 performance and documentation

---

## Notes

- `[P]` tasks represent different files or independent workstreams without blocking dependencies.
- `[Story]` labels map tasks to the user story they support for traceability and release planning.
- Each story is scoped so it can be validated independently before the next story begins.
- The project should remain data-safe and synthetic-only throughout implementation.
- The final MVP should prioritize raw ingestion and warehouse reporting before benchmark optimization.
