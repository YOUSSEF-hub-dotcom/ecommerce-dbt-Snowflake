with source as (
    select * from {{ source('raw', 'raw_orders') }}
),

cleaned as (
    select
        cast(order_id as integer) as order_id,
        cast(customer_id as integer) as customer_id,
        cast(product_id as integer) as product_id,
        cast(quantity as integer) as quantity,
        cast(order_date as date) as order_date,
        lower(trim(status)) as order_status
    from source
    where quantity > 0
)

select * from cleaned
