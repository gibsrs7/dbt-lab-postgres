WITH deduplicados AS (
    SELECT 
        id_produto,
        nome_produto,
        categoria,
        preco_base,
        ROW_NUMBER() OVER (PARTITION BY id_produto ORDER BY data_atualizacao DESC) as rn
    FROM {{ source('erp_origem', 'src_produtos') }}
),
ConsultaFinal AS (
SELECT 
    id_produto,
    nome_produto,
    categoria,
    preco_base
FROM deduplicados
WHERE rn = 1
)

SELECT * FROM ConsultaFinal