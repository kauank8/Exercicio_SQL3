Create DataBase EX_USERPROJECT
Go
Create Table Users(
id_user int not null Identity(1,1),
nome varchar(45) not null,
usuario varchar(45) not null Unique,
senha varchar(45) not null Default('123mudar'),
email varchar(45) not null
Primary Key(id_user)
)
Go
Create Table Projects(
id_project int not null Identity (10001, 1),
nome varchar(45) not null,
descricao varchar(45) not null,
dataProjeto date not null Check(dataProjeto > '01/09/2014')
Primary Key(id_project)
)
Go
Create table users_projects(
id_user int not null,
id_project int not null
Primary Key(id_user,id_project)
Foreign Key(id_user) References  Users (id_user),
Foreign Key(id_project) References Projects(id_project)
)
GO
-- alterando userName
Alter Table Users 
ALTER Column usuario varchar(10) not null 
GO
-- alterando senha
Alter Table Users
Alter Column senha varchar(8) not null
Go

Insert Into Users(nome,usuario,email)
Values
( 'Maria', 'Rh_Maria','maria@empresa.com'),
('Ana','Rh_Ana', 'ana@empresa.com'),
('Clara','Ti_Clara', 'clara@empresa.com')

Insert into Users
Values
('Paulo', 'Ti_Paulo', '123@456', 'paulo@empresa.com'),
('Aparecido', 'Rh_apaeci', '55@!cido', 'aparecido@empresa.com')


--Alterando nulidade em projetos
Alter table Projects
Alter Column descricao varchar(45) null

Insert into Projects
Values
('Re-Folha','Refatoração das folhas','05/09/2014'),
('Manutenção Pcs', 'Manutenção Pcs', '06/09/2014'),
('Auditoria', null, '07/09/2014')

Insert into users_projects
values
(2,10002),
(5,10001),
(3,10003),
(4,10002),
(6,10002)

Update Projects
Set dataProjeto = '12/09/2014'
Where id_project = 10002

Update Users
set usuario = 'Rh_cido'
Where nome = 'Aparecido'

Update Users
set senha = '888@*'
Where nome = 'Maria'

Delete users_projects
where id_user = 2 and id_project=10002

Select *  from Users
Select * from Projects
Select * from users_projects

