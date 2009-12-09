function libroSetup() {
    $('#ContenidoLibro').dynamicui(
        [
            ['Memoria de evento', ['.memoriaevento_field']],
            ['Número especial de revista', ['.revista_field']]
        ]
    );

    $('#ContenidoLibro')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();
}

function grupoInvestigacionSetup() {
    $('#Lider').dynamicui(
        [
            ['1', ['#siLider']]
        ]
    );

    $('#Lider')[0].dynamic.setup();
}

function obraTraducidaSetup() {
    $('#TipoObraTraducida').dynamicui(
        [
            ['*', ['#TipoObraTraducida_fields', '.ArticuloCapituloLibro_fields']],
            [['Libro', 'Capítulo en libro'], ['.CapituloLibro_fields']],
            ['Artículo en revista', ['.Articulo_fields']],
            ['Libro', ['.Libro_fields']],
            ['Capítulo en libro', ['.Capitulo_fields']]
        ]
    );

    $('#TipoObraTraducida')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();
}

function capituloSetup() {
    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado', '#publicado_fields']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );
    
    $('#TieneProyecto')[0].dynamic.setup();
}

function dictamenSetup() {
    $('#TipoDictamen').dynamicui(
            [
                ['Artículo', ['#articulo_field']],
                ['Proyecto de investigación CONACyT', ['#proyecto_field']],
                [['Libro'], ['#libro_field']]
            ]
        );

    $('#TipoDictamen')[0].dynamic.setup();
}

function tesisSetup() {
    $('#TipoTesis').dynamicui(
            [
                ['Tesis de El Colef', ['#AlumnoInterno']],
                ['Tesis externas', ['#AlumnoExterno']]
            ]
        );

    $('#TipoTesis')[0].dynamic.setup();
}

function distincionSetup() {
    $('#Ambito').dynamicui(
            [
                [['Internacional', 'Binacional'], ['#ambitopais']],
                [['Estatal', 'Local/Municipal'], ['#ambitoestatal']],
                ['Local/Municipal', ['.ambitoestatallocal']]
            ]
        );

    $('#Ambito')[0].dynamic.setup();
}

function participacionAcademiaSetup() {
	$('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['#EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();
}

function articuloSetup() {
    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();
}

function participacionSetup() {
    $('#OtraParticipacion').dynamicui(
            [
                ['Platicas', ['#Platicas']],
                ['Presentacion de resultados de investigacion', ['#PresentacionInvestigacion']],
                ['Presentacion de libro', ['#PresentacionLibro_div']]
            ]
        );

    $('#OtraParticipacion')[0].dynamic.setup();
}

function participacionMedioSetup() {

    $('#TipoParticipacion').dynamicui(
            [
                ['Presentación de libro', ['#libro_label']],
                ['Presentación resultados de investigación', ['#investigacion_label']],
                ['Periódico/Diario', ['#notaPeriodistica_label']],
                [['Seleccione ...', 'Conferencias', 'Demostraciones', 'Ferias Científicas y Tecnológicas', 'Ferias Empresariales', 'Medios Impresos', 'Radio', 'Revistas de Divulgación', 'Seminarios', 'Simposium', 'Talleres', 'Teatro', 'Televisión', 'Video'], ['#titulo_label']]
            ]
        );

    $('#TipoParticipacion')[0].dynamic.setup();
}

function reporteSetup() {    
    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['.tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#TipoReporte').dynamicui(
            [
                ['Documento de trabajo', ['.DocumentoTrabajo']],
                ['Reporte técnico', ['.ReporteTecnico']],
                ['*', ['.ReporteDocumento']]
            ]
        );

    $('#TipoReporte')[0].dynamic.setup();
}

function resenaSetup() {
    $('#TipoResena').dynamicui(
            [
                ['Reseña bibliográfica', ['#resenaBibliografica_field']]
            ]
        );

    $('#TipoResena')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();
}

function proyectoSetup() {
    $('#EstadoProyecto').dynamicui(
            [
                ['Terminado', ['#EstadoTerminado']]
            ]
        );

    $('#EstadoProyecto')[0].dynamic.setup();

    $('#ConRecursos').dynamicui(
        [
            ['1', ['#ProyectoConRecursos']]
        ]
    );

    $('#ConRecursos')[0].dynamic.setup();

    $('#ConConvenio').dynamicui(
        [
            ['1', ['.Convenio_Fields']]
        ]
    );

    $('#ConConvenio')[0].dynamic.setup();

    $('#SectorFinanciamiento').dynamicui(
            [
                ['Fondos CONACyT', ['#SectorFinanciamiento_Field']]
            ]
        );

    $('#SectorFinanciamiento')[0].dynamic.setup();
}

function investigadorSetup() {
    $('#EstadoInvestigador_Estado').dynamicui(
            [
                [['Activo', 'Baja', 'Licencia c/ sueldo', 'Licencia s/ sueldo', 'Sabático', 'Superación académica'], ['#EstadoPeriodos_Fields']],
                [['Licencia c/ sueldo', 'Licencia s/ sueldo', 'Sabático', 'Superación académica'], ['#EstadoFechaFinal_Field']]
            ]
        );

    $('#EstadoInvestigador_Estado')[0].dynamic.setup();

    $('#SNIInvestigador_SNI').dynamicui(
            [
                [['Emerito', 'Candidato', 'Nivel 1', 'Nivel 2', 'Nivel 3'], ['#SniPeriodos_Fields']],
                [['Candidato', 'Nivel 1', 'Nivel 2', 'Nivel 3'], ['#SniFechaFinal_Field']]
            ]
        );

    $('#SNIInvestigador_SNI')[0].dynamic.setup();
}

function organoInternoSetup() {
    $('#ConsejoComision').dynamicui(
            [
                [['Comisión Dictaminadora', 'Comisiones Evaluadoras Departamentales', 'Comisiones Académicas de Programas de Posgrado', 'Consejo Editorial', 'Consejo de Biblioteca'], ['#periodo_field']]
            ]
        );

    $('#ConsejoComision')[0].dynamic.setup();
}

function cursoSetup() {    
    $('#TipoCurso').dynamicui(
            [
                ['Cursos en El Colef', ['#cursointerno_field']],
                ['Cursos externos', ['#cursoexterno_field']]
            ]
        );

    $('#TipoCurso')[0].dynamic.setup();
}

function eventoSetup() {
    $('#TipoEvento').dynamicui(
            [
                ['Evento Estratégico (El Colef)', ['.TipoEvento_field']]
            ]
        );

    $('#TipoEvento')[0].dynamic.setup();

    $('#TipoParticipacion').dynamicui(
            [
                [['Conferencista magistral', 'Ponente'], ['#TipoParticipacion_fields']]
            ]
        );

    $('#TipoParticipacion')[0].dynamic.setup();

    $('#Ambito').dynamicui(
            [
                [['Internacional', 'Binacional'], ['#Ambito_field']]
            ]
        );

    $('#Ambito')[0].dynamic.setup();
}