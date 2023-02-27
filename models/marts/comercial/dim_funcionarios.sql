with
    funcionarios as (
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , self_joined as (
        select 
            funcionarios.id_funcionario
            , funcionarios.id_gerente
            , funcionarios.sobrenome_funcionario
            , funcionarios.nome_funcionario
            , funcionarios.nome_completo_funcionario as funcionario
            , funcionarios.titulo_funcionario
            , funcionarios.titulo_de_cortesia_funcionario
            , funcionarios.aniversario_funcionario
            , funcionarios.data_da_contratacao_funcionario
            , gerentes.nome_completo_funcionario as gerente
            , funcionarios.endereco_funcionario
            , funcionarios.cidade_funcionario
            , funcionarios.regiao_funcionario
            , funcionarios.codigo_postal_funcionario
            , funcionarios.pais_funcionario
            , funcionarios.telefone_funcionario
            , funcionarios.extensao_funcionario
        from funcionarios
        left join funcionarios as gerentes on
            funcionarios.id_gerente = gerentes.id_funcionario
    )


    , transformed as (
        select 
            row_number() over (order by id_funcionario) as sk_funcionario
            , *
        from self_joined
    )

select * 
from transformed