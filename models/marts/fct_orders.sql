with orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

order_line_items as (
    select
        orders.order_id,
        orders.customer_id,
        orders.product_id,
        orders.quantity,
        orders.order_date,
        orders.order_status,
        products.price,
        cast((orders.quantity * products.price) as numeric(10, 2)) as item_revenue
    from orders
    inner join products on orders.product_id = products.product_id
),

final as (
    select
        order_id,
        customer_id,
        min(order_date) as order_date,
        max(order_status) as order_status,
        count(product_id) as total_items,
        sum(quantity) as total_quantity,
        sum(item_revenue) as total_amount
    from order_line_items
    group by order_id, customer_id
)

select * from final