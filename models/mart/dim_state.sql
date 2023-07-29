with
    erp_state as (
        select *
        from {{ ref('stg_erp__state') }}
    )

select *
from erp_state