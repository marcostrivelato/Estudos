/* Transação*/

select * from teste.cursos_programacao;

begin; -- Cria um "checkpoint" para o qual podemos retornar caso mudanças indesejadas sejam feitas

delete from teste.cursos_programacao;
select * from teste.cursos_programacao;

rollback; -- Desfaz todas as alterações feitas desde o begin até este ponto

select * from teste.cursos_programacao;

begin;
delete from teste.cursos_programacao where id_curso = 60;
commit;

select * from teste.cursos_programacao;
