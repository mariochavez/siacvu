
    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

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
