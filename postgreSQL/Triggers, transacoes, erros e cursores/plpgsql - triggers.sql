/* Trigers*/

-- Usando triger na funcao anteriormente criada

drop function cria_instrutor;
create or replace function cria_instrutor() returns trigger as $$ -- Colocamos o return como trigger
	/*Quando usamos trigger nao precisamos adicionar entradas na funcao, já que as informações recebidas estarão na variavel new
		executando insert ... values (info1,info2), as informações estarão salvas em new.info1 e new.info2*/
	declare
		media_salarial decimal;
		total_instrutores integer;
		instrutores_salario_menor integer;
		percentual decimal(10,2);
	begin
		select into media_salarial avg(salario) from instrutor where id <> new.id;
		
		if new.salario > media_salarial then
			select into total_instrutores count(nome) from instrutor where id <> new.id;
			
			select into instrutores_salario_menor count(id) from instrutor where salario < new.salario;
			
			percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;
			
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');
		end if;
		
		return new; -- Retorna o valor que foi inserido no insert como values
	end;
$$ language plpgsql;

create trigger cria_log_instrutor after insert on instrutor
	for each row execute function cria_instrutor();


insert into instrutor (nome, salario) values ('Alfredo Mordomo', 1800);

select * from instrutor;
select * from log_instrutores;

-- Usando trigger para impedir uma insersao caso o salario seja maior que 100% dos instrutores, e transformar o salario no salario maximo até entao
drop function cria_instrutor;
create or replace function cria_instrutor() returns trigger as $$
	declare
		media_salarial decimal;
		total_instrutores integer;
		instrutores_salario_menor integer;
		percentual decimal(10,2);
	begin
		select into media_salarial avg(salario) from instrutor where id <> new.id;
		
		if new.salario > media_salarial then
			select into total_instrutores count(nome) from instrutor where id <> new.id;
			
			select into instrutores_salario_menor count(id) from instrutor where salario < new.salario;
			
			percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;
			
			if percentual = 100 then
				select into new.salario max(instrutor.salario) from instrutor where id <> new.id; -- Transforma o salário no maximo
				insert into log_instrutores(informacao)
					values ('O instrutor, ' || new.nome || 'receberá o teto salarial de' || new.salario);
			else
				insert into log_instrutores (informacao) 
					values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');		
			end if;
		end if;
		
		return new;
	end;
$$ language plpgsql;

drop trigger cria_log_instrutor on instrutor;
create trigger cria_log_instrutor before insert on instrutor
	for each row execute function cria_instrutor();


insert into instrutor (nome, salario) values ('Novo Instrutor 2', 5000);

select * from instrutor;
select * from log_instrutores;













