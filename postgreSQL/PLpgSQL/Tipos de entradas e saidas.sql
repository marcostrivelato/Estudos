/* Tipos compostos */

create table instrutor (
	id serial primary key,
	nome varchar(255) not null,
	salario decimal(10,2)	
);

		/* Inserindo um tipo composto na função*/
insert into instrutor (nome, salario) values ('Marcos Trivelato', 100);
	-- Usando a tabela instrutor como parametro, o parametro é dito do tipo instrutor
create or replace function dobro_do_salario (instrutor) returns decimal as $$
	select $1.salario * 2 as dobro;
$$ language sql;

select nome, dobro_do_salario(instrutor.*) from instrutor;

		/* Retornando um tipo composto */ 
create or replace function cria_instrutor_falso() returns instrutor as $$
	select 22 as id, 'Nome Falso' as nome, 200::decimal as salario;
$$ language sql;

select cria_instrutor_falso();			-- Retorna um conjuto de valores
select * from cria_instrutor_falso(); 	-- Podemos selecionar os retornos como uma tabela

		/*Retornando conjuntos de dados*/

insert into instrutor (nome,salario) values ('Diogo Mascarado',200);
insert into instrutor (nome,salario) values ('Paulo Pereira',300);
insert into instrutor (nome,salario) values ('Nico Alemao',400);
insert into instrutor (nome,salario) values ('Juliana',500);
insert into instrutor (nome,salario) values ('Priscila Alves',600);

create or replace function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$ 	-- setof permite que um conjunto seja retornado
	select * from instrutor where salario > valor_salario;												-- não apenas um dos valores
$$ language sql;

select * from instrutores_bem_pagos(300);

	-- neste segundo caso caso retornamos uma tabela especificada (não é tão util para o caso vigente pois já temos a tabela instrutor definida)
drop function instrutores_bem_pagos;
create or replace function instrutores_bem_pagos(valor_salario decimal) returns table (id integer, nome varchar, salario decimal) as $$ 	
	select * from instrutor where salario > valor_salario;												
$$ language sql;

select * from instrutores_bem_pagos(300);
	
	-- usando o record o retorno é generico, neste caso não é muito util já que os tipos já são bem definidos
drop function instrutores_bem_pagos;
create or replace function instrutores_bem_pagos(valor_salario decimal) returns setof record as $$
	select * from instrutor where salario > valor_salario;												
$$ language sql;

select * from instrutores_bem_pagos(300);

-- aqui definimos as entradas e saidas com in e out.
create or replace function soma_e_produto (in n_1 integer, in n_2 integer, out soma integer, out produto integer) as $$
	select n_1 + n_2 as soma, n_1 * n_2 as produto;
$$ language sql;

select * from soma_e_produto(3,3);

-- Criando um novo tipo para usar como retorno
create type dois_valores as (soma integer, produto integer);

drop function soma_e_produto;
create or replace function soma_e_produto (in n_1 integer, in n_2 integer) returns dois_valores as $$
	select n_1 + n_2 as soma, n_1 * n_2 as produto;
$$ language sql;
select * from soma_e_produto(3,3);


/* Voltando ao valor salário e utilizando os conceitos juntos*/
drop function instrutores_bem_pagos;
create or replace function instrutores_bem_pagos(valor_salario decimal, out nome varchar, out salario decimal) returns setof record as $$ 	
	-- Aqui como os valores de saida foram previamente definidos podemos usar o record
	select nome, salario from instrutor where salario > valor_salario;	-- Lembrar de selecionar apenas as saidas										
$$ language sql;

select * from instrutores_bem_pagos(300);





