-- ============================================================
-- Projeto: Bella Make - Análise de Vendas
-- Etapa: 03 - Consultas de análise
-- Autor: Lucas Martins
-- ============================================================

-- Venda por país
SELECT 
	pai.id_pais, pai.nome_pais, SUM(ven.valor_vendas) AS 'valor_total'
FROM cliente cli
	JOIN paises pai ON cli.id_pais = pai.id_pais
	JOIN vendas ven ON cli.id_cliente = ven.id_cliente
    GROUP BY pai.id_pais, pai.nome_pais 

-- Venda por més
SELECT 
	MONTH(data_venda) AS mês, SUM(valor_vendas) AS valor_total, COUNT(valor_vendas) AS quantidade_vendas
FROM vendas
GROUP BY mês	

-- Ticket médio por cliente
SELECT 
	cli.id_cliente, cli.nome_cliente, cli.sobrenome_cliente, ROUND(AVG(ven.valor_vendas),2) AS ticket_medio
FROM cliente cli
JOIN vendas ven ON cli.id_cliente = ven.id_cliente
GROUP BY cli.id_cliente, cli.nome_cliente, cli.sobrenome_cliente
ORDER BY ticket_medio DESC;

-- Ranking dos vendedores
SELECT
	ve.id_vendedor, ve.nome_vendedor, ve.sobrenome_vendedor, SUM(ven.valor_vendas) AS valor_total
FROM vendedor ve
JOIN vendas ven ON ve.id_vendedor = ven.id_vendedor
GROUP BY ve.id_vendedor, ve.nome_vendedor, ve.sobrenome_vendedor
ORDER BY valor_total DESC

-- Maior venda por país
SELECT pai.nome_pais, prod.produtos, SUM(ite.quantidade) AS quantidade, ite.preco_unitario
FROM cliente cli
	JOIN paises pai ON cli.id_pais = pai.id_pais
	JOIN vendas ven ON cli.id_cliente = ven.id_cliente
    JOIN itens_venda ite ON  ven.id_vendas = ite.id_vendas
    JOIN produtos prod ON prod.id_produto = ite.id_produto
GROUP BY pai.nome_pais, prod.produtos, ite.preco_unitario
HAVING SUM(ite.quantidade) = (
SELECT SUM(ite2.quantidade)
FROM cliente cli2
	JOIN paises pai2 ON cli2.id_pais = pai2.id_pais
	JOIN vendas ven2 ON cli2.id_cliente = ven2.id_cliente
    JOIN itens_venda ite2 ON  ven2.id_vendas = ite2.id_vendas
    JOIN produtos prod2 ON prod2.id_produto = ite2.id_produto
    WHERE pai2.nome_pais = pai.nome_pais
    GROUP BY prod2.produtos, pai2.nome_pais
  ORDER BY SUM(ite2.quantidade) DESC
    LIMIT 1
)
ORDER BY quantidade DESC;