/* Cursores*/

drop function instrutores_internos;
create or replace function instrutores_internos(id_instrutor integer) returns refcursor as $$
	declare
		cursor_salarios refcursor;
		salario decimal;
	begin
		open cursor_salarios for select instrutor.salario from instrutor where id <> id_instrutor and instrutor.salario > 0;
		/*
		fetch last from cursor_salario into salario;  Move o cursor e pega o valor da ultima entrade
		fetch next from cursor_salario into salario; Move o cursor e pega o valor da entrada seguinte
		fetch prior from cursor_salario into salario; Move o cursor e pega o valor da entrada anterior
		fetch first from cursor_salario into salario; Move o cursor e pega o valor da primeira
		*/
		-- no lugar do FETCH pode ser as vezes interesante usar o MOVE, que apenas move o cursor
			-- MOVE NEXT FROM cursor_salario 
		return cursor_salarios;
	end;
$$ language plpgsql;


	-- Modificando a função para utilizar o cursor
drop function cria_instrutor;
create or replace function cria_instrutor() returns trigger as $$
	declare
		media_salarial decimal;
		total_instrutores integer default 0;
		instrutores_salario_menor integer default 0;
		percentual decimal(10,2);
		cursor_salarios refcursor;
		salario decimal;
	begin
		select into media_salarial avg(instrutor.salario) from instrutor where id <> new.id;
		
		if new.salario > media_salarial then
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');
		end if;
		
		select instrutores_internos(new.id) into cursor_salarios;
		loop
			fetch cursor_salarios into salario;
			exit when not found;
			total_instrutores := total_instrutores +1;
			if new.salario > salario then
				instrutores_salario_menor = instrutores_salario_menor +1;
			end if;
		end loop;
		
		percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;	
		
		if percentual = 100 then
			select into new.salario max(instrutor.salario) from instrutor where id <> new.id; -- Transforma o salário no maximo
			insert into log_instrutores(informacao)
				values ('O instrutor, ' || new.nome || ' receberá o teto salarial de ' || new.salario);
		else
			insert into log_instrutores (informacao) 
				values ('O instrutor, ' || new.nome || ', recebe acima da média.' ||percentual|| '% dos instrutores recebem menos');		
		end if;
	
		return new;
	end;
$$ language plpgsql;

drop trigger cria_log_instrutor on instrutor;
create trigger cria_log_instrutor before insert on instrutor
	for each row execute function cria_instrutor();


insert into instrutor (nome, salario) values ('Antonio', 6000);
select * from instrutor;

select * from log_instrutores;


