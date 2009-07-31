
    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD9C6BB3B45]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD9C6BB3B45


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD98336201B]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD98336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B96A829E09]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B96A829E09


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB984B9FD1687D84E]') AND parent_object_id = OBJECT_ID('Usuarios'))
alter table Usuarios  drop constraint FKB984B9FD1687D84E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A72C4C6B8]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A72C4C6B8


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A6A829E09]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A6A829E09


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C1B8E1D4A]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C1B8E1D4A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C8336201B]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21100647CC4BEB17]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK21100647CC4BEB17


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK211006478336201B]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK211006478336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD9CF67963]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD9CF67963


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD8336201B]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D136FF2CA]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D136FF2CA


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D7D866EAB]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D7D866EAB


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D3E391E13]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D3E391E13


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D8336201B]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D8336201B


    if exists (select * from dbo.sysobjects where id = object_id(N'TipoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividades') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividades

    if exists (select * from dbo.sysobjects where id = object_id(N'Subdisciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subdisciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipantes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipantes

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Investigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Investigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'InvestigadorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InvestigadorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Usuarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Usuarios

    if exists (select * from dbo.sysobjects where id = object_id(N'UsuarioRol') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table UsuarioRol

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Indices') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Indices

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Instituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Instituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'CategoriaInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CategoriaInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Idiomas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Idiomas

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Cargos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cargos

    if exists (select * from dbo.sysobjects where id = object_id(N'Paises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Paises

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'Personas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Personas

    if exists (select * from dbo.sysobjects where id = object_id(N'Disciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Disciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'Areas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Areas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'FormaParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormaParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIs

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

    if exists (select * from dbo.sysobjects where id = object_id(N'CargoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CargoInvestigadores

    create table TipoArticulos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table LineaTematicas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Descripcion NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table GradoAcademicos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table TipoActividades (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Subdisciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table EstadoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EstadoFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table TipoParticipantes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table LineaInvestigaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Investigadores (
        Id INT IDENTITY NOT NULL,
       FechaIngreso DATETIME null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       primary key (Id)
    )

    create table Categorias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table TipoParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Puestos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table InvestigadorExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       Puesto NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Usuarios (
        Id INT IDENTITY NOT NULL,
       UsuarioNombre NVARCHAR(255) null,
       Clave NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PersonaFk INT null,
       primary key (Id)
    )

    create table UsuarioRol (
        UsuarioFk INT not null,
       RolFk INT not null
    )

    create table SNIInvestigadores (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       ExpedienteSNI NVARCHAR(255) null,
       ExpedienteProduccion NVARCHAR(255) null,
       ExpedienteAcademico NVARCHAR(255) null,
       ClaveCVU NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SNIFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Indices (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Departamentos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table ResponsableExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Instituciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Responsable NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table CategoriaInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CategoriaFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Idiomas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table CoautorExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Cargos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Paises (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Estados (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Personas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       ApellidoPaterno NVARCHAR(255) null,
       ApellidoMaterno NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Disciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Areas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table TipoCapitulos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Roles (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table GradoAcademicoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       Descripcion NVARCHAR(255) null,
       AreaInvestigacion NVARCHAR(255) null,
       Detalle NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       GradoAcademicoFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table FormaParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table SNIs (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table Sedes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Descripcion NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )

    create table CargoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CargoFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    alter table EstadoInvestigadores 
        add constraint FK667DBFD9C6BB3B45 
        foreign key (EstadoFk) 
        references Estados

    alter table EstadoInvestigadores 
        add constraint FK667DBFD98336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Investigadores 
        add constraint FKE67B58B96A829E09 
        foreign key (UsuarioFk) 
        references Usuarios

    alter table Usuarios 
        add constraint FKB984B9FD1687D84E 
        foreign key (PersonaFk) 
        references Personas

    alter table UsuarioRol 
        add constraint FKD884456A72C4C6B8 
        foreign key (RolFk) 
        references Roles

    alter table UsuarioRol 
        add constraint FKD884456A6A829E09 
        foreign key (UsuarioFk) 
        references Usuarios

    alter table SNIInvestigadores 
        add constraint FK6A7A949C1B8E1D4A 
        foreign key (SNIFk) 
        references SNIs

    alter table SNIInvestigadores 
        add constraint FK6A7A949C8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CategoriaInvestigadores 
        add constraint FK21100647CC4BEB17 
        foreign key (CategoriaFk) 
        references Categorias

    alter table CategoriaInvestigadores 
        add constraint FK211006478336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD9CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D136FF2CA 
        foreign key (CargoFk) 
        references Cargos

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores
