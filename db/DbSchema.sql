
    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF16DB6DA85102A57]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKF16DB6DA85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF16DB6DA74E8BAB7]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKF16DB6DA74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EA40B0885102A57]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK2EA40B0885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EA40B0874E8BAB7]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK2EA40B0874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829385102A57]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829385102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK40B4829374E8BAB7]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK40B4829374E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK371BC04385102A57]') AND parent_object_id = OBJECT_ID('ResponsableExternos'))
alter table ResponsableExternos  drop constraint FK371BC04385102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK371BC04374E8BAB7]') AND parent_object_id = OBJECT_ID('ResponsableExternos'))
alter table ResponsableExternos  drop constraint FK371BC04374E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK453645C58336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulos'))
alter table CoautorInternoCapitulos  drop constraint FK453645C58336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK453645C585102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulos'))
alter table CoautorInternoCapitulos  drop constraint FK453645C585102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK453645C574E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulos'))
alter table CoautorInternoCapitulos  drop constraint FK453645C574E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK453645C5A1B3F60D]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulos'))
alter table CoautorInternoCapitulos  drop constraint FK453645C5A1B3F60D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE9BFF7578FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulos'))
alter table CoautorExternoCapitulos  drop constraint FKE9BFF7578FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE9BFF75785102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulos'))
alter table CoautorExternoCapitulos  drop constraint FKE9BFF75785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE9BFF75774E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulos'))
alter table CoautorExternoCapitulos  drop constraint FKE9BFF75774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE9BFF757A1B3F60D]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulos'))
alter table CoautorExternoCapitulos  drop constraint FKE9BFF757A1B3F60D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA8E8D63E85102A57]') AND parent_object_id = OBJECT_ID('Cargos'))
alter table Cargos  drop constraint FKA8E8D63E85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA8E8D63E74E8BAB7]') AND parent_object_id = OBJECT_ID('Cargos'))
alter table Cargos  drop constraint FKA8E8D63E74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA20BAC85102A57]') AND parent_object_id = OBJECT_ID('CoautorExternos'))
alter table CoautorExternos  drop constraint FKFFA20BAC85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA20BAC74E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternos'))
alter table CoautorExternos  drop constraint FKFFA20BAC74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968885102A57]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968874E8BAB7]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CD232B385102A57]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FK6CD232B385102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CD232B374E8BAB7]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FK6CD232B374E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AED08208336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulos'))
alter table CoautorInternoArticulos  drop constraint FK2AED08208336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AED082085102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulos'))
alter table CoautorInternoArticulos  drop constraint FK2AED082085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AED082074E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulos'))
alter table CoautorInternoArticulos  drop constraint FK2AED082074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AED0820FCE29076]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulos'))
alter table CoautorInternoArticulos  drop constraint FK2AED0820FCE29076


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB68FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB68FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB685102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB685102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB674E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB674E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB6FCE29076]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB6FCE29076


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB984B9FD1687D84E]') AND parent_object_id = OBJECT_ID('Usuarios'))
alter table Usuarios  drop constraint FKB984B9FD1687D84E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB984B9FD85102A57]') AND parent_object_id = OBJECT_ID('Usuarios'))
alter table Usuarios  drop constraint FKB984B9FD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB984B9FD74E8BAB7]') AND parent_object_id = OBJECT_ID('Usuarios'))
alter table Usuarios  drop constraint FKB984B9FD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A72C4C6B8]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A72C4C6B8


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD884456A6A829E09]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FKD884456A6A829E09


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20CDD2C585102A57]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FK20CDD2C585102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20CDD2C574E8BAB7]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FK20CDD2C574E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7004441E85102A57]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK7004441E85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7004441E74E8BAB7]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK7004441E74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD9CF67963]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD9CF67963


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD85102A57]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD74E8BAB7]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK265240DD8336201B]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FK265240DD8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF88C425185102A57]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FKF88C425185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF88C425174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FKF88C425174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C1B8E1D4A]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C1B8E1D4A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C85102A57]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C74E8BAB7]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6A7A949C8336201B]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK6A7A949C8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C85102A57]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C74E8BAB7]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD85102A57]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD74E8BAB7]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK91FCA7F85102A57]') AND parent_object_id = OBJECT_ID('PeriodoReferencias'))
alter table PeriodoReferencias  drop constraint FK91FCA7F85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK91FCA7F74E8BAB7]') AND parent_object_id = OBJECT_ID('PeriodoReferencias'))
alter table PeriodoReferencias  drop constraint FK91FCA7F74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE5A612A185102A57]') AND parent_object_id = OBJECT_ID('TipoCapitulos'))
alter table TipoCapitulos  drop constraint FKE5A612A185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE5A612A174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoCapitulos'))
alter table TipoCapitulos  drop constraint FKE5A612A174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK45EB259085102A57]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK45EB259085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK45EB259074E8BAB7]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK45EB259074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8608BEE085102A57]') AND parent_object_id = OBJECT_ID('FormaParticipaciones'))
alter table FormaParticipaciones  drop constraint FK8608BEE085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8608BEE074E8BAB7]') AND parent_object_id = OBJECT_ID('FormaParticipaciones'))
alter table FormaParticipaciones  drop constraint FK8608BEE074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1261169485102A57]') AND parent_object_id = OBJECT_ID('Personas'))
alter table Personas  drop constraint FK1261169485102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1261169474E8BAB7]') AND parent_object_id = OBJECT_ID('Personas'))
alter table Personas  drop constraint FK1261169474E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919985102A57]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919974E8BAB7]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767285102A57]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767274E8BAB7]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26B980285102A57]') AND parent_object_id = OBJECT_ID('TipoArticulos'))
alter table TipoArticulos  drop constraint FK26B980285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26B980274E8BAB7]') AND parent_object_id = OBJECT_ID('TipoArticulos'))
alter table TipoArticulos  drop constraint FK26B980274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE85102A57]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE74E8BAB7]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C85102A57]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C74E8BAB7]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADE5A51EE5]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADE5A51EE5


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADC6BB3B45]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADC6BB3B45


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD11666E2A]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD11666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD1EDC2D3B]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD1EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD6425E2FD]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD6425E2FD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD7A8488F7]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD7A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD103EADB1]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD103EADB1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD2261429F]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD2261429F


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD437DED87]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD437DED87


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD295BC133]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADBC063744]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADBC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADF4FE4035]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADF4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD85102A57]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD74E8BAB7]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53D2CF3C8336201B]') AND parent_object_id = OBJECT_ID('ResponsableInternoCapitulos'))
alter table ResponsableInternoCapitulos  drop constraint FK53D2CF3C8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53D2CF3C85102A57]') AND parent_object_id = OBJECT_ID('ResponsableInternoCapitulos'))
alter table ResponsableInternoCapitulos  drop constraint FK53D2CF3C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53D2CF3C74E8BAB7]') AND parent_object_id = OBJECT_ID('ResponsableInternoCapitulos'))
alter table ResponsableInternoCapitulos  drop constraint FK53D2CF3C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53D2CF3CA1B3F60D]') AND parent_object_id = OBJECT_ID('ResponsableInternoCapitulos'))
alter table ResponsableInternoCapitulos  drop constraint FK53D2CF3CA1B3F60D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK539D878E8FDBB774]') AND parent_object_id = OBJECT_ID('ResponsableExternoCapitulos'))
alter table ResponsableExternoCapitulos  drop constraint FK539D878E8FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK539D878E85102A57]') AND parent_object_id = OBJECT_ID('ResponsableExternoCapitulos'))
alter table ResponsableExternoCapitulos  drop constraint FK539D878E85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK539D878E74E8BAB7]') AND parent_object_id = OBJECT_ID('ResponsableExternoCapitulos'))
alter table ResponsableExternoCapitulos  drop constraint FK539D878E74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK539D878EA1B3F60D]') AND parent_object_id = OBJECT_ID('ResponsableExternoCapitulos'))
alter table ResponsableExternoCapitulos  drop constraint FK539D878EA1B3F60D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE85102A57]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE74E8BAB7]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE85102A57]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE74E8BAB7]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D78336201B]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D78336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D73C5C6337]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D73C5C6337


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D76425E2FD]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D76425E2FD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7C6BB3B45]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7C6BB3B45


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D711666E2A]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D711666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D71EDC2D3B]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D71EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D77A8488F7]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D77A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D72AF31B56]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D72AF31B56


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D764F7D1CD]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D764F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D741CFD2F4]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D741CFD2F4


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7B9B574C5]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7B9B574C5


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D761CF922]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D761CF922


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D720BCCBEB]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D720BCCBEB


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D71BCB3374]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D71BCB3374


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7437DED87]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7437DED87


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7295BC133]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7BC063744]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7BC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D7F4FE4035]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D7F4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D785102A57]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D774E8BAB7]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF062672785102A57]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FKF062672785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF062672774E8BAB7]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FKF062672774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B96A829E09]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B96A829E09


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B985102A57]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE67B58B974E8BAB7]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKE67B58B974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD9C6BB3B45]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD9C6BB3B45


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD985102A57]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD974E8BAB7]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK667DBFD98336201B]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK667DBFD98336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1527E7985102A57]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK1527E7985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1527E7974E8BAB7]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK1527E7974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27DF9BD685102A57]') AND parent_object_id = OBJECT_ID('TipoParticipantes'))
alter table TipoParticipantes  drop constraint FK27DF9BD685102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27DF9BD674E8BAB7]') AND parent_object_id = OBJECT_ID('TipoParticipantes'))
alter table TipoParticipantes  drop constraint FK27DF9BD674E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21100647CC4BEB17]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK21100647CC4BEB17


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064785102A57]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064774E8BAB7]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK211006478336201B]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK211006478336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A2E670F85102A57]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK1A2E670F85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1A2E670F74E8BAB7]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK1A2E670F74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF172AB885102A57]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDF172AB885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDF172AB874E8BAB7]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDF172AB874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D136FF2CA]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D136FF2CA


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D7D866EAB]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D7D866EAB


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D3E391E13]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D3E391E13


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D85102A57]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D74E8BAB7]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC1D5F88D8336201B]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FKC1D5F88D8336201B


    if exists (select * from dbo.sysobjects where id = object_id(N'SNIs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIs

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

    if exists (select * from dbo.sysobjects where id = object_id(N'RevistaPublicaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table RevistaPublicaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Cargos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cargos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'InvestigadorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InvestigadorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Disciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Disciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Usuarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Usuarios

    if exists (select * from dbo.sysobjects where id = object_id(N'UsuarioRol') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table UsuarioRol

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividades') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividades

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Instituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Instituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Subdisciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subdisciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'PeriodoReferencias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table PeriodoReferencias

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'FormaParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormaParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Personas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Personas

    if exists (select * from dbo.sysobjects where id = object_id(N'Indices') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Indices

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Paises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Paises

    if exists (select * from dbo.sysobjects where id = object_id(N'Idiomas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Idiomas

    if exists (select * from dbo.sysobjects where id = object_id(N'Capitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Capitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableInternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableInternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableExternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableExternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'Articulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Articulos

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Investigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Investigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Areas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Areas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipantes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipantes

    if exists (select * from dbo.sysobjects where id = object_id(N'CategoriaInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CategoriaInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'CargoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CargoInvestigadores

    create table SNIs (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Sedes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Descripcion NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table RevistaPublicaciones (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(255) null,
       Periodicidad NVARCHAR(255) null,
       Issn NVARCHAR(255) null,
       Detalle NVARCHAR(255) null,
       Tipo NVARCHAR(255) null,
       Estado NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ResponsableExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoCapitulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       CapituloFk INT null,
       primary key (Id)
    )

    create table CoautorExternoCapitulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       CapituloFk INT null,
       primary key (Id)
    )

    create table Cargos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table InvestigadorExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       Puesto NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Disciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoArticulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ArticuloFk INT null,
       primary key (Id)
    )

    create table CoautorExternoArticulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ArticuloFk INT null,
       primary key (Id)
    )

    create table Usuarios (
        Id INT IDENTITY NOT NULL,
       UsuarioNombre NVARCHAR(255) null,
       Clave NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PersonaFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table UsuarioRol (
        UsuarioFk INT not null,
       RolFk INT not null
    )

    create table TipoParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table LineaTematicas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table GradoAcademicoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       Descripcion NVARCHAR(255) null,
       AreaInvestigacion NVARCHAR(255) null,
       Detalle NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       GradoAcademicoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table TipoActividades (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table SNIInvestigadores (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       ExpedienteSNI NVARCHAR(255) null,
       ExpedienteProduccion NVARCHAR(255) null,
       ExpedienteAcademico NVARCHAR(255) null,
       ClaveCVU NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       SNIFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Instituciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Responsable NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Subdisciplinas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table PeriodoReferencias (
        Id INT IDENTITY NOT NULL,
       Periodo NVARCHAR(255) null,
       Orden INT null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoCapitulos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Puestos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table FormaParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Personas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       ApellidoPaterno NVARCHAR(255) null,
       ApellidoMaterno NVARCHAR(255) null,
       Email NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Indices (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Categorias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoArticulos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Paises (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Idiomas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Capitulos (
        Id INT IDENTITY NOT NULL,
       NombreCapitulo NVARCHAR(255) null,
       FechaAceptacion DATETIME null,
       FechaEdicion DATETIME null,
       NombreLibro NVARCHAR(255) null,
       Editorial NVARCHAR(255) null,
       NoPaginas INT null,
       Volumen NVARCHAR(255) null,
       Editores NVARCHAR(255) null,
       Traductor NVARCHAR(255) null,
       NombreTraductor NVARCHAR(255) null,
       Resumen NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoCapituloFk INT null,
       EstadoFk INT null,
       PeriodoReferenciaFk INT null,
       LineaTematicaFk INT null,
       IdiomaFk INT null,
       PaisFk INT null,
       FormaParticipacionFk INT null,
       TipoParticipacionFk INT null,
       TipoParticipanteFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ResponsableInternoCapitulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       CapituloFk INT null,
       primary key (Id)
    )

    create table ResponsableExternoCapitulos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       CapituloFk INT null,
       primary key (Id)
    )

    create table GradoAcademicos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Estados (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Articulos (
        Id INT IDENTITY NOT NULL,
       FechaAceptacion DATETIME null,
       Titulo NVARCHAR(255) null,
       Volumen NVARCHAR(255) null,
       Numero INT null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       FechaEdicion DATETIME null,
       Participantes INT null,
       PalabrasClaves NVARCHAR(255) null,
       FechaPublicacion DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       TipoArticuloFk INT null,
       IdiomaFk INT null,
       EstadoFk INT null,
       PeriodoReferenciaFk INT null,
       LineaTematicaFk INT null,
       PaisFk INT null,
       RevistaPublicacionFk INT null,
       InstitucionFk INT null,
       Indice1Fk INT null,
       Indice2Fk INT null,
       Indice3Fk INT null,
       LineaInvestigacionFk INT null,
       TipoActividadFk INT null,
       TipoParticipanteFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table LineaInvestigaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Investigadores (
        Id INT IDENTITY NOT NULL,
       FechaIngreso DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       UsuarioFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstadoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EstadoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Areas (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoParticipantes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CategoriaInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CategoriaFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    create table Roles (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Departamentos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CargoInvestigadores (
        Id INT IDENTITY NOT NULL,
       Fecha DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CargoFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       InvestigadorFk INT null,
       primary key (Id)
    )

    alter table SNIs 
        add constraint FKF16DB6DA85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table SNIs 
        add constraint FKF16DB6DA74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Sedes 
        add constraint FK2EA40B0885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Sedes 
        add constraint FK2EA40B0874E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table RevistaPublicaciones 
        add constraint FK40B4829385102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table RevistaPublicaciones 
        add constraint FK40B4829374E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ResponsableExternos 
        add constraint FK371BC04385102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ResponsableExternos 
        add constraint FK371BC04374E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoCapitulos 
        add constraint FK453645C58336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoCapitulos 
        add constraint FK453645C585102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoCapitulos 
        add constraint FK453645C574E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoCapitulos 
        add constraint FK453645C5A1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table CoautorExternoCapitulos 
        add constraint FKE9BFF7578FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoCapitulos 
        add constraint FKE9BFF75785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoCapitulos 
        add constraint FKE9BFF75774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoCapitulos 
        add constraint FKE9BFF757A1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table Cargos 
        add constraint FKA8E8D63E85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Cargos 
        add constraint FKA8E8D63E74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternos 
        add constraint FKFFA20BAC85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternos 
        add constraint FKFFA20BAC74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table InvestigadorExternos 
        add constraint FK2FE0968885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table InvestigadorExternos 
        add constraint FK2FE0968874E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Disciplinas 
        add constraint FK6CD232B385102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Disciplinas 
        add constraint FK6CD232B374E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoArticulos 
        add constraint FK2AED08208336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoArticulos 
        add constraint FK2AED082085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoArticulos 
        add constraint FK2AED082074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoArticulos 
        add constraint FK2AED0820FCE29076 
        foreign key (ArticuloFk) 
        references Articulos

    alter table CoautorExternoArticulos 
        add constraint FK14FC6EB68FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoArticulos 
        add constraint FK14FC6EB685102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoArticulos 
        add constraint FK14FC6EB674E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoArticulos 
        add constraint FK14FC6EB6FCE29076 
        foreign key (ArticuloFk) 
        references Articulos

    alter table Usuarios 
        add constraint FKB984B9FD1687D84E 
        foreign key (PersonaFk) 
        references Personas

    alter table Usuarios 
        add constraint FKB984B9FD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Usuarios 
        add constraint FKB984B9FD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table UsuarioRol 
        add constraint FKD884456A72C4C6B8 
        foreign key (RolFk) 
        references Roles

    alter table UsuarioRol 
        add constraint FKD884456A6A829E09 
        foreign key (UsuarioFk) 
        references Usuarios

    alter table TipoParticipaciones 
        add constraint FK20CDD2C585102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoParticipaciones 
        add constraint FK20CDD2C574E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table LineaTematicas 
        add constraint FK7004441E85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table LineaTematicas 
        add constraint FK7004441E74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD9CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table GradoAcademicoInvestigadores 
        add constraint FK265240DD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table TipoActividades 
        add constraint FKF88C425185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoActividades 
        add constraint FKF88C425174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table SNIInvestigadores 
        add constraint FK6A7A949C1B8E1D4A 
        foreign key (SNIFk) 
        references SNIs

    alter table SNIInvestigadores 
        add constraint FK6A7A949C85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table SNIInvestigadores 
        add constraint FK6A7A949C74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table SNIInvestigadores 
        add constraint FK6A7A949C8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Instituciones 
        add constraint FK7E69627C85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Instituciones 
        add constraint FK7E69627C74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Subdisciplinas 
        add constraint FKB62F52AD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Subdisciplinas 
        add constraint FKB62F52AD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table PeriodoReferencias 
        add constraint FK91FCA7F85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table PeriodoReferencias 
        add constraint FK91FCA7F74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoCapitulos 
        add constraint FKE5A612A185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoCapitulos 
        add constraint FKE5A612A174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Puestos 
        add constraint FK45EB259085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Puestos 
        add constraint FK45EB259074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table FormaParticipaciones 
        add constraint FK8608BEE085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table FormaParticipaciones 
        add constraint FK8608BEE074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Personas 
        add constraint FK1261169485102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Personas 
        add constraint FK1261169474E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Indices 
        add constraint FKC50D919985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Indices 
        add constraint FKC50D919974E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Categorias 
        add constraint FK9AD9767285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Categorias 
        add constraint FK9AD9767274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoArticulos 
        add constraint FK26B980285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoArticulos 
        add constraint FK26B980274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Paises 
        add constraint FKFF6108EE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Paises 
        add constraint FKFF6108EE74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Idiomas 
        add constraint FKB635BD3C85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Idiomas 
        add constraint FKB635BD3C74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Capitulos 
        add constraint FK3165FEADE5A51EE5 
        foreign key (TipoCapituloFk) 
        references TipoCapitulos

    alter table Capitulos 
        add constraint FK3165FEADC6BB3B45 
        foreign key (EstadoFk) 
        references Estados

    alter table Capitulos 
        add constraint FK3165FEAD11666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Capitulos 
        add constraint FK3165FEAD1EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Capitulos 
        add constraint FK3165FEAD6425E2FD 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table Capitulos 
        add constraint FK3165FEAD7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Capitulos 
        add constraint FK3165FEAD103EADB1 
        foreign key (FormaParticipacionFk) 
        references FormaParticipaciones

    alter table Capitulos 
        add constraint FK3165FEAD2261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table Capitulos 
        add constraint FK3165FEAD437DED87 
        foreign key (TipoParticipanteFk) 
        references TipoParticipantes

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
        add constraint FK3165FEAD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Capitulos 
        add constraint FK3165FEAD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ResponsableInternoCapitulos 
        add constraint FK53D2CF3C8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ResponsableInternoCapitulos 
        add constraint FK53D2CF3C85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ResponsableInternoCapitulos 
        add constraint FK53D2CF3C74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ResponsableInternoCapitulos 
        add constraint FK53D2CF3CA1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table ResponsableExternoCapitulos 
        add constraint FK539D878E8FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table ResponsableExternoCapitulos 
        add constraint FK539D878E85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ResponsableExternoCapitulos 
        add constraint FK539D878E74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ResponsableExternoCapitulos 
        add constraint FK539D878EA1B3F60D 
        foreign key (CapituloFk) 
        references Capitulos

    alter table GradoAcademicos 
        add constraint FK4C871ABE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table GradoAcademicos 
        add constraint FK4C871ABE74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Estados 
        add constraint FKE112A3FE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Estados 
        add constraint FKE112A3FE74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Articulos 
        add constraint FK3EB394D78336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Articulos 
        add constraint FK3EB394D73C5C6337 
        foreign key (TipoArticuloFk) 
        references TipoArticulos

    alter table Articulos 
        add constraint FK3EB394D76425E2FD 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table Articulos 
        add constraint FK3EB394D7C6BB3B45 
        foreign key (EstadoFk) 
        references Estados

    alter table Articulos 
        add constraint FK3EB394D711666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Articulos 
        add constraint FK3EB394D71EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Articulos 
        add constraint FK3EB394D77A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Articulos 
        add constraint FK3EB394D72AF31B56 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Articulos 
        add constraint FK3EB394D764F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Articulos 
        add constraint FK3EB394D741CFD2F4 
        foreign key (Indice1Fk) 
        references Indices

    alter table Articulos 
        add constraint FK3EB394D7B9B574C5 
        foreign key (Indice2Fk) 
        references Indices

    alter table Articulos 
        add constraint FK3EB394D761CF922 
        foreign key (Indice3Fk) 
        references Indices

    alter table Articulos 
        add constraint FK3EB394D720BCCBEB 
        foreign key (LineaInvestigacionFk) 
        references LineaInvestigaciones

    alter table Articulos 
        add constraint FK3EB394D71BCB3374 
        foreign key (TipoActividadFk) 
        references TipoActividades

    alter table Articulos 
        add constraint FK3EB394D7437DED87 
        foreign key (TipoParticipanteFk) 
        references TipoParticipantes

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
        add constraint FK3EB394D785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Articulos 
        add constraint FK3EB394D774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table LineaInvestigaciones 
        add constraint FKF062672785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table LineaInvestigaciones 
        add constraint FKF062672774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Investigadores 
        add constraint FKE67B58B96A829E09 
        foreign key (UsuarioFk) 
        references Usuarios

    alter table Investigadores 
        add constraint FKE67B58B985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Investigadores 
        add constraint FKE67B58B974E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table EstadoInvestigadores 
        add constraint FK667DBFD9C6BB3B45 
        foreign key (EstadoFk) 
        references Estados

    alter table EstadoInvestigadores 
        add constraint FK667DBFD985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table EstadoInvestigadores 
        add constraint FK667DBFD974E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table EstadoInvestigadores 
        add constraint FK667DBFD98336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Areas 
        add constraint FK1527E7985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Areas 
        add constraint FK1527E7974E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoParticipantes 
        add constraint FK27DF9BD685102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoParticipantes 
        add constraint FK27DF9BD674E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CategoriaInvestigadores 
        add constraint FK21100647CC4BEB17 
        foreign key (CategoriaFk) 
        references Categorias

    alter table CategoriaInvestigadores 
        add constraint FK2110064785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CategoriaInvestigadores 
        add constraint FK2110064774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CategoriaInvestigadores 
        add constraint FK211006478336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Roles 
        add constraint FK1A2E670F85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Roles 
        add constraint FK1A2E670F74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Departamentos 
        add constraint FKDF172AB885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Departamentos 
        add constraint FKDF172AB874E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

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
        add constraint FKC1D5F88D85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CargoInvestigadores 
        add constraint FKC1D5F88D8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores
