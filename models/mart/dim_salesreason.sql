with
    erp_salesreason as (
        select *
        from {{ ref('stg_erp__salesreason') }}
    )

select *
from erp_salesreason