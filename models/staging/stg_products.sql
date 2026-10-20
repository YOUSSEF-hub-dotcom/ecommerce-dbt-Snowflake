with source as (
    select * from {{ source('raw', 'raw_products') }}
),

renamed as (
    select
        cast(product_id as integer) as product_id,
        trim(product_name) as product_name,
        trim(category) as category,
        cast(price as numeric(10, 2)) as price
    from source
)

select * from renamed