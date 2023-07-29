with
    erp_customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    ),

    erp_store as (
        select *
        from {{ ref('stg_erp__store') }}
    ),

    erp_person as (
        select *
        from {{ ref('stg_erp__person') }}
    ),      
    
    join_customer as (
        select
            erp_customer.customer_id,
            
            CASE 
                WHEN erp_customer.person_id is null THEN 
                    erp_store.store_name
                ELSE
                    erp_person.full_name          
            END as customer_name,
            
            CASE 
                WHEN erp_customer.person_id is null THEN 
                    "PJ"
                ELSE
                    "PF"      
            END as customer_type,

        from erp_customer
        left join erp_person  on erp_customer.person_id = erp_person.person_id
        left join erp_store   on erp_customer.store_id = erp_store.store_id
    )

select *
from join_customer