with orders as (
    select * from {{ ref('fct_orders') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
)

select
    customers.customer_id,
    customers.customer_name,
    count(distinct orders.order_id) as total_orders,
    coalesce(sum(case when orders.order_status = 'completed' then orders.total_amount else 0 end), 0) as total_spending
from customers
left join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.customer_name