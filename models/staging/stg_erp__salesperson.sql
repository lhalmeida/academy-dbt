with
    source_salesperson as (
        select
            cast(businessentityid as string) as salesperson_id,
            cast(territoryid as string) as territory_id,
            salesquota as sales_quota,
            bonus as bonus,
            commissionpct as comission_pct,
            salesytd as sales_this_year,
            saleslastyear as sales_last_year
        from {{ source('erp', 'salesperson') }}
    )
select *
from source_salesperson