with
    erp_products as (
        select *
        from {{ ref('stg_erp__products') }}
    ),

    erp_category as (
        select *
        from {{ ref('stg_erp__productcategory') }}
    ),

    erp_subcategory as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}
    ),      
    
    join_products as (
        select
            erp_products.product_id,
            erp_products.product_name,
            erp_category.category_name,
            erp_subcategory.subcategory_name,
        from erp_products
        left join erp_subcategory  on erp_products.subcategory_id = erp_subcategory.subcategory_id
        left join erp_category   on erp_subcategory.category_id = erp_category.category_id
    )

select *
from join_products