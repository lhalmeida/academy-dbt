with
    source_adress as (
        select
            cast(addressid as string) as address_id,
            cast(stateprovinceid as string) as state_id,         
            city as city,
            addressline1 as address_line1,
            addressline2 as address_line2,
            postalcode as postal_code,
        from {{ source('erp', 'address') }}
    )
select *
from source_adress