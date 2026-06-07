WITH vendas AS (
    SELECT * FROM {{ source('erp_origem', 'src_vendas') }}
)
SELECT * FROM vendas