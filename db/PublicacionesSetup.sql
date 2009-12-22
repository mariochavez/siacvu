DELETE from CoautorInternoProductos
GO
set identity_insert CoautorInternoProductos on
insert CoautorInternoProductos([Id],[TipoProducto],[Posicion],[CreadoEl],[ModificadoEl],[Activo],[InvestigadorFk],[CreadoPorFk],[ModificadoPorFk]) values(1,1,2,'Dec  3 2009  9:45AM','Dec  3 2009  9:45AM',1,1,3,3)
insert CoautorInternoProductos([Id],[TipoProducto],[Posicion],[CreadoEl],[ModificadoEl],[Activo],[InvestigadorFk],[CreadoPorFk],[ModificadoPorFk]) values(2,7,2,'Dec  3 2009  9:47AM','Dec  3 2009  9:47AM',1,1,3,3)
insert CoautorInternoProductos([Id],[TipoProducto],[Posicion],[CreadoEl],[ModificadoEl],[Activo],[InvestigadorFk],[CreadoPorFk],[ModificadoPorFk]) values(3,2,2,'Dec  3 2009  9:50AM','Dec  3 2009  9:50AM',1,3,2,2)
set identity_insert CoautorInternoProductos off
GO
update statistics CoautorInternoProductos
GO

DELETE from Firmas
GO
set identity_insert Firmas on
insert Firmas([Id],[TipoProducto],[Firma1],[Aceptacion1],[Firma2],[Aceptacion2],[Firma3],[Aceptacion3],[Descripcion],[CreadoEl],[ModificadoEl],[Activo],[Usuario1Fk],[Usuario2Fk],[Usuario3Fk],[CreadoPorFk],[ModificadoPorFk]) values(1,1,'Dec  3 2009  9:45AM',0,'Dec  3 2009  9:45AM',0,'Dec  3 2009  9:45AM',0, null,'Dec  3 2009  9:45AM','Dec  3 2009  9:45AM',1,null,null,null,3,3)
insert Firmas([Id],[TipoProducto],[Firma1],[Aceptacion1],[Firma2],[Aceptacion2],[Firma3],[Aceptacion3],[Descripcion],[CreadoEl],[ModificadoEl],[Activo],[Usuario1Fk],[Usuario2Fk],[Usuario3Fk],[CreadoPorFk],[ModificadoPorFk]) values(2,2,'Dec  3 2009  9:50AM',0,'Dec  3 2009  9:50AM',0,'Dec  3 2009  9:50AM',0, null,'Dec  3 2009  9:50AM','Dec  3 2009  9:50AM',1,null,null,null,2,2)
insert Firmas([Id],[TipoProducto],[Firma1],[Aceptacion1],[Firma2],[Aceptacion2],[Firma3],[Aceptacion3],[Descripcion],[CreadoEl],[ModificadoEl],[Activo],[Usuario1Fk],[Usuario2Fk],[Usuario3Fk],[CreadoPorFk],[ModificadoPorFk]) values(3,7,'Dec  3 2009  9:47AM',0,'Dec  3 2009  9:47AM',0,'Dec  3 2009  9:47AM',0, null,'Dec  3 2009  9:47AM','Dec  3 2009  9:47AM',1,null,null,null,3,3)
set identity_insert Firmas off
GO
update statistics Firmas
GO

DELETE from Articulos
GO
set identity_insert Articulos on
insert Articulos([Id],[Titulo],[TipoArticulo],[TieneProyecto],[PalabraClave1],[PalabraClave2],[PalabraClave3],[PosicionAutor],[EstadoProducto],[FechaAceptacion],[FechaPublicacion],[Volumen],[Numero],[PaginaInicial],[PaginaFinal],[Puntuacion],[CreadoEl],[ModificadoEl],[Activo],[FirmaFk],[ProyectoFk],[AreaTematicaFk],[AreaFk],[DisciplinaFk],[SubdisciplinaFk],[RevistaPublicacionFk],[DepartamentoFk],[SedeFk],[UsuarioFk],[CreadoPorFk],[ModificadoPorFk]) values(1,'Fluent NHibernate Basico',0,0,'nhibernate','fluent','database',1,0,'Jan  1 1910 12:00AM','Jan  1 1910 12:00AM',0,0,0,0,0,'Dec  3 2009  9:45AM','Dec  3 2009  9:45AM',1,1,null,null,null,null,null,null,1,1,3,3,3)
set identity_insert Articulos off
GO
update statistics Articulos
GO

DELETE from CoautorInternoArticulo
GO
insert CoautorInternoArticulo([CoautorInternoProducto],[ArticuloFk]) values(1,1)
GO
update statistics CoautorInternoArticulo
GO


DELETE from Capitulos
GO
set identity_insert Capitulos on
insert Capitulos([Id],[NombreCapitulo],[TipoCapitulo],[PosicionAutor],[TieneProyecto],[EstadoProducto],[FechaAceptacion],[FechaPublicacion],[NombreLibro],[AutorLibro],[TipoLibro],[Resumen],[Volumen],[PaginaInicial],[PaginaFinal],[NoCitas],[Puntuacion],[CreadoEl],[ModificadoEl],[Activo],[FirmaFk],[ProyectoFk],[AreaTematicaFk],[AreaFk],[DisciplinaFk],[SubdisciplinaFk],[EditorialFk],[UsuarioFk],[DepartamentoFk],[SedeFk],[CreadoPorFk],[ModificadoPorFk]) values(1,'Automaper en MVC',0,1,0,0,'Jan  1 1910 12:00AM','Jan  1 1910 12:00AM',null,null,0,null,0,0,0,0,0,'Dec  3 2009  9:50AM','Dec  3 2009  9:50AM',1,2,null,2,null,null,null,null,2,1,1,2,2)
set identity_insert Capitulos off
GO
update statistics Capitulos
GO


DELETE from CoautorInternoCapitulo
GO
insert CoautorInternoCapitulo([CoautorInternoProducto],[CapituloFk]) values(3,1)
GO
update statistics CoautorInternoCapitulo
GO


DELETE from Libros
GO
set identity_insert Libros on
insert Libros([Id],[Nombre],[FormatoPublicacion],[TipoProducto],[ContenidoLibro],[TieneProyecto],[PalabraClave1],[PalabraClave2],[PalabraClave3],[PosicionAutor],[EstadoProducto],[FechaAceptacion],[FechaPublicacion],[ISBN],[Edicion],[Reimpresion],[Volumen],[NoPaginas],[Tiraje],[Numero],[Puntuacion],[CreadoEl],[ModificadoEl],[Activo],[FirmaFk],[EventoFk],[ProyectoFk],[AreaTematicaFk],[AreaFk],[DisciplinaFk],[SubdisciplinaFk],[RevistaPublicacionFk],[UsuarioFk],[DepartamentoFk],[SedeFk],[CreadoPorFk],[ModificadoPorFk]) values(1,'NHibernate in Action',0,0,1,0,null,null,null,1,0,'Jan  1 1910 12:00AM','Jan  1 1910 12:00AM',null,1,0,0,0,0,0,0,'Dec  3 2009  9:47AM','Dec  3 2009  9:47AM',1,3,null,null,2,null,null,null,null,3,1,1,3,3)
set identity_insert Libros off
GO
update statistics Libros
GO

DELETE from CoautorInternoLibro
GO
insert CoautorInternoLibro([CoautorInternoProducto],[LibroFk]) values(2,1)
GO
update statistics CoautorInternoLibro
GO
