<<<<<<< HEAD:db/initdb.sql
INSERT Personas VALUES('Administrador', null, null, 'admin@mail.com', 1, GETDATE(), 1, GETDATE(), 1)
INSERT Personas VALUES('Peter', 'Parker', null, 'admin@mail.com', 1, GETDATE(), 1, GETDATE(), 1)

INSERT Usuarios VALUES('administrador', 'admin', 1, GETDATE(), 1, GETDATE(), 1, 1)
INSERT Usuarios VALUES('pparker', 'parker', 1, GETDATE(), 1, GETDATE(), 1, 2)

INSERT Roles VALUES('Administradores', 1, GETDATE(), 1, GETDATE(), 1)
INSERT Roles VALUES('Investigadores', 1, GETDATE(), 1, GETDATE(), 1)

INSERT UsuarioRol VALUES(1, 1)
INSERT UsuarioRol VALUES(2, 2)

/* Faltan estos valores */
insert into Departamentos values('Departament 1',1,GETDATE(),1,GETDATE(),1);
insert into Departamentos values('Departament 2',1,GETDATE(),1,GETDATE(),1);
insert into Departamentos values('Departament 3',1,GETDATE(),1,GETDATE(),1);

insert into Estados values('Activo',1,GETDATE(),1,GETDATE(),1);
insert into Estados values('Baja',1,GETDATE(),1,GETDATE(),1);
insert into Estados values('Sabático',1,GETDATE(),1,GETDATE(),1);
insert into Estados values('Licencia c/ sueldo',1,GETDATE(),1,GETDATE(),1);
insert into Estados values('Licencia s/ sueldo',1,GETDATE(),1,GETDATE(),1);
insert into Estados values('Superación académica',1,GETDATE(),1,GETDATE(),1);

insert into GradoAcademicos values('Licenciatura',1,GETDATE(),1,GETDATE(),1);
insert into GradoAcademicos values('Maestría',1,GETDATE(),1,GETDATE(),1);
insert into GradoAcademicos values('Doctor',1,GETDATE(),1,GETDATE(),1);

insert into Categorias values('Titular A',1,GETDATE(),1,GETDATE(),1);
insert into Categorias values('Titular B',1,GETDATE(),1,GETDATE(),1);
insert into Categorias values('Titular C',1,GETDATE(),1,GETDATE(),1);
insert into Categorias values('Asociado A',1,GETDATE(),1,GETDATE(),1);
insert into Categorias values('Asociado B',1,GETDATE(),1,GETDATE(),1);
insert into Categorias values('Asociado C',1,GETDATE(),1,GETDATE(),1);

insert into Cargos values('Investigador',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director de Departamento',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director Regional',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Coordinador de Programa',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Presidente',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Secretario General Académico',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Coordinador de Departamento de Apoyo',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Coordinador de Oficinas de Enlace y Vinculación',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director de Posgrado',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director General de Vinculación y Apoyo Académico',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director General Académico',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Becario de Alto Nivel',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Investigador por Proyecto',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Secretario General de Planeación y Desarrollo Institucional',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Direccion General de Administracion y Finanzas',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Direccion General Regional Noroeste',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Direccion de Area',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Otros',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Coordinador de Posgrado',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Coordinador de EcoParque',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Asistente de Director',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Estudiante Becario',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Investigador visitante',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director General de Docencia',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director General de Vinculación Institucional',1,GETDATE(),1,GETDATE(),1);
insert into Cargos values('Director General de Asuntos Académicos',1,GETDATE(),1,GETDATE(),1);

insert into SNIs values('Candidato',1,GETDATE(),1,GETDATE(),1);
insert into SNIs values('Nivel 1',1,GETDATE(),1,GETDATE(),1);
insert into SNIs values('Nivel 2',1,GETDATE(),1,GETDATE(),1);
insert into SNIs values('Nivel 3',1,GETDATE(),1,GETDATE(),1);
insert into SNIs values('Emerito',1,GETDATE(),1,GETDATE(),1);

