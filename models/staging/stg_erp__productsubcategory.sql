with
    source_productsubcategory as (
        select
            cast(productsubcategoryid as string) as subcategory_id,
            cast(productcategoryid as string) as category_id,
            name as subcategory_name,            
        from {{ source('erp', 'productsubcategory') }}
    )
select *
from source_productsubcategory