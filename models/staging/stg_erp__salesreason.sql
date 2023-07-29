with
    source_salesreason as (
        select
            cast(salesreasonid as string) as salesreason_id,
            name as salesreason_name,
            reasontype as salesreason_type,
        from {{ source('erp', 'salesreason') }}
    )
select *
from source_salesreason