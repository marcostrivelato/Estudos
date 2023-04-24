/* Estruturas condicionais */

create or replace function salario_ok(instrutor instrutor) returns varchar as $$
	begin
		if instrutor.salario > 200 then
			return 'Salário está ok';
		else
			return 'Salário pode aumentar';
		end if;
	end;
$$ language plpgsql;

select nome,salario_ok(instrutor) from instrutor;


	-- Recriando a função recebendo apenas o id

drop function salario_ok;
create or replace function salario_ok(id_instrutor integer) returns varchar as $$
	declare
		instrutor instrutor;
	begin
		select * from instrutor where id = id_instrutor into instrutor;
		if instrutor.salario > 200 then
			return 'Salário está ok';
		else
			return 'Salário pode aumentar';
		end if;
	end;
$$ language plpgsql;

select nome,salario_ok(instrutor.id) from instrutor;

		
		-- Adicionando mais condições
		
drop function salario_ok;
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
	begin
		if instrutor.salario > 300 then
			return 'Salário está ok';
		elseif instrutor.salario = 300 then
			return 'Salário pode aumentar';
		else
			return 'Salário está defasado';
		end if;
	end;
$$ language plpgsql;

select nome,salario_ok(instrutor) from instrutor;

		
		-- Ultilizando o case 
		
create or replace function salario_ok(instrutor instrutor) returns varchar as $$
	begin 
		case instrutor.salario
			when 100 then
				return 'Salário muito baixo';
			when 200 then
				return 'Salário baixo';
			when 300 then
				return 'Salário ok';
			else
				return 'Salário ótimo';
		end case;
	end;
$$ language plpgsql;
		
select nome,salario_ok(instrutor) from instrutor;





















