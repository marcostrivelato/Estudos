
/* Queremos descobrir qual o percentual do quadro que dado funcionario recebe mais*/

DO $$-- executa um bloco de codigo sem nome, este recurso ajuda na construção de novas funções, já que é mais fácil para ir testando
	declare
		cursor_salarios refcursor;
		salario decimal;
		total_instrutores integer default 0;
		instrutores_salario_menor integer default 0;
		percentual decimal;
	begin
		select instrutores_internos(12) into cursor_salarios;
		loop
			fetch cursor_salarios into salario;
			exit when not found;
			total_instrutores := total_instrutores +1;
			if 1000::decimal > salario then
				instrutores_salario_menor = instrutores_salario_menor +1;
			end if;
		end loop;
		percentual = instrutores_salario_menor::decimal * 100 /total_instrutores::decimal;
		
		raise notice 'Percentual = % %%', percentual;
	end;
$$ 

select * from instrutor;