with
    source_productcategory as (
        select
            cast(productcategoryid as string) as category_id,
            name as category_name,            
        from {{ source('erp', 'productcategory') }}
    )
select *
from source_productcategory
