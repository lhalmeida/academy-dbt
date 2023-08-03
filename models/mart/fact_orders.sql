with
    orders as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    ),

    orders_itens  as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    ),

    orders_reason  as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason') }}
    ),
    
    join_orders_itens as (
        select

            orders.order_id,
            --orders_reason.sales_reason_id,
            orders.salesperson_id,
            orders.customer_id,
            orders.creditcard_id,
            orders.address_id,
            orders_itens.product_id,


            orders_itens.quantity,
            orders_itens.unit_price,
            orders_itens.unit_price_discount,

            (orders.freight / (count(*) over (partition by orders.order_id))) as freight,
            (orders.tax_amt / (count(*) over (partition by orders.order_id))) as tax_amt,
            (orders_itens.quantity * orders_itens.unit_price) as total_item,

            orders.order_date,
            orders.due_date,      
            orders.ship_date,


        from orders_itens
        left join orders        on orders_itens.order_id = orders.order_id

    ), 
    
    orders_key as (
        select
            cast((order_id || '-' || product_id) as string) as pk_orders,
            *
        from join_orders_itens
    )

select *
from orders_key 