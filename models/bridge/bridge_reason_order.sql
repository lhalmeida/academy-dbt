with
    erp_salesreasonheader as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    )
    
select *
from erp_salesreasonheader