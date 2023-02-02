USE netflix;

-- CRIACAO DE VIEW

CREATE VIEW nota_media AS 
SELECT f.nome, avg(co.nota) nota_media
FROM colecao co
	JOIN filme f ON co.filme_id = f.id
GROUP BY f.nome
ORDER BY nota_media DESC;

/*
SELECT * FROM nota_media;
DROP VIEW nota_media;
*/

CREATE VIEW filme_qtdvisto AS
SELECT f.nome, count(s.id) qtd_visto
FROM colecao co
	JOIN filme f JOIN status s
	ON f.id = co.filme_id AND s.id = co.status_id
WHERE s.status = 'COMPLETO'
GROUP BY f.nome
ORDER BY count(s.id) DESC;

/*
SELECT * FROM filme_qtdvisto;
DROP VIEW filme_qtdvisto;
*/

CREATE VIEW categoria_indisponivel AS SELECT f.nome, fc.filme_id, fc.categoria_id, ca.categoria 
	FROM filme f JOIN filme_categoria fc JOIN categoria ca
    ON fc.filme_id = f.id AND fc.categoria_id = ca.id
    WHERE fc.categoria_id = '11';
    
/*
SELECT * FROM categoria_indisponivel;
DROP VIEW categoria_indisponivel;
*/

-- CRIACAO DE STORED FUNCTION, STORED PROCEDURE AND TRIGGERS

DELIMITER //
CREATE PROCEDURE filme_naoterminado_categoria (IN usuario_id INT, IN filme_categoria VARCHAR(45))
BEGIN
   SELECT f.nome, s.observacao
   FROM colecao co
		JOIN filme f ON f.id = co.filme_id
        JOIN filme_categoria fc ON f.id = fc.filme_id
        JOIN categoria ca ON ca.id = fc.categoria_id
		JOIN status s ON s.id = co.status_id
        JOIN usuario u ON u.id = co.usuario_id
		WHERE u.id = usuario_id
			AND ca.categoria = filme_categoria
            AND s.id <> 1
		GROUP BY f.nome;
END //
DELIMITER ;

/*
DROP PROCEDURE if exists filme_naoterminado_categoria;
CALL filme_naovisto_categoria ('1','Aventura');
*/   

DELIMITER //
CREATE FUNCTION frequencia_acesso(id_cliente INT)
RETURNS VARCHAR(25) DETERMINISTIC
BEGIN
    DECLARE total_completo decimal(25,2);
	SELECT count(s.id)
		INTO total_completo
        FROM status AS s
			JOIN colecao co ON s.id = co.status_id
            JOIN usuario u ON u.id = co.usuario_id
		WHERE s.status = 'COMPLETO' AND u.id = id_cliente;

	IF total_completo > 5 THEN
		RETURN 'ASSINANTE ASSIDUO';
	ELSE
		RETURN 'ASSINANTE CASUAL';
	END IF;
    
END //
DELIMITER ;

/*
SELECT frequencia_acesso(1);
SELECT frequencia_acesso(2);
SELECT frequencia_acesso(3);
SELECT frequencia_acesso(4);
DROP FUNCTION if exists frequencia_acesso;
*/
 
DELIMITER //
CREATE TRIGGER categoria_filme 
AFTER INSERT
ON filme FOR EACH ROW
BEGIN
	IF 1 = 1 THEN
	INSERT INTO filme_categoria (filme_id, categoria_id)
	VALUES (new.id, 11);
    END IF;
END //
DELIMITER ;

/*
DROP TRIGGER if exists categoria_filme;
*/

-- INDEX

CREATE INDEX idx_filme_nome ON filme(nome);

 
 
 