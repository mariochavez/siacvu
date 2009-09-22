function libroSetup() {
    $('#TipoPublicacion').dynamicui(
            [
                ['Libro traducido a otro idioma', ['#idioma_field', '.traductor_field']],
                ['Coordinación de un número especial de revista', ['.coordinacionrevista_field']],
                ['Coordinación de memoria', ['.coordinacionmemoria_field']],
                ['Coordinación de libro sin arbitraje', ['.coordinacionlibro_field']],
            	['Coordinación de libro con arbitraje', ['.coordinacionlibro_field']]
            ]
        );

    $('#TipoPublicacion')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.publicado_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();

    $('#TieneProyecto').dynamicui(
        [
            ['1', ['#SelectProyecto_p']]
        ]
    );

    $('#TieneProyecto')[0].dynamic.setup();

    $('#Traductor').dynamicui(
        [
            ['1', ['.NombreTraductor']]
        ]
    );

    $('#Traductor')[0].dynamic.setup();
}

function capituloSetup() {
    $('#TipoCapitulo').dynamicui(
            [
                ['Capítulo traducido a otro idioma', ['#idioma_field', '#traductor_field']]
            ]
        );

    $('#TipoCapitulo')[0].dynamic.setup();
}

function articuloSetup() {
    $('#TipoArticulo').dynamicui(
            [
                ['Artículo traducido a otro idioma', ['#idioma_field']],
                ['Artículo con arbitraje', ['.indice_field']]
            ]
        );

    $('#TipoArticulo')[0].dynamic.setup();

    $('#EstadoProducto').dynamicui(
            [
                ['Publicado', ['.pagina_field']]
            ]
        );

    $('#EstadoProducto')[0].dynamic.setup();
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
    $('#TipoReporte').dynamicui(
            [
                ['Cuaderno de trabajo', ['.CuadernoTrabajo']],
                ['Informe técnico', ['.ReporteTecnico']]
            ]
        );

    $('#TipoReporte')[0].dynamic.setup();
}

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