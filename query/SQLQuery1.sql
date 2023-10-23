create schema Pokémon;
go

create table Pokémon.Type
(
id int identity(1,1)not null,
naam1 varchar(20) not null,
naam2 varchar(20)not null,
constraint PK_Type Primary Key (id)
);
go

create table Pokémon.Regio
(
id int identity(1,1) not null,
naam varchar (50) not null,
aantalLocaties int not null,
constraint PK_Regio Primary Key (id)
);
go

create table Pokémon.Gym
(
id int identity(1,1) not null,
naam varchar (50) not null,
thema varchar (50) not null,
plaats varchar (50) not null,
regioId int not null,
constraint PK_Gym Primary Key (id),
constraint FK_Gym_Regio Foreign Key (regioId) references Pokémon.Regio(id)
);
go

create table Pokémon.Game
(
id int identity(1,1) not null,
naam varchar (50) not null,
uitgaveDatum date not null,
platform varchar (50) not null,
generatie int not null,
regioId int not null,
constraint PK_Game Primary Key (id),
constraint FK_Game_Regio Foreign Key (regioId) references Pokémon.Regio(id)
);
go

create table Pokémon.Trainer
(
id int identity(1,1) not null,
naam varchar (50) not null,
gymLeider bit not null,
gymId int not null,
constraint PK_Trainer Primary Key (id),
constraint FK_Trainer_Gym Foreign Key (gymId) references Pokémon.Gym(id)
);
go

create table Pokémon.Pokémon
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
constraint PK_Pokémon Primary Key (id),
constraint FK_Pokémon_Pokémon Foreign Key (voorgaandeEvolutie) references Pokémon.Pokémon(id),
constraint FK_Pokémon_Type Foreign Key (typeId) references Pokémon.Type(id),
);
go

create table Pokémon.PokémonTrainer
(
	id int identity(1,1) not null,
	pokémonId int not null,
	trainerId int not null,
	constraint PK_PokémonTrainer Primary Key (id),
	constraint FK_PokémonTrainer_Pokémon Foreign Key (pokémonId) references Pokémon.Pokémon(id),
	constraint FK_PokémonTrainer_Trainer Foreign Key (trainerId) references Pokémon.Trainer(id)
);
go

create table Pokémon.PokémonRegio
(
id int identity(1,1) not null,
pokémonId int not null,
regioId int not null,
constraint PK_PokémonRegio Primary Key (id),
	constraint FK_PokémonRegio_Pokémon Foreign Key (pokémonId) references Pokémon.Pokémon(id),
	constraint FK_PokémonRegio_Regio Foreign Key (regioId) references Pokémon.Regio(id)
);
go