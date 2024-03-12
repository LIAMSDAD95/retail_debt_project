with prods as 
    (
        select 
            * 
        from {{ source('Retail_Case', 'product_category_info') }}
            
    )
select *
from prods