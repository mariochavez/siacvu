

    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29271625455FC17D]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FK29271625455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29271625F1C29126]') AND parent_object_id = OBJECT_ID('TipoActividades'))
alter table TipoActividades  drop constraint FK29271625F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK31E81F46455FC17D]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FK31E81F46455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK31E81F46F1C29126]') AND parent_object_id = OBJECT_ID('Idiomas'))
alter table Idiomas  drop constraint FK31E81F46F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAE79019D8269DCA]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FKAE79019D8269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAE79019D455FC17D]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FKAE79019D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAE79019DF1C29126]') AND parent_object_id = OBJECT_ID('Disciplinas'))
alter table Disciplinas  drop constraint FKAE79019DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7AA809D060A0B556]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7AA809D060A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7AA809D0455FC17D]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7AA809D0455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7AA809D0F1C29126]') AND parent_object_id = OBJECT_ID('InstitucionProductos'))
alter table InstitucionProductos  drop constraint FK7AA809D0F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC8DF9DF4CD01B9AD]') AND parent_object_id = OBJECT_ID('InstitucionReporte'))
alter table InstitucionReporte  drop constraint FKC8DF9DF4CD01B9AD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC8DF9DF43F7A6D9E]') AND parent_object_id = OBJECT_ID('InstitucionReporte'))
alter table InstitucionReporte  drop constraint FKC8DF9DF43F7A6D9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK606D9A92CD01B9AD]') AND parent_object_id = OBJECT_ID('InstitucionEvento'))
alter table InstitucionEvento  drop constraint FK606D9A92CD01B9AD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK606D9A925F3ABFEA]') AND parent_object_id = OBJECT_ID('InstitucionEvento'))
alter table InstitucionEvento  drop constraint FK606D9A925F3ABFEA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEB374852455FC17D]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FKEB374852455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEB374852F1C29126]') AND parent_object_id = OBJECT_ID('TipoParticipaciones'))
alter table TipoParticipaciones  drop constraint FKEB374852F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55316DC17EF62BBA]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FK55316DC17EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55316DC1455FC17D]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FK55316DC1455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK55316DC1F1C29126]') AND parent_object_id = OBJECT_ID('Subdisciplinas'))
alter table Subdisciplinas  drop constraint FK55316DC1F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB03D708D455FC17D]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKB03D708D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB03D708DF1C29126]') AND parent_object_id = OBJECT_ID('Paises'))
alter table Paises  drop constraint FKB03D708DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD05EF07F60A0B556]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKD05EF07F60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD05EF07F977C6E8C]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKD05EF07F977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD05EF07F455FC17D]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKD05EF07F455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD05EF07FF1C29126]') AND parent_object_id = OBJECT_ID('Editoriales'))
alter table Editoriales  drop constraint FKD05EF07FF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EA477E3455FC17D]') AND parent_object_id = OBJECT_ID('Archivos'))
alter table Archivos  drop constraint FK3EA477E3455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EA477E3F1C29126]') AND parent_object_id = OBJECT_ID('Archivos'))
alter table Archivos  drop constraint FK3EA477E3F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC0799B907D0]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC0799B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC074D241A3E]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC074D241A3E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC0760A0B556]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC0760A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC0712714AF0]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC0712714AF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC07D3448B38]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC07D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC07F149DD42]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC07F149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC078429231C]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC078429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC078269DCA]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC078269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC077EF62BBA]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC077EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC297AC07EC8F6488]') AND parent_object_id = OBJECT_ID('CursoInvestigadores'))
alter table CursoInvestigadores  drop constraint FKC297AC07EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4CBC9823455FC17D]') AND parent_object_id = OBJECT_ID('VinculacionAPyDes'))
alter table VinculacionAPyDes  drop constraint FK4CBC9823455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4CBC9823F1C29126]') AND parent_object_id = OBJECT_ID('VinculacionAPyDes'))
alter table VinculacionAPyDes  drop constraint FK4CBC9823F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0E9BC08F5B]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0E9BC08F5B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0EE5183AC8]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0EE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0E99B907D0]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0E99B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0E7D4FAF1A]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0E7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0EC225E46C]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0EC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0E5AE19DB6]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0E5AE19DB6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0E455FC17D]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0E455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE914ED0EF1C29126]') AND parent_object_id = OBJECT_ID('OrganoInternos'))
alter table OrganoInternos  drop constraint FKE914ED0EF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCECFB5E3E5183AC8]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKCECFB5E3E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCECFB5E3DE05D932]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKCECFB5E3DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCECFB5E3455FC17D]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKCECFB5E3455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCECFB5E3F1C29126]') AND parent_object_id = OBJECT_ID('Investigadores'))
alter table Investigadores  drop constraint FKCECFB5E3F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE340CD9B455FC17D]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE340CD9B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE340CD9BF1C29126]') AND parent_object_id = OBJECT_ID('Estados'))
alter table Estados  drop constraint FKE340CD9BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4A41A1B69]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4A41A1B69



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC44C0F59DE]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC44C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4290BF268]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4290BF268



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4F7503156]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4F7503156



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4F432AF2]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4F432AF2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC460A0B556]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC460A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4D3448B38]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4F149DD42]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4F149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC48429231C]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC48429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC48269DCA]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC48269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC47EF62BBA]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC47EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4EC8F6488]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4E5183AC8]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC47D4FAF1A]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC47D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4C225E46C]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4455FC17D]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BB16BC4F1C29126]') AND parent_object_id = OBJECT_ID('TesisDirigidas'))
alter table TesisDirigidas  drop constraint FK9BB16BC4F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAF00DE37455FC17D]') AND parent_object_id = OBJECT_ID('SubprogramaConacyts'))
alter table SubprogramaConacyts  drop constraint FKAF00DE37455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAF00DE37F1C29126]') AND parent_object_id = OBJECT_ID('SubprogramaConacyts'))
alter table SubprogramaConacyts  drop constraint FKAF00DE37F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6EBB49FEF149DD42]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FK6EBB49FEF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6EBB49FE455FC17D]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FK6EBB49FE455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6EBB49FEF1C29126]') AND parent_object_id = OBJECT_ID('Niveles'))
alter table Niveles  drop constraint FK6EBB49FEF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK48F18CB6753CAEC]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK48F18CB6753CAEC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK48F18CBE5183AC8]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK48F18CBE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK48F18CB455FC17D]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK48F18CB455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK48F18CBF1C29126]') AND parent_object_id = OBJECT_ID('IdiomasInvestigadores'))
alter table IdiomasInvestigadores  drop constraint FK48F18CBF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3DB9509977C6E8C]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKF3DB9509977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3DB9509455FC17D]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKF3DB9509455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3DB9509F1C29126]') AND parent_object_id = OBJECT_ID('EstadoPaises'))
alter table EstadoPaises  drop constraint FKF3DB9509F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCD998C678]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCD998C678



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DC6091310A]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DC6091310A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DC60A0B556]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DC60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCCFD6C118]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCCFD6C118



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DC977C6E8C]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DC977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCBEC82AAA]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCBEC82AAA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCE5183AC8]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DC7D4FAF1A]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DC7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCC225E46C]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DC455FC17D]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DC455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK21F6C4DCF1C29126]') AND parent_object_id = OBJECT_ID('Distinciones'))
alter table Distinciones  drop constraint FK21F6C4DCF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0BA36DFED5]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0BA36DFED5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0B4C0F59DE]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0B4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0BE5183AC8]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0BE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0B7D4FAF1A]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0B7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0BC225E46C]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0BC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0BA550D9B2]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0BA550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0B9F256952]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0B9F256952



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0B17CB0B7C]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0B17CB0B7C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0B455FC17D]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK530FAD0BF1C29126]') AND parent_object_id = OBJECT_ID('Dictamenes'))
alter table Dictamenes  drop constraint FK530FAD0BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C44C0F59DE]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C44C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4F70FAF0B]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C49FA8791]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C49FA8791



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C46753CAEC]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C46753CAEC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4DE05D932]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4A550D9B2]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4A550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4E5183AC8]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C47D4FAF1A]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C47D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4C225E46C]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4455FC17D]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4C0B95C4F1C29126]') AND parent_object_id = OBJECT_ID('ObraTraducidas'))
alter table ObraTraducidas  drop constraint FK4C0B95C4F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3887694E5183AC8]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD3887694E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3887694F432AF2]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD3887694F432AF2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD38876948F751872]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD38876948F751872



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD388769460A0B556]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD388769460A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD38876945FF09ED0]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD38876945FF09ED0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD38876947D4FAF1A]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD38876947D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3887694C225E46C]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD3887694C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3887694455FC17D]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD3887694455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD3887694F1C29126]') AND parent_object_id = OBJECT_ID('EstanciaAcademicaExternas'))
alter table EstanciaAcademicaExternas  drop constraint FKD3887694F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF616EE83455FC17D]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FKF616EE83455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF616EE83F1C29126]') AND parent_object_id = OBJECT_ID('TipoEstancias'))
alter table TipoEstancias  drop constraint FKF616EE83F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FA3AE399B907D0]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK2FA3AE399B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FA3AE3455FC17D]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK2FA3AE3455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2FA3AE3F1C29126]') AND parent_object_id = OBJECT_ID('AutorInternoProductos'))
alter table AutorInternoProductos  drop constraint FK2FA3AE3F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK70291BADC8129C8D]') AND parent_object_id = OBJECT_ID('AutorInternoCapitulo'))
alter table AutorInternoCapitulo  drop constraint FK70291BADC8129C8D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK70291BAD418ABDF0]') AND parent_object_id = OBJECT_ID('AutorInternoCapitulo'))
alter table AutorInternoCapitulo  drop constraint FK70291BAD418ABDF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6447CCBEC8129C8D]') AND parent_object_id = OBJECT_ID('AutorInternoResena'))
alter table AutorInternoResena  drop constraint FK6447CCBEC8129C8D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6447CCBEB2F54094]') AND parent_object_id = OBJECT_ID('AutorInternoResena'))
alter table AutorInternoResena  drop constraint FK6447CCBEB2F54094



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK97028A53C8129C8D]') AND parent_object_id = OBJECT_ID('AutorInternoObraTraducida'))
alter table AutorInternoObraTraducida  drop constraint FK97028A53C8129C8D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK97028A5340F913DE]') AND parent_object_id = OBJECT_ID('AutorInternoObraTraducida'))
alter table AutorInternoObraTraducida  drop constraint FK97028A5340F913DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D75D1493D94E140]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FK4D75D1493D94E140



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D75D14960A0B556]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FK4D75D14960A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D75D149455FC17D]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FK4D75D149455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D75D149F1C29126]') AND parent_object_id = OBJECT_ID('AutorExternoProductos'))
alter table AutorExternoProductos  drop constraint FK4D75D149F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC8B42EFFCF25D8AD]') AND parent_object_id = OBJECT_ID('AutorExternoCapitulo'))
alter table AutorExternoCapitulo  drop constraint FKC8B42EFFCF25D8AD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC8B42EFF418ABDF0]') AND parent_object_id = OBJECT_ID('AutorExternoCapitulo'))
alter table AutorExternoCapitulo  drop constraint FKC8B42EFF418ABDF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD1F94958CF25D8AD]') AND parent_object_id = OBJECT_ID('AutorExternoResena'))
alter table AutorExternoResena  drop constraint FKD1F94958CF25D8AD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD1F94958B2F54094]') AND parent_object_id = OBJECT_ID('AutorExternoResena'))
alter table AutorExternoResena  drop constraint FKD1F94958B2F54094



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK30C26649CF25D8AD]') AND parent_object_id = OBJECT_ID('AutorExternoObraTraducida'))
alter table AutorExternoObraTraducida  drop constraint FK30C26649CF25D8AD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK30C2664940F913DE]') AND parent_object_id = OBJECT_ID('AutorExternoObraTraducida'))
alter table AutorExternoObraTraducida  drop constraint FK30C2664940F913DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395455F3ABFEA]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395455F3ABFEA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545AB112DBA]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545DE05D932]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395458269DCA]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395458269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545F70FAF0B]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395458A512554]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395458A512554



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395457EF62BBA]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395457EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545EC8F6488]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395454C0F59DE]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395454C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545A550D9B2]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545A550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545E5183AC8]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD6395457D4FAF1A]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD6395457D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545C225E46C]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545455FC17D]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD639545F1C29126]') AND parent_object_id = OBJECT_ID('Libros'))
alter table Libros  drop constraint FKD639545F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA6EE83D455FC17D]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDA6EE83D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDA6EE83DF1C29126]') AND parent_object_id = OBJECT_ID('Departamentos'))
alter table Departamentos  drop constraint FKDA6EE83DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F8504C0F59DE]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F8504C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850F70FAF0B]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850AF195D41]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850AF195D41



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850AB112DBA]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850DE05D932]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F8508269DCA]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F8508269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F8507EF62BBA]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F8507EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850EC8F6488]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F8506D917A44]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F8506D917A44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850E5183AC8]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F8507D4FAF1A]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F8507D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850C225E46C]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850455FC17D]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK84A1F850F1C29126]') AND parent_object_id = OBJECT_ID('Capitulos'))
alter table Capitulos  drop constraint FK84A1F850F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK46A568C0455FC17D]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK46A568C0455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK46A568C0F1C29126]') AND parent_object_id = OBJECT_ID('Areas'))
alter table Areas  drop constraint FK46A568C0F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A299B907D0]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A299B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A2F7503156]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A2F7503156



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A24D241A3E]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A24D241A3E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A2F432AF2]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A2F432AF2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A260A0B556]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A260A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A2D3448B38]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A2D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A2F149DD42]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A2F149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK921CC4A28429231C]') AND parent_object_id = OBJECT_ID('TesisPosgrados'))
alter table TesisPosgrados  drop constraint FK921CC4A28429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2B4C0F59DE]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2B4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BE5183AC8]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2B7D4FAF1A]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2B7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BC225E46C]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BECE8ECF6]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BECE8ECF6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BDE05D932]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BDE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BCFD6C118]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BCFD6C118



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2B17F7F546]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2B17F7F546



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2B455FC17D]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE8B64D2BF1C29126]') AND parent_object_id = OBJECT_ID('ParticipacionMedios'))
alter table ParticipacionMedios  drop constraint FKE8B64D2BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EF6F83E455FC17D]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3EF6F83E455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3EF6F83EF1C29126]') AND parent_object_id = OBJECT_ID('MedioImpresos'))
alter table MedioImpresos  drop constraint FK3EF6F83EF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDD3448B38]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDF149DD42]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED8429231C]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED8429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED977C6E8C]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED8269DCA]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED8269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED7EF62BBA]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED7EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDEC8F6488]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDEC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDFF98A064]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDFF98A064



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDA0FE2B9C]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDA0FE2B9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED58244014]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED58244014



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDE5183AC8]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEED455FC17D]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEED455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK993CEEDF1C29126]') AND parent_object_id = OBJECT_ID('ExperienciaProfesionales'))
alter table ExperienciaProfesionales  drop constraint FK993CEEDF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8148F50A455FC17D]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK8148F50A455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8148F50AF1C29126]') AND parent_object_id = OBJECT_ID('Categorias'))
alter table Categorias  drop constraint FK8148F50AF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6E288519455FC17D]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK6E288519455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6E288519F1C29126]') AND parent_object_id = OBJECT_ID('InvestigadorExternos'))
alter table InvestigadorExternos  drop constraint FK6E288519F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720AB112DBA]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720DE05D932]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C7208269DCA]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C7208269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C7207EF62BBA]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C7207EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720EC8F6488]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720F70FAF0B]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C72011919BCD]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C72011919BCD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C7204C0F59DE]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C7204C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720A550D9B2]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720A550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C7207D4FAF1A]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C7207D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720C225E46C]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720E5183AC8]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720455FC17D]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8255C720F1C29126]') AND parent_object_id = OBJECT_ID('Articulos'))
alter table Articulos  drop constraint FK8255C720F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC38C88603D94E140]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigaciones'))
alter table MiembroExternoGrupoInvestigaciones  drop constraint FKC38C88603D94E140



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC38C8860455FC17D]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigaciones'))
alter table MiembroExternoGrupoInvestigaciones  drop constraint FKC38C8860455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC38C8860F1C29126]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigaciones'))
alter table MiembroExternoGrupoInvestigaciones  drop constraint FKC38C8860F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC38C8860CE065530]') AND parent_object_id = OBJECT_ID('MiembroExternoGrupoInvestigaciones'))
alter table MiembroExternoGrupoInvestigaciones  drop constraint FKC38C8860CE065530



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6094ADB6F432AF2]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK6094ADB6F432AF2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6094ADB6455FC17D]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK6094ADB6455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6094ADB6F1C29126]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK6094ADB6F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6094ADB6AB112DBA]') AND parent_object_id = OBJECT_ID('EstudianteProyectos'))
alter table EstudianteProyectos  drop constraint FK6094ADB6AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EB4708899B907D0]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FK2EB4708899B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EB47088455FC17D]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FK2EB47088455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2EB47088F1C29126]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProductos'))
alter table ParticipanteInternoProductos  drop constraint FK2EB47088F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5A07F722FC016215]') AND parent_object_id = OBJECT_ID('ParticipanteInternoEvento'))
alter table ParticipanteInternoEvento  drop constraint FK5A07F722FC016215



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5A07F722618199EC]') AND parent_object_id = OBJECT_ID('ParticipanteInternoEvento'))
alter table ParticipanteInternoEvento  drop constraint FK5A07F722618199EC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF19B7504FC016215]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProyecto'))
alter table ParticipanteInternoProyecto  drop constraint FKF19B7504FC016215



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF19B7504AB112DBA]') AND parent_object_id = OBJECT_ID('ParticipanteInternoProyecto'))
alter table ParticipanteInternoProyecto  drop constraint FKF19B7504AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2F89C4723D94E140]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FK2F89C4723D94E140



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2F89C47260A0B556]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FK2F89C47260A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2F89C472455FC17D]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FK2F89C472455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2F89C472F1C29126]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProductos'))
alter table ParticipanteExternoProductos  drop constraint FK2F89C472F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6E46BE743A35E8C5]') AND parent_object_id = OBJECT_ID('ParticipanteExternoEvento'))
alter table ParticipanteExternoEvento  drop constraint FK6E46BE743A35E8C5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6E46BE74618199EC]') AND parent_object_id = OBJECT_ID('ParticipanteExternoEvento'))
alter table ParticipanteExternoEvento  drop constraint FK6E46BE74618199EC



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFED643A23A35E8C5]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProyecto'))
alter table ParticipanteExternoProyecto  drop constraint FKFED643A23A35E8C5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFED643A2AB112DBA]') AND parent_object_id = OBJECT_ID('ParticipanteExternoProyecto'))
alter table ParticipanteExternoProyecto  drop constraint FKFED643A2AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK16722150455FC17D]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK16722150455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK16722150F1C29126]') AND parent_object_id = OBJECT_ID('TipoProyectos'))
alter table TipoProyectos  drop constraint FK16722150F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB569722D3448B38]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKB569722D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB569722455FC17D]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKB569722455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB569722F1C29126]') AND parent_object_id = OBJECT_ID('Ramas'))
alter table Ramas  drop constraint FKB569722F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK464FE437455FC17D]') AND parent_object_id = OBJECT_ID('Monedas'))
alter table Monedas  drop constraint FK464FE437455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK464FE437F1C29126]') AND parent_object_id = OBJECT_ID('Monedas'))
alter table Monedas  drop constraint FK464FE437F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5F10E87A4DA92B48]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK5F10E87A4DA92B48



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5F10E87A455FC17D]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK5F10E87A455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5F10E87AF1C29126]') AND parent_object_id = OBJECT_ID('Sedes'))
alter table Sedes  drop constraint FK5F10E87AF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDEB6210C455FC17D]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKDEB6210C455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDEB6210CF1C29126]') AND parent_object_id = OBJECT_ID('NivelEstudios'))
alter table NivelEstudios  drop constraint FKDEB6210CF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK82FD84B4455FC17D]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FK82FD84B4455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK82FD84B4F1C29126]') AND parent_object_id = OBJECT_ID('LineaInvestigaciones'))
alter table LineaInvestigaciones  drop constraint FK82FD84B4F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5040B837EBCCB098]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK5040B837EBCCB098



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5040B837455FC17D]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK5040B837455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5040B837F1C29126]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK5040B837F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5040B837FB0C1512]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK5040B837FB0C1512



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5040B83799B907D0]') AND parent_object_id = OBJECT_ID('EstadoInvestigadores'))
alter table EstadoInvestigadores  drop constraint FK5040B83799B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34F46004455FC17D]') AND parent_object_id = OBJECT_ID('ConsejoComisiones'))
alter table ConsejoComisiones  drop constraint FK34F46004455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK34F46004F1C29126]') AND parent_object_id = OBJECT_ID('ConsejoComisiones'))
alter table ConsejoComisiones  drop constraint FK34F46004F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB992DEBD455FC17D]') AND parent_object_id = OBJECT_ID('TipoApoyos'))
alter table TipoApoyos  drop constraint FKB992DEBD455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB992DEBDF1C29126]') AND parent_object_id = OBJECT_ID('TipoApoyos'))
alter table TipoApoyos  drop constraint FKB992DEBDF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB84C0F59DE]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB84C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8F70FAF0B]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB868857395]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB868857395



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8AB112DBA]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB860A0B556]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB860A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8DE05D932]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8E5183AC8]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB87D4FAF1A]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB87D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8C225E46C]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8455FC17D]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA2575FB8F1C29126]') AND parent_object_id = OBJECT_ID('Reportes'))
alter table Reportes  drop constraint FKA2575FB8F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160CF432AF2]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160CF432AF2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160C60A0B556]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160C60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160C455FC17D]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160C455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160CF1C29126]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160CF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160CFB0C1512]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160CFB0C1512



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD88D160C99B907D0]') AND parent_object_id = OBJECT_ID('GradoAcademicoInvestigadores'))
alter table GradoAcademicoInvestigadores  drop constraint FKD88D160C99B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC2B81821455FC17D]') AND parent_object_id = OBJECT_ID('DirigidoAs'))
alter table DirigidoAs  drop constraint FKC2B81821455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC2B81821F1C29126]') AND parent_object_id = OBJECT_ID('DirigidoAs'))
alter table DirigidoAs  drop constraint FKC2B81821F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BDFD127455FC17D]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FK9BDFD127455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9BDFD127F1C29126]') AND parent_object_id = OBJECT_ID('Ambitos'))
alter table Ambitos  drop constraint FK9BDFD127F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBE3E38FDCFD6C118]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FKBE3E38FDCFD6C118



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBE3E38FD455FC17D]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FKBE3E38FD455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBE3E38FDF1C29126]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FKBE3E38FDF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBE3E38FD5F3ABFEA]') AND parent_object_id = OBJECT_ID('SesionEventos'))
alter table SesionEventos  drop constraint FKBE3E38FD5F3ABFEA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK525B81F73F199284]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FK525B81F73F199284



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK525B81F7E5183AC8]') AND parent_object_id = OBJECT_ID('UsuarioRol'))
alter table UsuarioRol  drop constraint FK525B81F7E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5F7A4833455FC17D]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK5F7A4833455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK5F7A4833F1C29126]') AND parent_object_id = OBJECT_ID('Roles'))
alter table Roles  drop constraint FK5F7A4833F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DDE05D932]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DDE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D8269DCA]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D8269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D7EF62BBA]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D7EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DEC8F6488]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DEC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D4C0F59DE]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DF70FAF0B]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DF70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D80ADAC4C]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D80ADAC4C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D977C6E8C]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DA550D9B2]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DA550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D6D917A44]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D6D917A44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DE5183AC8]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D7D4FAF1A]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DC225E46C]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372D455FC17D]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK38C3372DF1C29126]') AND parent_object_id = OBJECT_ID('Resenas'))
alter table Resenas  drop constraint FK38C3372DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4E8D99DB455FC17D]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK4E8D99DB455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4E8D99DBF1C29126]') AND parent_object_id = OBJECT_ID('ProgramaEstudios'))
alter table ProgramaEstudios  drop constraint FK4E8D99DBF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7CF1671455FC17D]') AND parent_object_id = OBJECT_ID('DireccionRegionales'))
alter table DireccionRegionales  drop constraint FK7CF1671455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK7CF1671F1C29126]') AND parent_object_id = OBJECT_ID('DireccionRegionales'))
alter table DireccionRegionales  drop constraint FK7CF1671F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23BBD5A7455FC17D]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK23BBD5A7455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23BBD5A7F1C29126]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK23BBD5A7F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23BBD5A7AB112DBA]') AND parent_object_id = OBJECT_ID('ProductoGeneradoProyectos'))
alter table ProductoGeneradoProyectos  drop constraint FK23BBD5A7AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA8735217455FC17D]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKA8735217455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA8735217F1C29126]') AND parent_object_id = OBJECT_ID('SNIs'))
alter table SNIs  drop constraint FKA8735217F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13F60A0B556]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13F60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13F75A0A304]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13F75A0A304



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13FB691E405]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13FB691E405



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13FB691E464]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13FB691E464



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13FB691E44B]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13FB691E44B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13F455FC17D]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13F455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3F96D13FF1C29126]') AND parent_object_id = OBJECT_ID('RevistaPublicaciones'))
alter table RevistaPublicaciones  drop constraint FK3F96D13FF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB4774E1E99B907D0]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FKB4774E1E99B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB4774E1E455FC17D]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FKB4774E1E455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB4774E1EF1C29126]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FKB4774E1EF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB4774E1EAB112DBA]') AND parent_object_id = OBJECT_ID('ResponsableProyectos'))
alter table ResponsableProyectos  drop constraint FKB4774E1EAB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB12714AF0]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB12714AF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB60A0B556]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBF1EEAF6]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBF1EEAF6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB977C6E8C]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBBEC82AAA]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBBEC82AAA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB5585E164]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB5585E164



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBD3448B38]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBF149DD42]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB8429231C]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB8429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB8269DCA]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB8269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB7EF62BBA]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB7EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBEC8F6488]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBEC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBE5183AC8]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EB455FC17D]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EB455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF6A54EBF1C29126]') AND parent_object_id = OBJECT_ID('FormacionAcademicas'))
alter table FormacionAcademicas  drop constraint FKF6A54EBF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B7B6B5072]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B7B6B5072



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B4C0F59DE]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B12714AF0]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B12714AF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BC3FD3A34]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BC3FD3A34



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B60A0B556]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BD3448B38]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BF149DD42]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B8429231C]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B8429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B8269DCA]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B8269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B7EF62BBA]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B7EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BEC8F6488]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BEC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BE5183AC8]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B7D4FAF1A]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BC225E46C]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6B455FC17D]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK51FB3D6BF1C29126]') AND parent_object_id = OBJECT_ID('Cursos'))
alter table Cursos  drop constraint FK51FB3D6BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8AE9E17B99B907D0]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FK8AE9E17B99B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8AE9E17B455FC17D]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FK8AE9E17B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8AE9E17BF1C29126]') AND parent_object_id = OBJECT_ID('CoautorInternoProductos'))
alter table CoautorInternoProductos  drop constraint FK8AE9E17BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3C86F13796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKF3C86F13796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3C86F13FAA5EC92]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKF3C86F13FAA5EC92



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF3C86F139C2EC51A]') AND parent_object_id = OBJECT_ID('CoautorInternoArticulo'))
alter table CoautorInternoArticulo  drop constraint FKF3C86F139C2EC51A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611E63D9796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulo'))
alter table CoautorInternoCapitulo  drop constraint FK611E63D9796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611E63D9418ABDF0]') AND parent_object_id = OBJECT_ID('CoautorInternoCapitulo'))
alter table CoautorInternoCapitulo  drop constraint FK611E63D9418ABDF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA6E29653796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoEvento'))
alter table CoautorInternoEvento  drop constraint FKA6E29653796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA6E296535F3ABFEA]') AND parent_object_id = OBJECT_ID('CoautorInternoEvento'))
alter table CoautorInternoEvento  drop constraint FKA6E296535F3ABFEA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCAE881FC796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoLibro'))
alter table CoautorInternoLibro  drop constraint FKCAE881FC796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCAE881FCB60002A8]') AND parent_object_id = OBJECT_ID('CoautorInternoLibro'))
alter table CoautorInternoLibro  drop constraint FKCAE881FCB60002A8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6603E5B7796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoReporte'))
alter table CoautorInternoReporte  drop constraint FK6603E5B7796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK6603E5B73F7A6D9E]') AND parent_object_id = OBJECT_ID('CoautorInternoReporte'))
alter table CoautorInternoReporte  drop constraint FK6603E5B73F7A6D9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E834D20796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoResena'))
alter table CoautorInternoResena  drop constraint FK1E834D20796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1E834D20B2F54094]') AND parent_object_id = OBJECT_ID('CoautorInternoResena'))
alter table CoautorInternoResena  drop constraint FK1E834D20B2F54094



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF4B4811B796AE425]') AND parent_object_id = OBJECT_ID('CoautorInternoObraTraducida'))
alter table CoautorInternoObraTraducida  drop constraint FKF4B4811B796AE425



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF4B4811B40F913DE]') AND parent_object_id = OBJECT_ID('CoautorInternoObraTraducida'))
alter table CoautorInternoObraTraducida  drop constraint FKF4B4811B40F913DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF497703D3D94E140]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FKF497703D3D94E140



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF497703D60A0B556]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FKF497703D60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF497703D455FC17D]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FKF497703D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF497703DF1C29126]') AND parent_object_id = OBJECT_ID('CoautorExternoProductos'))
alter table CoautorExternoProductos  drop constraint FKF497703DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4B8176B921E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK4B8176B921E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4B8176B9FAA5EC92]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK4B8176B9FAA5EC92



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4B8176B99C2EC51A]') AND parent_object_id = OBJECT_ID('CoautorExternoArticulo'))
alter table CoautorExternoArticulo  drop constraint FK4B8176B99C2EC51A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB8D51D9F21E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulo'))
alter table CoautorExternoCapitulo  drop constraint FKB8D51D9F21E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB8D51D9F418ABDF0]') AND parent_object_id = OBJECT_ID('CoautorExternoCapitulo'))
alter table CoautorExternoCapitulo  drop constraint FKB8D51D9F418ABDF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE87E741D21E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoEvento'))
alter table CoautorExternoEvento  drop constraint FKE87E741D21E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE87E741D5F3ABFEA]') AND parent_object_id = OBJECT_ID('CoautorExternoEvento'))
alter table CoautorExternoEvento  drop constraint FKE87E741D5F3ABFEA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDABD42B621E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoLibro'))
alter table CoautorExternoLibro  drop constraint FKDABD42B621E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDABD42B6B60002A8]') AND parent_object_id = OBJECT_ID('CoautorExternoLibro'))
alter table CoautorExternoLibro  drop constraint FKDABD42B6B60002A8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF8CBBF121E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoReporte'))
alter table CoautorExternoReporte  drop constraint FKEF8CBBF121E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKEF8CBBF13F7A6D9E]') AND parent_object_id = OBJECT_ID('CoautorExternoReporte'))
alter table CoautorExternoReporte  drop constraint FKEF8CBBF13F7A6D9E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFBF99AAE21E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoResena'))
alter table CoautorExternoResena  drop constraint FKFBF99AAE21E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFBF99AAEB2F54094]') AND parent_object_id = OBJECT_ID('CoautorExternoResena'))
alter table CoautorExternoResena  drop constraint FKFBF99AAEB2F54094



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK11AA730D21E57C45]') AND parent_object_id = OBJECT_ID('CoautorExternoObraTraducida'))
alter table CoautorExternoObraTraducida  drop constraint FK11AA730D21E57C45



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK11AA730D40F913DE]') AND parent_object_id = OBJECT_ID('CoautorExternoObraTraducida'))
alter table CoautorExternoObraTraducida  drop constraint FK11AA730D40F913DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20AE56FEF1EEAF6]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK20AE56FEF1EEAF6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20AE56FE455FC17D]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK20AE56FE455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK20AE56FEF1C29126]') AND parent_object_id = OBJECT_ID('AreaTematicas'))
alter table AreaTematicas  drop constraint FK20AE56FEF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9A04EE2A455FC17D]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK9A04EE2A455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9A04EE2AF1C29126]') AND parent_object_id = OBJECT_ID('TipoEventos'))
alter table TipoEventos  drop constraint FK9A04EE2AF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AA1B3F1455FC17D]') AND parent_object_id = OBJECT_ID('TipoArchivos'))
alter table TipoArchivos  drop constraint FK2AA1B3F1455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2AA1B3F1F1C29126]') AND parent_object_id = OBJECT_ID('TipoArchivos'))
alter table TipoArchivos  drop constraint FK2AA1B3F1F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAA550D9B2]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAA550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFA60A0B556]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFA60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFA6D917A44]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFA6D917A44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFA977C6E8C]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFA977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAAB112DBA]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAAB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAF1EEAF6]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAF1EEAF6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAE5183AC8]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFA7D4FAF1A]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFA7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAC225E46C]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFA455FC17D]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFA455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK29751DFAF1C29126]') AND parent_object_id = OBJECT_ID('ParticipacionAcademias'))
alter table ParticipacionAcademias  drop constraint FK29751DFAF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK190DBEE4455FC17D]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FK190DBEE4455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK190DBEE4F1C29126]') AND parent_object_id = OBJECT_ID('MedioElectronicos'))
alter table MedioElectronicos  drop constraint FK190DBEE4F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB3DF8AC6455FC17D]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FKB3DF8AC6455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB3DF8AC6F1C29126]') AND parent_object_id = OBJECT_ID('GradoAcademicos'))
alter table GradoAcademicos  drop constraint FKB3DF8AC6F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD547B0EA7A6A61B1]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FKD547B0EA7A6A61B1



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD547B0EA3AA7ED42]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FKD547B0EA3AA7ED42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD547B0EA223D14BF]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FKD547B0EA223D14BF



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD547B0EA455FC17D]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FKD547B0EA455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKD547B0EAF1C29126]') AND parent_object_id = OBJECT_ID('Firmas'))
alter table Firmas  drop constraint FKD547B0EAF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611290CEE66C0970]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK611290CEE66C0970



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611290CEEFB79030]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK611290CEEFB79030



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611290CEE5183AC8]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK611290CEE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611290CE455FC17D]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK611290CE455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK611290CEF1C29126]') AND parent_object_id = OBJECT_ID('ApoyoConacyts'))
alter table ApoyoConacyts  drop constraint FK611290CEF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK95FF9F106D917A44]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK95FF9F106D917A44



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK95FF9F10455FC17D]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK95FF9F10455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK95FF9F10F1C29126]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK95FF9F10F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK95FF9F10977C6E8C]') AND parent_object_id = OBJECT_ID('EditorialProductos'))
alter table EditorialProductos  drop constraint FK95FF9F10977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1B223D9250094BA5]') AND parent_object_id = OBJECT_ID('EditorialCapitulo'))
alter table EditorialCapitulo  drop constraint FK1B223D9250094BA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1B223D92418ABDF0]') AND parent_object_id = OBJECT_ID('EditorialCapitulo'))
alter table EditorialCapitulo  drop constraint FK1B223D92418ABDF0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE6A9761B50094BA5]') AND parent_object_id = OBJECT_ID('EditorialLibro'))
alter table EditorialLibro  drop constraint FKE6A9761B50094BA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKE6A9761BB60002A8]') AND parent_object_id = OBJECT_ID('EditorialLibro'))
alter table EditorialLibro  drop constraint FKE6A9761BB60002A8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK603B17AF50094BA5]') AND parent_object_id = OBJECT_ID('EditorialResena'))
alter table EditorialResena  drop constraint FK603B17AF50094BA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK603B17AFB2F54094]') AND parent_object_id = OBJECT_ID('EditorialResena'))
alter table EditorialResena  drop constraint FK603B17AFB2F54094



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBFDCF83050094BA5]') AND parent_object_id = OBJECT_ID('EditorialObraTraducida'))
alter table EditorialObraTraducida  drop constraint FKBFDCF83050094BA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKBFDCF83040F913DE]') AND parent_object_id = OBJECT_ID('EditorialObraTraducida'))
alter table EditorialObraTraducida  drop constraint FKBFDCF83040F913DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB6403E3650094BA5]') AND parent_object_id = OBJECT_ID('EditorialDictamen'))
alter table EditorialDictamen  drop constraint FKB6403E3650094BA5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB6403E36286C2BD0]') AND parent_object_id = OBJECT_ID('EditorialDictamen'))
alter table EditorialDictamen  drop constraint FKB6403E36286C2BD0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB7FC066F455FC17D]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FKB7FC066F455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKB7FC066FF1C29126]') AND parent_object_id = OBJECT_ID('TipoOrganos'))
alter table TipoOrganos  drop constraint FKB7FC066FF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9FA738EA455FC17D]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK9FA738EA455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK9FA738EAF1C29126]') AND parent_object_id = OBJECT_ID('TipoDistinciones'))
alter table TipoDistinciones  drop constraint FK9FA738EAF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BD266D455FC17D]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK1BD266D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1BD266DF1C29126]') AND parent_object_id = OBJECT_ID('TipoDictamenes'))
alter table TipoDictamenes  drop constraint FK1BD266DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485CE5183AC8]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485CE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485CD3448B38]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485CD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485CF149DD42]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485CF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485C8429231C]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485C8429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485C455FC17D]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485C455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKDC8C485CF1C29126]') AND parent_object_id = OBJECT_ID('GrupoInvestigaciones'))
alter table GrupoInvestigaciones  drop constraint FKDC8C485CF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CCDE894D]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CCDE894D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29C4C0F59DE]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29C4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29C16F1C912]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29C16F1C912



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CDE05D932]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CDE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CECE8ECF6]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CECE8ECF6



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CE5183AC8]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29C7D4FAF1A]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29C7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CC225E46C]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29C455FC17D]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29C455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK1D37F29CF1C29126]') AND parent_object_id = OBJECT_ID('Eventos'))
alter table Eventos  drop constraint FK1D37F29CF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF5060288A856491E]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FKF5060288A856491E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF5060288455FC17D]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FKF5060288455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF5060288F1C29126]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FKF5060288F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF5060288FB0C1512]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FKF5060288FB0C1512



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF506028899B907D0]') AND parent_object_id = OBJECT_ID('CategoriaInvestigadores'))
alter table CategoriaInvestigadores  drop constraint FKF506028899B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC0487ED5635B0]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC0487ED5635B0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC04877D4FAF1A]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC04877D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC0487C225E46C]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC0487C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC0487455FC17D]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC0487455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC0487F1C29126]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC0487F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC0487FB0C1512]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC0487FB0C1512



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK67DC048799B907D0]') AND parent_object_id = OBJECT_ID('CargoInvestigadores'))
alter table CargoInvestigadores  drop constraint FK67DC048799B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D9BA613455FC17D]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK4D9BA613455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK4D9BA613F1C29126]') AND parent_object_id = OBJECT_ID('Puestos'))
alter table Puestos  drop constraint FK4D9BA613F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK827643CA455FC17D]') AND parent_object_id = OBJECT_ID('FondoConacyts'))
alter table FondoConacyts  drop constraint FK827643CA455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK827643CAF1C29126]') AND parent_object_id = OBJECT_ID('FondoConacyts'))
alter table FondoConacyts  drop constraint FK827643CAF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8D84D14455FC17D]') AND parent_object_id = OBJECT_ID('AreaInvestigaciones'))
alter table AreaInvestigaciones  drop constraint FK8D84D14455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK8D84D14F1C29126]') AND parent_object_id = OBJECT_ID('AreaInvestigaciones'))
alter table AreaInvestigaciones  drop constraint FK8D84D14F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2B6BE868455FC17D]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK2B6BE868455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK2B6BE868F1C29126]') AND parent_object_id = OBJECT_ID('Sectores'))
alter table Sectores  drop constraint FK2B6BE868F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCD54B6D60A0B556]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKCD54B6D60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCD54B6DA4C83338]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKCD54B6DA4C83338



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCD54B6D455FC17D]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKCD54B6D455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCD54B6DF1C29126]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKCD54B6DF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKCD54B6DAB112DBA]') AND parent_object_id = OBJECT_ID('RecursoFinancieroProyectos'))
alter table RecursoFinancieroProyectos  drop constraint FKCD54B6DAB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102AC899212]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102AC899212



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541024C0F59DE]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541024C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102E11EACAD]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102E11EACAD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541025C6539D0]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541025C6539D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102F89C21F]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102F89C21F



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541029F256952]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541029F256952



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102DE05D932]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102F7503156]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102F7503156



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541028269DCA]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541028269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541027EF62BBA]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541027EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102EC8F6488]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B5410213A965E5]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B5410213A965E5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102D3448B38]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102F149DD42]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102F149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541028429231C]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541028429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102FF98A064]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102FF98A064



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102A0FE2B9C]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102A0FE2B9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B5410258244014]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B5410258244014



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B541027D4FAF1A]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B541027D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102C225E46C]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102E5183AC8]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102455FC17D]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF7B54102F1C29126]') AND parent_object_id = OBJECT_ID('Proyectos'))
alter table Proyectos  drop constraint FKF7B54102F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1977C6E8C]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1BEC82AAA]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1BEC82AAA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1CFD6C118]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1CFD6C118



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1D3448B38]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1455FC17D]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKAAAE1CE1F1C29126]') AND parent_object_id = OBJECT_ID('Instituciones'))
alter table Instituciones  drop constraint FKAAAE1CE1F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC14E3061455FC17D]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FKC14E3061455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKC14E3061F1C29126]') AND parent_object_id = OBJECT_ID('Dependencias'))
alter table Dependencias  drop constraint FKC14E3061F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA3766FA0FE2B9C]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FKFFA3766FA0FE2B9C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA3766F455FC17D]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FKFFA3766F455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKFFA3766FF1C29126]') AND parent_object_id = OBJECT_ID('Clases'))
alter table Clases  drop constraint FKFFA3766FF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK25E0AB5BD3079F7E]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK25E0AB5BD3079F7E



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK25E0AB5B455FC17D]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK25E0AB5B455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK25E0AB5BF1C29126]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK25E0AB5BF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK25E0AB5BFB0C1512]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK25E0AB5BFB0C1512



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK25E0AB5B99B907D0]') AND parent_object_id = OBJECT_ID('SNIInvestigadores'))
alter table SNIInvestigadores  drop constraint FK25E0AB5B99B907D0



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCA261B2D5]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCA261B2D5



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CC4C0F59DE]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CC4C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCE5183AC8]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CC7D4FAF1A]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CC7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCC225E46C]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCD143D092]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCD143D092



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCD3448B38]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCCFD6C118]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCCFD6C118



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CC977C6E8C]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CC977C6E8C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CC455FC17D]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CC455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK656739CCF1C29126]') AND parent_object_id = OBJECT_ID('OrganoExternos'))
alter table OrganoExternos  drop constraint FK656739CCF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3CD56022D3448B38]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK3CD56022D3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3CD56022455FC17D]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK3CD56022455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3CD56022F1C29126]') AND parent_object_id = OBJECT_ID('Organizaciones'))
alter table Organizaciones  drop constraint FK3CD56022F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3217028E455FC17D]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK3217028E455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK3217028EF1C29126]') AND parent_object_id = OBJECT_ID('LineaTematicas'))
alter table LineaTematicas  drop constraint FK3217028EF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FBE5183AC8]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FBE5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FB7D4FAF1A]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FB7D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FBC225E46C]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FBC225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FB8F751872]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FB8F751872



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FB60A0B556]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FB60A0B556



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FBD3448B38]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FBD3448B38



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FBF149DD42]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FBF149DD42



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FB8429231C]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FB8429231C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FB455FC17D]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FB455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKF00501FBF1C29126]') AND parent_object_id = OBJECT_ID('EstanciaInstitucionExternas'))
alter table EstanciaInstitucionExternas  drop constraint FKF00501FBF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA80A7CDB455FC17D]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKA80A7CDB455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FKA80A7CDBF1C29126]') AND parent_object_id = OBJECT_ID('Indices'))
alter table Indices  drop constraint FKA80A7CDBF1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23A17E62455FC17D]') AND parent_object_id = OBJECT_ID('EstatusFormacionAcademicas'))
alter table EstatusFormacionAcademicas  drop constraint FK23A17E62455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK23A17E62F1C29126]') AND parent_object_id = OBJECT_ID('EstatusFormacionAcademicas'))
alter table EstatusFormacionAcademicas  drop constraint FK23A17E62F1C29126



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00AB112DBA]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00AB112DBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00DE05D932]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00DE05D932



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C008269DCA]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C008269DCA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C007EF62BBA]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C007EF62BBA



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00EC8F6488]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00EC8F6488



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00F70FAF0B]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00F70FAF0B



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C0011919BCD]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C0011919BCD



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C004C0F59DE]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C004C0F59DE



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00A550D9B2]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00A550D9B2



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C007D4FAF1A]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C007D4FAF1A



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00C225E46C]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00C225E46C



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00E5183AC8]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00E5183AC8



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00455FC17D]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00455FC17D



    if exists (select 1 from sys.objects where object_id = OBJECT_ID(N'[FK58CB3C00F1C29126]') AND parent_object_id = OBJECT_ID('ArticuloDifusiones'))
