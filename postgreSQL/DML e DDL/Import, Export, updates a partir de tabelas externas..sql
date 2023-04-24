create schema teste;

create table teste.cursos_programacao (
	id_curso integer primary key,
	nome_curso varchar(255) not null
	);
	
insert into teste.cursos_programacao
	select academico.curso.id, academico.curso.nome from academico.curso
		join academico.categoria on academico.categoria.id = academico.curso.categoria_id
		where categoria.nome = 'Programação';

--Aqui fizemos a importacao de dados de um csv externo, usando as ferramentas do pg admin
select * from teste.cursos_programacao;


/* Comom estamos adicionando cursos com nomes ... Avançado, surge a nescessidade de especificar ... Básico tbm */
select * from academico.curso;

update academico.curso set nome = 'PHP Básico' where id=4;
update academico.curso set nome = 'Java Básico' where id=5;
update academico.curso set nome = 'C++ Básico' where id=6;

-- Utilizando a tabela academico.curso para atualizar a tabela teste.curso_programacao
update teste.cursos_programacao set nome_curso = nome
	from academico.curso where teste.cursos_programacao.id_curso = academico.curso.id;
	
select * from teste.cursos_programacao;