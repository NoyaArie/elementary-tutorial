
with orders as (

    select * from {{ ref('stg_orders') }}

),

dates as (

    select * from {{ ref('fin_date') }}

),

final as (

    select count(*)
    from orders
    union all
    select count(*) from dates
)

select * from final
