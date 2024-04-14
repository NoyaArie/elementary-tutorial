{{
    config(
        meta={'owner': ['noy@elementary-data.com']},
        severity='error'
    )
}}

select o.id, sum(p.amount) as sum_payments, o.amount as order_amount 
from {{ ref('stg_orders') }} o
join {{ ref('stg_payments') }} p on o.id=p.order_id
group by o.id
