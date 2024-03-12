with trans_ as (
    select * from {{ ref('stg_transactions') }}
)

select * from trans_
where quantity < 0 