				/* Criando uma função*/
CREATE FUNCTION primeira_funcao() RETURNS integer AS ' -- O corpo da função fica dentro das aspas
    select (5-3) * 2
' LANGUAGE SQL;

SELECT primeira_funcao() as numero;	-- Uma das maneiras de buscar o retorno da função

				/*Recebendo parâmetros*/ 
create function soma_dois_numeros(numero_1 integer, numero_2 integer) returns integer as '
	select numero_1 + numero_2;
' language sql;

select soma_dois_numeros(2,2);

-- É possivel não definir nomes para os parametros
create function soma_dois_numeros(integer, integer) returns integer as '
	select $1 + $2; --quando os nomes dos parametros n estão definidos usamos as posições para receber os parametros com $
' language sql;


				/* Sobre retornos*/
create table a(nome varchar(255) not null);
create or replace function cria_a(nome varchar) returns varchar as ' -- O replace faz com que possamos alterar a função já existente
	insert into a (nome) values(cria_a.nome);
	
	select nome; -- Como a função está setada para ter um retorno, o ultimo comando da função tem que ser um select.
' language sql;

select cria_a('Marcos Trivelato');
select * from a;

-- Neste caso a função não precisaria de um retorno logo podemos mudar para
drop function cria_a;  -- Replace não permite mudartipos parametros e tipos de retorno, logo precisamos remover a função para esta alteração
create or replace function cria_a(nome varchar) returns void as '
	insert into a (nome) values(cria_a.nome);
' language sql;

select cria_a('Marcos Trivelato');
select * from a;

-- Aqui trocamos o '' por $$ na definição da função, isso pq nos facilita se precisarmos usar uma string no corpo da função
drop function cria_a;
create or replace function cria_a(nome varchar) returns void as $$
	insert into a (nome) values('Patricia');
$$ language sql;