--4) A quantidade de clientes que não efetuaram venda:
SELECT COUNT(*) AS QUANTIDADE_CLIENTES
  FROM taif.tbcliente
 WHERE CLICODIGO NOT IN (SELECT CLICODIGO
						   FROM TAIF.TBVENDA)