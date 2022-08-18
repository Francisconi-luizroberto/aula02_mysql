/*  Luiz Roberto Francisconi
-  Aula 2 -----

- Criar uma Tabela Chamada Clientes

- Criar Uma tabela chamada Vendas_Produtos

- Forein Key da Tabela Clientes

- Insert Nas tabelas Cliente e Vendas Produtos com 5 registros em cada

- Select com JOIN  da tabelas dos Clientes X Vendas Produtos
*/

## Criar uma Tabela Chamada Clientes ##

create table Clientes(
id_cad integer not null auto_increment,
Nome_Cliente varchar(50) not null,
Sobrenome varchar(50) not null,
CPF varchar(11) not null,
primary key(id_cad)
);

## Criar Uma tabela chamada Vendas_Produtos

create table Vendas_Produtos(
id_Vendas_Prod integer not null auto_increment,
Nome_produtos varchar(50) not null,
valor float not null,
Quantidade integer(10) not null,
id_cad integer not null,
primary key(id_Vendas_Prod)
); 

# Forein Key da Tabela Clientes (referência)

 alter table Clientes add constraint fk_Clientes
foreign key(id_cad)
references vendas_produtos(id_cad)
on delete no action
on update no action;

select * from Clientes
select * from vendas_produtos

 ## Insert Nas tabelas Cliente e Vendas Produtos com 5 registros em cada
 
insert into Clientes (Nome_Cliente,Sobrenome,CPF) values("Roberto","Vasconcelos","87878787878",1),
insert into Clientes (Nome_Cliente,Sobrenome,CPF,id_cad) values("Silvana","Silveira","11111111111",2)
insert into Clientes (Nome_Cliente,Sobrenome,CPF,id_cad) values("João","Otaviano","45454545444",3)
insert into Clientes (Nome_Cliente,Sobrenome,CPF,id_cad) values("José","Silveira","98798745645",4)
insert into Clientes (Nome_Cliente,Sobrenome,CPF) values("Roberto","Vasconcelos","11341231424",5)

insert into Vendas_produtos (Nome_produtos,valor,quantidade,id_cad) values("Celular alfa",9800.00,8,1)
insert into Vendas_produtos (Nome_produtos,valor,quantidade,id_cad) values("chaveiro",23.50,33,2,)
insert into Vendas_produtos (Nome_produtos,valor,quantidade,id_cad) values("pulseira",25.30,9,3)
insert into Vendas_produtos (Nome_produtos,valor,quantidade,id_cad) values("laptop",11200.00,4,4)
insert into Vendas_produtos (Nome_produtos,valor,quantidade,id_cad) values("cadeira",3300.00,6,5)

## Select com JOIN  da tabelas dos Clientes X Vendas Produtos
select * from Vendas_produtos
join Clientes on
Clientes.id_cad=Vendas_produtos.id_cad

select Nome_cliente,sobrenome,cpf,nome_produtos,quantidade,valor,id_vendas_prod,vendas_produtos.id_cad,Clientes.id_cad from Vendas_produtos
join Clientes on # poderia ser from cadastro e join produtos
vendas_produtos.id_cad=Clientes.id_cad
order by Clientes.id_cad