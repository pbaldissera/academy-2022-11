with
    clientes as (
        select *
        from {{ ref('stg_erp__clientes') }}
    )



    , transformed as (
        select 
            row_number() over (order by id_cliente) as sk_cliente
            , *
        from clientes
    )

select * 
from transformed