alter table ArticuloDifusiones  drop constraint FK58CB3C00F1C29126



    if exists (select * from dbo.sysobjects where id = object_id(N'TipoActividades') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoActividades

    if exists (select * from dbo.sysobjects where id = object_id(N'Idiomas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Idiomas

    if exists (select * from dbo.sysobjects where id = object_id(N'Disciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Disciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'InstitucionEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InstitucionEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoParticipaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoParticipaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Subdisciplinas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Subdisciplinas

    if exists (select * from dbo.sysobjects where id = object_id(N'Paises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Paises

    if exists (select * from dbo.sysobjects where id = object_id(N'Editoriales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Editoriales

    if exists (select * from dbo.sysobjects where id = object_id(N'Convenios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Convenios

    if exists (select * from dbo.sysobjects where id = object_id(N'Archivos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Archivos

    if exists (select * from dbo.sysobjects where id = object_id(N'CursoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CursoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'VinculacionAPyDes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table VinculacionAPyDes

    if exists (select * from dbo.sysobjects where id = object_id(N'OrganoInternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OrganoInternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Investigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Investigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Estados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Estados

    if exists (select * from dbo.sysobjects where id = object_id(N'TesisDirigidas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TesisDirigidas

    if exists (select * from dbo.sysobjects where id = object_id(N'SubprogramaConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SubprogramaConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'Niveles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Niveles

    if exists (select * from dbo.sysobjects where id = object_id(N'IdiomasInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table IdiomasInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoPaises') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoPaises

    if exists (select * from dbo.sysobjects where id = object_id(N'Distinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Distinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Dictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'ObraTraducidas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ObraTraducidas

    if exists (select * from dbo.sysobjects where id = object_id(N'EstanciaAcademicaExternas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstanciaAcademicaExternas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEstancias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEstancias

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorInternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorInternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'AutorExternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AutorExternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'Libros') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Libros

    if exists (select * from dbo.sysobjects where id = object_id(N'Departamentos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Departamentos

    if exists (select * from dbo.sysobjects where id = object_id(N'Capitulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Capitulos

    if exists (select * from dbo.sysobjects where id = object_id(N'Areas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Areas

    if exists (select * from dbo.sysobjects where id = object_id(N'TesisPosgrados') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TesisPosgrados

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipacionMedios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipacionMedios

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioImpresos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioImpresos

    if exists (select * from dbo.sysobjects where id = object_id(N'ExperienciaProfesionales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ExperienciaProfesionales

    if exists (select * from dbo.sysobjects where id = object_id(N'Categorias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Categorias

    if exists (select * from dbo.sysobjects where id = object_id(N'InvestigadorExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table InvestigadorExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Articulos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Articulos

    if exists (select * from dbo.sysobjects where id = object_id(N'MiembroExternoGrupoInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MiembroExternoGrupoInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'EstudianteProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstudianteProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteInternoProyecto') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteInternoProyecto

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipanteExternoProyecto') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipanteExternoProyecto

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'Ramas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Ramas

    if exists (select * from dbo.sysobjects where id = object_id(N'Monedas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Monedas

    if exists (select * from dbo.sysobjects where id = object_id(N'Sedes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sedes

    if exists (select * from dbo.sysobjects where id = object_id(N'NivelEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table NivelEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'EstadoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstadoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'ConsejoComisiones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ConsejoComisiones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoApoyos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoApoyos

    if exists (select * from dbo.sysobjects where id = object_id(N'Reportes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Reportes

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'DirigidoAs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table DirigidoAs

    if exists (select * from dbo.sysobjects where id = object_id(N'Ambitos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Ambitos

    if exists (select * from dbo.sysobjects where id = object_id(N'SesionEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SesionEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'Usuarios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Usuarios

    if exists (select * from dbo.sysobjects where id = object_id(N'UsuarioRol') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table UsuarioRol

    if exists (select * from dbo.sysobjects where id = object_id(N'Roles') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Roles

    if exists (select * from dbo.sysobjects where id = object_id(N'Resenas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Resenas

    if exists (select * from dbo.sysobjects where id = object_id(N'ProgramaEstudios') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProgramaEstudios

    if exists (select * from dbo.sysobjects where id = object_id(N'DireccionRegionales') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table DireccionRegionales

    if exists (select * from dbo.sysobjects where id = object_id(N'ProductoGeneradoProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ProductoGeneradoProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIs') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIs

    if exists (select * from dbo.sysobjects where id = object_id(N'RevistaPublicaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table RevistaPublicaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'ResponsableProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ResponsableProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'FormacionAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FormacionAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'Cursos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Cursos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoArticulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoArticulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorInternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorInternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoArticulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoArticulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoEvento') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoEvento

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoReporte') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoReporte

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoResena

    if exists (select * from dbo.sysobjects where id = object_id(N'CoautorExternoObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CoautorExternoObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'AreaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AreaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoEventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoEventos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoArchivos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoArchivos

    if exists (select * from dbo.sysobjects where id = object_id(N'ParticipacionAcademias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ParticipacionAcademias

    if exists (select * from dbo.sysobjects where id = object_id(N'MedioElectronicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table MedioElectronicos

    if exists (select * from dbo.sysobjects where id = object_id(N'GradoAcademicos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GradoAcademicos

    if exists (select * from dbo.sysobjects where id = object_id(N'Firmas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Firmas

    if exists (select * from dbo.sysobjects where id = object_id(N'ApoyoConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ApoyoConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialProductos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialProductos

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialCapitulo') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialCapitulo

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialLibro') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialLibro

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialResena') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialResena

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialObraTraducida') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialObraTraducida

    if exists (select * from dbo.sysobjects where id = object_id(N'EditorialDictamen') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EditorialDictamen

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoOrganos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoOrganos

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDistinciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDistinciones

    if exists (select * from dbo.sysobjects where id = object_id(N'TipoDictamenes') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table TipoDictamenes

    if exists (select * from dbo.sysobjects where id = object_id(N'GrupoInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table GrupoInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Eventos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Eventos

    if exists (select * from dbo.sysobjects where id = object_id(N'CategoriaInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CategoriaInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'CargoInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table CargoInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'Puestos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Puestos

    if exists (select * from dbo.sysobjects where id = object_id(N'FondoConacyts') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table FondoConacyts

    if exists (select * from dbo.sysobjects where id = object_id(N'AreaInvestigaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table AreaInvestigaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Sectores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Sectores

    if exists (select * from dbo.sysobjects where id = object_id(N'RecursoFinancieroProyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table RecursoFinancieroProyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'Proyectos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Proyectos

    if exists (select * from dbo.sysobjects where id = object_id(N'Instituciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Instituciones

    if exists (select * from dbo.sysobjects where id = object_id(N'Dependencias') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Dependencias

    if exists (select * from dbo.sysobjects where id = object_id(N'Clases') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Clases

    if exists (select * from dbo.sysobjects where id = object_id(N'SNIInvestigadores') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table SNIInvestigadores

    if exists (select * from dbo.sysobjects where id = object_id(N'OrganoExternos') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table OrganoExternos

    if exists (select * from dbo.sysobjects where id = object_id(N'Organizaciones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Organizaciones

    if exists (select * from dbo.sysobjects where id = object_id(N'LineaTematicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table LineaTematicas

    if exists (select * from dbo.sysobjects where id = object_id(N'EstanciaInstitucionExternas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstanciaInstitucionExternas

    if exists (select * from dbo.sysobjects where id = object_id(N'Indices') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table Indices

    if exists (select * from dbo.sysobjects where id = object_id(N'EstatusFormacionAcademicas') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table EstatusFormacionAcademicas

    if exists (select * from dbo.sysobjects where id = object_id(N'ArticuloDifusiones') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table ArticuloDifusiones

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

    create table OrganoInternos (
        Id INT IDENTITY NOT NULL,
       FechaInicial DATETIME null,
       FechaFinal DATETIME null,
       Periodo INT null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ComprobanteOrganoInternoFk INT null,
       UsuarioFk INT null,
       InvestigadorFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       ConsejoComisionFk INT null,
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
       ComprobanteTesisDirigidaFk INT null,
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
       ComprobanteDistincionFk INT null,
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

    create table Dictamenes (
        Id INT IDENTITY NOT NULL,
       Nombre NVARCHAR(250) null,
       FechaDictamen DATETIME null,
       RevistaPublicacionTitulo NVARCHAR(250) null,
       Puntuacion DECIMAL(19,5) null,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       ComprobanteDictamenFk INT null,
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
       ComprobanteAceptadoFk INT null,
       ComprobanteObraTraducidaFk INT null,
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
       ComprobanteEstanciaFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
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
       ComprobanteAceptadoFk INT null,
       ComprobanteLibroFk INT null,
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
       ComprobanteAceptadoFk INT null,
       ComprobanteCapituloFk INT null,
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
       ComprobanteAceptadoFk INT null,
       ComprobanteArticuloFk INT null,
       FirmaFk INT null,
       RevistaPublicacionFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    create table MiembroExternoGrupoInvestigaciones (
        Id INT IDENTITY NOT NULL,
       CreadoEl DATETIME null,
       ModificadoEl DATETIME null,
       Activo BIT null,
       InvestigadorExternoFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       GrupoInvestigacionFk INT null,
       primary key (Id)
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
       ComprobanteAceptadoFk INT null,
       ComprobanteReporteFk INT null,
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

    create table UsuarioRol (
        UsuarioFk INT not null,
       RolFk INT not null
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
       ComprobanteAceptadoFk INT null,
       ComprobanteResenaFk INT null,
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
       ComprobanteCursoFk INT null,
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

    create table GrupoInvestigaciones (
        Id INT IDENTITY NOT NULL,
       NombreGrupoInvestigacion NVARCHAR(250) null,
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
       ComprobanteEventoFk INT null,
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
       ComprobanteCalendarioProyectoFk INT null,
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
       ComprobanteOrganoExternoFk INT null,
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
       ComprobanteAceptadoFk INT null,
       ComprobanteArticuloFk INT null,
       FirmaFk INT null,
       RevistaPublicacionFk INT null,
       DepartamentoFk INT null,
       SedeFk INT null,
       UsuarioFk INT null,
       CreadoPorFk INT null,
       ModificadoPorFk INT null,
       primary key (Id)
    )

    alter table Disciplinas 
        add constraint FKAE79019D8269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table InstitucionProductos 
        add constraint FK7AA809D060A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table InstitucionReporte 
        add constraint FKC8DF9DF4CD01B9AD 
        foreign key (InstitucionProducto) 
        references InstitucionProductos

    alter table InstitucionReporte 
        add constraint FKC8DF9DF43F7A6D9E 
        foreign key (ReporteFk) 
        references Reportes

    alter table InstitucionEvento 
        add constraint FK606D9A92CD01B9AD 
        foreign key (InstitucionProducto) 
        references InstitucionProductos

    alter table InstitucionEvento 
        add constraint FK606D9A925F3ABFEA 
        foreign key (EventoFk) 
        references Eventos

    alter table Subdisciplinas 
        add constraint FK55316DC17EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Editoriales 
        add constraint FKD05EF07F60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Editoriales 
        add constraint FKD05EF07F977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table OrganoInternos 
        add constraint FKE914ED0E9BC08F5B 
        foreign key (ComprobanteOrganoInternoFk) 
        references Archivos

    alter table OrganoInternos 
        add constraint FKE914ED0E99B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table OrganoInternos 
        add constraint FKE914ED0E7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table OrganoInternos 
        add constraint FKE914ED0EC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table OrganoInternos 
        add constraint FKE914ED0E5AE19DB6 
        foreign key (ConsejoComisionFk) 
        references ConsejoComisiones

    alter table Investigadores 
        add constraint FKCECFB5E3DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table TesisDirigidas 
        add constraint FK9BB16BC4A41A1B69 
        foreign key (ComprobanteTesisDirigidaFk) 
        references Archivos

    alter table TesisDirigidas 
        add constraint FK9BB16BC44C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table TesisDirigidas 
        add constraint FK9BB16BC4F7503156 
        foreign key (VinculacionAPyDFk) 
        references VinculacionAPyDes

    alter table TesisDirigidas 
        add constraint FK9BB16BC4F432AF2 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table TesisDirigidas 
        add constraint FK9BB16BC460A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table TesisDirigidas 
        add constraint FK9BB16BC4D3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table TesisDirigidas 
        add constraint FK9BB16BC4F149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table TesisDirigidas 
        add constraint FK9BB16BC48429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table TesisDirigidas 
        add constraint FK9BB16BC48269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table TesisDirigidas 
        add constraint FK9BB16BC47EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table TesisDirigidas 
        add constraint FK9BB16BC4EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table TesisDirigidas 
        add constraint FK9BB16BC47D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table TesisDirigidas 
        add constraint FK9BB16BC4C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table Niveles 
        add constraint FK6EBB49FEF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table IdiomasInvestigadores 
        add constraint FK48F18CB6753CAEC 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table EstadoPaises 
        add constraint FKF3DB9509977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table Distinciones 
        add constraint FK21F6C4DCD998C678 
        foreign key (ComprobanteDistincionFk) 
        references Archivos

    alter table Distinciones 
        add constraint FK21F6C4DC6091310A 
        foreign key (TipoDistincionFk) 
        references TipoDistinciones

    alter table Distinciones 
        add constraint FK21F6C4DC60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Distinciones 
        add constraint FK21F6C4DCCFD6C118 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table Distinciones 
        add constraint FK21F6C4DC977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table Distinciones 
        add constraint FK21F6C4DCBEC82AAA 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table Distinciones 
        add constraint FK21F6C4DC7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Distinciones 
        add constraint FK21F6C4DCC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table Dictamenes 
        add constraint FK530FAD0BA36DFED5 
        foreign key (ComprobanteDictamenFk) 
        references Archivos

    alter table Dictamenes 
        add constraint FK530FAD0B4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Dictamenes 
        add constraint FK530FAD0B7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Dictamenes 
        add constraint FK530FAD0BC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table Dictamenes 
        add constraint FK530FAD0BA550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Dictamenes 
        add constraint FK530FAD0B9F256952 
        foreign key (FondoConacytFk) 
        references FondoConacyts

    alter table Dictamenes 
        add constraint FK530FAD0B17CB0B7C 
        foreign key (TipoDictamenFk) 
        references TipoDictamenes

    alter table ObraTraducidas 
        add constraint FK4C0B95C44C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table ObraTraducidas 
        add constraint FK4C0B95C4F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table ObraTraducidas 
        add constraint FK4C0B95C49FA8791 
        foreign key (ComprobanteObraTraducidaFk) 
        references Archivos

    alter table ObraTraducidas 
        add constraint FK4C0B95C46753CAEC 
        foreign key (IdiomaFk) 
        references Idiomas

    alter table ObraTraducidas 
        add constraint FK4C0B95C4DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ObraTraducidas 
        add constraint FK4C0B95C4A550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ObraTraducidas 
        add constraint FK4C0B95C47D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ObraTraducidas 
        add constraint FK4C0B95C4C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table EstanciaAcademicaExternas 
        add constraint FKD3887694F432AF2 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table EstanciaAcademicaExternas 
        add constraint FKD38876948F751872 
        foreign key (TipoEstanciaFk) 
        references TipoEstancias

    alter table EstanciaAcademicaExternas 
        add constraint FKD388769460A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table EstanciaAcademicaExternas 
        add constraint FKD38876945FF09ED0 
        foreign key (ComprobanteEstanciaFk) 
        references Archivos

    alter table EstanciaAcademicaExternas 
        add constraint FKD38876947D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table EstanciaAcademicaExternas 
        add constraint FKD3887694C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table AutorInternoProductos 
        add constraint FK2FA3AE399B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table AutorInternoCapitulo 
        add constraint FK70291BADC8129C8D 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoCapitulo 
        add constraint FK70291BAD418ABDF0 
        foreign key (CapituloFk) 
        references Capitulos

    alter table AutorInternoResena 
        add constraint FK6447CCBEC8129C8D 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoResena 
        add constraint FK6447CCBEB2F54094 
        foreign key (ResenaFk) 
        references Resenas

    alter table AutorInternoObraTraducida 
        add constraint FK97028A53C8129C8D 
        foreign key (AutorInternoProducto) 
        references AutorInternoProductos

    alter table AutorInternoObraTraducida 
        add constraint FK97028A5340F913DE 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table AutorExternoProductos 
        add constraint FK4D75D1493D94E140 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table AutorExternoProductos 
        add constraint FK4D75D14960A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table AutorExternoCapitulo 
        add constraint FKC8B42EFFCF25D8AD 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoCapitulo 
        add constraint FKC8B42EFF418ABDF0 
        foreign key (CapituloFk) 
        references Capitulos

    alter table AutorExternoResena 
        add constraint FKD1F94958CF25D8AD 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoResena 
        add constraint FKD1F94958B2F54094 
        foreign key (ResenaFk) 
        references Resenas

    alter table AutorExternoObraTraducida 
        add constraint FK30C26649CF25D8AD 
        foreign key (AutorExternoProducto) 
        references AutorExternoProductos

    alter table AutorExternoObraTraducida 
        add constraint FK30C2664940F913DE 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table Libros 
        add constraint FKD6395455F3ABFEA 
        foreign key (EventoFk) 
        references Eventos

    alter table Libros 
        add constraint FKD639545AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Libros 
        add constraint FKD639545DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Libros 
        add constraint FKD6395458269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Libros 
        add constraint FKD639545F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table Libros 
        add constraint FKD6395458A512554 
        foreign key (ComprobanteLibroFk) 
        references Archivos

    alter table Libros 
        add constraint FKD6395457EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Libros 
        add constraint FKD639545EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Libros 
        add constraint FKD6395454C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Libros 
        add constraint FKD639545A550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Libros 
        add constraint FKD6395457D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Libros 
        add constraint FKD639545C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table Capitulos 
        add constraint FK84A1F8504C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Capitulos 
        add constraint FK84A1F850F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table Capitulos 
        add constraint FK84A1F850AF195D41 
        foreign key (ComprobanteCapituloFk) 
        references Archivos

    alter table Capitulos 
        add constraint FK84A1F850AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Capitulos 
        add constraint FK84A1F850DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Capitulos 
        add constraint FK84A1F8508269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Capitulos 
        add constraint FK84A1F8507EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Capitulos 
        add constraint FK84A1F850EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Capitulos 
        add constraint FK84A1F8506D917A44 
        foreign key (EditorialFk) 
        references Editoriales

    alter table Capitulos 
        add constraint FK84A1F8507D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Capitulos 
        add constraint FK84A1F850C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table ParticipacionMedios 
        add constraint FKE8B64D2B4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table ParticipacionMedios 
        add constraint FKE8B64D2B7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ParticipacionMedios 
        add constraint FKE8B64D2BC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table ParticipacionMedios 
        add constraint FKE8B64D2BECE8ECF6 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table ParticipacionMedios 
        add constraint FKE8B64D2BDE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ParticipacionMedios 
        add constraint FKE8B64D2BCFD6C118 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table ParticipacionMedios 
        add constraint FKE8B64D2B17F7F546 
        foreign key (DirigidoAFk) 
        references DirigidoAs

    alter table ExperienciaProfesionales 
        add constraint FK993CEEDD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table ExperienciaProfesionales 
        add constraint FK993CEEDF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table ExperienciaProfesionales 
        add constraint FK993CEED8429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table ExperienciaProfesionales 
        add constraint FK993CEED977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table ExperienciaProfesionales 
        add constraint FK993CEED8269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table ExperienciaProfesionales 
        add constraint FK993CEED7EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table ExperienciaProfesionales 
        add constraint FK993CEEDEC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table ExperienciaProfesionales 
        add constraint FK993CEEDFF98A064 
        foreign key (SectorEconomicoFk) 
        references Sectores

    alter table ExperienciaProfesionales 
        add constraint FK993CEEDA0FE2B9C 
        foreign key (RamaFk) 
        references Ramas

    alter table ExperienciaProfesionales 
        add constraint FK993CEED58244014 
        foreign key (ClaseFk) 
        references Clases

    alter table Articulos 
        add constraint FK8255C720AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Articulos 
        add constraint FK8255C720DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Articulos 
        add constraint FK8255C7208269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Articulos 
        add constraint FK8255C7207EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Articulos 
        add constraint FK8255C720EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Articulos 
        add constraint FK8255C720F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table Articulos 
        add constraint FK8255C72011919BCD 
        foreign key (ComprobanteArticuloFk) 
        references Archivos

    alter table Articulos 
        add constraint FK8255C7204C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Articulos 
        add constraint FK8255C720A550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Articulos 
        add constraint FK8255C7207D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Articulos 
        add constraint FK8255C720C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table MiembroExternoGrupoInvestigaciones 
        add constraint FKC38C88603D94E140 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table MiembroExternoGrupoInvestigaciones 
        add constraint FKC38C8860CE065530 
        foreign key (GrupoInvestigacionFk) 
        references GrupoInvestigaciones

    alter table EstudianteProyectos 
        add constraint FK6094ADB6F432AF2 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table EstudianteProyectos 
        add constraint FK6094ADB6AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipanteInternoProductos 
        add constraint FK2EB4708899B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ParticipanteInternoEvento 
        add constraint FK5A07F722FC016215 
        foreign key (ParticipanteInternoProducto) 
        references ParticipanteInternoProductos

    alter table ParticipanteInternoEvento 
        add constraint FK5A07F722618199EC 
        foreign key (SesionEventoFk) 
        references SesionEventos

    alter table ParticipanteInternoProyecto 
        add constraint FKF19B7504FC016215 
        foreign key (ParticipanteInternoProducto) 
        references ParticipanteInternoProductos

    alter table ParticipanteInternoProyecto 
        add constraint FKF19B7504AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipanteExternoProductos 
        add constraint FK2F89C4723D94E140 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table ParticipanteExternoProductos 
        add constraint FK2F89C47260A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table ParticipanteExternoEvento 
        add constraint FK6E46BE743A35E8C5 
        foreign key (ParticipanteExternoProducto) 
        references ParticipanteExternoProductos

    alter table ParticipanteExternoEvento 
        add constraint FK6E46BE74618199EC 
        foreign key (SesionEventoFk) 
        references SesionEventos

    alter table ParticipanteExternoProyecto 
        add constraint FKFED643A23A35E8C5 
        foreign key (ParticipanteExternoProducto) 
        references ParticipanteExternoProductos

    alter table ParticipanteExternoProyecto 
        add constraint FKFED643A2AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Ramas 
        add constraint FKB569722D3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table Sedes 
        add constraint FK5F10E87A4DA92B48 
        foreign key (DireccionRegionalFk) 
        references DireccionRegionales

    alter table EstadoInvestigadores 
        add constraint FK5040B837EBCCB098 
        foreign key (EstadoFk) 
        references Estados

    alter table EstadoInvestigadores 
        add constraint FK5040B837FB0C1512 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table EstadoInvestigadores 
        add constraint FK5040B83799B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table Reportes 
        add constraint FKA2575FB84C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Reportes 
        add constraint FKA2575FB8F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table Reportes 
        add constraint FKA2575FB868857395 
        foreign key (ComprobanteReporteFk) 
        references Archivos

    alter table Reportes 
        add constraint FKA2575FB8AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Reportes 
        add constraint FKA2575FB860A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Reportes 
        add constraint FKA2575FB8DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Reportes 
        add constraint FKA2575FB87D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Reportes 
        add constraint FKA2575FB8C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table GradoAcademicoInvestigadores 
        add constraint FKD88D160CF432AF2 
        foreign key (GradoAcademicoFk) 
        references GradoAcademicos

    alter table GradoAcademicoInvestigadores 
        add constraint FKD88D160C60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table GradoAcademicoInvestigadores 
        add constraint FKD88D160CFB0C1512 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table GradoAcademicoInvestigadores 
        add constraint FKD88D160C99B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table SesionEventos 
        add constraint FKBE3E38FDCFD6C118 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table SesionEventos 
        add constraint FKBE3E38FD5F3ABFEA 
        foreign key (EventoFk) 
        references Eventos

    alter table UsuarioRol 
        add constraint FK525B81F73F199284 
        foreign key (RolFk) 
        references Roles

    alter table Resenas 
        add constraint FK38C3372DDE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Resenas 
        add constraint FK38C3372D8269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Resenas 
        add constraint FK38C3372D7EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Resenas 
        add constraint FK38C3372DEC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Resenas 
        add constraint FK38C3372D4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Resenas 
        add constraint FK38C3372DF70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table Resenas 
        add constraint FK38C3372D80ADAC4C 
        foreign key (ComprobanteResenaFk) 
        references Archivos

    alter table Resenas 
        add constraint FK38C3372D977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table Resenas 
        add constraint FK38C3372DA550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table Resenas 
        add constraint FK38C3372D6D917A44 
        foreign key (EditorialFk) 
        references Editoriales

    alter table Resenas 
        add constraint FK38C3372D7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Resenas 
        add constraint FK38C3372DC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table ProductoGeneradoProyectos 
        add constraint FK23BBD5A7AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table RevistaPublicaciones 
        add constraint FK3F96D13F60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table RevistaPublicaciones 
        add constraint FK3F96D13F75A0A304 
        foreign key (AreaInvestigacionFk) 
        references AreaInvestigaciones

    alter table RevistaPublicaciones 
        add constraint FK3F96D13FB691E405 
        foreign key (Indice1Fk) 
        references Indices

    alter table RevistaPublicaciones 
        add constraint FK3F96D13FB691E464 
        foreign key (Indice2Fk) 
        references Indices

    alter table RevistaPublicaciones 
        add constraint FK3F96D13FB691E44B 
        foreign key (Indice3Fk) 
        references Indices

    alter table ResponsableProyectos 
        add constraint FKB4774E1E99B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table ResponsableProyectos 
        add constraint FKB4774E1EAB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table FormacionAcademicas 
        add constraint FKF6A54EB12714AF0 
        foreign key (NivelEstudioFk) 
        references NivelEstudios

    alter table FormacionAcademicas 
        add constraint FKF6A54EB60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table FormacionAcademicas 
        add constraint FKF6A54EBF1EEAF6 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table FormacionAcademicas 
        add constraint FKF6A54EB977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table FormacionAcademicas 
        add constraint FKF6A54EBBEC82AAA 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table FormacionAcademicas 
        add constraint FKF6A54EB5585E164 
        foreign key (EstatusFk) 
        references EstatusFormacionAcademicas

    alter table FormacionAcademicas 
        add constraint FKF6A54EBD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table FormacionAcademicas 
        add constraint FKF6A54EBF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table FormacionAcademicas 
        add constraint FKF6A54EB8429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table FormacionAcademicas 
        add constraint FKF6A54EB8269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table FormacionAcademicas 
        add constraint FKF6A54EB7EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table FormacionAcademicas 
        add constraint FKF6A54EBEC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Cursos 
        add constraint FK51FB3D6B7B6B5072 
        foreign key (ComprobanteCursoFk) 
        references Archivos

    alter table Cursos 
        add constraint FK51FB3D6B4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Cursos 
        add constraint FK51FB3D6B12714AF0 
        foreign key (NivelEstudioFk) 
        references NivelEstudios

    alter table Cursos 
        add constraint FK51FB3D6B60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table Cursos 
        add constraint FK51FB3D6BD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table Cursos 
        add constraint FK51FB3D6BF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table Cursos 
        add constraint FK51FB3D6B8429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Cursos 
        add constraint FK51FB3D6B8269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Cursos 
        add constraint FK51FB3D6B7EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Cursos 
        add constraint FK51FB3D6BEC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Cursos 
        add constraint FK51FB3D6B7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Cursos 
        add constraint FK51FB3D6BC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table CoautorInternoProductos 
        add constraint FK8AE9E17B99B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CoautorInternoArticulo 
        add constraint FKF3C86F13796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoArticulo 
        add constraint FKF3C86F13FAA5EC92 
        foreign key (ArticuloFk) 
        references Articulos

    alter table CoautorInternoArticulo 
        add constraint FKF3C86F139C2EC51A 
        foreign key (ArticuloDifusionFk) 
        references ArticuloDifusiones

    alter table CoautorInternoCapitulo 
        add constraint FK611E63D9796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoCapitulo 
        add constraint FK611E63D9418ABDF0 
        foreign key (CapituloFk) 
        references Capitulos

    alter table CoautorInternoEvento 
        add constraint FKA6E29653796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoEvento 
        add constraint FKA6E296535F3ABFEA 
        foreign key (EventoFk) 
        references Eventos

    alter table CoautorInternoLibro 
        add constraint FKCAE881FC796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoLibro 
        add constraint FKCAE881FCB60002A8 
        foreign key (LibroFk) 
        references Libros

    alter table CoautorInternoReporte 
        add constraint FK6603E5B7796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoReporte 
        add constraint FK6603E5B73F7A6D9E 
        foreign key (ReporteFk) 
        references Reportes

    alter table CoautorInternoResena 
        add constraint FK1E834D20796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoResena 
        add constraint FK1E834D20B2F54094 
        foreign key (ResenaFk) 
        references Resenas

    alter table CoautorInternoObraTraducida 
        add constraint FKF4B4811B796AE425 
        foreign key (CoautorInternoProducto) 
        references CoautorInternoProductos

    alter table CoautorInternoObraTraducida 
        add constraint FKF4B4811B40F913DE 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table CoautorExternoProductos 
        add constraint FKF497703D3D94E140 
        foreign key (InvestigadorExternoFk) 
        references InvestigadorExternos

    alter table CoautorExternoProductos 
        add constraint FKF497703D60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table CoautorExternoArticulo 
        add constraint FK4B8176B921E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoArticulo 
        add constraint FK4B8176B9FAA5EC92 
        foreign key (ArticuloFk) 
        references Articulos

    alter table CoautorExternoArticulo 
        add constraint FK4B8176B99C2EC51A 
        foreign key (ArticuloDifusionFk) 
        references ArticuloDifusiones

    alter table CoautorExternoCapitulo 
        add constraint FKB8D51D9F21E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoCapitulo 
        add constraint FKB8D51D9F418ABDF0 
        foreign key (CapituloFk) 
        references Capitulos

    alter table CoautorExternoEvento 
        add constraint FKE87E741D21E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoEvento 
        add constraint FKE87E741D5F3ABFEA 
        foreign key (EventoFk) 
        references Eventos

    alter table CoautorExternoLibro 
        add constraint FKDABD42B621E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoLibro 
        add constraint FKDABD42B6B60002A8 
        foreign key (LibroFk) 
        references Libros

    alter table CoautorExternoReporte 
        add constraint FKEF8CBBF121E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoReporte 
        add constraint FKEF8CBBF13F7A6D9E 
        foreign key (ReporteFk) 
        references Reportes

    alter table CoautorExternoResena 
        add constraint FKFBF99AAE21E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoResena 
        add constraint FKFBF99AAEB2F54094 
        foreign key (ResenaFk) 
        references Resenas

    alter table CoautorExternoObraTraducida 
        add constraint FK11AA730D21E57C45 
        foreign key (CoautorExternoProducto) 
        references CoautorExternoProductos

    alter table CoautorExternoObraTraducida 
        add constraint FK11AA730D40F913DE 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table AreaTematicas 
        add constraint FK20AE56FEF1EEAF6 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table ParticipacionAcademias 
        add constraint FK29751DFAA550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ParticipacionAcademias 
        add constraint FK29751DFA60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table ParticipacionAcademias 
        add constraint FK29751DFA6D917A44 
        foreign key (EditorialFk) 
        references Editoriales

    alter table ParticipacionAcademias 
        add constraint FK29751DFA977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table ParticipacionAcademias 
        add constraint FK29751DFAAB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ParticipacionAcademias 
        add constraint FK29751DFAF1EEAF6 
        foreign key (LineaTematicaFk) 
        references LineaTematicas

    alter table ParticipacionAcademias 
        add constraint FK29751DFA7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ParticipacionAcademias 
        add constraint FK29751DFAC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table ApoyoConacyts 
        add constraint FK611290CEE66C0970 
        foreign key (TipoApoyoFk) 
        references TipoApoyos

    alter table ApoyoConacyts 
        add constraint FK611290CEEFB79030 
        foreign key (SubprogramaConacytFk) 
        references SubprogramaConacyts

    alter table EditorialProductos 
        add constraint FK95FF9F106D917A44 
        foreign key (EditorialFk) 
        references Editoriales

    alter table EditorialProductos 
        add constraint FK95FF9F10977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table EditorialCapitulo 
        add constraint FK1B223D9250094BA5 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialCapitulo 
        add constraint FK1B223D92418ABDF0 
        foreign key (CapituloFk) 
        references Capitulos

    alter table EditorialLibro 
        add constraint FKE6A9761B50094BA5 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialLibro 
        add constraint FKE6A9761BB60002A8 
        foreign key (LibroFk) 
        references Libros

    alter table EditorialResena 
        add constraint FK603B17AF50094BA5 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialResena 
        add constraint FK603B17AFB2F54094 
        foreign key (ResenaFk) 
        references Resenas

    alter table EditorialObraTraducida 
        add constraint FKBFDCF83050094BA5 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialObraTraducida 
        add constraint FKBFDCF83040F913DE 
        foreign key (ObraTraducidaFk) 
        references ObraTraducidas

    alter table EditorialDictamen 
        add constraint FKB6403E3650094BA5 
        foreign key (EditorialProducto) 
        references EditorialProductos

    alter table EditorialDictamen 
        add constraint FKB6403E36286C2BD0 
        foreign key (DictamenFk) 
        references Dictamenes

    alter table GrupoInvestigaciones 
        add constraint FKDC8C485CD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table GrupoInvestigaciones 
        add constraint FKDC8C485CF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table GrupoInvestigaciones 
        add constraint FKDC8C485C8429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Eventos 
        add constraint FK1D37F29CCDE894D 
        foreign key (ComprobanteEventoFk) 
        references Archivos

    alter table Eventos 
        add constraint FK1D37F29C4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Eventos 
        add constraint FK1D37F29C16F1C912 
        foreign key (TipoEventoFk) 
        references TipoEventos

    alter table Eventos 
        add constraint FK1D37F29CDE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Eventos 
        add constraint FK1D37F29CECE8ECF6 
        foreign key (TipoParticipacionFk) 
        references TipoParticipaciones

    alter table Eventos 
        add constraint FK1D37F29C7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Eventos 
        add constraint FK1D37F29CC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table CategoriaInvestigadores 
        add constraint FKF5060288A856491E 
        foreign key (CategoriaFk) 
        references Categorias

    alter table CategoriaInvestigadores 
        add constraint FKF5060288FB0C1512 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table CategoriaInvestigadores 
        add constraint FKF506028899B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table CargoInvestigadores 
        add constraint FK67DC0487ED5635B0 
        foreign key (PuestoFk) 
        references Puestos

    alter table CargoInvestigadores 
        add constraint FK67DC04877D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table CargoInvestigadores 
        add constraint FK67DC0487C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table CargoInvestigadores 
        add constraint FK67DC0487FB0C1512 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table CargoInvestigadores 
        add constraint FK67DC048799B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table RecursoFinancieroProyectos 
        add constraint FKCD54B6D60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table RecursoFinancieroProyectos 
        add constraint FKCD54B6DA4C83338 
        foreign key (MonedaFk) 
        references Monedas

    alter table RecursoFinancieroProyectos 
        add constraint FKCD54B6DAB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table Proyectos 
        add constraint FKF7B54102AC899212 
        foreign key (TipoProyectoFk) 
        references TipoProyectos

    alter table Proyectos 
        add constraint FKF7B541024C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table Proyectos 
        add constraint FKF7B54102E11EACAD 
        foreign key (ComprobanteCalendarioProyectoFk) 
        references Archivos

    alter table Proyectos 
        add constraint FKF7B54102F89C21F 
        foreign key (SectorFinanciamientoFk) 
        references Sectores

    alter table Proyectos 
        add constraint FKF7B541029F256952 
        foreign key (FondoConacytFk) 
        references FondoConacyts

    alter table Proyectos 
        add constraint FKF7B54102DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table Proyectos 
        add constraint FKF7B54102F7503156 
        foreign key (VinculacionAPyDFk) 
        references VinculacionAPyDes

    alter table Proyectos 
        add constraint FKF7B541028269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table Proyectos 
        add constraint FKF7B541027EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table Proyectos 
        add constraint FKF7B54102EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table Proyectos 
        add constraint FKF7B5410213A965E5 
        foreign key (ComprobanteTematicaProyectoFk) 
        references Archivos

    alter table Proyectos 
        add constraint FKF7B54102D3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table Proyectos 
        add constraint FKF7B54102F149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table Proyectos 
        add constraint FKF7B541028429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table Proyectos 
        add constraint FKF7B54102FF98A064 
        foreign key (SectorEconomicoFk) 
        references Sectores

    alter table Proyectos 
        add constraint FKF7B54102A0FE2B9C 
        foreign key (RamaFk) 
        references Ramas

    alter table Proyectos 
        add constraint FKF7B5410258244014 
        foreign key (ClaseFk) 
        references Clases

    alter table Proyectos 
        add constraint FKF7B541027D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table Proyectos 
        add constraint FKF7B54102C225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table Instituciones 
        add constraint FKAAAE1CE1977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table Instituciones 
        add constraint FKAAAE1CE1BEC82AAA 
        foreign key (EstadoPaisFk) 
        references EstadoPaises

    alter table Instituciones 
        add constraint FKAAAE1CE1CFD6C118 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table Instituciones 
        add constraint FKAAAE1CE1D3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table Clases 
        add constraint FKFFA3766FA0FE2B9C 
        foreign key (RamaFk) 
        references Ramas

    alter table SNIInvestigadores 
        add constraint FK25E0AB5BD3079F7E 
        foreign key (SNIFk) 
        references SNIs

    alter table SNIInvestigadores 
        add constraint FK25E0AB5BFB0C1512 
        foreign key (ComprobanteFk) 
        references Archivos

    alter table SNIInvestigadores 
        add constraint FK25E0AB5B99B907D0 
        foreign key (InvestigadorFk) 
        references Investigadores

    alter table OrganoExternos 
        add constraint FK656739CCA261B2D5 
        foreign key (ComprobanteOrganoExternoFk) 
        references Archivos

    alter table OrganoExternos 
        add constraint FK656739CC4C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table OrganoExternos 
        add constraint FK656739CC7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table OrganoExternos 
        add constraint FK656739CCC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table OrganoExternos 
        add constraint FK656739CCD143D092 
        foreign key (TipoOrganoFk) 
        references TipoOrganos

    alter table OrganoExternos 
        add constraint FK656739CCD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table OrganoExternos 
        add constraint FK656739CCCFD6C118 
        foreign key (AmbitoFk) 
        references Ambitos

    alter table OrganoExternos 
        add constraint FK656739CC977C6E8C 
        foreign key (PaisFk) 
        references Paises

    alter table Organizaciones 
        add constraint FK3CD56022D3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FB7D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FBC225E46C 
        foreign key (SedeFk) 
        references Sedes

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FB8F751872 
        foreign key (TipoEstanciaFk) 
        references TipoEstancias

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FB60A0B556 
        foreign key (InstitucionFk) 
        references Instituciones

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FBD3448B38 
        foreign key (SectorFk) 
        references Sectores

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FBF149DD42 
        foreign key (OrganizacionFk) 
        references Organizaciones

    alter table EstanciaInstitucionExternas 
        add constraint FKF00501FB8429231C 
        foreign key (Nivel2Fk) 
        references Niveles

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00AB112DBA 
        foreign key (ProyectoFk) 
        references Proyectos

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00DE05D932 
        foreign key (AreaTematicaFk) 
        references AreaTematicas

    alter table ArticuloDifusiones 
        add constraint FK58CB3C008269DCA 
        foreign key (AreaFk) 
        references Areas

    alter table ArticuloDifusiones 
        add constraint FK58CB3C007EF62BBA 
        foreign key (DisciplinaFk) 
        references Disciplinas

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00EC8F6488 
        foreign key (SubdisciplinaFk) 
        references Subdisciplinas

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00F70FAF0B 
        foreign key (ComprobanteAceptadoFk) 
        references Archivos

    alter table ArticuloDifusiones 
        add constraint FK58CB3C0011919BCD 
        foreign key (ComprobanteArticuloFk) 
        references Archivos

    alter table ArticuloDifusiones 
        add constraint FK58CB3C004C0F59DE 
        foreign key (FirmaFk) 
        references Firmas

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00A550D9B2 
        foreign key (RevistaPublicacionFk) 
        references RevistaPublicaciones

    alter table ArticuloDifusiones 
        add constraint FK58CB3C007D4FAF1A 
        foreign key (DepartamentoFk) 
        references Departamentos

    alter table ArticuloDifusiones 
        add constraint FK58CB3C00C225E46C 
        foreign key (SedeFk) 
        references Sedes

