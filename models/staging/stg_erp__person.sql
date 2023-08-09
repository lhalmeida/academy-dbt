with
    source_person as (
        select
            cast(businessentityid as string) as person_id,
            firstname as first_name,
            lastname as last_name,
            CASE 
                WHEN middlename is not null THEN 
                    cast(firstname || ' ' || middlename || ' ' || lastname  as string)
                ELSE
                    cast(firstname || ' ' || lastname  as string)           
            END as full_name,
        from {{ source('erp', 'person') }}
    )
select *
from source_person