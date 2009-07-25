
    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'Cargos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cargos

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

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

    create table Sedes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorPor NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoPor NVARCHAR(255) null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       primary key (Id)
    )
