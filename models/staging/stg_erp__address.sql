with
    source_adress as (
        select
            cast(addressid as string) as address_id,
            cast(stateprovinceid as string) as state_id,         
            city as city,
            addressline1 as address_line1,

            CASE 
                WHEN addressline2 is null THEN 
                    "S/C"
                ELSE
                    addressline2         
            END as address_line2,
            
            postalcode as postal_code,
        from {{ source('erp', 'address') }}
    )
select *
from source_adress