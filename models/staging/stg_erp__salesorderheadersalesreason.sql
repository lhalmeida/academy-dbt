with
    source_salesorderheadersalesreason as (
        select
            cast(salesorderid as string) as order_id,
            cast(salesreasonid as string) as sales_reason_id,

        from {{ source('erp', 'salesorderheadersalesreason') }}
    )
select *
from source_salesorderheadersalesreason