WITH vendas AS (
    SELECT * FROM {{ ref('stg_vendas') }}
),

produtos AS (
    SELECT * FROM {{ ref('stg_produtos') }}
),

fato AS (
    SELECT
        p.id_produto AS sk_produto,
        TO_CHAR(v.data_venda, 'YYYYMMDD')::INT AS sk_tempo,
        v.id_venda,
        v.quantidade,
        (v.quantidade * p.preco_base) AS valor_total
    FROM vendas v
    INNER JOIN produtos p
        ON v.id_produto = p.id_produto
)

SELECT * FROM fato