call clean.bat

sqlcmd -S (local) -d siacvu -E -i CleanDBSchema.sql
sqlcmd -S (local) -d siacvu -E -i Inicializacion.sql
sqlcmd -S (local) -d siacvu -E -i Inicializacion1.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt1.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt2.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt3.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt4.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt5.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt6.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt7.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt8.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt9.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt10.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt11.sql
sqlcmd -S (local) -d siacvu -E -i CatalogosConacyt12.sql
sqlcmd -S (local) -d siacvu -E -i PublicacionesSetup.sql