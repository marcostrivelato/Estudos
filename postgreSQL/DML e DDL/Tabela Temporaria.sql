/* Inserindo alguns dados nas tabelas para depois fazer as pesquisas*/

INSERT INTO academico.aluno (primeiro_nome, ultimo_nome, data_nascimento) VALUES (
	'Vinicius', 'Dias', '1997-10-15'
), (
	'Patricia', 'Freitas', '1986-10-25'
), (
	'Diogo', 'Oliveira', '1984-08-27'
), (
	'Maria', 'Rosa', '1985-01-01'
);

INSERT INTO academico.categoria (nome) VALUES ('Front-end'), ('Programação'), ('Bancos de dados'), ('Data Science');

INSERT INTO academico.curso (nome, categoria_id) VALUES
	('HTML', 1),
	('CSS', 1),
	('JS', 1),
	('PHP', 2),
	('Java', 2),
	('C++', 2),
	('PostgreSQL', 3),
	('MySQL', 3),
	('Oracle', 3),
	('SQL Server', 3),
	('SQLite', 3),
	('Pandas', 4),
	('Machine Learning', 4),
	('Power BI', 4);
	
INSERT INTO academico.aluno_curso VALUES (1, 4), (1, 11), (2, 1), (2, 2), (3, 4), (3, 3), (4, 4), (4, 6), (4, 5);


	
--criar tabela temporaria chamada cursos de programacao que so contera o id e o nome do curso
select curso.id,curso.nome from academico.curso
	join academico.categoria on academico.categoria.id = academico.curso.categoria_id
	where categoria.nome = 'Programação'; -- Com isso selecrionamos apenas o Nome e o Id do curso


create temp table cursos_programacao (
	id_curso integer primary key,
	nome_curso varchar(255) not null
	);

insert into cursos_programacao --Adicionamos o select ao insert, assim todos os dados pesquisados no select serao inseridos na nova tabela
	select curso.id,curso.nome from academico.curso
		join academico.categoria on academico.categoria.id = academico.curso.categoria_id
		where categoria.nome = 'Programação';

select * from cursos_programacao;





