{{
    config(
        severity = 'error'
    )
}}
with
    validation_2011 as (
        select 
            sum(total_item) as total
        from {{ ref('fact_orders') }}
        where DATE(cast(order_date as timestamp)) between '2011-01-01' and '2011-12-31'
    )
select total
from validation_2011
where total not between 12646112.00 and 12646113.00