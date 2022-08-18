# Alter comando DDL (definição ou alteração estrutural)

alter table cadastro add cep integer(9) after CPF;


# Testar se inseriu os registros com select

select * from cadastro

# Trabalhando com comandos de select DQL

# Order by - ordenar pelo campo da coluna (alfabética/crescente)

# Ordem crescente
select Nome,Sobrenome from cadastro
order by Nome

#Ordem decrescente
select Nome,Sobrenome from cadastro
order by Nome desc

#### Where clausula de condição

select nome,Sobrenome from cadastro
where nome="João"

select nome, sobrenome from cadastro
where nome !="João"

# Operadores Relacionais

# > maior # < menor # = igual # <> diferente
# >= maior igual # <= menor igual

select id_cad,nome,sobrenome from cadastro
where id_cad>=3;

# Select com busca coringa

select nome,sobrenome from cadastro
where nome like "Jo%";

select nome,sobrenome from cadastro
where nome like "%ria"

select Nome,Sobrenome from cadastro
where nome like "%ui%"

select Nome,Sobrenome from cadastro
where nome like "ro%to"

# Operadores lógicos

# OR - OU - Quando 1 das condições são verdadeiras
# AND - E - Quando todas as condições são verdadeiras
# NOT - NÃO - Quando inverte a condição aplicada

# Operador OR

select nome,sobrenome from cadastro
where nome = "Roberto" or sobrenome = "Silva"

# Operador AND

select nome,sobrenome from cadastro
where nome="Roberto" and sobrenome="Ferreira"

# Operador NOT

select nome,sobrenome from cadastro
where not nome="Roberto"

## Subconsultas ou sub selects é uma forma de trazer um select dentro do outro  e também fazer o join de duas tabelas

# IN e NOT IN

select id_cad,nome,sobrenome from cadastro
where id_cad in (1,2)

select id_cad,nome,sobrenome from cadastro
where id_cad not in (1,2)

# Subselect
# vai executar primeiro entre parenteses puxando tudo que não for José do cadastro2. Tem mais sentido ou apenas tem sentido quando puxa de uma segunda tabela

select nome,sobrenome from cadastro
where nome not in (select nome from cadastro where nome = "José")

# Filtrar registros repetidos no select com a função distinct

select distinct sobrenome from cadastro


## Trabalhando com relação de tabelas e criação da foreing key (chave estrangeira)

# Criar a tabela produtos

create table produtos(
id_prod integer not null auto_increment,
Nome varchar(50) not null,
valor float not null,
Quantidade integer(10) not null,
id_cad integer not null, 
primary key(id_prod)
);

select * from produtos

## Criar a interligação das tabelas
# Constraint (interligação relacional de tabelas)

alter table produtos add constraint fk_cadastro_produtos
foreign key(id_cad)
references cadastro(id_cad)
on delete no action
on update no action;

select * from cadastro

### Subsonsultas com duas tabelas

select id_cad,nome,sobrenome from cadastro
where id_cad in (select id_cad from produtos where id_cad)

select id_cad,nome,sobrenome from cadastro
where id_cad not in (select id_cad from produtos where id_cad)

select nome,(select nome from cadastro where id_cad = produtos.id_cad) as Clientes  #as Clientes é um alias ou apelido criando máscara
from produtos

## Joins de tabelas utilizando subselect
# E aliases em nome das tabelas e saída do subselects

select nome as Frutas,(select nome from cadastro where id_cad = produtos.id_cad) as Clientes
from produtos

insert into produtos (nome,valor,quantidade,id_cad) values("Jaca",10,3.5,11)

## Select sem JOIN

select nome,sobrenome,quantidade,valor # Deu problema pois em cadastro e produtos tinha nome, dando conflito
from produtos,cadastro
where cadastro.id_cad=produtos.id_cad
order by quantidade;

## Alterar o nome de um campo da tabela

alter table cadastro change nome nome_cadastro varchar(50);

alter table produtos change nome Nome_produtos varchar(50);

select Nome_cadastro,sobrenome, Nome_produtos,quantidade,valor # agora funciona pois foram alterados os campos nome
from produtos,cadastro
where cadastro.id_cad=produtos.id_cad
order by quantidade;

## Join é a junção relacional entra as tabelas.alter

select * from produtos
join cadastro on
produtos.id_cad = cadastro.id_cad
# cada tabela que tiver basta inserir join nometabela on + prod.id_prod = estoque.id_prod por exemplo

select nome_cadastro,CPF,Nome_produtos,quantidade,valor from produtos
join cadastro on # poderia ser from cadastro e join produtos
produtos.id_cad = cadastro.id_cad
order by nome_cadastro

