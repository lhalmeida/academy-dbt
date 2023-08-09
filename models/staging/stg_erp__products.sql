
with
    source_product as (
        select
            cast(productid as string) as product_id,
            name as product_name,            
            cast(productsubcategoryid as string) as subcategory_id,
        from {{ source('erp', 'product') }}
    )
select *
from source_product