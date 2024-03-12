with a as (select *
    --select transaction_new_id, count(*) as t
 from {{ ref('stg_transactions') }}
where transaction_new_id = "82518041"
 --group by transaction_new_id
 --having t >1
 )

 select * from a
