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
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();
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
            [['Artículo en revista', 'Capítulo en libro'], ['.ArticuloCapitulo_fields']],
            ['Artículo en revista', ['.Articulo_fields']],
            ['Libro', ['.Libro_fields']],
            ['Capítulo en libro', ['.Capitulo_fields']]
        ]
    );

    $('#TipoObraTraducida')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();

    $('#AutorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#AutorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#AutorSeOrdenaAlfabeticamente')[0].dynamic.setup();
}

function capituloSetup() {
    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();

    $('#AutorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#AutorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#AutorSeOrdenaAlfabeticamente')[0].dynamic.setup();
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
                ['Aceptado', ['#EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();
}

function articuloSetup() {

    $('#TipoArticulo').change(function() {
        var comboValue = $(this).val();

        if (comboValue == "")
            comboValue = 0;

        $('#RevistaPublicacionTitulo')[0].autocompleter.setExtraParams({ extraParam: comboValue });
        $('#RevistaPublicacionTitulo')[0].autocompleter.flushCache();
    });

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado, #obra_field']],
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();
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
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
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

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();
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
                ['Aceptado', ['.EstatusAceptado', '#documentoprobatorio_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();

    $('#AutorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#AutorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#AutorSeOrdenaAlfabeticamente')[0].dynamic.setup();
}

function proyectoSetup(role) {
    if (role == "DGAA") {
        $('#EstadoProyecto').dynamicui(
            [
                ['Terminado', ['#EstadoTerminado']]
            ]
        );

        $('#EstadoProyecto')[0].dynamic.setup();
    }
    
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

    $('#ParticipaEstudiante').dynamicui(
        [
            ['1', ['#ParticipaEstudiante_Fields']]
        ]
    );

    $('#ParticipaEstudiante')[0].dynamic.setup();


    $('#ParticipanteSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#ParticipanteSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#ParticipanteSeOrdenaAlfabeticamente')[0].dynamic.setup();
}

function investigadorSetup() {

    if ($('#EstadoInvestigador_Estado').length > 0) {
        $('#EstadoInvestigador_Estado').dynamicui(
            [
                [['Activo', 'Baja', 'Licencia c/ sueldo', 'Licencia s/ sueldo', 'Sabático', 'Superación académica'], ['#EstadoPeriodos_Fields']],
                [['Licencia c/ sueldo', 'Licencia s/ sueldo', 'Sabático', 'Superación académica'], ['#EstadoFechaFinal_Field']]
            ]
        );

        $('#EstadoInvestigador_Estado')[0].dynamic.setup();
    }

    if ($('#SNIInvestigador_SNI').length > 0) {
        $('#SNIInvestigador_SNI').dynamicui(
            [
                [['Emerito', 'Candidato', 'Nivel 1', 'Nivel 2', 'Nivel 3'], ['#SniPeriodos_Fields']],
                [['Candidato', 'Nivel 1', 'Nivel 2', 'Nivel 3'], ['#SniFechaFinal_Field']]
            ]
        );

        $('#SNIInvestigador_SNI')[0].dynamic.setup();
    }
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

    $('#EsPrivada').dynamicui(
            [
                ['1', ['#EsPrivada_Field']]
            ]
        );

    $('#EsPrivada')[0].dynamic.setup();
}

function eventoSetup() {
    $('#TipoParticipacion').dynamicui(
            [
                [['Conferencista magistral', 'Ponente'], ['#TipoParticipacion_fields']]
            ]
        );

    $('#TipoParticipacion')[0].dynamic.setup();

    $('#CoautorSeOrdenaAlfabeticamente').dynamicui(
        [
            ['0', ['#CoautorSeOrdenaAlfabeticamente_field']]
        ]
    );

    $('#CoautorSeOrdenaAlfabeticamente')[0].dynamic.setup();

    CheckOptions.setup();
}

var CheckOptions = {
    setup: function() {
        $('#forma').unload(CheckOptions.verifyOptions());
        $('#TipoEvento').change(CheckOptions.verifyOptions);
        $('#TipoParticipacion').change(CheckOptions.verifyOptions);
    },
    verifyOptions: function() {
        var comboText1 = $('#TipoEvento :selected').text();
        var comboText2 = $('#TipoParticipacion :selected').text();

        if (comboText1 == "Evento Estratégico (El Colef)" && comboText2 == "Organizador") {
            $('#OrganizadorColef_fields').slideDown('fast', function() {
                $('#OrganizadorColef_fields').fadeIn('fast');
            });
            $('#NoOrganizadorColef_fields').slideUp('fast', function() {
                $('#NoOrganizadorColef_fields').fadeOut('fast');
            });
        }
        else {
            $('#OrganizadorColef_fields').slideUp('fast', function() {
                $('#OrganizadorColef_fields').fadeOut('fast');
            });
            $('#NoOrganizadorColef_fields').slideDown('fast', function() {
                $('#NoOrganizadorColef_fields').fadeIn('fast');
            });
        }
    }
};

var UploadFile = {
    setup: function(fileUpload, queue, uploader, cancelImg, action, auth) {
        $(fileUpload).uploadify({
            'uploader': uploader,
            'script': action,
            'cancelImg': cancelImg,
            'folder': action,
            'queueID': queue,
            'auto': false,
            'multi': false,
            'buttonText': 'Adjuntar',
            'onSelect': Upload.onSelect,
            'onSelectOnce': Upload.onSelectOnce,
            'onProgress': Upload.onProgress,
            'onAllComplete': Upload.onAllComplete,
            'onCancel': Upload.onCancel,
            'onError': error,
            'scriptData': { token: auth }
        });
    }
}