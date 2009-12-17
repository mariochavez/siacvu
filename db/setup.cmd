call clean.bat

sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CleanDBSchema.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i Inicializacion.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i Inicializacion1.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt1.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt2.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt3.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt4.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt5.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt6.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt7.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt8.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt9.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt10.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt11.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i CatalogosConacyt12.sql
sqlcmd -S SERVERAPLI\SQLEXPRESS -d siacvudev -E -i PublicacionesSetup.sql