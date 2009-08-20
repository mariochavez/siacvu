
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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D78AB6085102A57]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3D78AB6085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3D78AB6074E8BAB7]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3D78AB6074E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA3E082BED]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA3E082BED


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAEC222BA6]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAEC222BA6


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA295BC133]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEABC063744]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEABC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEAF4FE4035]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEAF4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA8336201B]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA85102A57]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK824D8BEA74E8BAB7]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FK824D8BEA74E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK87E86B1D2261429F]') AND parent_object_id = OBJECT_ID('TipoParticipacionEventos'))
alter table TipoParticipacionEventos  drop constraint FK87E86B1D2261429F


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK87E86B1D85102A57]') AND parent_object_id = OBJECT_ID('TipoParticipacionEventos'))
alter table TipoParticipacionEventos  drop constraint FK87E86B1D85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK87E86B1D74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoParticipacionEventos'))
alter table TipoParticipacionEventos  drop constraint FK87E86B1D74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK87E86B1D3BA127C1]') AND parent_object_id = OBJECT_ID('TipoParticipacionEventos'))
alter table TipoParticipacionEventos  drop constraint FK87E86B1D3BA127C1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK77542E185102A57]') AND parent_object_id = OBJECT_ID('TipoInstituciones'))
alter table TipoInstituciones  drop constraint FK77542E185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK77542E174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoInstituciones'))
alter table TipoInstituciones  drop constraint FK77542E174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE9CF67963]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE9CF67963


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE7A8488F7]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE7A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE103EADB1]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE103EADB1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE64F7D1CD]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE64F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE5ECF193D]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE5ECF193D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE1EDC2D3B]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE1EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE11666E2A]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE11666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE3E082BED]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE3E082BED


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE88D0C162]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE88D0C162


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE7D866EAB]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE7D866EAB


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE295BC133]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDEBC063744]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDEBC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDEF4FE4035]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDEF4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE8336201B]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE85102A57]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEA414CDE74E8BAB7]') AND parent_object_id = OBJECT_ID('Tesis'))
alter table Tesis  drop constraint FKEA414CDE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51F4869085102A57]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK51F4869085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51F4869074E8BAB7]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK51F4869074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B8336201B]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B748E7AD9]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B748E7AD9


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B7CEC3F4]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B7CEC3F4


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B90FFB19B]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B90FFB19B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B11666E2A]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B11666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B70EA6C9E]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B70EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B7A8488F7]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B7A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1BC0410E89]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1BC0410E89


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B85102A57]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56CA0A1B74E8BAB7]') AND parent_object_id = OBJECT_ID('Participaciones'))
alter table Participaciones  drop constraint FK56CA0A1B74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3ED3F785102A57]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FKCE3ED3F785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCE3ED3F774E8BAB7]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FKCE3ED3F774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA20BAC85102A57]') AND parent_object_id = OBJECT_ID('CoautorExternos'))
alter table CoautorExternos  drop constraint FKFFA20BAC85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA20BAC74E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternos'))
alter table CoautorExternos  drop constraint FKFFA20BAC74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK276A11CD8336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoReportes'))
alter table CoautorInternoReportes  drop constraint FK276A11CD8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK276A11CD85102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoReportes'))
alter table CoautorInternoReportes  drop constraint FK276A11CD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK276A11CD74E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoReportes'))
alter table CoautorInternoReportes  drop constraint FK276A11CD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK276A11CD13FE2142]') AND parent_object_id = OBJECT_ID('CoautorInternoReportes'))
alter table CoautorInternoReportes  drop constraint FK276A11CD13FE2142


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E50E26A85102A57]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK1E50E26A85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E50E26A74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK1E50E26A74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968885102A57]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FE0968874E8BAB7]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK2FE0968874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E78336201B]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E78336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7D6323CFC]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7D6323CFC


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E74B54D394]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E74B54D394


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E711666E2A]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E711666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E770EA6C9E]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E770EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E71EDC2D3B]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E71EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E77A8488F7]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E77A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E76425E2FD]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E76425E2FD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7103EADB1]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7103EADB1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E773171E9]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E773171E9


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7295BC133]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7BC063744]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7BC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E7F4FE4035]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E7F4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E785102A57]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK439120E774E8BAB7]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FK439120E774E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86CBBCE08FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoLibros'))
alter table CoautorExternoLibros  drop constraint FK86CBBCE08FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86CBBCE085102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoLibros'))
alter table CoautorExternoLibros  drop constraint FK86CBBCE085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86CBBCE074E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoLibros'))
alter table CoautorExternoLibros  drop constraint FK86CBBCE074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK86CBBCE0586827F8]') AND parent_object_id = OBJECT_ID('CoautorExternoLibros'))
alter table CoautorExternoLibros  drop constraint FK86CBBCE0586827F8


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB68FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB68FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB685102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB685102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB674E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB674E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK14FC6EB6FCE29076]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulos'))
alter table CoautorExternoArticulos  drop constraint FK14FC6EB6FCE29076


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB422A0B085102A57]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FKB422A0B085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB422A0B074E8BAB7]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FKB422A0B074E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE624B54D394]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE624B54D394


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6211666E2A]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6211666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6270EA6C9E]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6270EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE621EDC2D3B]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE621EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE627A8488F7]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE627A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62295BC133]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62BC063744]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62BC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE62F4FE4035]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE62F4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE628336201B]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE628336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6285102A57]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF708AE6274E8BAB7]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FKF708AE6274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE177237615]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE177237615


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE14B54D394]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE14B54D394


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE111666E2A]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE111666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE170EA6C9E]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE170EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE11EDC2D3B]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE11EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE164F7D1CD]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE164F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE17A8488F7]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE17A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE18336201B]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE18336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE185102A57]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26728BE174E8BAB7]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FK26728BE174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7785102A57]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8BA36D7774E8BAB7]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FK8BA36D7774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK913A1E0A85102A57]') AND parent_object_id = OBJECT_ID('ProductoDerivados'))
alter table ProductoDerivados  drop constraint FK913A1E0A85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK913A1E0A74E8BAB7]') AND parent_object_id = OBJECT_ID('ProductoDerivados'))
alter table ProductoDerivados  drop constraint FK913A1E0A74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8EB52B985102A57]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKD8EB52B985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD8EB52B974E8BAB7]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKD8EB52B974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7A9B067785102A57]') AND parent_object_id = OBJECT_ID('IdentificadorLibros'))
alter table IdentificadorLibros  drop constraint FK7A9B067785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7A9B067774E8BAB7]') AND parent_object_id = OBJECT_ID('IdentificadorLibros'))
alter table IdentificadorLibros  drop constraint FK7A9B067774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE803FA562]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE803FA562


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE2261429F]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE2261429F


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE3E082BED]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE3E082BED


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE7DBF823E]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE7DBF823E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAEC93A1EF1]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAEC93A1EF1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE8336201B]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE85102A57]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55BF0AAE74E8BAB7]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK55BF0AAE74E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2D5E463785102A57]') AND parent_object_id = OBJECT_ID('TipoFinanciamientos'))
alter table TipoFinanciamientos  drop constraint FK2D5E463785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2D5E463774E8BAB7]') AND parent_object_id = OBJECT_ID('TipoFinanciamientos'))
alter table TipoFinanciamientos  drop constraint FK2D5E463774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3B80B5285102A57]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKD3B80B5285102A57


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC8336201B]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC85102A57]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF821EEC74E8BAB7]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FKEF821EEC74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK17D499948336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoResenas'))
alter table CoautorInternoResenas  drop constraint FK17D499948336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK17D4999485102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoResenas'))
alter table CoautorInternoResenas  drop constraint FK17D4999485102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK17D4999474E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoResenas'))
alter table CoautorInternoResenas  drop constraint FK17D4999474E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK17D49994FF48CC4D]') AND parent_object_id = OBJECT_ID('CoautorInternoResenas'))
alter table CoautorInternoResenas  drop constraint FK17D49994FF48CC4D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA2968108FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoResenas'))
alter table CoautorExternoResenas  drop constraint FKDA2968108FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA29681085102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoResenas'))
alter table CoautorExternoResenas  drop constraint FKDA29681085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA29681074E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoResenas'))
alter table CoautorExternoResenas  drop constraint FKDA29681074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA296810FF48CC4D]') AND parent_object_id = OBJECT_ID('CoautorExternoResenas'))
alter table CoautorExternoResenas  drop constraint FKDA296810FF48CC4D


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC3FA1F2185102A57]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FKC3FA1F2185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC3FA1F2174E8BAB7]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FKC3FA1F2174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C85102A57]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7E69627C74E8BAB7]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FK7E69627C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD52343C93A1EF1]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD52343C93A1EF1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234342002BEE]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234342002BEE


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234364F7D1CD]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234364F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523431EDC2D3B]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523431EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD52343FA1D058B]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD52343FA1D058B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD523438336201B]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD523438336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234385102A57]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234385102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9DD5234374E8BAB7]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK9DD5234374E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4ECBCD2B85102A57]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FK4ECBCD2B85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4ECBCD2B74E8BAB7]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FK4ECBCD2B74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF35B3A2D85102A57]') AND parent_object_id = OBJECT_ID('Convenios'))
alter table Convenios  drop constraint FKF35B3A2D85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF35B3A2D74E8BAB7]') AND parent_object_id = OBJECT_ID('Convenios'))
alter table Convenios  drop constraint FKF35B3A2D74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK900A4EAC85102A57]') AND parent_object_id = OBJECT_ID('TipoPresentaciones'))
alter table TipoPresentaciones  drop constraint FK900A4EAC85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK900A4EAC74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoPresentaciones'))
alter table TipoPresentaciones  drop constraint FK900A4EAC74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8937716385102A57]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK8937716385102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8937716374E8BAB7]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK8937716374E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD85102A57]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB62F52AD74E8BAB7]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FKB62F52AD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK91FCA7F85102A57]') AND parent_object_id = OBJECT_ID('PeriodoReferencias'))
alter table PeriodoReferencias  drop constraint FK91FCA7F85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK91FCA7F74E8BAB7]') AND parent_object_id = OBJECT_ID('PeriodoReferencias'))
alter table PeriodoReferencias  drop constraint FK91FCA7F74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF8D374185102A57]') AND parent_object_id = OBJECT_ID('OtraParticipaciones'))
alter table OtraParticipaciones  drop constraint FKEF8D374185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF8D374174E8BAB7]') AND parent_object_id = OBJECT_ID('OtraParticipaciones'))
alter table OtraParticipaciones  drop constraint FKEF8D374174E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B8336201B]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7BF1AEE935]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7BF1AEE935


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B2261429F]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B2261429F


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B64F7D1CD]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B64F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B11666E2A]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B11666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B85102A57]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE29ADD7B74E8BAB7]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FKE29ADD7B74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB55786B8336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoEventos'))
alter table CoautorInternoEventos  drop constraint FKDB55786B8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB55786B85102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoEventos'))
alter table CoautorInternoEventos  drop constraint FKDB55786B85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB55786B74E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoEventos'))
alter table CoautorInternoEventos  drop constraint FKDB55786B74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB55786B3BA127C1]') AND parent_object_id = OBJECT_ID('CoautorInternoEventos'))
alter table CoautorInternoEventos  drop constraint FKDB55786B3BA127C1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE25BBDA78FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoEventos'))
alter table CoautorExternoEventos  drop constraint FKE25BBDA78FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE25BBDA785102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoEventos'))
alter table CoautorExternoEventos  drop constraint FKE25BBDA785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE25BBDA774E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoEventos'))
alter table CoautorExternoEventos  drop constraint FKE25BBDA774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE25BBDA73BA127C1]') AND parent_object_id = OBJECT_ID('CoautorExternoEventos'))
alter table CoautorExternoEventos  drop constraint FKE25BBDA73BA127C1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK57A9948085102A57]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK57A9948085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK57A9948074E8BAB7]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK57A9948074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1261169485102A57]') AND parent_object_id = OBJECT_ID('Personas'))
alter table Personas  drop constraint FK1261169485102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1261169474E8BAB7]') AND parent_object_id = OBJECT_ID('Personas'))
alter table Personas  drop constraint FK1261169474E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919985102A57]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC50D919974E8BAB7]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKC50D919974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E11666E2A]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E11666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E5ECF193D]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E5ECF193D


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E64F7D1CD]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E64F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E7DBF823E]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E7DBF823E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E3E082BED]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E3E082BED


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EEC222BA6]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EEC222BA6


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EC8628149]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EC8628149


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EC85D8149]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EC85D8149


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EC8588149]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EC8588149


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EC85B8149]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EC85B8149


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E7A8488F7]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E7A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E295BC133]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E295BC133


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EBC063744]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EBC063744


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63EF4FE4035]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63EF4FE4035


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E8336201B]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E85102A57]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8E38D63E74E8BAB7]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK8E38D63E74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767285102A57]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9AD9767274E8BAB7]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK9AD9767274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26B980285102A57]') AND parent_object_id = OBJECT_ID('TipoArticulos'))
alter table TipoArticulos  drop constraint FK26B980285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK26B980274E8BAB7]') AND parent_object_id = OBJECT_ID('TipoArticulos'))
alter table TipoArticulos  drop constraint FK26B980274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB644A341BCB3374]') AND parent_object_id = OBJECT_ID('TipoActividadMovilidadAcademicas'))
alter table TipoActividadMovilidadAcademicas  drop constraint FKDB644A341BCB3374


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB644A3485102A57]') AND parent_object_id = OBJECT_ID('TipoActividadMovilidadAcademicas'))
alter table TipoActividadMovilidadAcademicas  drop constraint FKDB644A3485102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB644A3474E8BAB7]') AND parent_object_id = OBJECT_ID('TipoActividadMovilidadAcademicas'))
alter table TipoActividadMovilidadAcademicas  drop constraint FKDB644A3474E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDB644A342C7CB987]') AND parent_object_id = OBJECT_ID('TipoActividadMovilidadAcademicas'))
alter table TipoActividadMovilidadAcademicas  drop constraint FKDB644A342C7CB987


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC418336201B]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC418336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC412B6A2801]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC412B6A2801


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41FEB3CEEC]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41FEB3CEEC


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41D93EC5CD]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41D93EC5CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4111666E2A]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4111666E2A


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4170EA6C9E]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4170EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC411EDC2D3B]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC411EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41C93A1EF1]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41C93A1EF1


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC417A8488F7]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC417A8488F7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC41C0410E89]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC41C0410E89


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4185102A57]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6CE1FC4174E8BAB7]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FK6CE1FC4174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE85102A57]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFF6108EE74E8BAB7]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKFF6108EE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK66FEAE5985102A57]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK66FEAE5985102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK66FEAE5974E8BAB7]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK66FEAE5974E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C85102A57]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB635BD3C74E8BAB7]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FKB635BD3C74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD8336201B]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD8336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEADE5A51EE5]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEADE5A51EE5


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD4B54D394]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD4B54D394


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD70EA6C9E]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD70EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD85102A57]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3165FEAD74E8BAB7]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK3165FEAD74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6D81574585102A57]') AND parent_object_id = OBJECT_ID('TipoReportes'))
alter table TipoReportes  drop constraint FK6D81574585102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6D81574574E8BAB7]') AND parent_object_id = OBJECT_ID('TipoReportes'))
alter table TipoReportes  drop constraint FK6D81574574E8BAB7


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B07A8C3DE5]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B07A8C3DE5


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B08BB69942]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B08BB69942


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B064F7D1CD]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B064F7D1CD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B01EDC2D3B]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B01EDC2D3B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B0201EE7BB]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B0201EE7BB


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B08336201B]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B08336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B085102A57]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK684440B074E8BAB7]') AND parent_object_id = OBJECT_ID('MovilidadAcademicas'))
alter table MovilidadAcademicas  drop constraint FK684440B074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE85102A57]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C871ABE74E8BAB7]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FK4C871ABE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34B67F8085102A57]') AND parent_object_id = OBJECT_ID('Generos'))
alter table Generos  drop constraint FK34B67F8085102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34B67F8074E8BAB7]') AND parent_object_id = OBJECT_ID('Generos'))
alter table Generos  drop constraint FK34B67F8074E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84935DC88336201B]') AND parent_object_id = OBJECT_ID('CoautorInternoLibros'))
alter table CoautorInternoLibros  drop constraint FK84935DC88336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84935DC885102A57]') AND parent_object_id = OBJECT_ID('CoautorInternoLibros'))
alter table CoautorInternoLibros  drop constraint FK84935DC885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84935DC874E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorInternoLibros'))
alter table CoautorInternoLibros  drop constraint FK84935DC874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84935DC8586827F8]') AND parent_object_id = OBJECT_ID('CoautorInternoLibros'))
alter table CoautorInternoLibros  drop constraint FK84935DC8586827F8


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F92D79885102A57]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK6F92D79885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6F92D79874E8BAB7]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK6F92D79874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE85102A57]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE112A3FE74E8BAB7]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE112A3FE74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK797B39C18FDBB774]') AND parent_object_id = OBJECT_ID('CoautorExternoReportes'))
alter table CoautorExternoReportes  drop constraint FK797B39C18FDBB774


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK797B39C185102A57]') AND parent_object_id = OBJECT_ID('CoautorExternoReportes'))
alter table CoautorExternoReportes  drop constraint FK797B39C185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK797B39C174E8BAB7]') AND parent_object_id = OBJECT_ID('CoautorExternoReportes'))
alter table CoautorExternoReportes  drop constraint FK797B39C174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK797B39C113FE2142]') AND parent_object_id = OBJECT_ID('CoautorExternoReportes'))
alter table CoautorExternoReportes  drop constraint FK797B39C113FE2142


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D78336201B]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D78336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D73C5C6337]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D73C5C6337


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D76425E2FD]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D76425E2FD


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D74B54D394]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D74B54D394


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D770EA6C9E]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D770EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D785102A57]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EB394D774E8BAB7]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK3EB394D774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56549E488718AE0E]') AND parent_object_id = OBJECT_ID('ProductoDerivadoMovilidadAcademicas'))
alter table ProductoDerivadoMovilidadAcademicas  drop constraint FK56549E488718AE0E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56549E4885102A57]') AND parent_object_id = OBJECT_ID('ProductoDerivadoMovilidadAcademicas'))
alter table ProductoDerivadoMovilidadAcademicas  drop constraint FK56549E4885102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56549E4874E8BAB7]') AND parent_object_id = OBJECT_ID('ProductoDerivadoMovilidadAcademicas'))
alter table ProductoDerivadoMovilidadAcademicas  drop constraint FK56549E4874E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK56549E482C7CB987]') AND parent_object_id = OBJECT_ID('ProductoDerivadoMovilidadAcademicas'))
alter table ProductoDerivadoMovilidadAcademicas  drop constraint FK56549E482C7CB987


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


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7522403185102A57]') AND parent_object_id = OBJECT_ID('TipoPublicaciones'))
alter table TipoPublicaciones  drop constraint FK7522403185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7522403174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoPublicaciones'))
alter table TipoPublicaciones  drop constraint FK7522403174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27DF9BD685102A57]') AND parent_object_id = OBJECT_ID('TipoParticipantes'))
alter table TipoParticipantes  drop constraint FK27DF9BD685102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK27DF9BD674E8BAB7]') AND parent_object_id = OBJECT_ID('TipoParticipantes'))
alter table TipoParticipantes  drop constraint FK27DF9BD674E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC93E6F3A70EA6C9E]') AND parent_object_id = OBJECT_ID('ProyectoMovilidadAcademicas'))
alter table ProyectoMovilidadAcademicas  drop constraint FKC93E6F3A70EA6C9E


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC93E6F3A85102A57]') AND parent_object_id = OBJECT_ID('ProyectoMovilidadAcademicas'))
alter table ProyectoMovilidadAcademicas  drop constraint FKC93E6F3A85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC93E6F3A74E8BAB7]') AND parent_object_id = OBJECT_ID('ProyectoMovilidadAcademicas'))
alter table ProyectoMovilidadAcademicas  drop constraint FKC93E6F3A74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC93E6F3A2C7CB987]') AND parent_object_id = OBJECT_ID('ProyectoMovilidadAcademicas'))
alter table ProyectoMovilidadAcademicas  drop constraint FKC93E6F3A2C7CB987


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21100647CC4BEB17]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK21100647CC4BEB17


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064785102A57]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064785102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2110064774E8BAB7]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK2110064774E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK211006478336201B]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FK211006478336201B


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK75A1DA3185102A57]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FK75A1DA3185102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK75A1DA3174E8BAB7]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FK75A1DA3174E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK952D666B85102A57]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK952D666B85102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK952D666B74E8BAB7]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK952D666B74E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53E7616285102A57]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FK53E7616285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK53E7616274E8BAB7]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FK53E7616274E8BAB7


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD667359285102A57]') AND parent_object_id = OBJECT_ID('EstadoProductos'))
alter table EstadoProductos  drop constraint FKD667359285102A57


    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD667359274E8BAB7]') AND parent_object_id = OBJECT_ID('EstadoProductos'))
