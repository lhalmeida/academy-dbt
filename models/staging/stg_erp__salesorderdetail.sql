with
    source_salesorderdetail as (
        select
            cast(salesorderdetailid as string) as salesorderdetail_id,
            cast(salesorderid as string) order_id,
            cast(productid as string) as product_id,

            cast(orderqty as int) as quantity,
            unitprice as unit_price,
            unitpricediscount as unit_price_discount,

        from {{ source('erp', 'salesorderdetail') }}
    )
select *
from source_salesorderdetail