insert into Sedes values('Matamoros','Dirección General Regional Noreste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Nuevo Laredo','Dirección General Regional Noreste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Piedras Negras','Dirección General Regional Noreste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Monterrey','Dirección General Regional Noreste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Ciudad Juarez','Dirección General Regional Noroeste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Tijuana','Tijuana',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Mexicali','Dirección General Regional Noroeste',1,GETDATE(),1,GETDATE(),1);
insert into Sedes values('Nogales','Dirección General Regional Noroeste',1,GETDATE(),1,GETDATE(),1);
=======
insert into Estados values('Activo',null,GETDATE(),null,GETDATE(),1);
insert into Estados values('Baja',null,GETDATE(),null,GETDATE(),1);
insert into Estados values('Sabático',null,GETDATE(),null,GETDATE(),1);
insert into Estados values('Licencia c/ sueldo',null,GETDATE(),null,GETDATE(),1);
insert into Estados values('Licencia s/ sueldo',null,GETDATE(),null,GETDATE(),1);
insert into Estados values('Superación académica',null,GETDATE(),null,GETDATE(),1);

insert into GradoAcademicos values('Licenciatura',null,GETDATE(),null,GETDATE(),1);
insert into GradoAcademicos values('Maestría',null,GETDATE(),null,GETDATE(),1);
insert into GradoAcademicos values('Doctor',null,GETDATE(),null,GETDATE(),1);

insert into Categorias values('Titular A',null,GETDATE(),null,GETDATE(),1);
insert into Categorias values('Titular B',null,GETDATE(),null,GETDATE(),1);
insert into Categorias values('Titular C',null,GETDATE(),null,GETDATE(),1);
insert into Categorias values('Asociado A',null,GETDATE(),null,GETDATE(),1);
insert into Categorias values('Asociado B',null,GETDATE(),null,GETDATE(),1);
insert into Categorias values('Asociado C',null,GETDATE(),null,GETDATE(),1);

insert into Cargos values('Investigador',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director de Departamento',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director Regional',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Coordinador de Programa',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Presidente',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Secretario General Académico',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Coordinador de Departamento de Apoyo',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Coordinador de Oficinas de Enlace y Vinculación',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director de Posgrado',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director General de Vinculación y Apoyo Académico',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director General Académico',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Becario de Alto Nivel',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Investigador por Proyecto',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Secretario General de Planeación y Desarrollo Institucional',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Direccion General de Administracion y Finanzas',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Direccion General Regional Noroeste',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Direccion de Area',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Otros',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Coordinador de Posgrado',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Coordinador de EcoParque',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Asistente de Director',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Estudiante Becario',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Investigador visitante',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director General de Docencia',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director General de Vinculación Institucional',null,GETDATE(),null,GETDATE(),1);
insert into Cargos values('Director General de Asuntos Académicos',null,GETDATE(),null,GETDATE(),1);

insert into SNIs values('Candidato',null,GETDATE(),null,GETDATE(),1);
insert into SNIs values('Nivel 1',null,GETDATE(),null,GETDATE(),1);
insert into SNIs values('Nivel 2',null,GETDATE(),null,GETDATE(),1);
insert into SNIs values('Nivel 3',null,GETDATE(),null,GETDATE(),1);
insert into SNIs values('Emerito',null,GETDATE(),null,GETDATE(),1);

insert into Sedes values('Matamoros','Dirección General Regional Noreste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Nuevo Laredo','Dirección General Regional Noreste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Piedras Negras','Dirección General Regional Noreste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Monterrey','Dirección General Regional Noreste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Ciudad Juarez','Dirección General Regional Noroeste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Tijuana','Tijuana',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Mexicali','Dirección General Regional Noroeste',null,GETDATE(),null,GETDATE(),1);
insert into Sedes values('Nogales','Dirección General Regional Noroeste',null,GETDATE(),null,GETDATE(),1);

insert into TipoArticulos values('Artículo con arbitraje',null,GETDATE(),null,GETDATE(),1);
insert into TipoArticulos values('Artículo sin arbitraje',null,GETDATE(),null,GETDATE(),1);
insert into TipoArticulos values('Artículo traducido a otro idioma',null,GETDATE(),null,GETDATE(),1);

insert into Indices values('CLASE',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('CONACYT',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('DIALNET',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('ECON-LIT',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('HAPI',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('HLAS',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('IN-RECS',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('ISI',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('JSTOR',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('LATINDEX',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('RedAlyc',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('Padrón anterior',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('Indice no aprobado',null,GETDATE(),null,GETDATE(),1);
insert into Indices values('Sin índice',null,GETDATE(),null,GETDATE(),1);

insert into Instituciones values('Universidad Externado de Colombia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Ayuntamiento de Matamoros',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('DIF Matamoros',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Casa de las Culturas del Mundo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Mexicano de la Juventud',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Universitario de Ciencias Sociales y Humanidades. Universidad de Guadalajara',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Investigaciones Jurídicas de la UNAM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Organización Jóvenes Demócratas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Producen',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fuerza Aerea de Chile',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría  Plan del Desarrollo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UAM-Iztapalapa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CEISAL',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UABC MEXICALI',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Nacional Autónoma de México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de York',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma Metropolitana - Azcapotzalco',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CREDAL',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SOMDE, CONAPO, CRIM, UNFPA',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Organización Política Alemana Jóvenes Demócratas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Veracruzana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Michoacana de San Nicolás de Hidalgo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Asociación Mexicana de Estudios del Trabajo','Oscar Contreras Montellanos',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Banco Interamericano de Desarrollo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnologico de Piedras Negras',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Tecnológica Centroamericana (Honduras)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('The University of Califronia and The COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of East Anglia G.B.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SOMEE (Sociedad Mexicana de Estudios Electorales)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('REVES 15, Universidad de Guadalajara y COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('The University of the Texas at Austin',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Random House Mondadori',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Raya en el Agua',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Culturas Populares del ICBC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Latin American Studies Association',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Sonora',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Investigación en Alimentación y Desarrollo (CIAD)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UIA-Noroeste, El COLEF, CETYS, DIF- municipal, CSPP, Alliant University Children s Hospital',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Suth western College',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Asociación Latino-Iberoamericana de Gestión Tecnológica',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Colegio de Michoacán',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Planned Parethood, Instituto nacional de la mujer y COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Planned parenthood, de San Diego  Instituto estatal de la mujer de BC y COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Plan Estratégico de Ciudad Juárez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Estudios Culturales. Museo UABC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University Galery',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('IMAFED','Secretaría de Gobernación',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Georgetown University, Washington, DC, Estados Unidos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad La Sapienza, Roma',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Maestría en Estudios Latinoamericanos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico de Estudios Superiores de Occidente',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico y de Estudios Superiores de Occidente',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('XVII Ayuntamiento de Tijuana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CEPAL-CELADE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('La Comisión de Cooperación Laboral',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Gobierno de Italia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidada de Guadalajara',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Pedagógica Nacional',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio de México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Salud Pública',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Red Internacional  de Colaboración en las Ciencias del Comportamiento',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Iberoamericana Noroeste',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Southwestem College',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación Mexicana de la Salud',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Zacatecas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Iberoamericana Noroeste en colaboración con El Colef',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Investigaciones Dr. José María Luis Mora',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Organización de Estados Iberamericanos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Baja California Sur',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Scalabrini House of Theology',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio de Tamaulipas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Panamericano de Humanidades',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad del Noreste de México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Comunitario de Salud Mental de Regla',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Whittir College',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión para Prevenir y Erradicar la Violencia Contra las Mujeres en Ciudad Juárez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Weatherhead Center Harvard University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Redlands',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de chihuahua',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Sociedad Cubana de Psiquiatría',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Foro Migraciones',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universite de Nice-Sophia Antipolis',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Administración Pública del Estado de Quintana Roo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Estudios Universitarios Xochicalco',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión Ciudadana de Derechos Humanos Noroeste A.C.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Salud',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Yucatán',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Red Internacional de Investigadores en Ciencias Sociales y Humanas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ENLACE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Estudios Superiores del Noroeste',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de la Habana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Interamericano de Estudios de Seguridad Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de La Laguna, Tenerife, España',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Investigacines Biológicas del Noroeste',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Trakya University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('San Diego Natural History Museum',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Enseñanza Técnica y Superior',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Politécnico Nacional',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Université de Poitiers',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio de San Luis',null,null,null,GETDATE(),null,GETDATE(),1);

insert into Instituciones values('Université d Orléans',null,null,null,GETDATE(),null,GETDATE(),1);

insert into Instituciones values('Universidad Autónoma del Estado de Hidalgo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University San Diego',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consulado de los Estados Unidos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of Pittsburgh',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Investigación y Estudios Avanzados-IPN',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Complutense de Madrid',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Milán',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Sin Fronteras',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Rey Juan Carlos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Woodrow Wilson Center',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Murcia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Madrid',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COLEF-UABC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Écoles des Hautes Études en Sciences Sociales (EHESS). Université de Paris, Sorbonne',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fondo de las Naciones Unidas para la Infancia (UNICEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colef, UABC, Universidad de California San Diego, Universidad Estatal de San Diego',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Woodbury University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Latina de Panamá',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión Interamericana de Mujeres',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of Essex',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Seminario Mayor de Nuevo Laredo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Mexicano de Doctrina Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Fronterizo de Promoción de Derechos Humanos A.C.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación para el Debido Proceso Legal',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Nacional para Tribunales Estatales',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Relaciones Exteriores',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión Internacional de Límites y Aguas entre México y Estados Unidos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Coalición Pro Defensa del Migrante',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Michoacana de San Nicolás Hidalgo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Washington',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Queretaro',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Rural Services Research Institute',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Cristóbal Colon',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión Económica para América Latina-México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Institut National de Etude Demogaphiques',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de la Comisión de Población',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Sin Fronteras, A.C',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Asuntos Migratorios de la LIX Legislatura de la Cámara de Diputados',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of  California, San Diego',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad del Caribe',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Museo de Historia Mexicana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consejo Nacional para Prevenir la Discriminación',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('La Comisión Coordinadora y las Instituciones Convocantes',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Sonora, UAS,  UABC, Centro de Investigación en Alimentación y Desarrollo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Deutscher Akademischer Austauschdienst Servicio Alemán  de Intercambio Académico',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of Skovde',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Antropología e Historia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universitat de Valencia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Facultad de Psicología Universidad de la Habana','Dr. Dionisio Zaldivar Pérez',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Investigación e Inversión estrategica del Gobierno de Guanajuato',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Francisco Gavidia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Referencia Latinoamericano para la Educación Especial',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad UNIVER Noroeste',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Tijuana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universite de Toulouse',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico de Ciudad Juárez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Xochicalco',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Iowa States University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma del Estado de Morelos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Gobierno del Estado de Coahuila',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Medical School',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Red de Salud de las Mujeres Latinoamericanas y del Caribe',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Observatorio Ciudadano del Feminicidio',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Valencia',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Michoacana del Oriente',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Tecnológico de Monterrey',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Investigaciones y Estudios Superiores en Antropología Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('East Carolina University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Ayuntamiento de Nuevo Laredo','Horacio Garza Garza - Presidente Municipal',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Ayuntamiento de Tijuana','José Guadalupe Osuna Millán - Presidente Municipal',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Barton Aschman Associates','Roberto C. Scales',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CECUT','Alfredo Alvarez - Director General',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CESPT','Ismael Grijalba Palomino - Director General',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CICESE','Mario Martínez García - Director General',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CIESAS','Dr. Raúl Loyola Díaz  - Director General, Lic. Araceli Mercado','relinst@juarez.ciesas.edu.mx',null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CNIME','Humberto Inzunza Fonseca - Presidente','hinzunza@telnor.net',null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COLMEX','Andrés Lira González - Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CONACYT','Jaime Martuscelli Quintana - Director Adjunto de Investigación Científica y Secretario Ejecutivo Sup',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SIREYES','Héctor Menchaca Solís',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CONAGUA','Ing. Guillermo Villalobos - Director General',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CONAPO','Rosa María Ruvalcaba - Directora General de Estudios de Población',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COPARMEX','Pedro Matín Briones - Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CUT','Jesús J. Ruiz Barraza - Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('FLACSO-Guatemala','Dr. René Eduardo Poitevin - Director',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Ford Foundation','No tiene',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('FOSIMAC','Martín L. Celaya Barragan - Secretario Técnico',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('FOSIREYES','Héctor Menchaca Solís',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('FOSIVILLA','Eduardo Hurtado García - Secretario Técnico',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación Friedrich Ebert','Lic. Ekart Wild - Representante',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Gobierno del Estado SCT','Héctor Terán Terán - Gobernador Constitucional de B. C.',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Gobierno del Estado de Chihuahua','Jesús M. Sandoval Armenta - Director General de Fomento Económico',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Federal Electoral','José Woldenberg Karakosky - Consejero Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('INEGI','Carlos M. Jarque - Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico de la Paz','M.C. Marcelino Bauza Rosete - Director',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ITPN','Víctor Manuel Ibarra Balderas - Director',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ISSSTE','Lic. Olimpia Talla Jiménez',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Medicina Social Comunitaria','Blanca Lomelí - Directora',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('New Mexico State University','William Conroy - Presidente',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SEMARNAP','No tiene',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Ecología','Miguel Anguel Cancino Aguilar',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SDSU','Nancy A. Marlin - Provost and Vicepresidente of Academic Affaris',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SEBS','M.C. Lorenzo Gómez Morín - Secretario',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SEDESOL','Lic. Mario Palma Rojo - Subsecretario de Desarrollo Regional',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SRE','Embajador Jorge Alberto Lozoya - Director Ejecutivo',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('STPS','Lic. Humberto Lugo Gil - Oficial Mayor',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SOMEDE','Carlos Welti',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('TAMIU','J. Charles Jennet - President',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UABC','Héctor Everaldo Beltrán Corona - Rector',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Coahuila','No tiene',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UABCS','Jorge Alberto Vale Sánchez - Rector',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Colima','Carlos Salazar Silva - Rector',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autonoma Metropolitana Iztapalapa','Terán Casa Nueva - Rector',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UIA - Noroeste','Humberto Barquera Gómez - Apoderado',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('WWU','Johm O. Stubbs - President and Vice Chancellor',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SFU','Johm O. Stubbs - Presidente and Vice Chancellor',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Migración','No tiene',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaria de Comercio','Jose Perez','jperez@sc.com',null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Guadalajara',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Ciudad Juárez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('S.E.P.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CREA',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Guadalajara',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('XIII Ayuntamiento de Mexicali',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Nuevo León',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fondo de Cultura Económica',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Miguel Ángel Porrúa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UNAM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colmex',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría del Trabajo y Previsión Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consejo Nacional de Población',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Asociacón Latinoamericana de Sociología',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ORSTOM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consejo Estatal de Población de Oaxaca',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ITESO',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Chicana/Latina Research Center-UCD',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Plaza y Valdez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Iberoamericana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Programa Cultural de las Fronteras',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Conaculta',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('IRD',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Wisconsin','Alberto Palloni',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Iberomericana Santa Fé',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consorcio transfronterizo de investigación en Acción',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de investigación y Docencia Económica',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of Texas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación Rockefeler',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fondo Nacional para la Cultura y las Artes',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Procuraduría Federal de Protección al Ambiente',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consejo de Desarrollo Económico de Tijuana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Organización Panamericana de la Salud Ely Lilly',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Programa Interdisciplinario de Estudios de la Mujer (PIEM)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación Mac Arthur',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Gobernación',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UC Mexus',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SAHOPE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of Southern California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión de Cooperación Ambiental México-Estados Unidos',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Sistema de Investigación Francisco Villa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión de Cooperación Económica Fronteriza (COCEF)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Organización Franco y Asociados',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Municipio de Juarez, Chihuahua',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Junta Municipal de Agua y Saneamiento',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SIMAC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of California, in Santa Cruz, Ca.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Parsons Transportation Group','Thomas E. Barron',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Colegio de Postgraduados',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COESPO-GUANAJUATO','DR. LUIS FERNANDO MACIAS GARCIA',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('HEWLETT FOUNDATION',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('USC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('AIDS RESEARCH PROGRAM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('USAID',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colef',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión de Cooperación Ecologica',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('The Border Studies Program',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Energía de la Federación',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Institut De Recherche Pour Le Development',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Compton Foundation',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('San Diego State University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('International Community Foundation',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COESPO ( SONORA )',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Baker & Associates, energy Consultants',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Nutrición',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CDT de Tecate',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fundación El Colef',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Municipio de San Pedro Garza Garcia Nuevo León',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio Mexiquense','Iracheta Cenecorta Alfonso Xavier',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Mexicano de Seguro Social','David Ontiveros',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Environmental Resources Management',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Camp Dresser & Mckee Inc.',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fideicomiso','Ramiro Moreno Navarro',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Subsecretaria de asuntos religiosos en la Sec. de Gobernación',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('SEMPRA ENERGY MEXICO',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Dir. Gral. Finanzas del Gobierno de Chihuahua',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Estatal de Michigan','Scott Whiteford',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Mexicano del Seguro Social','David Ontiveros',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Cuentas Bancarias','Ramiro Moreno Navarro',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('FLACSO - MEXICO',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico y de Estudios Superiores de Monterrey',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Tecnológica de Matamoros',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Universitario del Noreste',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Municipal de Planeación',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Comisión para Asuntos de la Frontera Norte',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Archivo General del Estado de Nuevo León',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Texas El Paso',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UAM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Desarrollo Urbano y Obras Públicas del Gobierno del Estado de Nuevo León',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Consejo Estatal de Población',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CONARTE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Otro',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('International Community Foundation San Diego, Ca.','Richard Kiy',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Cultura de Baja California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Southwestern College',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Pacific Sociological association',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('ITAM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autonoma de Sinaloa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('St Josephs Inivercity',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Loyola Marymount University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fairfiled University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('LaSalle University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('John Carrol University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Monterrey',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio de Michoacán',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Tamaulipas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Tecnológico de Nuevo Laredo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Interamericana del Norte',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Museo Casamata',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Investigación en Materiales Avanzados (CIMAV)','David Ríos Jara',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('St. Josephs University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Layola College',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University  of Notre Dame',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Institut Natinal Du Travail de Emploi et de la formation professionnelle',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma Metropolitana-Xochimilco',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Gabriel Zzekely Sánchez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Quitar Juarez',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Banco de México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CIAD',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autonoma del Estado de México',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('INESER',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('El Colegio de Sonora',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Guanajuato',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('nada tijuana',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro Regional de Investigación Multidisciplinaria CRIM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Puebla (UAP)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('INSP',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('INSAD',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Estudios México- Estados Unidos','Universidad de California en San Diego',null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de Altos Estudios Internacionales',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Escuela Nacional de Antropología e Historia. Unidad Chihuahua',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Casa del Migrante en Tijuana, Centro Scalabrini',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Colegio de Michoacan',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Planned parethood, Instituto estatal de la mujer  de BC y COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Baja California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CIDE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Tijuana Trabaja',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de San Francisco',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Planned parethood de San Diego, Instituto estatal de la mujer de BC y COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Hosei University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CREDAL, COLEF e ITESM',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Grupo Editorial EON',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autonóma Agraria Antonio Narro (UAAAN)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('University of California, San Diego (UCSD)',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('The University of California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('The University of California and El Colegio de la Frontera Norte',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Estatal de San Diego',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Red nacional  de colaboración en las ciencias del comportamiento',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('CETYS-Universidad',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma de Sinaloa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Barcelona',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Plaza & Janés',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('IMAC',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Escuela Normal Fronteriza',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('INSITE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Department of chicana chicano studies',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Harvard University',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UPN',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto Nacional de Desarrollo Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('UABC Ensenada',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Secretaría de Desarrollo Social',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad de Guadalajara y El COLEF',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Fondo Poblacional de Naciones Unidas',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Universidad Autónoma Metropolitana-Iztapalapa',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Centro de Estudios Estratégicos para el Desarrollo',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('COLEF - CICESE',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Instituto de la Mujer para el Estado de Baja California',null,null,null,GETDATE(),null,GETDATE(),1);
insert into Instituciones values('Arizona State University',null,null,null,GETDATE(),null,GETDATE(),1);

insert into TipoParticipaciones values('Ponente',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipaciones values('Comentarista',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipaciones values('Moderador',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipaciones values('Coordinador de Mesa',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipaciones values('Organizador',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipaciones values('Coorganizador',null,GETDATE(),null,GETDATE(),1);

insert into TipoActividades values('Investigación',null,GETDATE(),null,GETDATE(),1);
insert into TipoActividades values('Docencia',null,GETDATE(),null,GETDATE(),1);
insert into TipoActividades values('Vinculación',null,GETDATE(),null,GETDATE(),1);

insert into TipoCapitulos values('Capitulo con arbitraje',null,GETDATE(),null,GETDATE(),1);
insert into TipoCapitulos values('Capitulo sin arbitraje',null,GETDATE(),null,GETDATE(),1);
insert into TipoCapitulos values('Capitulo traducido a otro idioma',null,GETDATE(),null,GETDATE(),1);
insert into TipoCapitulos values('Ponencia publicada',null,GETDATE(),null,GETDATE(),1);
  
insert into FormaParticipaciones values('Editor',null,GETDATE(),null,GETDATE(),1);
insert into FormaParticipaciones values('Compilador',null,GETDATE(),null,GETDATE(),1);
insert into FormaParticipaciones values('Coordinador',null,GETDATE(),null,GETDATE(),1);

insert into TipoParticipantes values('Persona Fisica',null,GETDATE(),null,GETDATE(),1);
insert into TipoParticipantes values('Investigador',null,GETDATE(),null,GETDATE(),1);


insert into InvestigadorExternos values('Acevedo Gladys', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aceves Calderón Patricia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Adolfo Sánchez Rebolledo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Adrian de León Arias', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Adriana Chávez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('AGERWALD VINOD', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aguilar Barajas Ismael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aguilar Ismael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aguilar Villanueva Luis Fernando', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Agustín Sández Pérez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alan R. Sweedler', null, 'Acting Assitant Vice President for  International Programs', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('ALARCÓN DIANA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Albert Berry', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alberto Palloni', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alberto Palloni', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Albornoz Liliana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alegre Lisette', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alejandro Canales Cerón', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alejandro Cervantes Carson', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alejandro Diaz Bautista', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alejandro Mungaray', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alejandro Rodríguez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('ALFONSO DIAZ JIMENEZ', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alfonso Macias Laylle', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alfredo Alvarez', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alfredo Lattes', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alfredo Limas Hernández', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alicia Maguid', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alicia Ziccandi', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Allen Jedicka', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Alma Rodríguez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Álvarez de la Torre Guillermo Benjamin', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Amelia Malagamba', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('AMEZCUA M.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Amorim Mónica', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Amuedo Dorantes Catalino', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ana Celia Zentella', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ana Leticia Salcedo Rocha', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ana Luz Torres Martínez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ana María López Salas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ana Martínez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Andrea Revueltas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Andrés Lira González', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Andrés Tornos Cubillo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Angel López López', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Angel Ronald', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Angela Renee De la Torre Castellanos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Anne Runyan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aparicio Mijares Francisco Javier', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Araceli Mercado', 'relinst@juarez.ciesas.edu.mx', null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Aralia López González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Arreola Hernández Francisco', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Arroyo Magaña Wendy', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Arturo Lara', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Atsuko Tanabe', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ayllón Trujillo María Teresa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Azizur R. Khan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Balbuena Raúl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Banda Gustavo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Baptista Raúl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bárbara A. Driscoll', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Basilia Valenzuela V.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Basilio Verduzco Chávez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('BASSOLS MARIO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Baudasse Thierry', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Benitez Raúl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Benítez Raúl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bensúnsan Graciela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bergareche Ana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernal Guillermo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernard Bauer O.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernardo de Jesús Saldaña Téllez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernardo Flores Báez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernardo González Aréchiga', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bernardo Romero Vázquez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Blackwell Maylei', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Blanca Acedo', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Blanca Lomelí', null, 'Directora', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Blanca Rodríguez', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Brodine Stephanie', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Brown Christopher', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Brown-Gort Allert', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Brugeilles Carole', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Brusati Annalisa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bullock Stephen', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('BUNCLE KARIN', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Bustelo Ruesta María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Caballero Ortega Heriberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cabrero Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cadena Magdalena', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Calderón Chelius Leticia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Caldéron Segura Esther', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Camacho Gonzalo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('CAMERON MAXWELL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Campos Marcia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Canales Ceron Alejandro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cañedo Solares Irma', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cantú Martínez Pedro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cappello Héctor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cardona Antonio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carla Pederzini', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos Graizbord', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos Gutiérrez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos M. Jarque', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos Salazar Silva', null, 'Rector', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos Silva', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carlos Welti', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carole Brugeilles', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Carrillo Arturo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('CASASOLA S.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('CASTILLO DEBRA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('CASTILLO MANUEL ÁNGEL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Castillo Octelina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Castro Ceiro Teresa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Castro Teresa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Catalina Denman', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cázares Rivera Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cejudo Guillermo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Celaya Tentori Minerva', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cerutti Mario', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cesar Alfredo Olivas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('César Benítez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('César González González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Chavez Ana María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Chávez Galindo Ana María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Chávez Mauricio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Christian Zlolnisky Palacios', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Christopher Brown', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Claudia Sandoval', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Claudio Mauricio Stern Feiter', null, 'INSTITUCION OMS', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Claudio Mauricio Stern Feitler', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Clemente Ruiz Durán', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Clemente Zúñiga', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Concepción Martínez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Conde Carlos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Conde González Carlos Jesús', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Conde Zambada Gilberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('CONTRERAS OSCAR', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cordera Campos Rolando', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Córdova Plaza Rosío', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cornelius Wayne', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Corona Paez Sergio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Corral Osuna Beatriz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Corral Rafael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cosio María Eugenia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cosio-Zavala María Eugenia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('COUTIGNO RAMÍREZ ANA CLAUDIA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cristina Ocampo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cruz Norma', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Cuauhtémoc Calderón Villarreal', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Dae Won Choi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Daniel Delaunay', null, 'No tiene', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Daniel Delaunay', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Daniel Hernandez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Daniel Venegas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Danielé Joly', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Ontiveros', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Pepper', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Runsten', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Runsten Ruíz Clemente', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Schauer', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('David Sroaf', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Dávila Alejandro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('de la O María Eugenia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('de la Torre Rodolfo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('De Lucas Javier', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('de Oliveira Orlandina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('de Oliveira Orlando', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Dennis L. Soden', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Diana Alarcón González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Djamel Toudert', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Domínguez Santos Rufino E.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Dr. J.C. Agunwamba', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Duane G. Metzger', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Durand Jorge', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Echarri Canovas Carlos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Edmé Domínguez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eduardo González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eduardo Hurtado García', null, 'Secretario Técnico', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eduardo López', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eduardo Margáin', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eduardo Zepeda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Edward Brown', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ekart Wild', null, 'Representante de la Fundación Friedrich Ebert', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Elena Bilbao', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Elena Urrutia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Eliseo Mendoza Berrueto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Elizabeth Juárez Cerdi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Embajador Jorge Alberto Lozoya', null, 'Director Ejecutivo', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Emeterio Martínez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Enrique Dussel', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Enrique Hernández Laos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Enrique Luengo González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('ENUAU EMILIO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ernesto Jáuregui', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('ESCANDÓN JULIO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Escobar Diego', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Escobar Latapí Agustín', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Espejel Carbajal Martha Ileana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Espinosa Damián Gisela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Espinoza Morales Lydia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Estévez Federico', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Estrella Gabriel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Evan Ward', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('EZCURRA E. EDUARDO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('EZCURRA EXEQUIEL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('F. Vázquez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fabiola Vargas Valencia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Farfán Morales Olimpia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Farley Kathleen A.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Favret Rita', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Feas Roger', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Felipe Cuamea Velázquez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Félix Arredondo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Félix Verduzco Gustavo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fernado Lozano Ascencio', null, 'Coordinador', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fernando Lozano Ascencio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ferreira Luís', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Few Roger', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Figueroa Juan Guillermo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fitzpatrik Jody', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Flamand Gómez Laura', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Flavio Alonso Rosales Díaz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fletes Ocón Hector Bernabé', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Flores Aubanel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Flores Simental Raúl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Flores Torres Oscar', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fouquet Guerineau Anne', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Francisco A. Bernal Rodríguez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Francisco Fernández de Castro Santos', null, 'Director Adjunto de Administración y Finanzas', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Francisco Malagamba', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Francisco Miranda López', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Franco María del Carmen', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Francoise Lestage', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fray Cruzalta Aguirre Julián', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Fullerton Tom', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gabriel Estrella', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gabriela Adriana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gabriela Dutrénit', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gámez Moisés', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GARCÍA  BRIGIDA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García  Galvan Alejandro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GARCÍA DE ALBA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García del Castillo Rodolfo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GARCÍA GERARDO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GARCÍA J.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García López Patricia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Martha', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Martínez Bernardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Miriam', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Páez Benjamín', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Pérez Hilda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García y Griego Manuel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('García Zamora Rodolfo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Garda Roberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gardea Torresdey Jorge', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gary Gereffi', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gaxiola Aldama Ruth', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gerardo Chávez Velazco', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gerardo Jacobs', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gerardo Otero', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GERBER JAMES', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gereffy Gary', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gilberto Giménez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Giorguli Silvia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gloria Elizabeth García Hernández', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Cesar', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González César', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Corona Rosa María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Fagoaga Eduardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Igael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GONZÁLEZ ISRAEL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Leyva Sergio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Maíz Rocío', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Quiroga Miguel A.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Quiroga Miguel Ángel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Quiróga Miguel Ángel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('GONZÁLEZ RITA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González Rosa María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('González-Aréchiga Bernardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gracida Romo Juan José', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Graciela Bensunsan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Graizbord Boris', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Grajeda Leilanie', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Green Stanley', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Grijalva Gabriela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Guadalupe Ortega Villa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gudarrama Rocío', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Guevara Ivonne', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Guido Pinto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Guillermo Villalobos', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gustavo de J. Bravo Castillo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gustavo Garza', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gutiérrez Arturo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Gutiérrez Luis Miguel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Héctor Everardo Beltrán Corona', null, 'Rector', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Héctor Menchaca Solís', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Héctor Padilla', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Héctor Terán Terán', null, 'Gobernador Constitucional de B.C.', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernán Ahuja', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández Cabrera Porfirio M.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández David', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández Gonzalo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández Hilda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández Juan M.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('HERNANDEZ MADRID MIGUEL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández María del Carmen', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hernández Ramiro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Herrera Barrientos Jaime', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('HERRERA J.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Herrera Montes Salvador', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('HERRERA PÉREZ OCTAVIO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('HINOJOSA R.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hipólito Rodríguez Herrero', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Horacio Garza Graza', null, 'Presidente Municipal', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Hovell Melbourne F.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Howell Melbourne F.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Humberto Barquera Gémez', null, 'Apoderado', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Humberto González Galbán', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Humberto Inzunza Fonseca', 'hinzunza@telnor.net', 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Humberto Lugo Gil', null, 'Oficial Mayor', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Igor Israel González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('IGOR JOSÉ', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ilescas Vela Virginia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ilíana Sonntag', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Inés Favela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('IRACHETA ALFONSO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Irazuzta Di Chiara Ignacio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Islas Yadira', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ismael Aguilar Barajas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ismael Grijalba Palomino', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ismael Martínez García', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Itzel Magali Perez Zagal', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('IVAN55', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Izquierdo Antonio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('J. Charles Jennet', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('J. M. Robine', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jaime Hererra Barrientos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jaime Martuscelli Quintana', null, 'Director Adjunto de Investigación Científica y Secretario Ejecutivo Suplente de Fondos', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jalette Patrice', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('James Gerber', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Janice Monk', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jáquez Gabriel Román', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Javier Landa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Javier Monk', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jean Daniel M. Saphores', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jean Papail', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('JENKINS  RHYS', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesus', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesús Arroyo Alejandre', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesús J. Ruiz Barraza', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesús M. Sandoval Armenta', null, 'Director General de Fomento Económico', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesús Moises Beltrán', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jesús Román Calleros', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Joel Jennings', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Johm O. Stubbs', null, 'President and Vice Chancellor', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('John Cross', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Alberto Vale Sánchez', null, 'Rector', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Alonso Sánchez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Antonio Hernández Plascencia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Castro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Deantes del Ángel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Durand', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Eduardo Mendoza Cota', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('JORGE ENRRIQUE CASTRO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Gil', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jorge Herrera', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Alejandro García Galván', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Arturo Pérez Sánchez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Carlos Lozano', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Carlos Ramírez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Guadalupe Osuna Millán', null, 'Presidente Municipal', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Guerrero Guerrero', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Javier Robles', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Luis Aranda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Luis Contreras', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Luis García', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Luis Molina Hernández', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Luis Trava Manzanilla', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José María Parra Ramos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Molina Ruíz', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('José Woldenberg Karakosky', null, 'Consejero Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Joseph Devinny', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Juan Antonio Legaspi Delgado', null, 'Director General de Seguridad e Higiene', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Juan Carlos Herguera', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Juan Pablo Guerro', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Julie Stanton', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Julio Boltvinik', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Jusidman Clara', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Karina Orozco Rocha', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Karla Gallo Campos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Katherine Side', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kathryn A. Woolard', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kathryn Kopinak', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kay Eekhoff', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kazuko Shiraishi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('KENNEY MARTIN', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('KERR BILL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kosacoff Bernardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kristin Espinoza', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kuhner Gretchen', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kumar Acharya Arun', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Kumar Arun', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('L. L. Gutiérrez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('L. Reyes', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Laniado Rafael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lara Cisneros Gerardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lara Francisco', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lara Gerardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('LATTES ALFREDO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Laura Ochoa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leite Moreira Américo Carlos Américo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lejano Raul', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leobardo Jiménez Sánchez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('León Ledesma Miguel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Léon Ledesma Miguel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lestage Francoise', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leticia Calderón Chelius', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leyva Claudia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leyva Osvaldo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Leyva René', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ligia González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('List Reyes Mauricio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('López Castro Gustavo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('López López Álvaro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('López María de la Paz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('López Vladimir', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lorenzo Gómez Morín', null, 'Secretario', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lourdes Nieblas Cuevas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Lourdes Pacheco', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Loza Gloria María', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luengas Rubén', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('LUGO SONIA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Antonio Miranda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis E. Calderón', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Mier', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Miguel Gutierrez Robledo', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Miguel Morales', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Miguel Rionda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luis Miguel Rionda Martínez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luján Ponce Noemí', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Luna Pastén Héctor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Macías Luis Fernando', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Macías Marie-Carmen', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Maldonado Vasquez Centolino', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Angel Castillo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Arroyo Galván', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Chavez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Chávez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Gutiérrez Vidal', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Manuel Villa Issa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marcelino Bauza Rosete', null, 'Director', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marco Antonio Samaniego L.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María Antonieta Robles', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María Cristina Gutiérrez Zúñiga', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Maria de los Angeles Pozas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María de los Ángeles Pozas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María de Lourdes Ampudia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Maria de Lourdes Camarena Ojinaga', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María del Carmen García Peña', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María del Rosario Cota Yañez Cota', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MARIA ELENA REYES', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María Eugenia Cosio-Zavala', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María Eugenia de la O', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María Eugenia Treviño', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('María José González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Maria Luisa Erranti', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marianne Marchand', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mariano Norzagaray Campos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marina Ariza', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Alberto Magaña', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MARIO ALBERTO ROSAS', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Alberto Rosas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Bassols', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Bassols Ricardez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Lungo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Martínez García', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mario Palma Rojo', null, 'Subsecretario de Desarrollo Regional', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Markides Kiriakos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marlene Solís', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Márquez Yanod', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Marta Torres', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martín de la Rosa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martin Kenney', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martín L. Celaya Barragan', null, 'Secretario Técnico', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Alejandra', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Corona Francisco Javier', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Cristina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martinez Donate Ana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Donate Ana, Sipan,  C y  José Luis Izazola', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MARTÍNEZ FRANCISCO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Lucas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Martínez Martínez Alejandro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mary Alcocer', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mary Carmen Villeda Santana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mary I. O Connor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Matínez Martínez Alejendro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Max J. Castro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('May Relaño Pastor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mayo Murrieta', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Medina Alejandra', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Medina Patricia Eugenia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Meghnad Desai', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MEHTA KALA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mejía Arango Silvia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Melbourne Hovell', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MELÉ PATRICE', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Melgar Mayra Patricia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Méndez Alma Ivonne', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mendez Eloy', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Méndez Reyes Jesús', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mercado Alfonso', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Michael R. Pfau', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Michel Peraldi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MIDDLEBROOK KEVIN', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Miguel Ángel Ramírez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Miguel Anguel Cancino Aguilar', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MIguel Cervera Flores', null, 'Director General de Estadística', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Miguel Jesús Hernández Madrid', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Miguel León Pérez', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MINES RICHARD', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MIRNA SASTRÉ', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moguel Reyna', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mohar Alejandro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moisés Gamez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Molina García Mario', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mónica Gendreau', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mónica Jasis Silberg', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Monterrubio Cordero Juan C.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MOORE C.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moreno David', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moreno Jaimes Carlos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moreno José Luis', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Moreno Mena José', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('MURRIETA MAYO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Mwangi wa Githinji', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nadia Cadia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nancy A. Marlin', null, 'Provost and Vicepresident of Academic Affaris', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nancy Grey Posfero', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nancy Lowery', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Natalia Ribas Mateos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nava Isalia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Navarrete Sergio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Neves Nogueira Paula Cristina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nieblas Ortiz Efraín Carlos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Noemí Ehrenfeld L.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nombre', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Norma Iglesias', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Norris Clement', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nuñez Guillermo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Núñez Leopoldo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Nuno María Rosa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ochoa Dávila Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ochoa Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ochoa Marín Sandra Catalina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ofelia Woo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Olimpia Talia Jimenéz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Olivia Ruiz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Olvera José Juan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ortiz Alegría Luz Belinda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ortiz Luis', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ortiz Rafael', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Oscar Contreras Montellano', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Oscar Fernández', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Oscar Pedrin Osuna', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ovidio González Gómez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pablo Cotler', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pablo Serrano Vallejo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pablo Vila', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pacheco Edith', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Padilla Delgado Héctor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('PADILLA HÉCTOR', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Palacios Hernández Lylia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Palloni Alberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Parra Avila Juan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Parson Jason G.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Partida Busch Virgilio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pat Mac Dermott', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Patrice Mele', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Patricia Fernández Ham', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Patricio Cardoso Ruiz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Paul Ganster', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pedraza Laura', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pedro Cital', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pedro Martínez Briones', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Peña Medina Sergio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Penagos Sergio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Peralta Videa José Ramón', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Peredo Quezada María Isabel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pereira de Melo María Cristina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pérez Patricia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pineda Pablos Nicolás', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('POOM MEDINA JUAN', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Portillo José Antonio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Pozas María de los Angeles', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Prieto González José Manuel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Provencio Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Puar Jasbir', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('R. Wong', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rafael Pérez-Abreu', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ramírez López Berenice', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ramírez Miguel Ángel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ramón Eduardo Ruíz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ramos María Elena', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ramos Salvador', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Raúl Fernández', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Raúl Hinojosa', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Raúl Loyola Díaz', null, 'Director General', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('René Eduardo Poitevin', null, 'Director', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('René Zenteno', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ricardo Silva Toledo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ricardo Trejo Hernández', null, 'Director General de Programación y Presupuesto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Richard Gordon', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Richard Hofstetter', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Richard Wright', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Richardson Chad', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rick Miner', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rivas Eva', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rivas Sada Eva', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Robert Alvarez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Robert C. Scales', null, 'Asesoría, coordinación y diseño del Sistema de Información Integral de la Secretaría Pública', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Roberto Rivera Carmona', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Roberto Sánchez Rodríguez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Roberto Verdugo Díaz', null, 'Director de Educación Superior e Investigación', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Robles Ortega Rosalba', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rocío Barajas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rodolfo García', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rodrigo Pimental Lastra', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rodríguez Francisco', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rodríguez Yosu', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rolando Cordera Campos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Román Artuto R.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Román Gabriela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Romero Hernandez Odilia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Romero Navarrete Lourdes Magdalena', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ronald Angel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ros Jaime', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosa Linda Fregoso', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosa María González Corona', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosa María Ruvalcaba', null, 'Directora de Población', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosalba Casas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosalina Cano García', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rosas Karina', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Rossana Reguillo Cruz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('RUBEL A.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ruíz Marco A.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ryoshiro Baba', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('SALAS JOSÉ LUIS', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Salazar Mario', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Salazar Vidal', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Saldaña Téllez Bernardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Salguero Friné', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Salinas Patti', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Samuel Schmidt', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sánchez Adrián', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sánchez Crispín Álvaro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sánchez Juan Carlos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sánchez Martha', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Santacruz de León Germán', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Saphores Jean Daniel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sassen Saskia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Scott Whiteford', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Selee Andrew', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Senen Cecilia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sereseres Cesar A.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sergio Ramírez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sergio Solís', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sergio Zendejas Romero', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Shawn Kanaupuni', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sheridan Cecilia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Shibata Harumi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Silvia Guendelman', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Simonett Helena', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Socorro Arzaluz', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Soledad González', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Solís Gilberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Solis Patricio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sonia Baires', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sonia Lugo Morones', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sophie Bava', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('SPARROW GLEN', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Stephanie Pincetl', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Steve Wallace', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Strathdee Steffanie', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Stuart Aitken', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sueli Ramos', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Susan Gzesh', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Susana Pastrana Corral', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Susanne Jonas', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Swanie Potot', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Sylvie Mazzela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Takeyuki Tsuda', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Telésforo Ramírez', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tellez Edward', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tello Peón Jorge', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Téran Casanueva', null, 'Rector', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Teresa Montero', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Terry McKinley', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Teruel Graciela', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Theodore H. Cohn', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Thomas J. Kelly', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Thomas M. Fullerton', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tintos Juan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tipa Nadia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tons H. Hilker', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('TORRES GABRIEL', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Torres José Luis', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Torres Oscar', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Torres Victor', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tovar Esquivel Enrique', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Trejo Peña Alma Paola', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('TREVIÑO RODRÍGUEZ MARÍA EUGENIA', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Tridib Banerjee', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Trujillo Joel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Valdés Alma Victoria', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Valdés Carlos Manuel', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Valencia Armas Alberto', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Valentín Vargas Arenal', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Van Broeck Anne Marie', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Van der Knaap Peter', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('VAN DOOREN ROBINE', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('VAN TULDER R.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vargas Adriana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vargas Fabiola', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vargas Villavicencio José Antonio', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vazquez Sandrin German', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vendrell Ferré Joan', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Véronique Manry', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Víctor Gabriel Muro', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Víctor Klagsbrunn', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Víctor Manuel Ibarra Balderas', null, 'Director', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Víctor Raúl Martínez V.', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Víctor Zuñiga', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Vidaurrázaga René', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Villalobos Iliana', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Villarreal María Elena', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Wallace Steve', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('William Conroy', null, 'Presidente', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Wong Pablo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Wong Rebeca', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Wright Robert', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Yamile Mizrahi', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Yolanda Palma', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Yrizar Guillermo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Yuridia Rodríguez', null, 'Participa en proyecto', null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Zamudio Patricia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Zapico Goñi Eduardo', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Zavala de Cosio María Eugenia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('ZEPEDA EDUARDO', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Ziccardi Alicia', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Zuniga Gil Clemente', null, null, null, GETDATE(), null, GETDATE(),1)
insert into InvestigadorExternos values('Zúñiga González Víctor', null, null, null, GETDATE(), null, GETDATE(),1)
>>>>>>> d4375a21b0db2bc0f7e8df22b2ccc202e13012b6:db/initdb.sql
