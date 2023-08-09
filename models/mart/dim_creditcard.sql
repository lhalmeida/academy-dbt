with
    erp_creditcard as (
        select *
        from {{ ref('stg_erp__creditcard') }}
    )

select *
from erp_creditcard