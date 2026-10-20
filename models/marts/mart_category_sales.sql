with orders as (
    select * from {{ ref('stg_orders') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

joined as (
    select
        products.category,
        orders.order_id,
        orders.order_status,
        cast((orders.quantity * products.price) as numeric(10, 2)) as item_revenue
    from orders
    inner join products on orders.product_id = products.product_id
)

select
    category,
    count(distinct order_id) as total_orders,
    coalesce(sum(case when order_status = 'completed' then item_revenue else 0 end), 0) as total_revenue
from joined
group by category