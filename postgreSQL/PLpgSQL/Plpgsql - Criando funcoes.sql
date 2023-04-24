/* Funções em plgsql*/

create or replace function primeira_pl() returns integer as $$
	declare	-- Bloco no qual variáveis são definidas
		primeira_variavel integer default 3;		-- tbm pode ser atribuido como primeira_variavel :=3
	begin	--Definindo o bloco que sera o corpo da função, como não é sql precisamos definir essa instância.
		primeira_variavel := primeira_variavel * 2;
		return primeira_variavel;			--Para retornar um valor neste bloco de comandos precisamos usar um return.
	end
$$ language plpgsql;

select primeira_pl();

/* Usando sub-blocos */ 

create or replace function primeira_pl() returns integer as $$
	declare	
		primeira_variavel integer default 3;	
	begin	
		primeira_variavel := primeira_variavel * 2;
		declare
			primeira_variavel integer;	-- Esta variavel, por mais que tenha o mesmo nome da variável do bloco pai
		begin							-- é outra variavel, está em outro endereço de memória. Em geral esta n é
			primeira_variavel := 7;		-- uma boa prática de programação
		end;
		
		return primeira_variavel;		
	end
$$ language plpgsql;
