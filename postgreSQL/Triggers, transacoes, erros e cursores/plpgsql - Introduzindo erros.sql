/* Administração de erros */

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
			
			if percentual = 100::decimal then
				select into new.salario max(instrutor.salario) from instrutor where id <> new.id; -- Transforma o salário no teto salarial
				insert into log_instrutores(informacao)
					values ('O instrutor, ' || new.nome || 'receberá o teto salarial de' || new.salario);
			else
				insert into log_instrutores (informacao) 
					values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');		
			end if;
		end if;
		return new;
		exception -- Aqui iniciamos o tratamento do erro (se o erro acontecer, tudo que é feito na função anteriormente é abandonado)
			when undefined_colimn then -- Escolhemos qual tipo de erro será tratado
				raise notice 'Algo de errado nao esta certo'; -- Aqui inserimos uma mensage que será exibida no prompt como notice
				raise exception 'Erro complicado de resolver'; -- Aqui inserimos uma mensage que será exibida no prompt como error
			when raise_exception then -- Quando lancada uma excessao, podemos inserir um tratamento de excessao aqui
				
	end;
$$ language plpgsql;


drop trigger cria_log_instrutor on instrutor;
create trigger cria_log_instrutor before insert on instrutor
	for each row execute function cria_instrutor();


 	-- Usando um assert para gerar um erro e impedir que o usuario adicione um funcionario com salario acima do teto

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
			
			assert percentual < 100::decimal, 'Instrutores novos não podem receber mais que os antigos';
			-- O assert cria um erro, e manda a mensagem de erro definida
			
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');		
		end if;
		return new;
	end;
$$ language plpgsql;

drop function cria_instrutor;
drop trigger cria_log_instrutor on instrutor;
create trigger cria_log_instrutor before insert on instrutor
	for each row execute function cria_instrutor();

select * from log_instrutores;
select * from instrutor;
insert into instrutor (nome,salario) values ('joao',2100);


	-- Podemos utilizar as mensagens de erro parar tentar entender oq está acontecendo no código
	
create or replace function cria_instrutor() returns trigger as $$
	declare
		media_salarial decimal;
		total_instrutores integer;
		instrutores_salario_menor integer;
		percentual decimal(10,2);
	begin
		select into media_salarial avg(salario) from instrutor where id <> new.id;
		
		raise notice 'Salario inserido: % Media de salario: %', new.salario, media_salarial; -- Com isso podemos obter informações de depuração
		
		if new.salario > media_salarial then
			select into total_instrutores count(nome) from instrutor where id <> new.id;
			
			select into instrutores_salario_menor count(id) from instrutor where salario < new.salario;
			
			percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;
			
			assert percentual < 100::decimal,
			
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');		
		end if;
		return new;
	end;
$$ language plpgsql;









