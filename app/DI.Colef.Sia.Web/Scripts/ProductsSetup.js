function libroSetup() {
    $('#FormatoPublicacion').dynamicui(
        [
            ['Memoria de evento', ['.memoriaevento_field']],
            ['Número especial de revista', ['.revista_field']],
            ['Libro traducido a otro idioma', ['.idioma_field']]
        ]
    );

    $('#FormatoPublicacion')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.estatuspublicado_field']],
                ['Aceptado', ['#estatusaceptado_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']],
            ['0', ['#notieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();
}

function capituloSetup() {
    $('#TipoCapitulo').dynamicui(
            [
                ['Capítulo traducido a otro idioma', ['#idioma_field', '#traductor_field']]
            ]
        );

    $('#TipoCapitulo')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#tieneproyecto_field']],
            ['0', ['#notieneproyecto_field']]
        ]
    );
    
    $('#TieneProyecto')[0].dynamic.setup();
}

function dictamenSetup() {
    $('#TipoDictamen').dynamicui(
            [
                ['Artículo', ['#articulo_field']],
                ['Proyecto de investigación CONACyT', ['#proyecto_field']],
                [['Capítulo en libro', 'Libro'], ['#capituloLibro_field']]
            ]
        );

    $('#TipoDictamen')[0].dynamic.setup();
}

function tesisSetup() {
    $('#TipoEstudiante').dynamicui(
            [
                ['Interno', ['.AlumnoInterno']],
                ['Externo', ['.AlumnoExterno']]
            ]
        );

    $('#TipoEstudiante')[0].dynamic.setup();
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
            ['1', ['#tieneproyecto_field']],
            ['0', ['#notieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#ArticuloTraducido').dynamicui(
        [
            ['1', ['#idioma_field']]
        ]
    );

    $('#ArticuloTraducido')[0].dynamic.setup();
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
    CheckParticipacionMedioOptions.setup();
}

var CheckParticipacionMedioOptions = {
    setup: function() {
        $('#forma').unload(CheckParticipacionMedioOptions.verifyOptions());
        $('#TipoParticipacion').change(CheckParticipacionMedioOptions.verifyOptions);
    },
    verifyOptions: function() {
        var comboText = $('#TipoParticipacion :selected').text();

        if (comboText != "Presentación de libro" && comboText != "Presentación resultados de investigación" && comboText != "Periódico/Diario") {
            $('#titulo_label').slideUp('fast', function() {
                $('#titulo_label').fadeOut('fast');
            });            
        } else if (comboText != "Presentación de libro") {
            $('#libro_label').slideDown('fast', function() {
                $('#libro_label').fadeIn('fast');
            });
        } else if (comboText != "Presentación resultados de investigación") {
            $('#investigacion_label').slideDown('fast', function() {
                $('#investigacion_label').fadeIn('fast');
            });
        } else if (comboText != "Periódico/Diario") {
            $('#notaPeriodistica_label').slideDown('fast', function() {
                $('#notaPeriodistica_label').fadeIn('fast');
            });
        }

        if (comboText == "Seleccione ...") {
            $('#titulo_label').slideUp('fast', function() {
                $('#titulo_label').fadeOut('fast');
            });
            $('#libro_label').slideUp('fast', function() {
                $('#libro_label').fadeOut('fast');
            });
            $('#investigacion_label').slideUp('fast', function() {
                $('#investigacion_label').fadeOut('fast');
            });
            $('#notaPeriodistica_label').slideUp('fast', function() {
                $('#notaPeriodistica_label').fadeOut('fast');
            });            
        }
    }
};

function reporteSetup() {    
    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['#EstatusPublicado']],
                ['Aceptado', ['#EstatusAceptado']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['.tieneproyecto_field']],
            ['0', ['.notieneproyecto_field']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#TipoReporte').dynamicui(
            [
                ['Cuaderno de trabajo', ['.CuadernoTrabajo']],
                ['Reporte técnico', ['.ReporteTecnico', '.notieneproyecto_field']],
                ['*', ['.ReporteCuaderno']]
            ]
        );

    $('#TipoReporte')[0].dynamic.setup();
}

function resenaSetup() {
    $('#TipoResena').dynamicui(
            [
                ['*', ['#tipoPublicacion_field']],
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

    $('#ResenaTraducida').dynamicui(
        [
            ['1', ['#idioma_field']]
        ]
    );

    $('#ResenaTraducida')[0].dynamic.setup();
}

function proyectoSetup() {
    $('#RequiereServicioUSEG').dynamicui(
        [
            ['1', ['.RequiereUSEG']]
        ]
    );

    $('#RequiereServicioUSEG')[0].dynamic.setup();

    $('#ParticipaEstudiante').dynamicui(
        [
            ['1', ['.ParticipaEstudiante']]
        ]
    );

    $('#ParticipaEstudiante')[0].dynamic.setup();

    $('#ConConvenio').dynamicui(
        [
            ['1', ['.NombreConvenio']]
        ]
    );

    $('#ConConvenio')[0].dynamic.setup();
}

function investigadorSetup() {
    $('#EstadoInvestigador_Estado').dynamicui(
            [
                [['Licencia c/ sueldo', 'Licencia s/ sueldo', 'Sabático', 'Superación académica'], ['.EstadoFechaFinal_Field']]
            ]
        );

    $('#EstadoInvestigador_Estado')[0].dynamic.setup();
}

function organoInternoSetup() {
    CheckOrganoInternoOptions.setup();
}

var CheckOrganoInternoOptions = {
    setup: function() {
        $('#forma').unload(CheckOrganoInternoOptions.verifyOptions());
        $('#ConsejoComision').change(CheckOrganoInternoOptions.verifyOptions);
    },
    verifyOptions: function() {
        var comboText = $('#ConsejoComision :selected').text();

        if (comboText == "Consejo Académico" || comboText == "Seleccione ...") {
            $('#periodo_field').slideUp('fast', function() {
                $('#periodo_field').fadeOut('fast');
            });
        } else {
            $('#periodo_field').slideDown('fast', function() {
                $('#periodo_field').fadeIn('fast');
            });
        }
    }
};

function cursoSetup() {
    $('#TipoCurso').dynamicui(
            [
                ['Interno', ['.cursointerno']]
            ]
        );

    $('#TipoCurso')[0].dynamic.setup();
}