USE nerflix;

-- mostrar tabelas

SELECT * FROM categoria;
SELECT * FROM colecao;
SELECT * FROM filme;
SELECT * FROM filme_categoria;
SELECT * FROM status;
SELECT * FROM usuario;

-- views

SELECT * FROM nota_media;
SELECT * FROM filme_qtdvisto;
SELECT * FROM categoria_indisponivel;  -- checagem do trigger!

-- procedure / function / trigger

CALL filme_naoterminado_categoria ('1','Aventura');
CALL filme_naoterminado_categoria ('2','Acao');
CALL filme_naoterminado_categoria ('4','Suspense');

SELECT frequencia_acesso(1);
SELECT frequencia_acesso(2);
SELECT frequencia_acesso(3);
SELECT frequencia_acesso(4);

INSERT INTO filme (nome, ano)
	VALUES ('Velozes e Furiosos 52', 2024);
INSERT INTO filme (nome, ano)
	VALUES ('Ritmo Ragatanga', 2025);
SELECT * FROM categoria_indisponivel;

