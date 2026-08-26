# Data Model: Healthcare Analytics Warehouse

## Overview

The Healthcare Analytics Warehouse uses a layered architecture:

```text
CSV Sources
    ↓
Raw Layer
    ↓
Staging Layer
    ↓
Warehouse Layer
    ↓
Reporting Layer
```

The warehouse is designed to support:

- Therapist productivity reporting
- Documentation compliance reporting
- Staffing utilization reporting
- Department performance reporting
- Performance benchmarking exercises

---

# Source Datasets

## Patients

Represents patient demographic information.

### Fields

| Field | Type |
|---------|---------|
| patient_id | integer |
| age | integer |
| diagnosis | varchar |

---

## Therapists

Represents therapy staff.

### Fields

| Field | Type |
|---------|---------|
| therapist_id | integer |
| therapist_name | varchar |
| discipline | varchar |
| department_id | integer |

---

## Therapy Visits

Represents individual treatment encounters.

### Fields

| Field | Type |
|---------|---------|
| visit_id | integer |
| patient_id | integer |
| therapist_id | integer |
| visit_date | date |
| visit_type | varchar |
| duration_minutes | integer |
| notes_completed | boolean |

---

## Documentation Metrics

Represents documentation compliance measurements.

### Fields

| Field | Type |
|---------|---------|
| metric_id | integer |
| therapist_id | integer |
| reporting_period | date |
| completion_rate | numeric |

---

## Staffing

Represents staffing and scheduling information.

### Fields

| Field | Type |
|---------|---------|
| staffing_id | integer |
| therapist_id | integer |
| work_date | date |
| scheduled_hours | numeric |
| productive_hours | numeric |

---

# Warehouse Model

The warehouse uses a star schema design to support analytical reporting,
performance optimization, and dimensional analysis.

## Dimension Tables

### dim_patient

Stores descriptive patient information used for reporting and filtering.

| Field | Type |
|---------|---------|
| patient_key | integer |
| patient_id | integer |
| diagnosis | varchar |
| age_group | varchar |

### dim_therapist

Stores descriptive therapist information.

| Field | Type |
|---------|---------|
| therapist_key | integer |
| therapist_id | integer |
| therapist_name | varchar |
| discipline | varchar |
| department_id | integer |

### dim_department

Stores department information.

| Field | Type |
|---------|---------|
| department_key | integer |
| department_id | integer |
| department_name | varchar |

### dim_date

Stores calendar attributes used for reporting.

| Field | Type |
|---------|---------|
| date_key | integer |
| calendar_date | date |
| month | integer |
| quarter | integer |
| year | integer |

---

## Fact Tables

### fact_visits

Stores visit activity used for productivity and volume reporting.

| Field | Type |
|---------|---------|
| visit_key | integer |
| therapist_key | integer |
| patient_key | integer |
| date_key | integer |
| duration_minutes | integer |
| visit_count | integer |

### fact_documentation

Stores documentation compliance activity.

| Field | Type |
|---------|---------|
| documentation_key | integer |
| therapist_key | integer |
| date_key | integer |
| completed_visits | integer |
| total_visits | integer |

### fact_staffing

Stores staffing utilization information.

| Field | Type |
|---------|---------|
| staffing_key | integer |
| therapist_key | integer |
| department_key | integer |
| date_key | integer |
| scheduled_hours | numeric |
| productive_hours | numeric |

# Reporting Metrics

## Therapist Productivity

Total Treatment Minutes / Hours Worked

## Documentation Compliance

Completed Documentation / Total Visits

## Staffing Utilization

Productive Hours / Scheduled Hours
