with
    source_orders as (
        select 
            cast(order_id as int) as id_ordem
            , cast(customer_id as string) as id_cliente
            , cast(employee_id as int) as id_funcionario
            , cast(order_date as date) as data_da_ordem
            , cast(required_date as date) as data_da_requisicao
            , cast(shipped_date as date) as data_de_envio
            , cast(ship_via as int) as id_transportadora
            , cast(freight as int) as frete
            , cast(ship_name as string) as nome_de_envio
            , cast(ship_address as string) as endereco_de_envio
            , cast(ship_city as string) as cidade_de_envio
            , cast(ship_region as string) as regiao_de_envio
            , cast(ship_postal_code as string) as codigo_postal_de_envio
            , cast(ship_country as string) as pais_de_envio
        from {{ source('erp', 'orders') }}

    )

select *
from source_orders
