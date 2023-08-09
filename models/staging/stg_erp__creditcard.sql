with
    source_creditcard as (
        select
            cast(creditcardid as string) as creditcard_id,
            cardtype as card_type,            
        from {{ source('erp', 'creditcard') }}
    )
select *
from source_creditcard