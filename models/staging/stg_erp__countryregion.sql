with
    source_countryregion as (
        select
            cast(countryregioncode as string) as country_code,
            name as country_name,
        from {{ source('erp', 'countryregion') }}
    )
select *
from source_countryregion