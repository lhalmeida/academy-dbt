with
    source_store as (
        select
            cast(businessentityid as string) as store_id,
            name as store_name,
        from {{ source('erp', 'store') }}
    )
select *
from source_store