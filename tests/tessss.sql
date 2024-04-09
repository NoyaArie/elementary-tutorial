{{
    config(
        severity='error',
        meta={'owner': ['noy@elementary-data.com']}
    )
}}

select stg_orders.id, sum(p.amount) as sum_payments, stg_orders.amount as order_amount 
from {{ ref('stg_orders') }}
join {{ ref('stg_payments') }} p on stg_orders.id=p.order_id
group by stg_orders.id
