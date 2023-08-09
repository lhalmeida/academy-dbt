with
    erp_address as (
        select 
            cast(address_id as string) as address_id,
            cast(address_line1 || '  ' || address_line2  as string)  as full_address,
            state_id,
            city
        from {{ ref('stg_erp__address') }}
    ),

    erp_state as (
        select *
        from {{ ref('stg_erp__state') }}
    ),

    erp_country as (
        select *
        from {{ ref('stg_erp__countryregion') }}
    ),

    join_region as (
        select 
            erp_address.address_id,
            erp_country.country_name,
            erp_state.state_name,
            erp_state.state_UF,
            erp_address.city,
            erp_address.full_address,
        from erp_address
        left join erp_state  on erp_address.state_id = erp_state.state_id
        left join erp_country   on erp_state.country_code = erp_country.country_code
    )

select *
from join_region