alter table EstadoProductos  drop constraint FKD667359274E8BAB7


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

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioImpresos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioImpresos

    if exists (select * from dbo.sysobjects where id = object_id(N'FormacionAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormacionAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Cargos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cargos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipacionEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipacionEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoInstituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoInstituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Tesis') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Tesis

    if exists (select * from dbo.sysobjects where id = object_id(N'ProgramaEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProgramaEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'Participaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Participaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Niveles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Niveles

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoReportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoReportes

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'InvestigadorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InvestigadorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Libros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Libros

    if exists (select * from dbo.sysobjects where id = object_id(N'Disciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Disciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoLibros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoLibros

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Ambitos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Ambitos

    if exists (select * from dbo.sysobjects where id = object_id(N'Usuarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Usuarios

    if exists (select * from dbo.sysobjects where id = object_id(N'UsuarioRol') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table UsuarioRol

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Resenas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Resenas

    if exists (select * from dbo.sysobjects where id = object_id(N'Reportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Reportes

    if exists (select * from dbo.sysobjects where id = object_id(N'Proyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Proyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'ProductoDerivados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProductoDerivados

    if exists (select * from dbo.sysobjects where id = object_id(N'NivelEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table NivelEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'IdentificadorLibros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table IdentificadorLibros

    if exists (select * from dbo.sysobjects where id = object_id(N'OrganoExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OrganoExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoFinanciamientos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoFinanciamientos

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoPaises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoPaises

    if exists (select * from dbo.sysobjects where id = object_id(N'Distinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Distinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoResenas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoResenas

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoResenas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoResenas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividades') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividades

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioElectronicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioElectronicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Instituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Instituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Eventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Eventos

    if exists (select * from dbo.sysobjects where id = object_id(N'Dependencias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dependencias

    if exists (select * from dbo.sysobjects where id = object_id(N'Convenios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Convenios

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoPresentaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoPresentaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'Subdisciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subdisciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'PeriodoReferencias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table PeriodoReferencias

    if exists (select * from dbo.sysobjects where id = object_id(N'OtraParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OtraParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'FormaParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormaParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Dictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'Sectores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sectores

    if exists (select * from dbo.sysobjects where id = object_id(N'Personas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Personas

    if exists (select * from dbo.sysobjects where id = object_id(N'Indices') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Indices

    if exists (select * from dbo.sysobjects where id = object_id(N'Cursos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cursos

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoArticulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoArticulos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividadMovilidadAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividadMovilidadAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipacionMedios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipacionMedios

    if exists (select * from dbo.sysobjects where id = object_id(N'Paises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Paises

    if exists (select * from dbo.sysobjects where id = object_id(N'Organizaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Organizaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Idiomas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Idiomas

    if exists (select * from dbo.sysobjects where id = object_id(N'Capitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Capitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoReportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoReportes

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableInternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableInternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableExternoCapitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableExternoCapitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'MovilidadAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MovilidadAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Generos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Generos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoLibros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoLibros

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDistinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDistinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoReportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoReportes

    if exists (select * from dbo.sysobjects where id = object_id(N'Articulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Articulos

    if exists (select * from dbo.sysobjects where id = object_id(N'ProductoDerivadoMovilidadAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProductoDerivadoMovilidadAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Investigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Investigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Areas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Areas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoPublicaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoPublicaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipantes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipantes

    if exists (select * from dbo.sysobjects where id = object_id(N'ProyectoMovilidadAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProyectoMovilidadAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'CategoriaInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CategoriaInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoOrganos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoOrganos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEstancias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEstancias

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoProductos

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

    create table MedioImpresos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table FormacionAcademicas (
        Id INT IDENTITY NOT NULL,
       NumeroCedula INT null,
       TituloGrado NVARCHAR(255) null,
       FechaObtencion DATETIME null,
       TituloTesis NVARCHAR(255) null,
       Ciudad NVARCHAR(255) null,
       Estatus NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       NivelEstudioFk INT null,
       InstitucionFk INT null,
       LineaTematicaFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       InvestigadorFk INT null,
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

    create table TipoParticipacionEventos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoParticipacionFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       EventoFk INT null,
       primary key (Id)
    )

    create table TipoInstituciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Tesis (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(255) null,
       FechaConclusion DATETIME null,
       Autor NVARCHAR(255) null,
       FechaGrado DATETIME null,
       Puntuacion INT null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       GradoAcademicoFk INT null,
       PaisFk INT null,
       FormaParticipacionFk INT null,
       InstitucionFk INT null,
       ProgramaEstudioFk INT null,
       LineaTematicaFk INT null,
       PeriodoReferenciaFk INT null,
       SectorFk INT null,
       DependenciaFk INT null,
       DepartamentoFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ProgramaEstudios (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Participaciones (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(255) null,
       Puntuacion INT null,
       Institucion NVARCHAR(255) null,
       FechaPresentacion DATETIME null,
       Lugar NVARCHAR(255) null,
       Ciudad NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       AutorFk INT null,
       OtraParticipacionFk INT null,
       TipoPresentacionFk INT null,
       PeriodoReferenciaFk INT null,
       ProyectoFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Niveles (
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

    create table CoautorInternoReportes (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ReporteFk INT null,
       primary key (Id)
    )

    create table TipoProyectos (
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

    create table Libros (
        Id INT IDENTITY NOT NULL,
       TieneProyecto BIT null,
       FechaAceptacion DATETIME null,
       Nombre NVARCHAR(255) null,
       ISBN NVARCHAR(255) null,
       Editorial NVARCHAR(255) null,
       FechaEdicion DATETIME null,
       NoPaginas INT null,
       Tiraje NVARCHAR(255) null,
       PalabrasClave NVARCHAR(255) null,
       CoTraductor NVARCHAR(255) null,
       Traductor NVARCHAR(255) null,
       Puntuacion INT null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       TipoPublicacionFk INT null,
       EstadoProductoFk INT null,
       PeriodoReferenciaFk INT null,
       ProyectoFk INT null,
       LineaTematicaFk INT null,
       PaisFk INT null,
       IdiomaFk INT null,
       FormaParticipacionFk INT null,
       IdentificadorLibroFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
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

    create table CoautorExternoLibros (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       LibroFk INT null,
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

    create table Ambitos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
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

    create table Resenas (
        Id INT IDENTITY NOT NULL,
       FechaAceptacion DATETIME null,
       FechaEdicion DATETIME null,
       ReferenciaBibliograficaLibro NVARCHAR(255) null,
       ReferenciaBibliograficaRevista NVARCHAR(255) null,
       NombreProducto NVARCHAR(255) null,
       PaginaInicial INT null,
       PaginaFinal INT null,
       TituloLibro NVARCHAR(255) null,
       NombreRevista NVARCHAR(255) null,
       Editorial NVARCHAR(255) null,
       PalabrasClave NVARCHAR(255) null,
       Puntuacion INT null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       EstadoProductoFk INT null,
       PeriodoReferenciaFk INT null,
       ProyectoFk INT null,
       LineaTematicaFk INT null,
       PaisFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Reportes (
        Id INT IDENTITY NOT NULL,
       FechaAceptacion DATETIME null,
       Titulo NVARCHAR(255) null,
       FechaEdicion DATETIME null,
       Editorial NVARCHAR(255) null,
       NoPaginas INT null,
       Descripcion NVARCHAR(255) null,
       Objetivo NVARCHAR(255) null,
       PalabarasClave NVARCHAR(255) null,
       Puntuacion INT null,
       Fecha DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoReporteFk INT null,
       EstadoProductoFk INT null,
       PeriodoReferenciaFk INT null,
       ProyectoFk INT null,
       LineaTematicaFk INT null,
       InstitucionFk INT null,
       PaisFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Proyectos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ProductoDerivados (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table NivelEstudios (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table IdentificadorLibros (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table OrganoExternos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Siglas NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoOrganoFk INT null,
       TipoParticipacionFk INT null,
       SectorFk INT null,
       NivelFk INT null,
       AmbitoFk INT null,
       InvestigadorFk INT null,
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

    create table TipoFinanciamientos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstadoPaises (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Distinciones (
        Id INT IDENTITY NOT NULL,
       Descripcion NVARCHAR(255) null,
       FechaOtorgamiento DATETIME null,
       Ciudad NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoDistincionFk INT null,
       InstitucionFk INT null,
       AmbitoFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoResenas (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ResenaFk INT null,
       primary key (Id)
    )

    create table CoautorExternoResenas (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ResenaFk INT null,
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

    create table MedioElectronicos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
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

    create table Eventos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Titulo NVARCHAR(255) null,
       Invitacion BIT null,
       Lugar NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       PalabraClave1 NVARCHAR(255) null,
       PalabraClave2 NVARCHAR(255) null,
       PalabraClave3 NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       AmbitoFk INT null,
       TipoEventoFk INT null,
       InstitucionFk INT null,
       LineaTematicaFk INT null,
       TipoFinanciamientoFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Dependencias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table Convenios (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoPresentaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoDictamenes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
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

    create table OtraParticipaciones (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
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

    create table Dictamenes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       Puntuacion INT null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       TipoDictamenFk INT null,
       TipoParticipacionFk INT null,
       InstitucionFk INT null,
       PeriodoReferenciaFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoEventos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       EventoFk INT null,
       primary key (Id)
    )

    create table CoautorExternoEventos (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       EventoFk INT null,
       primary key (Id)
    )

    create table Sectores (
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

    create table Cursos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       NumeroHoras INT null,
       Puntuacion INT null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       PeriodoReferenciaFk INT null,
       ProgramaEstudioFk INT null,
       InstitucionFk INT null,
       NivelFk INT null,
       SectorFk INT null,
       OrganizacionFk INT null,
       Nivel2Fk INT null,
       Nivel3Fk INT null,
       Nivel4Fk INT null,
       Nivel5Fk INT null,
       PaisFk INT null,
       AreaFk INT null,
       DisciplinaFk INT null,
       SubdisciplinaFk INT null,
       InvestigadorFk INT null,
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

    create table TipoActividadMovilidadAcademicas (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoActividadFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       MovilidadAcademicaFk INT null,
       primary key (Id)
    )

    create table ParticipacionMedios (
        Id INT IDENTITY NOT NULL,
       Titulo NVARCHAR(255) null,
       Puntuacion INT null,
       Nombre NVARCHAR(255) null,
       Especificacion NVARCHAR(255) null,
       Tema NVARCHAR(255) null,
       FechaDifusion DATETIME null,
       Ciudad NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       MedioImpresoFk INT null,
       MedioElectronicoFk INT null,
       GeneroFk INT null,
       PeriodoReferenciaFk INT null,
       ProyectoFk INT null,
       LineaTematicaFk INT null,
       AmbitoFk INT null,
       PaisFk INT null,
       EstadoPaisFk INT null,
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

    create table Organizaciones (
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
       Puntuacion INT null,
       Volumen NVARCHAR(255) null,
       Editores NVARCHAR(255) null,
       Traductor NVARCHAR(255) null,
       NombreTraductor NVARCHAR(255) null,
       Resumen NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       TipoCapituloFk INT null,
       EstadoProductoFk INT null,
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
       ProyectoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoReportes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
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

    create table MovilidadAcademicas (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       TipoEstanciaFk INT null,
       TipoInstitucionFk INT null,
       InstitucionFk INT null,
       LineaTematicaFk INT null,
       ConvenioFk INT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
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

    create table Generos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table CoautorInternoLibros (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       LibroFk INT null,
       primary key (Id)
    )

    create table TipoDistinciones (
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

    create table CoautorExternoReportes (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       ReporteFk INT null,
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
       Puntuacion INT null,
       Participantes INT null,
       PalabrasClaves NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorFk INT null,
       TipoArticuloFk INT null,
       IdiomaFk INT null,
       EstadoProductoFk INT null,
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
       ProyectoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table ProductoDerivadoMovilidadAcademicas (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ProductoDerivadoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       MovilidadAcademicaFk INT null,
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

    create table TipoPublicaciones (
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

    create table ProyectoMovilidadAcademicas (
        Id INT IDENTITY NOT NULL,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ProyectoFk INT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       MovilidadAcademicaFk INT null,
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

    create table TipoOrganos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoEventos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table TipoEstancias (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table EstadoProductos (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(255) null,
       CreadorEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       CreadorPorFk INT null,
       ModificadoPorFk INT null,
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

    alter table MedioImpresos 
        add constraint FK3D78AB6085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table MedioImpresos 
        add constraint FK3D78AB6074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

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
        add constraint FK824D8BEA3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table FormacionAcademicas 
        add constraint FK824D8BEAEC222BA6 
        foreign key (OrganizacionFk) 
        references Organizaciones

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

    alter table FormacionAcademicas 
        add constraint FK824D8BEA8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table FormacionAcademicas 
        add constraint FK824D8BEA85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table FormacionAcademicas 
        add constraint FK824D8BEA74E8BAB7 
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

    alter table TipoParticipacionEventos 
        add constraint FK87E86B1D2261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table TipoParticipacionEventos 
        add constraint FK87E86B1D85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoParticipacionEventos 
        add constraint FK87E86B1D74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoParticipacionEventos 
        add constraint FK87E86B1D3BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table TipoInstituciones 
        add constraint FK77542E185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoInstituciones 
        add constraint FK77542E174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Tesis 
        add constraint FKEA414CDE9CF67963 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table Tesis 
        add constraint FKEA414CDE7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Tesis 
        add constraint FKEA414CDE103EADB1 
        foreign key (FormaParticipacionFk) 
        references FormaParticipaciones

    alter table Tesis 
        add constraint FKEA414CDE64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Tesis 
        add constraint FKEA414CDE5ECF193D 
        foreign key (ProgramaEstudioFk) 
        references ProgramaEstudios

    alter table Tesis 
        add constraint FKEA414CDE1EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Tesis 
        add constraint FKEA414CDE11666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Tesis 
        add constraint FKEA414CDE3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table Tesis 
        add constraint FKEA414CDE88D0C162 
        foreign key (DependenciaFk) 
        references Dependencias

    alter table Tesis 
        add constraint FKEA414CDE7D866EAB 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Tesis 
        add constraint FKEA414CDE295BC133 
        foreign key (AreaFk) 
        references Areas

    alter table Tesis 
        add constraint FKEA414CDEBC063744 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Tesis 
        add constraint FKEA414CDEF4FE4035 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Tesis 
        add constraint FKEA414CDE8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Tesis 
        add constraint FKEA414CDE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Tesis 
        add constraint FKEA414CDE74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ProgramaEstudios 
        add constraint FK51F4869085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ProgramaEstudios 
        add constraint FK51F4869074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Participaciones 
        add constraint FK56CA0A1B8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Participaciones 
        add constraint FK56CA0A1B748E7AD9 
        foreign key (AutorFk) 
        references Investigadores

    alter table Participaciones 
        add constraint FK56CA0A1B7CEC3F4 
        foreign key (OtraParticipacionFk) 
        references OtraParticipaciones

    alter table Participaciones 
        add constraint FK56CA0A1B90FFB19B 
        foreign key (TipoPresentacionFk) 
        references TipoPresentaciones

    alter table Participaciones 
        add constraint FK56CA0A1B11666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Participaciones 
        add constraint FK56CA0A1B70EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Participaciones 
        add constraint FK56CA0A1B7A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Participaciones 
        add constraint FK56CA0A1BC0410E89 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table Participaciones 
        add constraint FK56CA0A1B85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Participaciones 
        add constraint FK56CA0A1B74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Niveles 
        add constraint FKCE3ED3F785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Niveles 
        add constraint FKCE3ED3F774E8BAB7 
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

    alter table CoautorInternoReportes 
        add constraint FK276A11CD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoReportes 
        add constraint FK276A11CD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoReportes 
        add constraint FK276A11CD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoReportes 
        add constraint FK276A11CD13FE2142 
        foreign key (ReporteFk) 
        references Reportes

    alter table TipoProyectos 
        add constraint FK1E50E26A85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoProyectos 
        add constraint FK1E50E26A74E8BAB7 
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

    alter table Libros 
        add constraint FK439120E78336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Libros 
        add constraint FK439120E7D6323CFC 
        foreign key (TipoPublicacionFk) 
        references TipoPublicaciones

    alter table Libros 
        add constraint FK439120E74B54D394 
        foreign key (EstadoProductoFk) 
        references EstadoProductos

    alter table Libros 
        add constraint FK439120E711666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Libros 
        add constraint FK439120E770EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Libros 
        add constraint FK439120E71EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Libros 
        add constraint FK439120E77A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Libros 
        add constraint FK439120E76425E2FD 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table Libros 
        add constraint FK439120E7103EADB1 
        foreign key (FormaParticipacionFk) 
        references FormaParticipaciones

    alter table Libros 
        add constraint FK439120E773171E9 
        foreign key (IdentificadorLibroFk) 
        references IdentificadorLibros

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
        add constraint FK439120E785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Libros 
        add constraint FK439120E774E8BAB7 
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

    alter table CoautorExternoLibros 
        add constraint FK86CBBCE08FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoLibros 
        add constraint FK86CBBCE085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoLibros 
        add constraint FK86CBBCE074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoLibros 
        add constraint FK86CBBCE0586827F8 
        foreign key (LibroFk) 
        references Libros

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

    alter table Ambitos 
        add constraint FKB422A0B085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Ambitos 
        add constraint FKB422A0B074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

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

    alter table Resenas 
        add constraint FKF708AE624B54D394 
        foreign key (EstadoProductoFk) 
        references EstadoProductos

    alter table Resenas 
        add constraint FKF708AE6211666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Resenas 
        add constraint FKF708AE6270EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Resenas 
        add constraint FKF708AE621EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Resenas 
        add constraint FKF708AE627A8488F7 
        foreign key (PaisFk) 
        references Paises

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
        add constraint FKF708AE628336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Resenas 
        add constraint FKF708AE6285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Resenas 
        add constraint FKF708AE6274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Reportes 
        add constraint FK26728BE177237615 
        foreign key (TipoReporteFk) 
        references TipoReportes

    alter table Reportes 
        add constraint FK26728BE14B54D394 
        foreign key (EstadoProductoFk) 
        references EstadoProductos

    alter table Reportes 
        add constraint FK26728BE111666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Reportes 
        add constraint FK26728BE170EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Reportes 
        add constraint FK26728BE11EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Reportes 
        add constraint FK26728BE164F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Reportes 
        add constraint FK26728BE17A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table Reportes 
        add constraint FK26728BE18336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Reportes 
        add constraint FK26728BE185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Reportes 
        add constraint FK26728BE174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Proyectos 
        add constraint FK8BA36D7785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Proyectos 
        add constraint FK8BA36D7774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ProductoDerivados 
        add constraint FK913A1E0A85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ProductoDerivados 
        add constraint FK913A1E0A74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table NivelEstudios 
        add constraint FKD8EB52B985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table NivelEstudios 
        add constraint FKD8EB52B974E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table IdentificadorLibros 
        add constraint FK7A9B067785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table IdentificadorLibros 
        add constraint FK7A9B067774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table OrganoExternos 
        add constraint FK55BF0AAE803FA562 
        foreign key (TipoOrganoFk) 
        references TipoOrganos

    alter table OrganoExternos 
        add constraint FK55BF0AAE2261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table OrganoExternos 
        add constraint FK55BF0AAE3E082BED 
        foreign key (SectorFk) 
        references Sectores

    alter table OrganoExternos 
        add constraint FK55BF0AAE7DBF823E 
        foreign key (NivelFk) 
        references Niveles

    alter table OrganoExternos 
        add constraint FK55BF0AAEC93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table OrganoExternos 
        add constraint FK55BF0AAE8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table OrganoExternos 
        add constraint FK55BF0AAE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table OrganoExternos 
        add constraint FK55BF0AAE74E8BAB7 
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

    alter table TipoFinanciamientos 
        add constraint FK2D5E463785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoFinanciamientos 
        add constraint FK2D5E463774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table EstadoPaises 
        add constraint FKD3B80B5285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table EstadoPaises 
        add constraint FKD3B80B5274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

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
        add constraint FKEF821EEC8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Distinciones 
        add constraint FKEF821EEC85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Distinciones 
        add constraint FKEF821EEC74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoResenas 
        add constraint FK17D499948336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoResenas 
        add constraint FK17D4999485102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoResenas 
        add constraint FK17D4999474E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoResenas 
        add constraint FK17D49994FF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

    alter table CoautorExternoResenas 
        add constraint FKDA2968108FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoResenas 
        add constraint FKDA29681085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoResenas 
        add constraint FKDA29681074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoResenas 
        add constraint FKDA296810FF48CC4D 
        foreign key (ResenaFk) 
        references Resenas

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

    alter table MedioElectronicos 
        add constraint FKC3FA1F2185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table MedioElectronicos 
        add constraint FKC3FA1F2174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Instituciones 
        add constraint FK7E69627C85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Instituciones 
        add constraint FK7E69627C74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Eventos 
        add constraint FK9DD52343C93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table Eventos 
        add constraint FK9DD5234342002BEE 
        foreign key (TipoEventoFk) 
        references TipoEventos

    alter table Eventos 
        add constraint FK9DD5234364F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Eventos 
        add constraint FK9DD523431EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table Eventos 
        add constraint FK9DD52343FA1D058B 
        foreign key (TipoFinanciamientoFk) 
        references TipoFinanciamientos

    alter table Eventos 
        add constraint FK9DD523438336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Eventos 
        add constraint FK9DD5234385102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Eventos 
        add constraint FK9DD5234374E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Dependencias 
        add constraint FK4ECBCD2B85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Dependencias 
        add constraint FK4ECBCD2B74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Convenios 
        add constraint FKF35B3A2D85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Convenios 
        add constraint FKF35B3A2D74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoPresentaciones 
        add constraint FK900A4EAC85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoPresentaciones 
        add constraint FK900A4EAC74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoDictamenes 
        add constraint FK8937716385102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoDictamenes 
        add constraint FK8937716374E8BAB7 
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

    alter table OtraParticipaciones 
        add constraint FKEF8D374185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table OtraParticipaciones 
        add constraint FKEF8D374174E8BAB7 
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

    alter table Dictamenes 
        add constraint FKE29ADD7B8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Dictamenes 
        add constraint FKE29ADD7BF1AEE935 
        foreign key (TipoDictamenFk) 
        references TipoDictamenes

    alter table Dictamenes 
        add constraint FKE29ADD7B2261429F 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table Dictamenes 
        add constraint FKE29ADD7B64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Dictamenes 
        add constraint FKE29ADD7B11666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Dictamenes 
        add constraint FKE29ADD7B85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Dictamenes 
        add constraint FKE29ADD7B74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoEventos 
        add constraint FKDB55786B8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoEventos 
        add constraint FKDB55786B85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoEventos 
        add constraint FKDB55786B74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoEventos 
        add constraint FKDB55786B3BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table CoautorExternoEventos 
        add constraint FKE25BBDA78FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoEventos 
        add constraint FKE25BBDA785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoEventos 
        add constraint FKE25BBDA774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoEventos 
        add constraint FKE25BBDA73BA127C1 
        foreign key (EventoFk) 
        references Eventos

    alter table Sectores 
        add constraint FK57A9948085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Sectores 
        add constraint FK57A9948074E8BAB7 
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

    alter table Cursos 
        add constraint FK8E38D63E11666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table Cursos 
        add constraint FK8E38D63E5ECF193D 
        foreign key (ProgramaEstudioFk) 
        references ProgramaEstudios

    alter table Cursos 
        add constraint FK8E38D63E64F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Cursos 
        add constraint FK8E38D63E7DBF823E 
        foreign key (NivelFk) 
        references Niveles

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
        add constraint FK8E38D63EC85D8149 
        foreign key (Nivel3Fk) 
        references Niveles

    alter table Cursos 
        add constraint FK8E38D63EC8588149 
        foreign key (Nivel4Fk) 
        references Niveles

    alter table Cursos 
        add constraint FK8E38D63EC85B8149 
        foreign key (Nivel5Fk) 
        references Niveles

    alter table Cursos 
        add constraint FK8E38D63E7A8488F7 
        foreign key (PaisFk) 
        references Paises

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
        add constraint FK8E38D63E8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Cursos 
        add constraint FK8E38D63E85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Cursos 
        add constraint FK8E38D63E74E8BAB7 
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

    alter table TipoActividadMovilidadAcademicas 
        add constraint FKDB644A341BCB3374 
        foreign key (TipoActividadFk) 
        references TipoActividades

    alter table TipoActividadMovilidadAcademicas 
        add constraint FKDB644A3485102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoActividadMovilidadAcademicas 
        add constraint FKDB644A3474E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoActividadMovilidadAcademicas 
        add constraint FKDB644A342C7CB987 
        foreign key (MovilidadAcademicaFk) 
        references MovilidadAcademicas

    alter table ParticipacionMedios 
        add constraint FK6CE1FC418336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ParticipacionMedios 
        add constraint FK6CE1FC412B6A2801 
        foreign key (MedioImpresoFk) 
        references MedioImpresos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41FEB3CEEC 
        foreign key (MedioElectronicoFk) 
        references MedioElectronicos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41D93EC5CD 
        foreign key (GeneroFk) 
        references Generos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC4111666E2A 
        foreign key (PeriodoReferenciaFk) 
        references PeriodoReferencias

    alter table ParticipacionMedios 
        add constraint FK6CE1FC4170EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC411EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41C93A1EF1 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table ParticipacionMedios 
        add constraint FK6CE1FC417A8488F7 
        foreign key (PaisFk) 
        references Paises

    alter table ParticipacionMedios 
        add constraint FK6CE1FC41C0410E89 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table ParticipacionMedios 
        add constraint FK6CE1FC4185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ParticipacionMedios 
        add constraint FK6CE1FC4174E8BAB7 
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

    alter table Organizaciones 
        add constraint FK66FEAE5985102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Organizaciones 
        add constraint FK66FEAE5974E8BAB7 
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
        add constraint FK3165FEAD8336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Capitulos 
        add constraint FK3165FEADE5A51EE5 
        foreign key (TipoCapituloFk) 
        references TipoCapitulos

    alter table Capitulos 
        add constraint FK3165FEAD4B54D394 
        foreign key (EstadoProductoFk) 
        references EstadoProductos

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
        add constraint FK3165FEAD70EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Capitulos 
        add constraint FK3165FEAD85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Capitulos 
        add constraint FK3165FEAD74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoReportes 
        add constraint FK6D81574585102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoReportes 
        add constraint FK6D81574574E8BAB7 
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

    alter table MovilidadAcademicas 
        add constraint FK684440B07A8C3DE5 
        foreign key (TipoEstanciaFk) 
        references TipoEstancias

    alter table MovilidadAcademicas 
        add constraint FK684440B08BB69942 
        foreign key (TipoInstitucionFk) 
        references TipoInstituciones

    alter table MovilidadAcademicas 
        add constraint FK684440B064F7D1CD 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table MovilidadAcademicas 
        add constraint FK684440B01EDC2D3B 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table MovilidadAcademicas 
        add constraint FK684440B0201EE7BB 
        foreign key (ConvenioFk) 
        references Convenios

    alter table MovilidadAcademicas 
        add constraint FK684440B08336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table MovilidadAcademicas 
        add constraint FK684440B085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table MovilidadAcademicas 
        add constraint FK684440B074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table GradoAcademicos 
        add constraint FK4C871ABE85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table GradoAcademicos 
        add constraint FK4C871ABE74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table Generos 
        add constraint FK34B67F8085102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Generos 
        add constraint FK34B67F8074E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoLibros 
        add constraint FK84935DC88336201B 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoLibros 
        add constraint FK84935DC885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorInternoLibros 
        add constraint FK84935DC874E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorInternoLibros 
        add constraint FK84935DC8586827F8 
        foreign key (LibroFk) 
        references Libros

    alter table TipoDistinciones 
        add constraint FK6F92D79885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoDistinciones 
        add constraint FK6F92D79874E8BAB7 
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

    alter table CoautorExternoReportes 
        add constraint FK797B39C18FDBB774 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoReportes 
        add constraint FK797B39C185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table CoautorExternoReportes 
        add constraint FK797B39C174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table CoautorExternoReportes 
        add constraint FK797B39C113FE2142 
        foreign key (ReporteFk) 
        references Reportes

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
        add constraint FK3EB394D74B54D394 
        foreign key (EstadoProductoFk) 
        references EstadoProductos

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
        add constraint FK3EB394D770EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Articulos 
        add constraint FK3EB394D785102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table Articulos 
        add constraint FK3EB394D774E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ProductoDerivadoMovilidadAcademicas 
        add constraint FK56549E488718AE0E 
        foreign key (ProductoDerivadoFk) 
        references ProductoDerivados

    alter table ProductoDerivadoMovilidadAcademicas 
        add constraint FK56549E4885102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ProductoDerivadoMovilidadAcademicas 
        add constraint FK56549E4874E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ProductoDerivadoMovilidadAcademicas 
        add constraint FK56549E482C7CB987 
        foreign key (MovilidadAcademicaFk) 
        references MovilidadAcademicas

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

    alter table TipoPublicaciones 
        add constraint FK7522403185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoPublicaciones 
        add constraint FK7522403174E8BAB7 
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

    alter table ProyectoMovilidadAcademicas 
        add constraint FKC93E6F3A70EA6C9E 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ProyectoMovilidadAcademicas 
        add constraint FKC93E6F3A85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table ProyectoMovilidadAcademicas 
        add constraint FKC93E6F3A74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table ProyectoMovilidadAcademicas 
        add constraint FKC93E6F3A2C7CB987 
        foreign key (MovilidadAcademicaFk) 
        references MovilidadAcademicas

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

    alter table TipoOrganos 
        add constraint FK75A1DA3185102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoOrganos 
        add constraint FK75A1DA3174E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoEventos 
        add constraint FK952D666B85102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoEventos 
        add constraint FK952D666B74E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table TipoEstancias 
        add constraint FK53E7616285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table TipoEstancias 
        add constraint FK53E7616274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

    alter table EstadoProductos 
        add constraint FKD667359285102A57 
        foreign key (CreadorPorFk) 
        references Usuarios

    alter table EstadoProductos 
        add constraint FKD667359274E8BAB7 
        foreign key (ModificadoPorFk) 
        references Usuarios

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
