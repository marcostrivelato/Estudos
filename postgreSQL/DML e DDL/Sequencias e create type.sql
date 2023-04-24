create sequence sequencia;

select CURRVAL('sequencia');  -- Demonstra o valor atual da sequencia
select nextval('sequencia');  -- Avanca para  o proximo valor da sequencia

/* Criando a tabela com a sequencia definida como id */
create temporary table auto(
	id integer primary key default nextval('sequencia'),
	nome varchar(30) not null
);

insert into auto (nome) values ('Vinicius Dias');	-- Ao inserir como já haviamos avançado a sequancia usando select nextval() o id não será 1
insert into auto (nome) values ('Outro Nome');		-- Novamente avançamos a sequencia antes de fazer este insert

select * from auto;

/* Criando um tipo próprio*/
create type CLASSIFICACAO as enum('Livre','12_anos','14_anos','16_anos','18_anos'); -- Enum, enumera todas as possiveis entradas

create temporary table filme (
	id serial primary key,
	nome varchar(255) not null,
	classificacao CLASSIFICACAO
);

insert into filme (nome,classificacao) values ('Um filme qualquer','teste'); -- Esta entrada não será permitida pois 'teste' não está na lista enumerada
insert into filme (nome,classificacao) values ('Um filme qualquer','Livre');

select * from filme;