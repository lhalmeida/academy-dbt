with
    erp_country as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    )

select *
from erp_country