
    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'Cargos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cargos

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIs

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
       Descripcion NVARCHAR(255) null,
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
