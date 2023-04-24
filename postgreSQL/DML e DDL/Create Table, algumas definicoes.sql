/* Algumas utilidades ao criar tabelas*/

create if not exists academico.aluno( --Apenas cria a tabela caso ela ainda nao exista
	id serial primary key
	primeiro_nome varchar(255) not null,
	data_nascimento date not null default now -- Adiciona um valor default caso nada seja inserido
)

create temporary table a( -- Cria uma tabela temporaria
	coluna1 varchar(255) not null check(coluna <> '') --Ao adicionar a tabela, sera checado a condicao dada
);

insert into a (''); -- Este insert nao funcionará pois não atende a restrição do check

drop table a;

create temporary table a( 
	coluna1 varchar(255) not null check(coluna1 <> ''),
	coluna2 varchar(255) not null,
	unique (coluna1,coluna2) -- Esta linha garante que a combinacao entre coluna1 e coluna2 nao seja duplicada
);

insert into a values ('a','b'); --apos inserir este valor, nao sera possivel inserir novamente, similar a uma chave primaria composta
insert into a values ('a','b'); --ERROR:  duplicate key value violates unique constraint "a_coluna1_coluna2_key"
								--DETAIL:  Key (coluna1, coluna2)=(a, b) already exists.
	
/* Ultilizando o Alter table*/	
	
-- Renomeando a tabela e as colunas								
alter table a rename to teste;
alter table teste rename coluna1 to primeira_coluna;
alter table teste rename coluna2 to segunda_coluna;










