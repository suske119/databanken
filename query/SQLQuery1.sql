create schema Pok�mon;
go

create table Pok�mon.Type
(
id int identity(1,1)not null,
naam1 varchar(20) not null,
naam2 varchar(20)not null,
constraint PK_Type Primary Key (id)
);
go

create table Pok�mon.Regio
(
id int identity(1,1) not null,
naam varchar (50) not null,
aantalLocaties int not null,
constraint PK_Regio Primary Key (id)
);
go

create table Pok�mon.Gym
(
id int identity(1,1) not null,
naam varchar (50) not null,
thema varchar (50) not null,
plaats varchar (50) not null,
regioId int not null,
constraint PK_Gym Primary Key (id),
constraint FK_Gym_Regio Foreign Key (regioId) references Pok�mon.Regio(id)
);
go

create table Pok�mon.Game
(
id int identity(1,1) not null,
naam varchar (50) not null,
uitgaveDatum date not null,
platform varchar (50) not null,
generatie int not null,
regioId int not null,
constraint PK_Game Primary Key (id),
constraint FK_Game_Regio Foreign Key (regioId) references Pok�mon.Regio(id)
);
go

create table Pok�mon.Trainer
(
id int identity(1,1) not null,
naam varchar (50) not null,
gymLeider bit not null,
gymId int not null,
constraint PK_Trainer Primary Key (id),
constraint FK_Trainer_Gym Foreign Key (gymId) references Pok�mon.Gym(id)
);
go

create table Pok�mon.Pok�mon
(
id int identity(1,1) not null,
naam varchar (50) not null,
voorgaandeEvolutie int not null,
level int not null,
nature varchar (20) not null,
geslacht varchar(1),
legendary bit not null,
shiny bit not null,
typeId int not null,
constraint PK_Pok�mon Primary Key (id),
constraint FK_Pok�mon_Pok�mon Foreign Key (voorgaandeEvolutie) references Pok�mon.Pok�mon(id),
constraint FK_Pok�mon_Type Foreign Key (typeId) references Pok�mon.Type(id),
);
go

create table Pok�mon.Pok�monTrainer
(
	id int identity(1,1) not null,
	pok�monId int not null,
	trainerId int not null,
	constraint PK_Pok�monTrainer Primary Key (id),
	constraint FK_Pok�monTrainer_Pok�mon Foreign Key (pok�monId) references Pok�mon.Pok�mon(id),
	constraint FK_Pok�monTrainer_Trainer Foreign Key (trainerId) references Pok�mon.Trainer(id)
);
go

create table Pok�mon.Pok�monRegio
(
id int identity(1,1) not null,
pok�monId int not null,
regioId int not null,
constraint PK_Pok�monRegio Primary Key (id),
	constraint FK_Pok�monRegio_Pok�mon Foreign Key (pok�monId) references Pok�mon.Pok�mon(id),
	constraint FK_Pok�monRegio_Regio Foreign Key (regioId) references Pok�mon.Regio(id)
);
go