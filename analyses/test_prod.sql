select prod_cat, count(prod_sub_cat_code)
from {{ ref('stg_product_info') }}
group by 1