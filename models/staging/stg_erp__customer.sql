with
    source_customer as (
        select
            cast(customerid as string) as customer_id,
            cast(personid as string) as person_id,
            cast(storeid as string) as store_id,
            cast(territoryid as string) as territory_id,
        from {{ source('erp', 'customer') }}
    )
select *
from source_customer