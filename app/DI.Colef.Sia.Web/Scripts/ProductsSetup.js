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
            ['1', ['.tieneproyecto_field']]
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
            ['1', ['.tieneproyecto_field']]
        ]
    );
    
    $('#TieneProyecto')[0].dynamic.setup();
}

function dictamenSetup() {
    $('#TipoDictamen').dynamicui(
            [
                ['Artículo', ['.articulo_field']],
                ['Proyecto de investigación CONACyT', ['#proyecto_field']]
            ]
        );

    $('#TipoDictamen')[0].dynamic.setup();
}

function tesisSetup() {
    $('#TipoEstudiante').dynamicui(
            [
                ['Interno', ['.AlumnoInterno']],
                ['Externo', ['.AlumnoExterno']],
                ['*', ['.AlumnoInternoExterno']]
            ]
        );

    $('#TipoEstudiante')[0].dynamic.setup();

    $('#Concluida').dynamicui(
        [
            ['1', ['#TesisConcluida']]
        ]
    );

    $('#Concluida')[0].dynamic.setup();

    CheckTesisOptions.setup();
}

var CheckTesisOptions = {
    setup: function() {
        $('#forma').unload(CheckTesisOptions.verifyOptions());
        $('#TipoEstudiante').change(CheckTesisOptions.uncheckOption);
    },
    uncheckOption: function() {
        var value = $('#TipoEstudiante :selected').text();

        if (value == 'Seleccione ...') {
            $('#Concluida').attr('checked', false);

            if (!$('#Concluida').attr('checked')) {
                $('#TesisConcluida').hide();
            }
        }

        CheckTesisOptions.verifyFormaParticipacion(value);
    },
    verifyOptions: function() {
        var checked = $('#Concluida').attr('checked');
        var value = $('#TipoEstudiante :selected').text();

        if (value == 'Seleccione ...') {
            if (checked == true) {
                $('#TesisConcluida').hide();
            }
        }
        else {
            CheckTesisOptions.verifyFormaParticipacion(value);

            if (checked == false) {
                $('#TesisConcluida').hide();
            }
        }
    },
    verifyFormaParticipacion: function(value) {
        if (value == 'Externo') {
            $('#FormaParticipacion').removeClass("requerido");
        }
        else {
            $('#FormaParticipacion').addClass("requerido");
        }
    }
};


function distincionSetup() {

    $('#Ambito').dynamicui(
            [
                ['Estatal', ['#ambitoestatal']],
                ['Local', ['#ambitolocal']]
            ]
        );

    $('#Ambito')[0].dynamic.setup();

    CheckDistincionOptions.setup();
}

var CheckDistincionOptions = {
    setup: function() {
        $('#forma').unload(CheckDistincionOptions.verifyOptions());
        $('#Ambito').change(CheckDistincionOptions.verifyOptions);
    },
    verifyOptions: function() {
        var comboText = $('#Ambito :selected').text();

        if (comboText == "Binacional" || comboText == "Internacional" || comboText == "Seleccione ...") {
            $('#ambitopais').slideUp('fast', function() {
                $('#ambitopais').fadeOut('fast');
            });
        }
        else {
            $('#ambitopais').slideDown('fast', function() {
                $('#ambitopais').fadeIn('fast');
            });
        }
    }
};

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
            ['1', ['.tieneproyecto_field']]
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
    $('#MedioElectronico').dynamicui(
            [
                ['Otro', ['#OtroMedioElectronico']]
            ]
        );

    $('#MedioElectronico')[0].dynamic.setup();

    $('#MedioImpreso').dynamicui(
            [
                ['*', ['.NotaPeriodistica_p']],
                ['Otro', ['#OtroMedioImpreso']]
            ]
        );

    $('#MedioImpreso')[0].dynamic.setup();
}

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
                ['Reporte técnico', ['.ReporteTecnico']],
                ['*', ['.ReporteCuaderno']]
            ]
        );

    $('#TipoReporte')[0].dynamic.setup();

    Uncheck.setup();
}

var Uncheck = {
    setup: function() {
        $('#forma').unload(Uncheck.verifyOptions());
        $('#TipoReporte').change(Uncheck.uncheckOption);
    },
    uncheckOption: function() {
        var comboId = '#' + $(this).attr('id');
        var value = $(comboId + ' :selected').text();

        if (value != 'Reporte técnico') {
            $('#TieneProyecto').attr('checked', false);

            if (!$('#TieneProyecto').attr('checked')) {
                $('.tieneproyecto_field').hide();
            }

            $('.notieneproyecto_field').hide();
        }
        else {
            $('.notieneproyecto_field').show();
        }
    },
    verifyOptions: function() {
        var checked = $('#TieneProyecto').attr('checked');
        var value = $('#TipoReporte :selected').text();

        if (value == 'Reporte técnico') {
            if (checked == true) {
                $('.notieneproyecto_field').hide();
            }
        }
        else {
            if (checked == false) {
                $('.notieneproyecto_field').hide();
            }
        }
    }
};

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
                ['Publicado', ['#EstatusPublicado']],
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