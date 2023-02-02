USE netflix;

-- POPULANDO A BASE DE DADOS

INSERT INTO categoria (categoria)
VALUES 
	('Comedia'),
	('Acao'),
	('Aventura'),
	('Terror'),
	('Romantico'),
    
	('Suspense'),
	('Ficcao Cientifica'),
	('Musical'),
	('Suspense'),
	('Drama'),
    
    ('Categoria Indisponivel');
    
INSERT INTO filme (nome, ano)
VALUES 
	('No Limite do Amanha', 2014),
	('47 Ronins', 2013),
    ('Forrest Gump', 1994),
    ('Minha Mae e uma Peca', 2013),
    ('Continencia do Amor', 2022),
    
    ('It - A coisa', 2017),
    ('O poco', 2019),
    ('2012', 2009),
    ('O Rei Leao', 2019),
    ('O Quarto de Jack', 2015);
    
INSERT INTO filme_categoria (filme_id,categoria_id)
VALUES 
	(1,2),
	(1,7),
	(2,2),
	(2,3),
	(3,1),
	(3,5),
	(3,10),
	(4,1),
	(5,5),
	(5,8),
	(5,10),
	(6,4),
	(7,9),
	(8,2),
	(8,3),
	(8,7),
	(9,3),
	(9,8),
	(10,9),
	(10,10);
    
INSERT INTO status (status, observacao, tempo)
VALUES 
	('COMPLETO', null, null),
    ('ABANDONADO','muito ruim', null),
    ('ABANDONADO','ja sei o final', null),
    ('PAUSADO','dormi', null),
    ('PAUSADO','sem tempo','1:00:00'),
	('PAUSADO','sem tempo','0:35:00');
    
INSERT INTO usuario (usuario, nome, senha)
VALUES 
	('kenzo','kenzo take',sha1('12345')),
    ('fravia','fravia take',sha1('fra2000')),
    ('adaberto','adaberto take',sha1('ada9876')),
    ('termo','termo take',sha1('010101'));

INSERT INTO colecao (usuario_id, filme_id, status_id, nota)
VALUES 
	(1, 1, 1, 08.5),
    (1, 2, 1, 07.5),
    (1, 3, 1, 08.0),
    (1, 4, 2, null),
    (1, 6, 3, null),
    (1, 7, 1, 06.5),
    (1, 9, 5, 10.0),
    (1, 10, 6, null),
    
    (2, 1, 2, null),
    (2, 2, 1, 08.0),
    (2, 3, 1, 07.5),
    (2, 5, 1, 05.0),
    (2, 6, 2, null),
    (2, 7, 3, null),
    (2, 8, 1, 05.0),
    (2, 9, 1, 09.5),
    (2, 10, 1, 08.0),
    
	(3, 1, 1, 09.0),
    (3, 2, 1, 09.0),
    (3, 3, 1, 06.5),
    (3, 4, 1, 06.0),
    (3, 6, 5, null),
    (3, 7, 6, null),
    (3, 8, 1, 08.5),
    
    (4, 2, 1, 08.5),
    (4, 3, 1, 10.0),
    (4, 4, 1, 07.0),
	(4, 5, 1, 09.0),
    (4, 7, 2, null),
    (4, 8, 1, 06.0),
    (4, 9, 1, 10.0),
    (4, 10, 2, null);
    
/*
SELECT * FROM categoria;
SELECT * FROM colecao;
SELECT * FROM filme;
SELECT * FROM filme_categoria;
SELECT * FROM status;
SELECT * FROM usuario;
*/