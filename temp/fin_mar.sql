with customers as (

    select * from {{ ref('mar_customers') }}

),

orders as (

    select * from {{ ref('fin_orders') }}

)

select * -- c.customer_id, count(*)
from customers c
--join orders o on c.customer_id = o.customer_id
--group by c.customer_id
