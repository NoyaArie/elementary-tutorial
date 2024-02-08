
with date1 as (

    select * from {{ source('date_dev', 'date') }}

),

date2 as (

    select * from {{ source('date', 'date') }}

),

final as (

    select count(*)
    from date1
    union all
    select count(*) from date2
)

select * from final
