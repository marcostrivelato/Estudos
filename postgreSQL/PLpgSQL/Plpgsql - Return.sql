/* Usando return de maneiras diferentes em plpgslq*/

-- Vamos refazer as funções anteriormente criadas usando plpgslq

create or replace function cria_a(nome varchar) returns void as $$
	begin
		insert into a (nome) values('Patricia');
	end; -- Neste caso como o returno é vazio não precisamos adicionar return ao bloco
$$ language plpgsql;

select cria_a('andre');
select * from a;


create or replace function cria_instrutor_falso() returns instrutor as $$
	begin
		return row(22, 'Nome Falso', 200::decimal)::instrutor;	-- Usando o row, fazemos com que todos os parâmetros sejam retornados em uma unica linha
	end;														-- também informamos qual o tipo da saida, no caso instrutor
$$ language plpgsql;

select id, salario from cria_instrutor_falso();


	-- Definindo e ultilizando uma variável para retorno
create or replace function cria_instrutor_falso() returns instrutor as $$
	declare
		retorno instrutor;	-- Deste modo criamos uma variável retorno, para adicionar todas entradas nela e usala como returno no comando return.
	begin
		select 22, 'Nome Falso', 200::decimal into retorno;
		return retorno;
	end;														
$$ language plpgsql;

	-- Retornando queries
drop function instrutores_bem_pagos;
create or replace function instrutores_bem_pagos(valor_salario decimal) returns setof instrutor as $$
	declare
		retorno instrutor;
	begin 
		return query select * from instrutor where salario > valor_salario;	-- Usando o return query toda uma query										
	end;
$$ language plpgsql;

select * from instrutores_bem_pagos(300);











