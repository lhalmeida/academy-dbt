with
    source_employee as (
        select
            cast(businessentityid as string) as employee_id,
            birthdate as birth_date,
            hiredate as hire_date,
            jobtitle as job_title,
            gender as gender,
            maritalstatus as marital_status,
            organizationnode as organization_node,
        from {{ source('erp', 'employee') }}
    )
select *
from source_employee