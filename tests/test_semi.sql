{{
    config(
        meta={'owner': ['noy@elementary-data.com']},
        severity='error'
    )
}}

select * from {{ ref('returned_orders') }}
