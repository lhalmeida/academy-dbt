with
    erp_city as (
        select 
            distinct(cast(city || '|' || state_id as string)) as city_id,
            state_id,
            city
        from {{ ref('stg_erp__address') }}
    )

select *
from erp_city