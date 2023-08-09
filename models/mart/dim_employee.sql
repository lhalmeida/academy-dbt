with
    erp_employee as (
        select
            employee_id,
            birth_date,
            hire_date,
            job_title,
            gender,
            marital_status,
        from {{ ref('stg_erp__employee') }}
    ),

    erp_person as (
        select *
        from {{ ref('stg_erp__person') }}
    ),

    erp_salesperson as (
        select *
        from {{ ref('stg_erp__salesperson') }}
    ),      
    
    join_employee_name as (
        select
            erp_employee.employee_id,
            erp_person.full_name as employee_name,
            erp_employee.birth_date,
            erp_employee.hire_date,
            erp_employee.job_title,
            erp_employee.gender,
            erp_employee.marital_status,
            CASE 
                WHEN erp_salesperson.salesperson_id is null
                    THEN false
                ELSE true
            END as is_salesperson
        from erp_employee
        left join erp_person      on erp_employee.employee_id = erp_person.person_id
        left join erp_salesperson on erp_employee.employee_id = erp_salesperson.salesperson_id
    )

select *
from join_employee_name