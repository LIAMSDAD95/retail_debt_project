with customer as
    (select *
    from {{ ref('stg_customers') }})

,
transact as (
    select *
    from {{ ref('stg_transactions') }}

)
, prods as (
    select * 
    from {{ ref('stg_product_info') }}
)
, 
final as (
    select * 
    from customer c
    left join transact t on c.customer_id=t.cust_id
    left join prods p on t.prod_cat_code = p.prod_cat_code AND t.prod_subcat_code = p.prod_sub_cat_code
)

select 
            customer_id,
            dob,
            age,
            gender_,
            city,
            transaction_new_id,
            transaction_date,
            prod_cat,
            prod_subcat,
            quantity,
            rate,
            tax,
            total_amt,
            store_type
            
 from final