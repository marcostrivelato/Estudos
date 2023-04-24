	/* estruturas de repetição*/

create or replace function tabuada(numero integer) returns setof varchar as $$
	declare
		multiplicador integer default 1;
	begin
		loop
			return next numero ||' x '||  multiplicador ||' = '|| numero*multiplicador; 
			multiplicador := multiplicador +1;
			exit when multiplicador = 11;
		end loop;
	end;
$$ language plpgsql;

	-- usando o while
create or replace function tabuada(numero integer) returns setof varchar as $$
	declare
		multiplicador integer default 1;
	begin
		while multiplicador < 11 loop
			return next numero ||' x '||  multiplicador ||' = '|| numero*multiplicador;
			multiplicador := multiplicador +1;
		end loop;
	end;
$$ language plpgsql;

	-- usando o for
create or replace function tabuada(numero integer) returns setof varchar as $$
	declare
		multiplicador integer default 1;
	begin
		for multiplicador in 1..10 loop
			return next numero ||' x '||  multiplicador ||' = '|| numero*multiplicador
		end loop;
	end;
$$ language plpgsql;

select tabuada(3);


create function instrutor_com_salario(out nome varchar,out salario_ok varchar) returns setof record as $$ 
	declare
		instrutor instrutor;
	begin
		for instrutor in select * from instrutor loop
			nome := instrutor.nome;
			salario_ok = salario_ok(instrutor);			
			return next;
		end loop;
	end;
$$ language plpgsql;

select * from instrutor_com_salario();











