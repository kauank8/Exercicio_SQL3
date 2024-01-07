Create DataBase LocacaoDVD
go
Use LocacaoDVD

Create table Filme(
id_filme int not null,
titulo varchar(40) not null,
ano int null check(ano<=2021)
Primary Key (id_filme)
)
Go
Create Table Estrela(
id_estrela int not null,
nome varchar(50) not null
Primary Key(id_estrela)
)
Go
Create Table Filme_Estrela(
id_filme int not null,
id_estrela int not null
Primary Key(id_filme, id_estrela)
Foreign Key (id_filme) References Filme(id_filme),
Foreign Key (id_estrela) References Estrela(id_estrela)
)
Go
Create Table Dvd (
num_dvd int not null,
dataFabricacao date not null check(dataFabricacao < getdate()),
id_filme int not null
Primary Key(num_dvd)
Foreign Key(id_filme) References Filme(id_filme)
)
Go
Create Table Cliente (
num_cadastro int not null,
nome varchar(70) not null,
logradouro varchar(150) not null,
num int not null check(num >= 0),
cep char(8) null Check(Len(cep) = '8')
Primary Key(num_cadastro)
)
Go
Create Table Locacao(
num_dvd int not null,
num_cliente int not null,
data_locacao date not null Default(getdate()),
data_devolucao date not null ,
valor decimal(7,2) not null Check(valor > 0)
Primary Key(num_dvd, num_cliente,data_locacao)
Foreign Key(num_dvd) References Dvd(num_dvd),
Foreign Key(num_cliente) References Cliente(num_cadastro),
Constraint chk_dtdev_dtloc Check(data_devolucao > data_locacao)
)

Alter table Estrela
Add nome_real varchar(50) null
--Alterando coluna titulo
Alter Table Filme
Alter Column titulo varchar(80) not null

Insert into Filme
Values
(1001, 'Whiplash', 2015),
(1002, 'Birdman', 2015),
(1003, 'Interestelar', 2014),
(1004, 'A Culpa é das estrelas' ,2014),
(1005, 'Alexandre e o Dia Terrível, Horrível,
Espantoso e Horroroso', 2014),
(1006, 'Sing', 2016)

Insert into Estrela
Values
(9901, 'Michael Keaton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9903, 'Miles Teller', NULL),
(9904, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')

Insert into Filme_Estrela
Values
(1002, 9901),
(1002 ,9902),
(1001, 9903),
(1005, 9904),
(1005 ,9905)

Insert into Dvd
Values
(10001, '2020-12-02', 1001),
(10002, '2019-10-18', 1002),
(10003, '2020-04-03', 1003),
(10004, '2020-12-02' ,1001),
(10005, '2019-10-18', 1004),
(10006, '2020-04-03' ,1002),
(10007, '2020-12-02', 1005),
(10008, '2019-10-18' ,1002),
(10009, '2020-04-03', 1003)

Insert into Cliente
Values
(5501, 'Matilde Luz', 'Rua Síria', 150, '03086040'),
(5502, 'Carlos Carreiro' ,'Rua Bartolomeu Aires' ,1250, '04419110'),
(5503, 'Daniel Ramalho', 'Rua Itajutiba', 169, NULL),
(5504, 'Roberta Bento', 'Rua Jayme Von Rosenburg' ,36, NULL),
(5505, 'Rosa Cerqueira', 'Rua Arnaldo Simões Pinto', 235, '02917110')

Insert into Locacao
Values
(10001, 5502, '2021-02-18' ,'2021-02-21', 3.50),
(10009 ,5502 ,'2021-02-18', '2021-02-21', 3.50),
(10002, 5503, '2021-02-18' ,'2021-02-19', 3.50),
(10002, 5505, '2021-02-20','2021-02-23' ,3.00),
(10004, 5505, '2021-02-20' , '2021-02-23' ,3.00),
(10005, 5505, '2021-02-20', '2021-02-23', 3.00),
(10001, 5501, '2021-02-24' ,'2021-02-26', 3.50),
(10008, 5501, '2021-02-24', '2021-02-26', 3.50)

Update Cliente
set cep ='08411150'
where num_cadastro=5503

Update Cliente
set cep ='02918190'
where num_cadastro=5504

Update Locacao
set valor = 3.25
where data_locacao = '2021-02-18' and num_cliente = 5502

Update Locacao
set valor = 3.10
where data_locacao = '2021-02-24' and num_cliente = 5501

Update Dvd
set dataFabricacao = '2019-07-14'
where num_dvd = 10005

Update Estrela
set nome_real = 'Miles Alexander Teller'
where nome = 'Miles Teller'

Delete Filme
where titulo = 'Sing'

--Selects
Select titulo
from Filme
where ano=2014

Select id_filme, ano from Filme
where titulo = 'BirdMan'

Select id_filme, ano from Filme
where titulo Like '%plash'

Select id_estrela, nome, nome_real From Estrela
where nome Like 'Steve%'

Select Distinct id_filme, Convert(char(10),dataFabricacao,103) as fab from Dvd
where dataFabricacao >= '01-01-2020'

Select num_dvd, data_locacao, data_devolucao,valor, valor+2.00 as multa from Locacao
where num_cliente = 5505

Select logradouro, num, cep From Cliente
where nome = 'Matilde luz'

Select nome_real From Estrela
where nome = 'Michael Keaton'

Select num_cadastro, nome,  logradouro +' Num:'+Cast(num as varchar(10)) + ' Cep:' +cep as end_completo from Cliente
where num_cadastro >=5503