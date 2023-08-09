with
    source_state as (
        select
            cast(stateprovinceid as string) as state_id,
            cast(territoryid as string) as territory_id,            
            name as state_name,
            stateprovincecode as state_UF,
            countryregioncode as country_code,
        from {{ source('erp', 'stateprovince') }}
    )
select *
from source_state