with
    source_salesorderheader as (
        select
            cast(salesorderid as string) order_id,
            cast(salespersonid as string) as salesperson_id,
            cast(customerid as string) as customer_id,
            cast(creditcardid as string) as creditcard_id,
            cast(billtoaddressid as string) as address_id,

            cast(orderdate as datetime) as order_date,
            cast(duedate as datetime) as due_date,      
            cast(shipdate as datetime) as ship_date,

            cast(taxamt as numeric) as tax_amt,
            cast(freight as numeric) as freight,
            cast(subtotal as numeric) as sub_total,
            cast(totaldue as numeric) as total,
        from {{ source('erp', 'salesorderheader') }}
    )
select *
from source_salesorderheader