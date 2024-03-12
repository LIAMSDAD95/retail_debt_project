with
    source as (
        select
            customer_id,
            dob,
            date_diff(current_date(), DOB,year) as age,
            case when gender = 'F' then 'Chick'
                when gender = 'M' then 'Dude' end as gender_,
            case when city_code = 1 then 'New-York'
                when city_code = 2 then 'Los Angeles'
                when city_code = 3 then 'Chitown'
                when city_code = 4 then ' Philly'
                when city_code = 5 then 'Detroit'
                when city_code = 6 then 'San Fran'
                when city_code = 7 then ' Boston'
                when city_code = 8 then 'Toronto'
                when city_code = 9 then 'Houston'
                when city_code = 10 then 'Miami' end as city
            
        from {{ source("Retail_Case", "customer") }}

    )
select *
from source
