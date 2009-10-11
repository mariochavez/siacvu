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
                ['Reporte técnico', ['.ReporteTecnico', '.notieneproyecto_field']],
                ['*', ['.ReporteCuaderno']]
            ]
        );

    $('#TipoReporte')[0].dynamic.setup();

    Uncheck.setup();
}

var Uncheck = {
    setup: function() {
        $('#TipoReporte').change(Uncheck.uncheckOption);
    },
    uncheckOption: function() {
        var value = $('#TipoReporte :selected').text();

        if (value != 'Reporte técnico')
            $('#TieneProyecto').attr('checked', false);

        reporteSetup();
    }
};

function resenaSetup() {
    $('#TipoResena').dynamicui(
            [
                ['Nota crítica', ['.NotaCritica']],
                ['Reseña bibliográfica', ['#ResenaBibliografica_div']]
            ]
        );

    $('#TipoResena')[0].dynamic.setup();
}

function tesisDirigidaSetup() {
    $('#GradoAcademico').dynamicui(
            [
                ['*', ['#FechaGrado_p']]
            ]
        );

    $('#GradoAcademico')[0].dynamic.setup();
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