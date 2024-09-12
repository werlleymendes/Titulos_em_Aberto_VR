SELECT * FROM pg_tables WHERE tablename LIKE '%verba%'

SELECT * FROM verba LIMIT 10;

SELECT * FROM tiporecebimento;

SELECT * FROM fornecedor;

SELECT * FROM loja;

SELECT * FROM comprador;

SELECT * FROM mercadologico;

SELECT * FROM situacaoreceberverba;
SELECT * FROM situacaoverba;

SELECT * FROM receberverba where id_situacaoreceberverba = 0;



SELECT /*sum(j.valorliquido)*/b.descricao "loja", c.descricao "tipo recebimento", a.dataemissao "data de emissão",  
a.id_fornecedor, d.razaosocial "razão social", e.nome "comprador", f.descricao "mercadologico",
g.descricao "tipo verba", a.representante, a.telefone, h.descricao "tipo local cobranca", a.valor "valor original", 
j.valorliquido, a.observacao, i.descricao "tipo origem verba"
	FROM verba a 
	JOIN loja b 
		ON a.id_loja = b.id
	JOIN tiporecebimento c
		ON c.id = a.id_tiporecebimento
	JOIN fornecedor d
		ON d.id = a.id_fornecedor
	JOIN comprador e
		ON e.id = a.id_comprador
	JOIN (SELECT mercadologico1, descricao
			FROM mercadologico
				where mercadologico2=0
						and mercadologico3=0
						and mercadologico4=0
						and mercadologico5=0) f
		ON f.mercadologico1 = a.mercadologico1
	JOIN tipoverba g
		ON g.id = a.id_tipoverba
	JOIN tipolocalcobranca h
		ON h.id = a.id_tipolocalcobranca
	JOIN tipoorigemverba i
		ON i.id = a.id_tipoorigemverba
	JOIN receberverba j
		ON j.id_verba = a.id
	WHERE a.id_situacaoverba = 1
			and j.id_situacaoreceberverba = 0


