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