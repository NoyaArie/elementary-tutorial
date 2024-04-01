{{
    config(
        severity='error',
        meta={'owner': ['noy@elementary-data.com']}
    )
}}

WITH orders AS (
  SELECT
    *
  FROM {{ ref('stg_orders') }}
), payments AS (
  SELECT
    *
  FROM {{ ref('stg_payments') }}
), order_payments AS (
  SELECT
    order_id,
    SUM(amount) AS total_amount
  FROM payments
  GROUP BY
    order_id
), final AS (
  SELECT
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    orders.status,
    order_payments.total_amount AS amount
  FROM orders
  LEFT JOIN order_payments
    ON orders.order_id = order_payments.order_id
)
SELECT
  *
FROM final
