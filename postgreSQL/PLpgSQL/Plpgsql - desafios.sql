/*Criar uma funcao que insira um curso em determinada categoria, informando o nome da categoria, 
Caso a categoria nao existir criar a categoria, se existir apenas criar o curso*/

-- Minha solução
create or replace function cria_curso(nome_curso varchar, nome_categoria varchar) returns void as $$
	declare
		categoria categoria;
		contador integer default 1;
		limite integer;
		retorno varchar;
		id_nova_categoria integer;
	begin
		select count(nome) from categoria into limite;
		for categoria in select * from categoria loop
			if categoria.nome = nome_categoria then
				insert into curso (nome,categoria_id) values (nome_curso, categoria.id);
				exit;
			elseif contador = limite then
				insert into categoria (nome) values (nome_categoria);
				select into id_nova_categoria id from categoria where nome = nome_categoria;
				insert into curso (nome, categoria_id) values (nome_curso, id_nova_categoria);
			end if;
			contador := contador + 1;
		end loop;
	end;
$$ language plpgsql;


select * from categoria;
drop function cria_curso;
select cria_curso('Gato','Gato');

select * from curso;
select * from categoria;


-- Solução aula
create or replace function cria_curso(nome_curso varchar, nome_categoria varchar) returns void as $$
	declare
		id_categoria integer;
	begin
		select id into id_categoria from categoria where nome = nome_categoria;
		
		if not found then
			insert into categoria (nome) values (nome_categoria) returning idinto id_categoria;
		end if;
		
		insert into curso (nome, categoria_id) values (nome_curso, id_categoria)
	end;
$$ language plpgsql;


/*Criar uma funcao para inserir instrutores com salários. Se salario for maior que a média salvar um log. 
Salvar outro log dizzendo que fulano recebe mais que x% da grade de instrutores
*/

create table log_instrutores (
	id serial primary key,
	informacao varchar(255),
	momento_criacao timestamp default current_timestamp
	);

drop function cria_instrutor;
create or replace function cria_instrutor(nome_instrutor varchar, salario_instrutor decimal) returns void as $$
	declare
		media_salarial decimal;
		novo_instrutor_id integer;
		total_instrutores integer;
		instrutores_salario_menor integer;
		percentual decimal(10,2);
	begin
		insert into instrutor (nome,salario) values (nome_instrutor,salario_instrutor) returning id into novo_instrutor_id;
		
		select into media_salarial avg(salario) from instrutor where id <> novo_instrutor_id;
		
		if salario_instrutor > media_salarial then
			select into total_instrutores count(nome) from instrutor where id <> novo_instrutor_id;
			
			select into instrutores_salario_menor count(id) from instrutor where salario < salario_instrutor;
			
			percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;
			
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || nome_instrutor || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');
		end if;	
	end;
$$ language plpgsql;


select * from instrutor;
select cria_instrutor ('Marcelo Adnet', 2000);
select * from log_instrutores;







