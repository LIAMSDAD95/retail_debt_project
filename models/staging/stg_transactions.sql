with transacts as 
    (
        select
            distinct substr(cast(transaction_id as string),1,8) as transaction_new_id,
            cust_id,
            parse_date('%d-%m-%Y',replace(tran_date, '/', '-')) as transaction_date,
            prod_subcat_code,
            prod_cat_code, 
            abs(Qty) as quantity,
            rate,
            tax,
            total_amt,
            store_type

        from {{ source('Retail_Case', 'transaction') }}
        where total_amt > 0
            
    )
    select * from transacts
--select transaction_new_id, count(transaction_new_id) as dd
--from transacts
--group by 1
--having dd > 1

