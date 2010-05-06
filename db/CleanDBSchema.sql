

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9D4AA1BC62D605DB]') AND parent_object_id = OBJECT_ID('VinculacionAPyDes'))
alter table VinculacionAPyDes  drop constraint FK9D4AA1BC62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9D4AA1BC74E8BAB7]') AND parent_object_id = OBJECT_ID('VinculacionAPyDes'))
alter table VinculacionAPyDes  drop constraint FK9D4AA1BC74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAE84C80462D605DB]') AND parent_object_id = OBJECT_ID('TipoApoyos'))
alter table TipoApoyos  drop constraint FKAE84C80462D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAE84C80474E8BAB7]') AND parent_object_id = OBJECT_ID('TipoApoyos'))
alter table TipoApoyos  drop constraint FKAE84C80474E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK57A9948062D605DB]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK57A9948062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK57A9948074E8BAB7]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK57A9948074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B96A829E09]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B96A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B98A77AB9C]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B98A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B962D605DB]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B974E8BAB7]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919962D605DB]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919974E8BAB7]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D096A829E09]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D096A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D093E082BED]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D093E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D09EC222BA6]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D09EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D09C8628149]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D09C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D0962D605DB]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D0962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK742C6D0974E8BAB7]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FK742C6D0974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6708195562D605DB]') AND parent_object_id = OBJECT_ID('DirigidoAs'))
alter table DirigidoAs  drop constraint FK6708195562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6708195574E8BAB7]') AND parent_object_id = OBJECT_ID('DirigidoAs'))
alter table DirigidoAs  drop constraint FK6708195574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADCB4F3F6C]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADCB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD70EA6C9E]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD70EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD8A77AB9C]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD8A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD295BC133]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADBC063744]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADBC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADF4FE4035]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADF4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADE30B9132]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADE30B9132



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD6A829E09]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD7D866EAB]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD3E391E13]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD62D605DB]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD74E8BAB7]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF88C425162D605DB]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FKF88C425162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF88C425174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FKF88C425174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE62D605DB]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE74E8BAB7]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C62D605DB]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C74E8BAB7]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK952D666B62D605DB]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK952D666B62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK952D666B74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK952D666B74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53E7616262D605DB]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FK53E7616262D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53E7616274E8BAB7]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FK53E7616274E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52ADBC063744]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52ADBC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD62D605DB]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD74E8BAB7]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A2E670F62D605DB]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK1A2E670F62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A2E670F74E8BAB7]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK1A2E670F74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A6A829E09]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A72C4C6B8]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A72C4C6B8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14DFAB5DAA0C7213]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FK14DFAB5DAA0C7213



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14DFAB5D62D605DB]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FK14DFAB5D62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14DFAB5D74E8BAB7]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FK14DFAB5D74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D770EA6C9E]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D770EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D78A77AB9C]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D78A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7295BC133]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7BC063744]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7F4FE4035]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7CB4F3F6C]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D72AF31B56]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D72AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D77D866EAB]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D77D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D73E391E13]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D73E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D76A829E09]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D76A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D762D605DB]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D774E8BAB7]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AF217E62D605DB]') AND parent_object_id = OBJECT_ID('Archivos'))
alter table Archivos  drop constraint FKD4AF217E62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AF217E74E8BAB7]') AND parent_object_id = OBJECT_ID('Archivos'))
alter table Archivos  drop constraint FKD4AF217E74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF71A7A2E82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoArticulo'))
alter table ArchivoArticulo  drop constraint FKF71A7A2E82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF71A7A2EFCE29076]') AND parent_object_id = OBJECT_ID('ArchivoArticulo'))
alter table ArchivoArticulo  drop constraint FKF71A7A2EFCE29076



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDEB6270882C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoArticuloDifusion'))
alter table ArchivoArticuloDifusion  drop constraint FKDEB6270882C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDEB62708BA049F44]') AND parent_object_id = OBJECT_ID('ArchivoArticuloDifusion'))
alter table ArchivoArticuloDifusion  drop constraint FKDEB62708BA049F44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F93781982C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoCapitulo'))
alter table ArchivoCapitulo  drop constraint FK6F93781982C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F937819A1B3F60D]') AND parent_object_id = OBJECT_ID('ArchivoCapitulo'))
alter table ArchivoCapitulo  drop constraint FK6F937819A1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK73A5D66B82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoCurso'))
alter table ArchivoCurso  drop constraint FK73A5D66B82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK73A5D66B2E9FF2CA]') AND parent_object_id = OBJECT_ID('ArchivoCurso'))
alter table ArchivoCurso  drop constraint FK73A5D66B2E9FF2CA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD7DDAA1C82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoDictamen'))
alter table ArchivoDictamen  drop constraint FKD7DDAA1C82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD7DDAA1CCB0D698F]') AND parent_object_id = OBJECT_ID('ArchivoDictamen'))
alter table ArchivoDictamen  drop constraint FKD7DDAA1CCB0D698F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEC582C7282C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoDistincion'))
alter table ArchivoDistincion  drop constraint FKEC582C7282C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEC582C72A563B165]') AND parent_object_id = OBJECT_ID('ArchivoDistincion'))
alter table ArchivoDistincion  drop constraint FKEC582C72A563B165



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK94C557A482C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoEvento'))
alter table ArchivoEvento  drop constraint FK94C557A482C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK94C557A43BA127C1]') AND parent_object_id = OBJECT_ID('ArchivoEvento'))
alter table ArchivoEvento  drop constraint FK94C557A43BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA3244AFA82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoLibro'))
alter table ArchivoLibro  drop constraint FKA3244AFA82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA3244AFA586827F8]') AND parent_object_id = OBJECT_ID('ArchivoLibro'))
alter table ArchivoLibro  drop constraint FKA3244AFA586827F8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK64C5808682C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoObraTraducida'))
alter table ArchivoObraTraducida  drop constraint FK64C5808682C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK64C58086F7D09D3A]') AND parent_object_id = OBJECT_ID('ArchivoObraTraducida'))
alter table ArchivoObraTraducida  drop constraint FK64C58086F7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3CF46F8382C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoOrganoExterno'))
alter table ArchivoOrganoExterno  drop constraint FK3CF46F8382C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3CF46F8320ACA338]') AND parent_object_id = OBJECT_ID('ArchivoOrganoExterno'))
alter table ArchivoOrganoExterno  drop constraint FK3CF46F8320ACA338



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8C70CE9182C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoOrganoInterno'))
alter table ArchivoOrganoInterno  drop constraint FK8C70CE9182C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8C70CE91B291B950]') AND parent_object_id = OBJECT_ID('ArchivoOrganoInterno'))
alter table ArchivoOrganoInterno  drop constraint FK8C70CE91B291B950



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4682E10D82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoReporte'))
alter table ArchivoReporte  drop constraint FK4682E10D82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4682E10D13FE2142]') AND parent_object_id = OBJECT_ID('ArchivoReporte'))
alter table ArchivoReporte  drop constraint FK4682E10D13FE2142



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE95B9CBC82C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoResena'))
alter table ArchivoResena  drop constraint FKE95B9CBC82C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE95B9CBCFF48CC4D]') AND parent_object_id = OBJECT_ID('ArchivoResena'))
alter table ArchivoResena  drop constraint FKE95B9CBCFF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6EC3CA8882C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoTesisDirigida'))
alter table ArchivoTesisDirigida  drop constraint FK6EC3CA8882C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6EC3CA88954C47FF]') AND parent_object_id = OBJECT_ID('ArchivoTesisDirigida'))
alter table ArchivoTesisDirigida  drop constraint FK6EC3CA88954C47FF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6C9212882C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoProyecto'))
alter table ArchivoProyecto  drop constraint FKD6C9212882C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6C9212870EA6C9E]') AND parent_object_id = OBJECT_ID('ArchivoProyecto'))
alter table ArchivoProyecto  drop constraint FKD6C9212870EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8F52929682C3B7BC]') AND parent_object_id = OBJECT_ID('ArchivoEstanciaAcademicaExterna'))
alter table ArchivoEstanciaAcademicaExterna  drop constraint FK8F52929682C3B7BC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8F529296525369A7]') AND parent_object_id = OBJECT_ID('ArchivoEstanciaAcademicaExterna'))
alter table ArchivoEstanciaAcademicaExterna  drop constraint FK8F529296525369A7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK75A1DA3162D605DB]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FK75A1DA3162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK75A1DA3174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FK75A1DA3174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF16DB6DA62D605DB]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKF16DB6DA62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF16DB6DA74E8BAB7]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKF16DB6DA74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA6A829E09]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA8336201B]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA7D866EAB]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA3E391E13]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA9E4F194A]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA9E4F194A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA62D605DB]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKECD0AAEA74E8BAB7]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKECD0AAEA74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE62D605DB]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE74E8BAB7]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF172AB862D605DB]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDF172AB862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF172AB874E8BAB7]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDF172AB874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A470EA6C9E]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A470EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A48A77AB9C]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A48A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A4295BC133]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A4295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A4BC063744]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A4BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A4F4FE4035]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A4F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A4CB4F3F6C]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A4CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A42AF31B56]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A42AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A47D866EAB]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A47D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A43E391E13]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A43E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A46A829E09]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A46A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A462D605DB]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A462D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCDA70A474E8BAB7]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FKCDA70A474E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311CB4F3F6C]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3116C7A4C4B]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3116C7A4C4B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD31184B302FF]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD31184B302FF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3119CF67963]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3119CF67963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD31164F7D1CD]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD31164F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3113E082BED]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3113E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311EC222BA6]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311C8628149]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311295BC133]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311BC063744]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD311F4FE4035]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD311F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3116A829E09]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3116A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3117D866EAB]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3117D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD3113E391E13]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD3113E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD31162D605DB]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD31162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF4DD31174E8BAB7]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FKEF4DD31174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8A3F71988336201B]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FK8A3F71988336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8A3F719862D605DB]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FK8A3F719862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8A3F719874E8BAB7]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FK8A3F719874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8A3F719870EA6C9E]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FK8A3F719870EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D78AB6062D605DB]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3D78AB6062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D78AB6074E8BAB7]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3D78AB6074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFCCB4F3F6C]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFCCB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC6425E2FD]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC6425E2FD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC8A77AB9C]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC8A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC2AF31B56]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC2AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC6A829E09]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC7D866EAB]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC3E391E13]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC62D605DB]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A338EFC74E8BAB7]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK1A338EFC74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F92D79862D605DB]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK6F92D79862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F92D79874E8BAB7]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK6F92D79874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDDAB43C062D605DB]') AND parent_object_id = OBJECT_ID('TipoArchivos'))
alter table TipoArchivos  drop constraint FKDDAB43C062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDDAB43C074E8BAB7]') AND parent_object_id = OBJECT_ID('TipoArchivos'))
alter table TipoArchivos  drop constraint FKDDAB43C074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE62D605DB]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE74E8BAB7]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB8FBCFAB62D605DB]') AND parent_object_id = OBJECT_ID('DireccionRegionales'))
alter table DireccionRegionales  drop constraint FKB8FBCFAB62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB8FBCFAB74E8BAB7]') AND parent_object_id = OBJECT_ID('DireccionRegionales'))
alter table DireccionRegionales  drop constraint FKB8FBCFAB74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1527E7962D605DB]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK1527E7962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1527E7974E8BAB7]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK1527E7974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B3288336201B]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B3288336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B32884B302FF]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B32884B302FF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B3285ECF193D]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B3285ECF193D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B3289CF67963]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B3289CF67963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B32864F7D1CD]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B32864F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B3283E082BED]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B3283E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B328EC222BA6]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B328EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD989B328C8628149]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FKD989B328C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB63156A829E09]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB63156A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB63159CF67963]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB63159CF67963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB63157A8C3DE5]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB63157A8C3DE5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB631564F7D1CD]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB631564F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB63157D866EAB]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB63157D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB63153E391E13]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB63153E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB631562D605DB]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB631562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK43CB631574E8BAB7]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FK43CB631574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E50E26A62D605DB]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK1E50E26A62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E50E26A74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK1E50E26A74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD9CF67963]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD9CF67963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD64F7D1CD]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD64F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD62D605DB]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD74E8BAB7]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD18F6ABF3]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD18F6ABF3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD8336201B]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC3E082BED]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCEC222BA6]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCEC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCC8628149]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCC8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC7A8488F7]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC7A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC295BC133]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCBC063744]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCBC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCF4FE4035]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCF4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCD1F1E09F]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCD1F1E09F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CCAA0C7213]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CCAA0C7213



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC44A2723A]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC44A2723A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC6A829E09]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC62D605DB]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4F93B3CC74E8BAB7]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK4F93B3CC74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB1E3720462D605DB]') AND parent_object_id = OBJECT_ID('ConsejoComisiones'))
alter table ConsejoComisiones  drop constraint FKB1E3720462D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB1E3720474E8BAB7]') AND parent_object_id = OBJECT_ID('ConsejoComisiones'))
alter table ConsejoComisiones  drop constraint FKB1E3720474E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEFE230DD8336201B]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FKEFE230DD8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEFE230DD62D605DB]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FKEFE230DD62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEFE230DD74E8BAB7]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FKEFE230DD74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27FD9C3763A0A2A3]') AND parent_object_id = OBJECT_ID('ParticipanteInternoEvento'))
alter table ParticipanteInternoEvento  drop constraint FK27FD9C3763A0A2A3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27FD9C37EAA1B3DF]') AND parent_object_id = OBJECT_ID('ParticipanteInternoEvento'))
alter table ParticipanteInternoEvento  drop constraint FK27FD9C37EAA1B3DF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK610A2E1E63A0A2A3]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProyecto'))
alter table ParticipanteInternoProyecto  drop constraint FK610A2E1E63A0A2A3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK610A2E1E70EA6C9E]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProyecto'))
alter table ParticipanteInternoProyecto  drop constraint FK610A2E1E70EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB9FA41368FDBB774]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FKB9FA41368FDBB774



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB9FA413664F7D1CD]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FKB9FA413664F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB9FA413662D605DB]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FKB9FA413662D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB9FA413674E8BAB7]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FKB9FA413674E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF489ABC8FB7AC05C]') AND parent_object_id = OBJECT_ID('ParticipanteExternoEvento'))
alter table ParticipanteExternoEvento  drop constraint FKF489ABC8FB7AC05C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF489ABC8EAA1B3DF]') AND parent_object_id = OBJECT_ID('ParticipanteExternoEvento'))
alter table ParticipanteExternoEvento  drop constraint FKF489ABC8EAA1B3DF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2B223E77FB7AC05C]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProyecto'))
alter table ParticipanteExternoProyecto  drop constraint FK2B223E77FB7AC05C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2B223E7770EA6C9E]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProyecto'))
alter table ParticipanteExternoProyecto  drop constraint FK2B223E7770EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC30604C862D605DB]') AND parent_object_id = OBJECT_ID('SubprogramaConacyts'))
alter table SubprogramaConacyts  drop constraint FKC30604C862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC30604C874E8BAB7]') AND parent_object_id = OBJECT_ID('SubprogramaConacyts'))
alter table SubprogramaConacyts  drop constraint FKC30604C874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8EB52B962D605DB]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKD8EB52B962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8EB52B974E8BAB7]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKD8EB52B974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CD232B3295BC133]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FK6CD232B3295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CD232B362D605DB]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FK6CD232B362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CD232B374E8BAB7]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FK6CD232B374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK92545087E30B9132]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK92545087E30B9132



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9254508762D605DB]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK9254508762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9254508774E8BAB7]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK9254508774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK925450877A8488F7]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK925450877A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK381727364DBE1A6B]') AND parent_object_id = OBJECT_ID('EditorialCapitulo'))
alter table EditorialCapitulo  drop constraint FK381727364DBE1A6B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38172736A1B3F60D]') AND parent_object_id = OBJECT_ID('EditorialCapitulo'))
alter table EditorialCapitulo  drop constraint FK38172736A1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE032A8F64DBE1A6B]') AND parent_object_id = OBJECT_ID('EditorialLibro'))
alter table EditorialLibro  drop constraint FKE032A8F64DBE1A6B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE032A8F6586827F8]') AND parent_object_id = OBJECT_ID('EditorialLibro'))
alter table EditorialLibro  drop constraint FKE032A8F6586827F8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5A61D6AC4DBE1A6B]') AND parent_object_id = OBJECT_ID('EditorialResena'))
alter table EditorialResena  drop constraint FK5A61D6AC4DBE1A6B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5A61D6ACFF48CC4D]') AND parent_object_id = OBJECT_ID('EditorialResena'))
alter table EditorialResena  drop constraint FK5A61D6ACFF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFAC4CE5D4DBE1A6B]') AND parent_object_id = OBJECT_ID('EditorialObraTraducida'))
alter table EditorialObraTraducida  drop constraint FKFAC4CE5D4DBE1A6B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFAC4CE5DF7D09D3A]') AND parent_object_id = OBJECT_ID('EditorialObraTraducida'))
alter table EditorialObraTraducida  drop constraint FKFAC4CE5DF7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK44CF0E944DBE1A6B]') AND parent_object_id = OBJECT_ID('EditorialDictamen'))
alter table EditorialDictamen  drop constraint FK44CF0E944DBE1A6B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK44CF0E94CB0D698F]') AND parent_object_id = OBJECT_ID('EditorialDictamen'))
alter table EditorialDictamen  drop constraint FK44CF0E94CB0D698F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK69423275C93A1EF1]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FK69423275C93A1EF1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6942327562D605DB]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FK6942327562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6942327574E8BAB7]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FK6942327574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK694232753BA127C1]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FK694232753BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EA40B08FE7BABE]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK2EA40B08FE7BABE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EA40B0862D605DB]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK2EA40B0862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EA40B0874E8BAB7]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK2EA40B0874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA27DBAA3E082BED]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKEA27DBAA3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA27DBAA62D605DB]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKEA27DBAA62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA27DBAA74E8BAB7]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKEA27DBAA74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51F4869062D605DB]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK51F4869062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51F4869074E8BAB7]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK51F4869074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3ED3F7EC222BA6]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FKCE3ED3F7EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3ED3F762D605DB]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FKCE3ED3F762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3ED3F774E8BAB7]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FKCE3ED3F774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34FE812062D605DB]') AND parent_object_id = OBJECT_ID('Monedas'))
alter table Monedas  drop constraint FK34FE812062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34FE812074E8BAB7]') AND parent_object_id = OBJECT_ID('Monedas'))
alter table Monedas  drop constraint FK34FE812074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D37E25AD5]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D37E25AD5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D7D866EAB]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D3E391E13]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D62D605DB]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D74E8BAB7]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D18F6ABF3]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D18F6ABF3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D8336201B]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41CB4F3F6C]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC416A829E09]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC416A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC417D866EAB]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC417D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC413E391E13]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC413E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC412261429F]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC412261429F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC418A77AB9C]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC418A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41C93A1EF1]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41C93A1EF1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC417B40DE3F]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC417B40DE3F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4162D605DB]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4174E8BAB7]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E73BA127C1]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E73BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E770EA6C9E]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E770EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E78A77AB9C]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E78A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7295BC133]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7BC063744]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7F4FE4035]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7CB4F3F6C]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E72AF31B56]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E72AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E76A829E09]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E76A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E77D866EAB]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E77D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E73E391E13]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E73E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E762D605DB]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E774E8BAB7]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C7A8488F7]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C7A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627CC0410E89]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627CC0410E89



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627CC93A1EF1]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627CC93A1EF1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C3E082BED]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C62D605DB]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C74E8BAB7]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFB29159064F7D1CD]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKFB29159064F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFB2915907A8488F7]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKFB2915907A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFB29159062D605DB]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKFB29159062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFB29159074E8BAB7]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKFB29159074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4ECBCD2B62D605DB]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FK4ECBCD2B62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4ECBCD2B74E8BAB7]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FK4ECBCD2B74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK33E5D7A51EDC2D3B]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK33E5D7A51EDC2D3B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK33E5D7A562D605DB]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK33E5D7A562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK33E5D7A574E8BAB7]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK33E5D7A574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1B18FE662D605DB]') AND parent_object_id = OBJECT_ID('AreaInvestigaciones'))
alter table AreaInvestigaciones  drop constraint FKC1B18FE662D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1B18FE674E8BAB7]') AND parent_object_id = OBJECT_ID('AreaInvestigaciones'))
alter table AreaInvestigaciones  drop constraint FKC1B18FE674E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE1CB4F3F6C]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE1CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE170EA6C9E]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE170EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE164F7D1CD]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE164F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE18A77AB9C]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE18A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE16A829E09]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE16A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE17D866EAB]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE17D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE13E391E13]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE13E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE162D605DB]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE174E8BAB7]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77B2AE3011]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77B2AE3011



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77CB4F3F6C]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77201EE7BB]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77201EE7BB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7760BA4690]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7760BA4690



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77E758F5B4]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77E758F5B4



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D778A77AB9C]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D778A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7784B302FF]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7784B302FF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77295BC133]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77BC063744]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77F4FE4035]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77970F014B]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77970F014B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D773E082BED]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D773E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77EC222BA6]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77C8628149]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77D1F1E09F]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77D1F1E09F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D77AA0C7213]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D77AA0C7213



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7744A2723A]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7744A2723A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D777D866EAB]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D777D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D773E391E13]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D773E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D776A829E09]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D776A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7762D605DB]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7774E8BAB7]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3B80B527A8488F7]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKD3B80B527A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3B80B5262D605DB]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKD3B80B5262D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3B80B5274E8BAB7]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKD3B80B5274E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EECB2CAFCD8]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EECB2CAFCD8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC64F7D1CD]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC64F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EECC93A1EF1]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EECC93A1EF1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC7A8488F7]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC7A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EECC0410E89]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EECC0410E89



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC6A829E09]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC7D866EAB]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC3E391E13]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC62D605DB]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC74E8BAB7]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB422A0B062D605DB]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FKB422A0B062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB422A0B074E8BAB7]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FKB422A0B074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7CD5A96A64F7D1CD]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7CD5A96A64F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7CD5A96A62D605DB]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7CD5A96A62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7CD5A96A74E8BAB7]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7CD5A96A74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK941D48A6A3282B3]') AND parent_object_id = OBJECT_ID('InstitucionReporte'))
alter table InstitucionReporte  drop constraint FK941D48A6A3282B3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK941D48A13FE2142]') AND parent_object_id = OBJECT_ID('InstitucionReporte'))
alter table InstitucionReporte  drop constraint FK941D48A13FE2142



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3D5D5D6A3282B3]') AND parent_object_id = OBJECT_ID('InstitucionEvento'))
alter table InstitucionEvento  drop constraint FKCE3D5D5D6A3282B3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3D5D5D3BA127C1]') AND parent_object_id = OBJECT_ID('InstitucionEvento'))
alter table InstitucionEvento  drop constraint FKCE3D5D5D3BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK235213B89CF67963]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK235213B89CF67963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK235213B862D605DB]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK235213B862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK235213B874E8BAB7]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK235213B874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK235213B870EA6C9E]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK235213B870EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8937716362D605DB]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK8937716362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8937716374E8BAB7]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK8937716374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK140229918336201B]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK140229918336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1402299162D605DB]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK1402299162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1402299174E8BAB7]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK1402299174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9CC896BE751FC11F]') AND parent_object_id = OBJECT_ID('AutorInternoCapitulo'))
alter table AutorInternoCapitulo  drop constraint FK9CC896BE751FC11F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9CC896BEA1B3F60D]') AND parent_object_id = OBJECT_ID('AutorInternoCapitulo'))
alter table AutorInternoCapitulo  drop constraint FK9CC896BEA1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9466F96C751FC11F]') AND parent_object_id = OBJECT_ID('AutorInternoResena'))
alter table AutorInternoResena  drop constraint FK9466F96C751FC11F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9466F96CFF48CC4D]') AND parent_object_id = OBJECT_ID('AutorInternoResena'))
alter table AutorInternoResena  drop constraint FK9466F96CFF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD71AD782751FC11F]') AND parent_object_id = OBJECT_ID('AutorInternoObraTraducida'))
alter table AutorInternoObraTraducida  drop constraint FKD71AD782751FC11F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD71AD782F7D09D3A]') AND parent_object_id = OBJECT_ID('AutorInternoObraTraducida'))
alter table AutorInternoObraTraducida  drop constraint FKD71AD782F7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA32D18F38FDBB774]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FKA32D18F38FDBB774



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA32D18F364F7D1CD]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FKA32D18F364F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA32D18F362D605DB]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FKA32D18F362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA32D18F374E8BAB7]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FKA32D18F374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9642E24AC6FC9223]') AND parent_object_id = OBJECT_ID('AutorExternoCapitulo'))
alter table AutorExternoCapitulo  drop constraint FK9642E24AC6FC9223



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9642E24AA1B3F60D]') AND parent_object_id = OBJECT_ID('AutorExternoCapitulo'))
alter table AutorExternoCapitulo  drop constraint FK9642E24AA1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBDA4E728C6FC9223]') AND parent_object_id = OBJECT_ID('AutorExternoResena'))
alter table AutorExternoResena  drop constraint FKBDA4E728C6FC9223



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBDA4E728FF48CC4D]') AND parent_object_id = OBJECT_ID('AutorExternoResena'))
alter table AutorExternoResena  drop constraint FKBDA4E728FF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3E500693C6FC9223]') AND parent_object_id = OBJECT_ID('AutorExternoObraTraducida'))
alter table AutorExternoObraTraducida  drop constraint FK3E500693C6FC9223



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3E500693F7D09D3A]') AND parent_object_id = OBJECT_ID('AutorExternoObraTraducida'))
alter table AutorExternoObraTraducida  drop constraint FK3E500693F7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE628A77AB9C]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE628A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62295BC133]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62BC063744]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62F4FE4035]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62CB4F3F6C]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE627A8488F7]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE627A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE622AF31B56]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE622AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62E30B9132]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62E30B9132



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE626A829E09]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE626A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE627D866EAB]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE627D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE623E391E13]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE623E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6262D605DB]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6262D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6274E8BAB7]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6274E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9114F61C8828823]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK9114F61C8828823



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9114F61469EFF44]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK9114F61469EFF44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9114F616A829E09]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK9114F616A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9114F6162D605DB]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK9114F6162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9114F6174E8BAB7]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK9114F6174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF062672762D605DB]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FKF062672762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF062672774E8BAB7]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FKF062672774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE0196A829E09]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE0196A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE0197D866EAB]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE0197D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE0193E391E13]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE0193E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE0197A8C3DE5]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE0197A8C3DE5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE01964F7D1CD]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE01964F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE0193E082BED]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE0193E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE019EC222BA6]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE019EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE019C8628149]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE019C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE01962D605DB]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE01962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2BE01974E8BAB7]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKA2BE01974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD9C6BB3B45]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD9C6BB3B45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD962D605DB]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD974E8BAB7]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD918F6ABF3]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD918F6ABF3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD98336201B]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD98336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCAE46D9C8336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FKCAE46D9C8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCAE46D9C62D605DB]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FKCAE46D9C62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCAE46D9C74E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FKCAE46D9C74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC41CB3DA18FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKC41CB3DA18FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC41CB3DAFCE29076]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKC41CB3DAFCE29076



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC41CB3DABA049F44]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKC41CB3DABA049F44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4AEC98B518FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulo'))
alter table CoautorInternoCapitulo  drop constraint FK4AEC98B518FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4AEC98B5A1B3F60D]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulo'))
alter table CoautorInternoCapitulo  drop constraint FK4AEC98B5A1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD196DEE318FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoEvento'))
alter table CoautorInternoEvento  drop constraint FKD196DEE318FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD196DEE33BA127C1]') AND parent_object_id = OBJECT_ID('CoautorInternoEvento'))
alter table CoautorInternoEvento  drop constraint FKD196DEE33BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D25DC818FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoLibro'))
alter table CoautorInternoLibro  drop constraint FK3D25DC818FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D25DC8586827F8]') AND parent_object_id = OBJECT_ID('CoautorInternoLibro'))
alter table CoautorInternoLibro  drop constraint FK3D25DC8586827F8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27BD11CD18FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoReporte'))
alter table CoautorInternoReporte  drop constraint FK27BD11CD18FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27BD11CD13FE2142]') AND parent_object_id = OBJECT_ID('CoautorInternoReporte'))
alter table CoautorInternoReporte  drop constraint FK27BD11CD13FE2142



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF5FE7018FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoResena'))
alter table CoautorInternoResena  drop constraint FKEF5FE7018FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF5FE70FF48CC4D]') AND parent_object_id = OBJECT_ID('CoautorInternoResena'))
alter table CoautorInternoResena  drop constraint FKEF5FE70FF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3C80ED5E18FE0275]') AND parent_object_id = OBJECT_ID('CoautorInternoObraTraducida'))
alter table CoautorInternoObraTraducida  drop constraint FK3C80ED5E18FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3C80ED5EF7D09D3A]') AND parent_object_id = OBJECT_ID('CoautorInternoObraTraducida'))
alter table CoautorInternoObraTraducida  drop constraint FK3C80ED5EF7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2CDE378718FE0275]') AND parent_object_id = OBJECT_ID('MiembroInternoGrupoInvestigacion'))
alter table MiembroInternoGrupoInvestigacion  drop constraint FK2CDE378718FE0275



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2CDE378768E3AA1]') AND parent_object_id = OBJECT_ID('MiembroInternoGrupoInvestigacion'))
alter table MiembroInternoGrupoInvestigacion  drop constraint FK2CDE378768E3AA1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK15D3B7B28FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FK15D3B7B28FDBB774



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK15D3B7B264F7D1CD]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FK15D3B7B264F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK15D3B7B262D605DB]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FK15D3B7B262D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK15D3B7B274E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FK15D3B7B274E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK851DDCE699085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK851DDCE699085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK851DDCE6FCE29076]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK851DDCE6FCE29076



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK851DDCE6BA049F44]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK851DDCE6BA049F44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK713E819D99085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulo'))
alter table CoautorExternoCapitulo  drop constraint FK713E819D99085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK713E819DA1B3F60D]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulo'))
alter table CoautorExternoCapitulo  drop constraint FK713E819DA1B3F60D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8A8B54399085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoEvento'))
alter table CoautorExternoEvento  drop constraint FKD8A8B54399085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8A8B5433BA127C1]') AND parent_object_id = OBJECT_ID('CoautorExternoEvento'))
alter table CoautorExternoEvento  drop constraint FKD8A8B5433BA127C1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF4ABCE099085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoLibro'))
alter table CoautorExternoLibro  drop constraint FKDF4ABCE099085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF4ABCE0586827F8]') AND parent_object_id = OBJECT_ID('CoautorExternoLibro'))
alter table CoautorExternoLibro  drop constraint FKDF4ABCE0586827F8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK79AE39C199085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoReporte'))
alter table CoautorExternoReporte  drop constraint FK79AE39C199085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK79AE39C113FE2142]') AND parent_object_id = OBJECT_ID('CoautorExternoReporte'))
alter table CoautorExternoReporte  drop constraint FK79AE39C113FE2142



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD1565D8899085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoResena'))
alter table CoautorExternoResena  drop constraint FKD1565D8899085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD1565D88FF48CC4D]') AND parent_object_id = OBJECT_ID('CoautorExternoResena'))
alter table CoautorExternoResena  drop constraint FKD1565D88FF48CC4D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2E7780E199085EFD]') AND parent_object_id = OBJECT_ID('CoautorExternoObraTraducida'))
alter table CoautorExternoObraTraducida  drop constraint FK2E7780E199085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2E7780E1F7D09D3A]') AND parent_object_id = OBJECT_ID('CoautorExternoObraTraducida'))
alter table CoautorExternoObraTraducida  drop constraint FK2E7780E1F7D09D3A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAF60DCC099085EFD]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigacion'))
alter table MiembroExternoGrupoInvestigacion  drop constraint FKAF60DCC099085EFD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAF60DCC068E3AA1]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigacion'))
alter table MiembroExternoGrupoInvestigacion  drop constraint FKAF60DCC068E3AA1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86521C0462D605DB]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK86521C0462D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86521C0474E8BAB7]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK86521C0474E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86521C0470EA6C9E]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK86521C0470EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20CDD2C562D605DB]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FK20CDD2C562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20CDD2C574E8BAB7]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FK20CDD2C574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5BD7F0296425E2FD]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK5BD7F0296425E2FD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5BD7F0296A829E09]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK5BD7F0296A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5BD7F02962D605DB]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK5BD7F02962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5BD7F02974E8BAB7]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK5BD7F02974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D7DCA9362D605DB]') AND parent_object_id = OBJECT_ID('FondoConacyts'))
alter table FondoConacyts  drop constraint FK4D7DCA9362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D7DCA9374E8BAB7]') AND parent_object_id = OBJECT_ID('FondoConacyts'))
alter table FondoConacyts  drop constraint FK4D7DCA9374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767262D605DB]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767262D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767274E8BAB7]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767274E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE6598336201B]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE6598336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE6595ECF193D]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE6595ECF193D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE65964F7D1CD]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE65964F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE6592BAFDC96]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE6592BAFDC96



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE6593E082BED]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE6593E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE659EC222BA6]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE659EC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE659C8628149]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE659C8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE659295BC133]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE659295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE659BC063744]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE659BC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD4AFE659F4FE4035]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKD4AFE659F4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C1B8E1D4A]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C1B8E1D4A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C62D605DB]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C74E8BAB7]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C18F6ABF3]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C18F6ABF3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C8336201B]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C8336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D02AF31B56]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D02AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D064F7D1CD]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D064F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D0E30B9132]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D0E30B9132



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D07A8488F7]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D07A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D070EA6C9E]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D070EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D01EDC2D3B]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D01EDC2D3B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D06A829E09]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D06A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D07D866EAB]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D07D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D03E391E13]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D03E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D062D605DB]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23DC16D074E8BAB7]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK23DC16D074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK66FEAE593E082BED]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK66FEAE593E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK66FEAE5962D605DB]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK66FEAE5962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK66FEAE5974E8BAB7]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK66FEAE5974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD52343CB4F3F6C]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD52343CB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234342002BEE]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234342002BEE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523438A77AB9C]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523438A77AB9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523432261429F]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523432261429F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523436A829E09]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523436A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523437D866EAB]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523437D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523433E391E13]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523433E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234362D605DB]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234374E8BAB7]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829364F7D1CD]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829364F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B48293842F4EA5]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B48293842F4EA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829341CFD2F4]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829341CFD2F4



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B48293B9B574C5]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B48293B9B574C5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829361CF922]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829361CF922



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829362D605DB]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829362D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829374E8BAB7]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829374E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC15ABC1964F7D1CD]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKC15ABC1964F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC15ABC196D764BC1]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKC15ABC196D764BC1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC15ABC1962D605DB]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKC15ABC1962D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC15ABC1974E8BAB7]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKC15ABC1974E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC15ABC1970EA6C9E]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKC15ABC1970EA6C9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA2BAFDC96]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA2BAFDC96



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA64F7D1CD]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA64F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA1EDC2D3B]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA1EDC2D3B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA7A8488F7]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA7A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAC0410E89]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAC0410E89



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAC541BC16]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAC541BC16



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA3E082BED]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAEC222BA6]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAEC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAC8628149]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAC8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA295BC133]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEABC063744]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEABC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAF4FE4035]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAF4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA6A829E09]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA62D605DB]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA74E8BAB7]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63ECB4F3F6C]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63ECB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E2BAFDC96]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E2BAFDC96



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EE5D82963]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EE5D82963



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E64F7D1CD]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E64F7D1CD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E3E082BED]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EEC222BA6]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EEC222BA6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EC8628149]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EC8628149



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E295BC133]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E295BC133



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EBC063744]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EBC063744



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EF4FE4035]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EF4FE4035



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E6A829E09]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E7D866EAB]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E3E391E13]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E62D605DB]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E74E8BAB7]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21100647CC4BEB17]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK21100647CC4BEB17



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064762D605DB]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064762D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064774E8BAB7]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064774E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064718F6ABF3]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064718F6ABF3



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK211006478336201B]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK211006478336201B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK45EB259062D605DB]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK45EB259062D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK45EB259074E8BAB7]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK45EB259074E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAECB4F3F6C]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAECB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE6A829E09]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE7D866EAB]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE3E391E13]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE803FA562]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE803FA562



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE3E082BED]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE3E082BED



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAEC93A1EF1]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAEC93A1EF1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE7A8488F7]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE7A8488F7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE62D605DB]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE74E8BAB7]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7004441E62D605DB]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK7004441E62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7004441E74E8BAB7]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK7004441E74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968862D605DB]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968862D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968874E8BAB7]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968874E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC3FA1F2162D605DB]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FKC3FA1F2162D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC3FA1F2174E8BAB7]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FKC3FA1F2174E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BC2D59F6EC29E1E]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FK1BC2D59F6EC29E1E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BC2D59FCC939E1E]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FK1BC2D59FCC939E1E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BC2D59F470C9E1E]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FK1BC2D59F470C9E1E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BC2D59F62D605DB]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FK1BC2D59F62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BC2D59F74E8BAB7]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FK1BC2D59F74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8773549562D605DB]') AND parent_object_id = OBJECT_ID('EstatusFormacionAcademicas'))
alter table EstatusFormacionAcademicas  drop constraint FK8773549562D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8773549574E8BAB7]') AND parent_object_id = OBJECT_ID('EstatusFormacionAcademicas'))
alter table EstatusFormacionAcademicas  drop constraint FK8773549574E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7BCB4F3F6C]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7BCB4F3F6C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B6A829E09]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B6A829E09



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B7D866EAB]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B7D866EAB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B3E391E13]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B3E391E13



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B2AF31B56]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B2AF31B56



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7BE758F5B4]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7BE758F5B4



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7BF1AEE935]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7BF1AEE935



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B62D605DB]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B74E8BAB7]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B74E8BAB7



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK241520AA62D605DB]') AND parent_object_id = OBJECT_ID('Glosarios'))
alter table Glosarios  drop constraint FK241520AA62D605DB



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK241520AA74E8BAB7]') AND parent_object_id = OBJECT_ID('Glosarios'))
alter table Glosarios  drop constraint FK241520AA74E8BAB7



    if exists (select * from dbo.sysobjects where id = object_id(N'VinculacionAPyDes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table VinculacionAPyDes

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoApoyos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoApoyos

    if exists (select * from dbo.sysobjects where id = object_id(N'Sectores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sectores

    if exists (select * from dbo.sysobjects where id = object_id(N'Investigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Investigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Indices') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Indices

    if exists (select * from dbo.sysobjects where id = object_id(N'GrupoInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GrupoInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'DirigidoAs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table DirigidoAs

    if exists (select * from dbo.sysobjects where id = object_id(N'Capitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Capitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividades') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividades

    if exists (select * from dbo.sysobjects where id = object_id(N'Paises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Paises

    if exists (select * from dbo.sysobjects where id = object_id(N'Idiomas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Idiomas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEstancias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEstancias

    if exists (select * from dbo.sysobjects where id = object_id(N'Subdisciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subdisciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'UsuarioRol') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table UsuarioRol

    if exists (select * from dbo.sysobjects where id = object_id(N'Clases') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Clases

    if exists (select * from dbo.sysobjects where id = object_id(N'Articulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Articulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Archivos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Archivos

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoArticulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoArticulo

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoArticuloDifusion') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoArticuloDifusion

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoCurso') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoCurso

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoDictamen') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoDictamen

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoDistincion') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoDistincion

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoOrganoExterno') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoOrganoExterno

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoOrganoInterno') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoOrganoInterno

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoTesisDirigida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoTesisDirigida

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoProyecto') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoProyecto

    if exists (select * from dbo.sysobjects where id = object_id(N'ArchivoEstanciaAcademicaExterna') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArchivoEstanciaAcademicaExterna

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoOrganos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoOrganos

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIs

    if exists (select * from dbo.sysobjects where id = object_id(N'OrganoInternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OrganoInternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'ArticuloDifusiones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArticuloDifusiones

    if exists (select * from dbo.sysobjects where id = object_id(N'TesisDirigidas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TesisDirigidas

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioImpresos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioImpresos

    if exists (select * from dbo.sysobjects where id = object_id(N'ObraTraducidas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ObraTraducidas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDistinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDistinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoArchivos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoArchivos

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'DireccionRegionales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table DireccionRegionales

    if exists (select * from dbo.sysobjects where id = object_id(N'Areas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Areas

    if exists (select * from dbo.sysobjects where id = object_id(N'TesisPosgrados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TesisPosgrados

    if exists (select * from dbo.sysobjects where id = object_id(N'EstanciaAcademicaExternas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstanciaAcademicaExternas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'ExperienciaProfesionales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ExperienciaProfesionales

    if exists (select * from dbo.sysobjects where id = object_id(N'ConsejoComisiones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ConsejoComisiones

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoProyecto') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoProyecto

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoProyecto') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoProyecto

    if exists (select * from dbo.sysobjects where id = object_id(N'SubprogramaConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SubprogramaConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'NivelEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table NivelEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'Disciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Disciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialResena

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialDictamen') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialDictamen

    if exists (select * from dbo.sysobjects where id = object_id(N'SesionEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SesionEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

    if exists (select * from dbo.sysobjects where id = object_id(N'Ramas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Ramas

    if exists (select * from dbo.sysobjects where id = object_id(N'ProgramaEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProgramaEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'Niveles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Niveles

    if exists (select * from dbo.sysobjects where id = object_id(N'Monedas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Monedas

    if exists (select * from dbo.sysobjects where id = object_id(N'CargoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CargoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipacionMedios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipacionMedios

    if exists (select * from dbo.sysobjects where id = object_id(N'Libros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Libros

    if exists (select * from dbo.sysobjects where id = object_id(N'Instituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Instituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Editoriales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Editoriales

    if exists (select * from dbo.sysobjects where id = object_id(N'Dependencias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dependencias

    if exists (select * from dbo.sysobjects where id = object_id(N'AreaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AreaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'AreaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AreaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Reportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Reportes

    if exists (select * from dbo.sysobjects where id = object_id(N'Proyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Proyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoPaises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoPaises

    if exists (select * from dbo.sysobjects where id = object_id(N'Distinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Distinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Ambitos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Ambitos

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'EstudianteProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstudianteProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'Usuarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Usuarios

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'Resenas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Resenas

    if exists (select * from dbo.sysobjects where id = object_id(N'ApoyoConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ApoyoConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'EstanciaInstitucionExternas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstanciaInstitucionExternas

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoArticulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoArticulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'MiembroInternoGrupoInvestigacion') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MiembroInternoGrupoInvestigacion

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoArticulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoArticulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'MiembroExternoGrupoInvestigacion') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MiembroExternoGrupoInvestigacion

    if exists (select * from dbo.sysobjects where id = object_id(N'ProductoGeneradoProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProductoGeneradoProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'IdiomasInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table IdiomasInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'FondoConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FondoConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'Convenios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Convenios

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'CursoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CursoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipacionAcademias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipacionAcademias

    if exists (select * from dbo.sysobjects where id = object_id(N'Organizaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Organizaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Eventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Eventos

    if exists (select * from dbo.sysobjects where id = object_id(N'RevistaPublicaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table RevistaPublicaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'RecursoFinancieroProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table RecursoFinancieroProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'FormacionAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormacionAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'Cursos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cursos

    if exists (select * from dbo.sysobjects where id = object_id(N'CategoriaInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CategoriaInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'OrganoExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OrganoExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'InvestigadorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InvestigadorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioElectronicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioElectronicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Firmas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Firmas

    if exists (select * from dbo.sysobjects where id = object_id(N'EstatusFormacionAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstatusFormacionAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'Dictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'Glosarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Glosarios

    create table VinculacionAPyDes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoApoyos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Sectores (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       TipoSector INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Investigadores (
        Id INT IDENTITY NOT NULL,
       FechaIngreso DATETIME null,
       FechaContrato DATETIME null,
       ExpedienteProduccion NVARCHAR(255) null,
       ExpedienteAcademico NVARCHAR(255) null,
       ClaveCVU NVARCHAR(255) null,
       ExpedienteSNI NVARCHAR(255) null,
       AreaTematica1 NVARCHAR(255) null,
       AreaTematica2 NVARCHAR(255) null,
       AreaTematica3 NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       AreaTematicaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Indices (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       Detalle NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table GrupoInvestigaciones (
        Id INT IDENTITY NOT NULL,
       NombreGrupoInvestigacion NVARCHAR(250) null,
       AutorSeOrdenaAlfabeticamente BIT null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionAutor INT null,
       PosicionCoautor INT null,
       FechaCreacion DATETIME null,
       Lider BIT null,
       Impacto NVARCHAR(255) null,
       VinculacionSectorProductivo NVARCHAR(255) null,
       VinculacionSectorSocial NVARCHAR(255) null,
       Colaboracion NVARCHAR(255) null,
       Administracion NVARCHAR(255) null,
       ProgramaRegistrado NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table DirigidoAs (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Capitulos (
        Id INT IDENTITY NOT NULL,
       NombreCapitulo NVARCHAR(250) null,
       TipoCapitulo INT null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       TieneProyecto BIT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       NombreLibro NVARCHAR(250) null,
       AutorLibro NVARCHAR(255) null,
       TipoLibro INT null,
       Resumen NVARCHAR(400) null,
       Volumen NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       NoCitas INT null,
       AutorSeOrdenaAlfabeticamente BIT null,
       PosicionAutor INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       ProyectoFk INT null,
       AreaTematicaFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       EditorialFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoActividades (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Paises (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Idiomas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoEventos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoEstancias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Subdisciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       DisciplinaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Roles (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table UsuarioRol (
        RolFk INT not null,
       UsuarioFk INT not null
    )

    create table Clases (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       RamaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Articulos (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       TipoArticulo INT null,
       TieneProyecto BIT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Volumen NVARCHAR(255) null,
       Numero NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ProyectoFk INT null,
       AreaTematicaFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       FirmaFk INT null,
       RevistaPublicacionFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Archivos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       TipoProducto INT null,
       Datos image null,
       Contenido NVARCHAR(255) null,
       Tamano INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ArchivoArticulo (
        Archivo INT not null,
       ArticuloFk INT null,
       primary key (Archivo)
    )

    create table ArchivoArticuloDifusion (
        Archivo INT not null,
       ArticuloDifusionFk INT null,
       primary key (Archivo)
    )

    create table ArchivoCapitulo (
        Archivo INT not null,
       CapituloFk INT null,
       primary key (Archivo)
    )

    create table ArchivoCurso (
        Archivo INT not null,
       CursoFk INT null,
       primary key (Archivo)
    )

    create table ArchivoDictamen (
        Archivo INT not null,
       DictamenFk INT null,
       primary key (Archivo)
    )

    create table ArchivoDistincion (
        Archivo INT not null,
       DistincionFk INT null,
       primary key (Archivo)
    )

    create table ArchivoEvento (
        Archivo INT not null,
       EventoFk INT null,
       primary key (Archivo)
    )

    create table ArchivoLibro (
        Archivo INT not null,
       LibroFk INT null,
       primary key (Archivo)
    )

    create table ArchivoObraTraducida (
        Archivo INT not null,
       ObraTraducidaFk INT null,
       primary key (Archivo)
    )

    create table ArchivoOrganoExterno (
        Archivo INT not null,
       OrganoExternoFk INT null,
       primary key (Archivo)
    )

    create table ArchivoOrganoInterno (
        Archivo INT not null,
       OrganoInternoFk INT null,
       primary key (Archivo)
    )

    create table ArchivoReporte (
        Archivo INT not null,
       ReporteFk INT null,
       primary key (Archivo)
    )

    create table ArchivoResena (
        Archivo INT not null,
       ResenaFk INT null,
       primary key (Archivo)
    )

    create table ArchivoTesisDirigida (
        Archivo INT not null,
       TesisDirigidaFk INT null,
       primary key (Archivo)
    )

    create table ArchivoProyecto (
        Archivo INT not null,
       ProyectoFk INT null,
       primary key (Archivo)
    )

    create table ArchivoEstanciaAcademicaExterna (
        Archivo INT not null,
       EstanciaAcademicaExternaFk INT null,
       primary key (Archivo)
    )

    create table TipoOrganos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table SNIs (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table OrganoInternos (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       Periodo INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       InvestigadorFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       ConsejoComisionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Estados (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Departamentos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ArticuloDifusiones (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       TipoArticulo INT null,
       TieneProyecto BIT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Volumen NVARCHAR(255) null,
       Numero NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ProyectoFk INT null,
       AreaTematicaFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       FirmaFk INT null,
       RevistaPublicacionFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TesisDirigidas (
        Id INT IDENTITY NOT NULL,
       TipoTesis INT null,
       Titulo NVARCHAR(250) null,
       ProgramaEstudio NVARCHAR(255) null,
       PertenecePNPC BIT null,
       FechaGrado DATETIME null,
       FormaParticipacion INT null,
       NombreAlumno NVARCHAR(250) null,
       TieneConvenio BIT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       TesisPosgradoFk INT null,
       VinculacionAPyDFk INT null,
       GradoAcademicoFk INT null,
       InstitucionFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ResponsableProyectos (
        Id INT IDENTITY NOT NULL,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ProyectoFk INT null,
       primary key (Id)
    )

    create table MedioImpresos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ObraTraducidas (
        Id INT IDENTITY NOT NULL,
       CoautorSeOrdenaAlfabeticamente BIT null,
       AutorSeOrdenaAlfabeticamente BIT null,
       PosicionAutor INT null,
       Nombre NVARCHAR(250) null,
       NombreTraductor NVARCHAR(250) null,
       ApellidoPaterno NVARCHAR(255) null,
       ApellidoMaterno NVARCHAR(255) null,
       NombreObraTraducida NVARCHAR(250) null,
       TipoObraTraducida INT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Volumen NVARCHAR(255) null,
       Numero NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       NombreLibro NVARCHAR(250) null,
       TipoLibro INT null,
       NoPaginas INT null,
       Resumen NVARCHAR(400) null,
       NoCitas INT null,
       ISBN NVARCHAR(255) null,
       Edicion INT null,
       Reimpresion INT null,
       Tiraje INT null,
       Puntuacion DECIMAL(19,5) null,
       PosicionCoautor INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       IdiomaFk INT null,
       AreaTematicaFk INT null,
       RevistaPublicacionFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoDistinciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoArchivos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table GradoAcademicos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table DireccionRegionales (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Areas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstanciaAcademicaExternas (
        Id INT IDENTITY NOT NULL,
       InvestigadorExterno NVARCHAR(255) null,
       LineasInvestigacion NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       Actividades NVARCHAR(255) null,
       Logros NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       GradoAcademicoFk INT null,
       TipoEstanciaFk INT null,
       InstitucionFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoProyectos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table GradoAcademicoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       Programa NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       GradoAcademicoFk INT null,
       InstitucionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ComprobanteFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table ExperienciaProfesionales (
        Id INT IDENTITY NOT NULL,
       Entidad NVARCHAR(255) null,
       Nombramiento NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       LineaInvestigacion1 NVARCHAR(255) null,
       LineaInvestigacion2 NVARCHAR(255) null,
       LineaInvestigacion3 NVARCHAR(255) null,
       PrincipalesLogros NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       PaisFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       SectorEconomicoFk INT null,
       RamaFk INT null,
       ClaseFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ConsejoComisiones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       Duracion INT null,
       Reeleccion BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ParticipanteInternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       ParticipanteSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ParticipanteInternoEvento (
        ParticipanteInternoProducto INT not null,
       SesionEventoFk INT null,
       primary key (ParticipanteInternoProducto)
    )

    create table ParticipanteInternoProyecto (
        ParticipanteInternoProducto INT not null,
       ProyectoFk INT null,
       primary key (ParticipanteInternoProducto)
    )

    create table ParticipanteExternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       ParticipanteSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       InstitucionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ParticipanteExternoEvento (
        ParticipanteExternoProducto INT not null,
       SesionEventoFk INT null,
       primary key (ParticipanteExternoProducto)
    )

    create table ParticipanteExternoProyecto (
        ParticipanteExternoProducto INT not null,
       ProyectoFk INT null,
       primary key (ParticipanteExternoProducto)
    )

    create table SubprogramaConacyts (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table NivelEstudios (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Disciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       AreaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EditorialProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EditorialNombre NVARCHAR(250) null,
       EditorialFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       PaisFk INT null,
       primary key (Id)
    )

    create table EditorialCapitulo (
        EditorialProducto INT not null,
       CapituloFk INT null,
       primary key (EditorialProducto)
    )

    create table EditorialLibro (
        EditorialProducto INT not null,
       LibroFk INT null,
       primary key (EditorialProducto)
    )

    create table EditorialResena (
        EditorialProducto INT not null,
       ResenaFk INT null,
       primary key (EditorialProducto)
    )

    create table EditorialObraTraducida (
        EditorialProducto INT not null,
       ObraTraducidaFk INT null,
       primary key (EditorialProducto)
    )

    create table EditorialDictamen (
        EditorialProducto INT not null,
       DictamenFk INT null,
       primary key (EditorialProducto)
    )

    create table SesionEventos (
        Id INT IDENTITY NOT NULL,
       NombreSesion NVARCHAR(250) null,
       ObjetivoSesion NVARCHAR(255) null,
       FechaEvento DATETIME null,
       Lugar NVARCHAR(255) null,
       Logros NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       AmbitoFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       EventoFk INT null,
       primary key (Id)
    )

    create table Sedes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       DireccionRegionalFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Ramas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SectorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ProgramaEstudios (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Niveles (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       OrganizacionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Monedas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CargoInvestigadores (
        Id INT IDENTITY NOT NULL,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PuestoFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ComprobanteFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table ParticipacionMedios (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       Institucion NVARCHAR(255) null,
       LugarPresentacion NVARCHAR(255) null,
       FechaPresentacion DATETIME null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       TipoParticipacionFk INT null,
       AreaTematicaFk INT null,
       AmbitoFk INT null,
       DirigidoAFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Libros (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       FormatoPublicacion INT null,
       TipoProducto INT null,
       ContenidoLibro INT null,
       TieneProyecto BIT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       ISBN NVARCHAR(255) null,
       Edicion INT null,
       Reimpresion INT null,
       Volumen NVARCHAR(255) null,
       NoPaginas INT null,
       Tiraje INT null,
       Numero NVARCHAR(255) null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EventoFk INT null,
       ProyectoFk INT null,
       AreaTematicaFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       FirmaFk INT null,
       RevistaPublicacionFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Instituciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       AgrupaInstitucion NVARCHAR(255) null,
       Siglas NVARCHAR(255) null,
       Sede NVARCHAR(255) null,
       PaginaWeb NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       Telefono NVARCHAR(255) null,
       TipoInstitucion BIT null,
       Ciudad NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       AmbitoFk INT null,
       SectorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Editoriales (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       TipoEditorial INT null,
       Contacto NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       PaginaWeb NVARCHAR(255) null,
       Telefono NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InstitucionFk INT null,
       PaisFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Dependencias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table AreaTematicas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       LineaTematicaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table AreaInvestigaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Reportes (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       TipoReporte INT null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       TieneProyecto BIT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       Descripcion NVARCHAR(400) null,
       Numero NVARCHAR(255) null,
       Objetivo NVARCHAR(255) null,
       NoPaginas INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       ProyectoFk INT null,
       InstitucionFk INT null,
       AreaTematicaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Proyectos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       ParticipanteSeOrdenaAlfabeticamente BIT null,
       PosicionParticipante INT null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       FechaProrroga DATETIME null,
       EstadoProyecto INT null,
       FechaConclusion DATETIME null,
       ConRecursos BIT null,
       ConConvenio BIT null,
       ObjetivoGeneral NVARCHAR(255) null,
       ImpactoPoliticaPublica INT null,
       ResumenProyecto NVARCHAR(400) null,
       Actividades NVARCHAR(255) null,
       ProductoAcademicoEsperado NVARCHAR(255) null,
       ParticipaEstudiante BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       Puntuacion DECIMAL(19,5) null,
       TipoProyectoFk INT null,
       FirmaFk INT null,
       ConvenioFk INT null,
       SectorFinanciamientoFk INT null,
       FondoConacytFk INT null,
       AreaTematicaFk INT null,
       VinculacionAPyDFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       ComprobanteTematicaProyectoFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       SectorEconomicoFk INT null,
       RamaFk INT null,
       ClaseFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstadoPaises (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PaisFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Distinciones (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       Descripcion NVARCHAR(400) null,
       FechaOtorgamiento DATETIME null,
       Municipio NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoDistincionFk INT null,
       InstitucionFk INT null,
       AmbitoFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Ambitos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table InstitucionProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InstitucionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table InstitucionReporte (
        InstitucionProducto INT not null,
       ReporteFk INT null,
       primary key (InstitucionProducto)
    )

    create table InstitucionEvento (
        InstitucionProducto INT not null,
       EventoFk INT null,
       primary key (InstitucionProducto)
    )

    create table EstudianteProyectos (
        Id INT IDENTITY NOT NULL,
       NombreEstudiante NVARCHAR(250) null,
       TipoEstudiante INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       GradoAcademicoFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ProyectoFk INT null,
       primary key (Id)
    )

    create table TipoDictamenes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table AutorInternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       AutorSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table AutorInternoCapitulo (
        AutorInternoProducto INT not null,
       CapituloFk INT null,
       primary key (AutorInternoProducto)
    )

    create table AutorInternoResena (
        AutorInternoProducto INT not null,
       ResenaFk INT null,
       primary key (AutorInternoProducto)
    )

    create table AutorInternoObraTraducida (
        AutorInternoProducto INT not null,
       ObraTraducidaFk INT null,
       primary key (AutorInternoProducto)
    )

    create table AutorExternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       AutorSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       InstitucionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table AutorExternoCapitulo (
        AutorExternoProducto INT not null,
       CapituloFk INT null,
       primary key (AutorExternoProducto)
    )

    create table AutorExternoResena (
        AutorExternoProducto INT not null,
       ResenaFk INT null,
       primary key (AutorExternoProducto)
    )

    create table AutorExternoObraTraducida (
        AutorExternoProducto INT not null,
       ObraTraducidaFk INT null,
       primary key (AutorExternoProducto)
    )

    create table Resenas (
        Id INT IDENTITY NOT NULL,
       NombreProducto NVARCHAR(250) null,
       TipoResena INT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       TituloLibro NVARCHAR(250) null,
       AutorSeOrdenaAlfabeticamente BIT null,
       PosicionAutor INT null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Volumen NVARCHAR(255) null,
       Numero NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       AreaTematicaFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       FirmaFk INT null,
       PaisFk INT null,
       RevistaPublicacionFk INT null,
       EditorialFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ApoyoConacyts (
        Id INT IDENTITY NOT NULL,
       NoApoyo INT null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoApoyoFk INT null,
       SubprogramaConacytFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table LineaInvestigaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstanciaInstitucionExternas (
        Id INT IDENTITY NOT NULL,
       DepartamentoDestino NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       Actividades NVARCHAR(255) null,
       Logros NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       TipoEstanciaFk INT null,
       InstitucionFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstadoInvestigadores (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EstadoFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ComprobanteFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoArticulo (
        CoautorInternoProducto INT not null,
       ArticuloFk INT null,
       ArticuloDifusionFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoCapitulo (
        CoautorInternoProducto INT not null,
       CapituloFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoEvento (
        CoautorInternoProducto INT not null,
       EventoFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoLibro (
        CoautorInternoProducto INT not null,
       LibroFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoReporte (
        CoautorInternoProducto INT not null,
       ReporteFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoResena (
        CoautorInternoProducto INT not null,
       ResenaFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorInternoObraTraducida (
        CoautorInternoProducto INT not null,
       ObraTraducidaFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table MiembroInternoGrupoInvestigacion (
        CoautorInternoProducto INT not null,
       GrupoInvestigacionFk INT null,
       primary key (CoautorInternoProducto)
    )

    create table CoautorExternoProductos (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT not null,
       Posicion INT null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       InstitucionFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorExternoArticulo (
        CoautorExternoProducto INT not null,
       ArticuloFk INT null,
       ArticuloDifusionFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoCapitulo (
        CoautorExternoProducto INT not null,
       CapituloFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoEvento (
        CoautorExternoProducto INT not null,
       EventoFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoLibro (
        CoautorExternoProducto INT not null,
       LibroFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoReporte (
        CoautorExternoProducto INT not null,
       ReporteFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoResena (
        CoautorExternoProducto INT not null,
       ResenaFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table CoautorExternoObraTraducida (
        CoautorExternoProducto INT not null,
       ObraTraducidaFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table MiembroExternoGrupoInvestigacion (
        CoautorExternoProducto INT not null,
       GrupoInvestigacionFk INT null,
       primary key (CoautorExternoProducto)
    )

    create table ProductoGeneradoProyectos (
        Id INT IDENTITY NOT NULL,
       ProductoGenerado INT null,
       FechaEntrega DATETIME null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ProyectoFk INT null,
       primary key (Id)
    )

    create table TipoParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       Tipo INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table IdiomasInvestigadores (
        Id INT IDENTITY NOT NULL,
       LenguaMaterna NVARCHAR(255) null,
       Traductor BIT null,
       Profesor BIT null,
       NivelConversacion INT null,
       NivelLectura INT null,
       NivelEscritura INT null,
       FechaEvaluacion DATETIME null,
       NombreDocumentoProbatorio NVARCHAR(250) null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       IdiomaFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table FondoConacyts (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Categorias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table SNIInvestigadores (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SNIFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ComprobanteFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table ParticipacionAcademias (
        Id INT IDENTITY NOT NULL,
       NombreProducto NVARCHAR(250) null,
       Volumen NVARCHAR(255) null,
       EstadoProducto INT null,
       FechaAceptacion DATETIME null,
       FechaPublicacion DATETIME null,
       FechaEdicion DATETIME null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       RevistaPublicacionFk INT null,
       InstitucionFk INT null,
       EditorialFk INT null,
       PaisFk INT null,
       ProyectoFk INT null,
       LineaTematicaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Organizaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CodigoConacyt NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SectorFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Eventos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       ObjetivoEvento NVARCHAR(255) null,
       FinanciamientoInterno INT null,
       FinanciamientoExterno INT null,
       SesionesTrabajo INT null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       Invitacion BIT null,
       TituloTrabajo NVARCHAR(250) null,
       CoautorSeOrdenaAlfabeticamente BIT null,
       PosicionCoautor INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       TipoEventoFk INT null,
       AreaTematicaFk INT null,
       TipoParticipacionFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table RevistaPublicaciones (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(250) null,
       DepartamentoAcademico NVARCHAR(255) null,
       FactorImpacto NVARCHAR(255) null,
       Issn NVARCHAR(255) null,
       Issne NVARCHAR(255) null,
       Contacto NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       PaginaWeb NVARCHAR(255) null,
       Telefono NVARCHAR(255) null,
       TipoRevista INT null,
       ClasificacionSieva INT null,
       DescripcionRevista NVARCHAR(400) null,
       FormatoRevista INT null,
       Periodicidad INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InstitucionFk INT null,
       AreaInvestigacionFk INT null,
       Indice1Fk INT null,
       Indice2Fk INT null,
       Indice3Fk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table RecursoFinancieroProyectos (
        Id INT IDENTITY NOT NULL,
       Monto DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InstitucionFk INT null,
       MonedaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ProyectoFk INT null,
       primary key (Id)
    )

    create table FormacionAcademicas (
        Id INT IDENTITY NOT NULL,
       NumeroCedula INT null,
       TituloGrado NVARCHAR(250) null,
       FechaObtencion DATETIME null,
       TituloTesis NVARCHAR(250) null,
       Ciudad NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       NivelEstudioFk INT null,
       InstitucionFk INT null,
       LineaTematicaFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       EstatusFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Cursos (
        Id INT IDENTITY NOT NULL,
       TipoCurso INT null,
       ProgramaEstudio NVARCHAR(255) null,
       EsPrivada BIT null,
       TieneConvenio BIT null,
       PertenecePNPC BIT null,
       Nombre NVARCHAR(250) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       NumeroHoras INT null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       NivelEstudioFk INT null,
       CursoInvestigadorFk INT null,
       InstitucionFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CategoriaInvestigadores (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CategoriaFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       ComprobanteFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Puestos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table OrganoExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       Participacion NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       Siglas NVARCHAR(255) null,
       Ciudad NVARCHAR(255) null,
       Puntos DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       TipoOrganoFk INT null,
       SectorFk INT null,
       AmbitoFk INT null,
       PaisFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table LineaTematicas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table InvestigadorExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       ApellidoPaterno NVARCHAR(255) null,
       ApellidoMaterno NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table MedioElectronicos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Firmas (
        Id INT IDENTITY NOT NULL,
       TipoProducto INT null,
       Firma1 DATETIME null,
       Aceptacion1 INT null,
       Firma2 DATETIME null,
       Aceptacion2 INT null,
       Firma3 DATETIME null,
       Aceptacion3 INT null,
       PuntuacionSieva DECIMAL(19,5) null,
       Descripcion NVARCHAR(400) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       Usuario1Fk INT null,
       Usuario2Fk INT null,
       Usuario3Fk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstatusFormacionAcademicas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Dictamenes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       FechaDictamen DATETIME null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       FirmaFk INT null,
       UsuarioFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       RevistaPublicacionFk INT null,
       FondoConacytFk INT null,
       TipoDictamenFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Glosarios (
        Id INT IDENTITY NOT NULL,
       Campo NVARCHAR(255) null,
       Descripcion NVARCHAR(400) null,
       Contexto NVARCHAR(255) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    alter table Investigadores 
        add constraint FKE67B58B98A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table GrupoInvestigaciones 
        add constraint FK742C6D093E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table GrupoInvestigaciones 
        add constraint FK742C6D09EC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table GrupoInvestigaciones 
        add constraint FK742C6D09C8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Capitulos 
        add constraint FK3165FEADCB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Capitulos 
        add constraint FK3165FEAD70EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Capitulos 
        add constraint FK3165FEAD8A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Capitulos 
        add constraint FK3165FEAD295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Capitulos 
        add constraint FK3165FEADBC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Capitulos 
        add constraint FK3165FEADF4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Capitulos 
        add constraint FK3165FEADE30B9132 
        foreign key (EditorialFk) 
        references Editoriales

    alter table Capitulos 
        add constraint FK3165FEAD7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Capitulos 
        add constraint FK3165FEAD3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table Subdisciplinas 
        add constraint FKB62F52ADBC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table UsuarioRol 
        add constraint FKD884456A72C4C6B8 
        foreign key (RolFk) 
        references Roles

    alter table Clases 
        add constraint FK14DFAB5DAA0C7213 
        foreign key (RamaFk) 
        references Ramas

    alter table Articulos 
        add constraint FK3EB394D770EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Articulos 
        add constraint FK3EB394D78A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Articulos 
        add constraint FK3EB394D7295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Articulos 
        add constraint FK3EB394D7BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Articulos 
        add constraint FK3EB394D7F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Articulos 
        add constraint FK3EB394D7CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Articulos 
        add constraint FK3EB394D72AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Articulos 
        add constraint FK3EB394D77D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Articulos 
        add constraint FK3EB394D73E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table ArchivoArticulo 
        add constraint FKF71A7A2E82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoArticulo 
        add constraint FKF71A7A2EFCE29076 
        foreign key (ArticuloFk) 
        references Articulos

    alter table ArchivoArticuloDifusion 
        add constraint FKDEB6270882C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoArticuloDifusion 
        add constraint FKDEB62708BA049F44 
        foreign key (ArticuloDifusionFk) 
        references ArticuloDifusiones

    alter table ArchivoCapitulo 
        add constraint FK6F93781982C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoCapitulo 
        add constraint FK6F937819A1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table ArchivoCurso 
        add constraint FK73A5D66B82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoCurso 
        add constraint FK73A5D66B2E9FF2CA 
        foreign key (CursoFk) 
        references Cursos

    alter table ArchivoDictamen 
        add constraint FKD7DDAA1C82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoDictamen 
        add constraint FKD7DDAA1CCB0D698F 
        foreign key (DictamenFk) 
        references Dictamenes

    alter table ArchivoDistincion 
        add constraint FKEC582C7282C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoDistincion 
        add constraint FKEC582C72A563B165 
        foreign key (DistincionFk) 
        references Distinciones

    alter table ArchivoEvento 
        add constraint FK94C557A482C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoEvento 
        add constraint FK94C557A43BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table ArchivoLibro 
        add constraint FKA3244AFA82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoLibro 
        add constraint FKA3244AFA586827F8 
        foreign key (LibroFk) 
        references Libros

    alter table ArchivoObraTraducida 
        add constraint FK64C5808682C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoObraTraducida 
        add constraint FK64C58086F7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table ArchivoOrganoExterno 
        add constraint FK3CF46F8382C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoOrganoExterno 
        add constraint FK3CF46F8320ACA338 
        foreign key (OrganoExternoFk) 
        references OrganoExternos

    alter table ArchivoOrganoInterno 
        add constraint FK8C70CE9182C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoOrganoInterno 
        add constraint FK8C70CE91B291B950 
        foreign key (OrganoInternoFk) 
        references OrganoInternos

    alter table ArchivoReporte 
        add constraint FK4682E10D82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoReporte 
        add constraint FK4682E10D13FE2142 
        foreign key (ReporteFk) 
        references Reportes

    alter table ArchivoResena 
        add constraint FKE95B9CBC82C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoResena 
        add constraint FKE95B9CBCFF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table ArchivoTesisDirigida 
        add constraint FK6EC3CA8882C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoTesisDirigida 
        add constraint FK6EC3CA88954C47FF 
        foreign key (TesisDirigidaFk) 
        references TesisDirigidas

    alter table ArchivoProyecto 
        add constraint FKD6C9212882C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoProyecto 
        add constraint FKD6C9212870EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ArchivoEstanciaAcademicaExterna 
        add constraint FK8F52929682C3B7BC 
        foreign key (Archivo) 
        references Archivos

    alter table ArchivoEstanciaAcademicaExterna 
        add constraint FK8F529296525369A7 
        foreign key (EstanciaAcademicaExternaFk) 
        references EstanciaAcademicaExternas

    alter table OrganoInternos 
        add constraint FKECD0AAEA8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table OrganoInternos 
        add constraint FKECD0AAEA7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table OrganoInternos 
        add constraint FKECD0AAEA3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table OrganoInternos 
        add constraint FKECD0AAEA9E4F194A 
        foreign key (ConsejoComisionFk) 
        references ConsejoComisiones

    alter table ArticuloDifusiones 
        add constraint FKCDA70A470EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ArticuloDifusiones 
        add constraint FKCDA70A48A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ArticuloDifusiones 
        add constraint FKCDA70A4295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table ArticuloDifusiones 
        add constraint FKCDA70A4BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table ArticuloDifusiones 
        add constraint FKCDA70A4F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table ArticuloDifusiones 
        add constraint FKCDA70A4CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table ArticuloDifusiones 
        add constraint FKCDA70A42AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ArticuloDifusiones 
        add constraint FKCDA70A47D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ArticuloDifusiones 
        add constraint FKCDA70A43E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table TesisDirigidas 
        add constraint FKEF4DD311CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table TesisDirigidas 
        add constraint FKEF4DD31184B302FF 
        foreign key (VinculacionAPyDFk) 
        references VinculacionAPyDes

    alter table TesisDirigidas 
        add constraint FKEF4DD3119CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table TesisDirigidas 
        add constraint FKEF4DD31164F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table TesisDirigidas 
        add constraint FKEF4DD3113E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table TesisDirigidas 
        add constraint FKEF4DD311EC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table TesisDirigidas 
        add constraint FKEF4DD311C8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table TesisDirigidas 
        add constraint FKEF4DD311295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table TesisDirigidas 
        add constraint FKEF4DD311BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table TesisDirigidas 
        add constraint FKEF4DD311F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table TesisDirigidas 
        add constraint FKEF4DD3117D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table TesisDirigidas 
        add constraint FKEF4DD3113E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table ResponsableProyectos 
        add constraint FK8A3F71988336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ResponsableProyectos 
        add constraint FK8A3F719870EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ObraTraducidas 
        add constraint FK1A338EFCCB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table ObraTraducidas 
        add constraint FK1A338EFC6425E2FD 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table ObraTraducidas 
        add constraint FK1A338EFC8A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ObraTraducidas 
        add constraint FK1A338EFC2AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ObraTraducidas 
        add constraint FK1A338EFC7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ObraTraducidas 
        add constraint FK1A338EFC3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table EstanciaAcademicaExternas 
        add constraint FK43CB63159CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table EstanciaAcademicaExternas 
        add constraint FK43CB63157A8C3DE5 
        foreign key (TipoEstanciaFk) 
        references TipoEstancias

    alter table EstanciaAcademicaExternas 
        add constraint FK43CB631564F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table EstanciaAcademicaExternas 
        add constraint FK43CB63157D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table EstanciaAcademicaExternas 
        add constraint FK43CB63153E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD9CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD18F6ABF3 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CC3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCEC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCC8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CC7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CC295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCBC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCF4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCD1F1E09F 
        foreign key (SectorEconomicoFk) 
        references Sectores

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CCAA0C7213 
        foreign key (RamaFk) 
        references Ramas

    alter table ExperienciaProfesionales 
        add constraint FK4F93B3CC44A2723A 
        foreign key (ClaseFk) 
        references Clases

    alter table ParticipanteInternoProductos 
        add constraint FKEFE230DD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ParticipanteInternoEvento 
        add constraint FK27FD9C3763A0A2A3 
        foreign key (ParticipanteInternoProducto) 
        references ParticipanteInternoProductos

    alter table ParticipanteInternoEvento 
        add constraint FK27FD9C37EAA1B3DF 
        foreign key (SesionEventoFk) 
        references SesionEventos

    alter table ParticipanteInternoProyecto 
        add constraint FK610A2E1E63A0A2A3 
        foreign key (ParticipanteInternoProducto) 
        references ParticipanteInternoProductos

    alter table ParticipanteInternoProyecto 
        add constraint FK610A2E1E70EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipanteExternoProductos 
        add constraint FKB9FA41368FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table ParticipanteExternoProductos 
        add constraint FKB9FA413664F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table ParticipanteExternoEvento 
        add constraint FKF489ABC8FB7AC05C 
        foreign key (ParticipanteExternoProducto) 
        references ParticipanteExternoProductos

    alter table ParticipanteExternoEvento 
        add constraint FKF489ABC8EAA1B3DF 
        foreign key (SesionEventoFk) 
        references SesionEventos

    alter table ParticipanteExternoProyecto 
        add constraint FK2B223E77FB7AC05C 
        foreign key (ParticipanteExternoProducto) 
        references ParticipanteExternoProductos

    alter table ParticipanteExternoProyecto 
        add constraint FK2B223E7770EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Disciplinas 
        add constraint FK6CD232B3295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table EditorialProductos 
        add constraint FK92545087E30B9132 
        foreign key (EditorialFk) 
        references Editoriales

    alter table EditorialProductos 
        add constraint FK925450877A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table EditorialCapitulo 
        add constraint FK381727364DBE1A6B 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialCapitulo 
        add constraint FK38172736A1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table EditorialLibro 
        add constraint FKE032A8F64DBE1A6B 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialLibro 
        add constraint FKE032A8F6586827F8 
        foreign key (LibroFk) 
        references Libros

    alter table EditorialResena 
        add constraint FK5A61D6AC4DBE1A6B 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialResena 
        add constraint FK5A61D6ACFF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table EditorialObraTraducida 
        add constraint FKFAC4CE5D4DBE1A6B 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialObraTraducida 
        add constraint FKFAC4CE5DF7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table EditorialDictamen 
        add constraint FK44CF0E944DBE1A6B 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialDictamen 
        add constraint FK44CF0E94CB0D698F 
        foreign key (DictamenFk) 
        references Dictamenes

    alter table SesionEventos 
        add constraint FK69423275C93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table SesionEventos 
        add constraint FK694232753BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table Sedes 
        add constraint FK2EA40B08FE7BABE 
        foreign key (DireccionRegionalFk) 
        references DireccionRegionales

    alter table Ramas 
        add constraint FKEA27DBAA3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Niveles 
        add constraint FKCE3ED3F7EC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D37E25AD5 
        foreign key (PuestoFk) 
        references Puestos

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D18F6ABF3 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table ParticipacionMedios 
        add constraint FK6CE1FC417D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC413E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table ParticipacionMedios 
        add constraint FK6CE1FC412261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table ParticipacionMedios 
        add constraint FK6CE1FC418A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41C93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC417B40DE3F 
        foreign key (DirigidoAFk) 
        references DirigidoAs

    alter table Libros 
        add constraint FK439120E73BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table Libros 
        add constraint FK439120E770EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Libros 
        add constraint FK439120E78A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Libros 
        add constraint FK439120E7295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Libros 
        add constraint FK439120E7BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Libros 
        add constraint FK439120E7F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Libros 
        add constraint FK439120E7CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Libros 
        add constraint FK439120E72AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Libros 
        add constraint FK439120E77D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Libros 
        add constraint FK439120E73E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table Instituciones 
        add constraint FK7E69627C7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Instituciones 
        add constraint FK7E69627CC0410E89 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table Instituciones 
        add constraint FK7E69627CC93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table Instituciones 
        add constraint FK7E69627C3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Editoriales 
        add constraint FKFB29159064F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Editoriales 
        add constraint FKFB2915907A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table AreaTematicas 
        add constraint FK33E5D7A51EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Reportes 
        add constraint FK26728BE1CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Reportes 
        add constraint FK26728BE170EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Reportes 
        add constraint FK26728BE164F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Reportes 
        add constraint FK26728BE18A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Reportes 
        add constraint FK26728BE17D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Reportes 
        add constraint FK26728BE13E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table Proyectos 
        add constraint FK8BA36D77B2AE3011 
        foreign key (TipoProyectoFk) 
        references TipoProyectos

    alter table Proyectos 
        add constraint FK8BA36D77CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Proyectos 
        add constraint FK8BA36D7760BA4690 
        foreign key (SectorFinanciamientoFk) 
        references Sectores

    alter table Proyectos 
        add constraint FK8BA36D77E758F5B4 
        foreign key (FondoConacytFk) 
        references FondoConacyts

    alter table Proyectos 
        add constraint FK8BA36D778A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Proyectos 
        add constraint FK8BA36D7784B302FF 
        foreign key (VinculacionAPyDFk) 
        references VinculacionAPyDes

    alter table Proyectos 
        add constraint FK8BA36D77295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Proyectos 
        add constraint FK8BA36D77BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Proyectos 
        add constraint FK8BA36D77F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Proyectos 
        add constraint FK8BA36D77970F014B 
        foreign key (ComprobanteTematicaProyectoFk) 
        references Archivos

    alter table Proyectos 
        add constraint FK8BA36D773E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Proyectos 
        add constraint FK8BA36D77EC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table Proyectos 
        add constraint FK8BA36D77C8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Proyectos 
        add constraint FK8BA36D77D1F1E09F 
        foreign key (SectorEconomicoFk) 
        references Sectores

    alter table Proyectos 
        add constraint FK8BA36D77AA0C7213 
        foreign key (RamaFk) 
        references Ramas

    alter table Proyectos 
        add constraint FK8BA36D7744A2723A 
        foreign key (ClaseFk) 
        references Clases

    alter table Proyectos 
        add constraint FK8BA36D777D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Proyectos 
        add constraint FK8BA36D773E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table EstadoPaises 
        add constraint FKD3B80B527A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Distinciones 
        add constraint FKEF821EECB2CAFCD8 
        foreign key (TipoDistincionFk) 
        references TipoDistinciones

    alter table Distinciones 
        add constraint FKEF821EEC64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Distinciones 
        add constraint FKEF821EECC93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table Distinciones 
        add constraint FKEF821EEC7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Distinciones 
        add constraint FKEF821EECC0410E89 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table Distinciones 
        add constraint FKEF821EEC7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Distinciones 
        add constraint FKEF821EEC3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table InstitucionProductos 
        add constraint FK7CD5A96A64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table InstitucionReporte 
        add constraint FK941D48A6A3282B3 
        foreign key (InstitucionProducto) 
        references InstitucionProductos

    alter table InstitucionReporte 
        add constraint FK941D48A13FE2142 
        foreign key (ReporteFk) 
        references Reportes

    alter table InstitucionEvento 
        add constraint FKCE3D5D5D6A3282B3 
        foreign key (InstitucionProducto) 
        references InstitucionProductos

    alter table InstitucionEvento 
        add constraint FKCE3D5D5D3BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table EstudianteProyectos 
        add constraint FK235213B89CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table EstudianteProyectos 
        add constraint FK235213B870EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table AutorInternoProductos 
        add constraint FK140229918336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table AutorInternoCapitulo 
        add constraint FK9CC896BE751FC11F 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoCapitulo 
        add constraint FK9CC896BEA1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table AutorInternoResena 
        add constraint FK9466F96C751FC11F 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoResena 
        add constraint FK9466F96CFF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table AutorInternoObraTraducida 
        add constraint FKD71AD782751FC11F 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoObraTraducida 
        add constraint FKD71AD782F7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table AutorExternoProductos 
        add constraint FKA32D18F38FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table AutorExternoProductos 
        add constraint FKA32D18F364F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table AutorExternoCapitulo 
        add constraint FK9642E24AC6FC9223 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoCapitulo 
        add constraint FK9642E24AA1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table AutorExternoResena 
        add constraint FKBDA4E728C6FC9223 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoResena 
        add constraint FKBDA4E728FF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table AutorExternoObraTraducida 
        add constraint FK3E500693C6FC9223 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoObraTraducida 
        add constraint FK3E500693F7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table Resenas 
        add constraint FKF708AE628A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Resenas 
        add constraint FKF708AE62295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Resenas 
        add constraint FKF708AE62BC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Resenas 
        add constraint FKF708AE62F4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Resenas 
        add constraint FKF708AE62CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Resenas 
        add constraint FKF708AE627A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Resenas 
        add constraint FKF708AE622AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Resenas 
        add constraint FKF708AE62E30B9132 
        foreign key (EditorialFk) 
        references Editoriales

    alter table Resenas 
        add constraint FKF708AE627D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Resenas 
        add constraint FKF708AE623E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table ApoyoConacyts 
        add constraint FK9114F61C8828823 
        foreign key (TipoApoyoFk) 
        references TipoApoyos

    alter table ApoyoConacyts 
        add constraint FK9114F61469EFF44 
        foreign key (SubprogramaConacytFk) 
        references SubprogramaConacyts

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE0197D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE0193E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE0197A8C3DE5 
        foreign key (TipoEstanciaFk) 
        references TipoEstancias

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE01964F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE0193E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE019EC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table EstanciaInstitucionExternas 
        add constraint FKA2BE019C8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table EstadoInvestigadores 
        add constraint FK667DBFD9C6BB3B45 
        foreign key (EstadoFk) 
        references Estados

    alter table EstadoInvestigadores 
        add constraint FK667DBFD918F6ABF3 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table EstadoInvestigadores 
        add constraint FK667DBFD98336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoProductos 
        add constraint FKCAE46D9C8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoArticulo 
        add constraint FKC41CB3DA18FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoArticulo 
        add constraint FKC41CB3DAFCE29076 
        foreign key (ArticuloFk) 
        references Articulos

    alter table CoautorInternoArticulo 
        add constraint FKC41CB3DABA049F44 
        foreign key (ArticuloDifusionFk) 
        references ArticuloDifusiones

    alter table CoautorInternoCapitulo 
        add constraint FK4AEC98B518FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoCapitulo 
        add constraint FK4AEC98B5A1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table CoautorInternoEvento 
        add constraint FKD196DEE318FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoEvento 
        add constraint FKD196DEE33BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table CoautorInternoLibro 
        add constraint FK3D25DC818FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoLibro 
        add constraint FK3D25DC8586827F8 
        foreign key (LibroFk) 
        references Libros

    alter table CoautorInternoReporte 
        add constraint FK27BD11CD18FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoReporte 
        add constraint FK27BD11CD13FE2142 
        foreign key (ReporteFk) 
        references Reportes

    alter table CoautorInternoResena 
        add constraint FKEF5FE7018FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoResena 
        add constraint FKEF5FE70FF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table CoautorInternoObraTraducida 
        add constraint FK3C80ED5E18FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoObraTraducida 
        add constraint FK3C80ED5EF7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table MiembroInternoGrupoInvestigacion 
        add constraint FK2CDE378718FE0275 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table MiembroInternoGrupoInvestigacion 
        add constraint FK2CDE378768E3AA1 
        foreign key (GrupoInvestigacionFk) 
        references GrupoInvestigaciones

    alter table CoautorExternoProductos 
        add constraint FK15D3B7B28FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoProductos 
        add constraint FK15D3B7B264F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table CoautorExternoArticulo 
        add constraint FK851DDCE699085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoArticulo 
        add constraint FK851DDCE6FCE29076 
        foreign key (ArticuloFk) 
        references Articulos

    alter table CoautorExternoArticulo 
        add constraint FK851DDCE6BA049F44 
        foreign key (ArticuloDifusionFk) 
        references ArticuloDifusiones

    alter table CoautorExternoCapitulo 
        add constraint FK713E819D99085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoCapitulo 
        add constraint FK713E819DA1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table CoautorExternoEvento 
        add constraint FKD8A8B54399085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoEvento 
        add constraint FKD8A8B5433BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table CoautorExternoLibro 
        add constraint FKDF4ABCE099085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoLibro 
        add constraint FKDF4ABCE0586827F8 
        foreign key (LibroFk) 
        references Libros

    alter table CoautorExternoReporte 
        add constraint FK79AE39C199085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoReporte 
        add constraint FK79AE39C113FE2142 
        foreign key (ReporteFk) 
        references Reportes

    alter table CoautorExternoResena 
        add constraint FKD1565D8899085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoResena 
        add constraint FKD1565D88FF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table CoautorExternoObraTraducida 
        add constraint FK2E7780E199085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoObraTraducida 
        add constraint FK2E7780E1F7D09D3A 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table MiembroExternoGrupoInvestigacion 
        add constraint FKAF60DCC099085EFD 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table MiembroExternoGrupoInvestigacion 
        add constraint FKAF60DCC068E3AA1 
        foreign key (GrupoInvestigacionFk) 
        references GrupoInvestigaciones

    alter table ProductoGeneradoProyectos 
        add constraint FK86521C0470EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table IdiomasInvestigadores 
        add constraint FK5BD7F0296425E2FD 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table SNIInvestigadores 
        add constraint FK6A7A949C1B8E1D4A 
        foreign key (SNIFk) 
        references SNIs

    alter table SNIInvestigadores 
        add constraint FK6A7A949C18F6ABF3 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table SNIInvestigadores 
        add constraint FK6A7A949C8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ParticipacionAcademias 
        add constraint FK23DC16D02AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ParticipacionAcademias 
        add constraint FK23DC16D064F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table ParticipacionAcademias 
        add constraint FK23DC16D0E30B9132 
        foreign key (EditorialFk) 
        references Editoriales

    alter table ParticipacionAcademias 
        add constraint FK23DC16D07A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table ParticipacionAcademias 
        add constraint FK23DC16D070EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipacionAcademias 
        add constraint FK23DC16D01EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table ParticipacionAcademias 
        add constraint FK23DC16D07D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ParticipacionAcademias 
        add constraint FK23DC16D03E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table Organizaciones 
        add constraint FK66FEAE593E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Eventos 
        add constraint FK9DD52343CB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Eventos 
        add constraint FK9DD5234342002BEE 
        foreign key (TipoEventoFk) 
        references TipoEventos

    alter table Eventos 
        add constraint FK9DD523438A77AB9C 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Eventos 
        add constraint FK9DD523432261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table Eventos 
        add constraint FK9DD523437D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Eventos 
        add constraint FK9DD523433E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table RevistaPublicaciones 
        add constraint FK40B4829364F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table RevistaPublicaciones 
        add constraint FK40B48293842F4EA5 
        foreign key (AreaInvestigacionFk) 
        references AreaInvestigaciones

    alter table RevistaPublicaciones 
        add constraint FK40B4829341CFD2F4 
        foreign key (Indice1Fk) 
        references Indices

    alter table RevistaPublicaciones 
        add constraint FK40B48293B9B574C5 
        foreign key (Indice2Fk) 
        references Indices

    alter table RevistaPublicaciones 
        add constraint FK40B4829361CF922 
        foreign key (Indice3Fk) 
        references Indices

    alter table RecursoFinancieroProyectos 
        add constraint FKC15ABC1964F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table RecursoFinancieroProyectos 
        add constraint FKC15ABC196D764BC1 
        foreign key (MonedaFk) 
        references Monedas

    alter table RecursoFinancieroProyectos 
        add constraint FKC15ABC1970EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table FormacionAcademicas 
        add constraint FK824D8BEA2BAFDC96 
        foreign key (NivelEstudioFk) 
        references NivelEstudios

    alter table FormacionAcademicas 
        add constraint FK824D8BEA64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table FormacionAcademicas 
        add constraint FK824D8BEA1EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table FormacionAcademicas 
        add constraint FK824D8BEA7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table FormacionAcademicas 
        add constraint FK824D8BEAC0410E89 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table FormacionAcademicas 
        add constraint FK824D8BEAC541BC16 
        foreign key (EstatusFk) 
        references EstatusFormacionAcademicas

    alter table FormacionAcademicas 
        add constraint FK824D8BEA3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table FormacionAcademicas 
        add constraint FK824D8BEAEC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table FormacionAcademicas 
        add constraint FK824D8BEAC8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table FormacionAcademicas 
        add constraint FK824D8BEA295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table FormacionAcademicas 
        add constraint FK824D8BEABC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table FormacionAcademicas 
        add constraint FK824D8BEAF4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Cursos 
        add constraint FK8E38D63ECB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Cursos 
        add constraint FK8E38D63E2BAFDC96 
        foreign key (NivelEstudioFk) 
        references NivelEstudios

    alter table Cursos 
        add constraint FK8E38D63E64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Cursos 
        add constraint FK8E38D63E3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Cursos 
        add constraint FK8E38D63EEC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table Cursos 
        add constraint FK8E38D63EC8628149 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Cursos 
        add constraint FK8E38D63E295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Cursos 
        add constraint FK8E38D63EBC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Cursos 
        add constraint FK8E38D63EF4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Cursos 
        add constraint FK8E38D63E7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Cursos 
        add constraint FK8E38D63E3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table CategoriaInvestigadores 
        add constraint FK21100647CC4BEB17 
        foreign key (CategoriaFk) 
        references Categorias

    alter table CategoriaInvestigadores 
        add constraint FK2110064718F6ABF3 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table CategoriaInvestigadores 
        add constraint FK211006478336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table OrganoExternos 
        add constraint FK55BF0AAECB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table OrganoExternos 
        add constraint FK55BF0AAE7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table OrganoExternos 
        add constraint FK55BF0AAE3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table OrganoExternos 
        add constraint FK55BF0AAE803FA562 
        foreign key (TipoOrganoFk) 
        references TipoOrganos

    alter table OrganoExternos 
        add constraint FK55BF0AAE3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table OrganoExternos 
        add constraint FK55BF0AAEC93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table OrganoExternos 
        add constraint FK55BF0AAE7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Dictamenes 
        add constraint FKE29ADD7BCB4F3F6C 
        foreign key (FirmaFk) 
        references Firmas

    alter table Dictamenes 
        add constraint FKE29ADD7B7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Dictamenes 
        add constraint FKE29ADD7B3E391E13 
        foreign key (SedeFk) 
        references Sedes

    alter table Dictamenes 
        add constraint FKE29ADD7B2AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Dictamenes 
        add constraint FKE29ADD7BE758F5B4 
        foreign key (FondoConacytFk) 
        references FondoConacyts

    alter table Dictamenes 
        add constraint FKE29ADD7BF1AEE935 
        foreign key (TipoDictamenFk) 
        references TipoDictamenes

