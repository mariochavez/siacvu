function setupDocument() {
    RemoteLink.setup();
    RemoteForm.setup();
    LocalForm.setup();
    DateTimePicker.setup();
    SubForm.setup();

    $('div.elementodescripcion:odd').addClass('elementolista-dos');
    setupSublistRows();

    $('.clearField').clearField();

    AutoComplete.setup();
    SearchAutoComplete.setup();
    paisSetDefaultValue();
    EnableIdiomaOptions.setup();
    EnablePaginaInicialFinalOptions.setup();
}

function setupLibros() {
    LibroEnableOptions.setup();
}

function setupParticipaciones() {
    ParticipacionEnableOptions.setup();
}

function setupParticipacionMedios() {
    ParticipacionMedioEnableOptions.setup();
}

function setupReportes() {
    ReporteEnableOptions.setup();
}

function setupResenas() {
    ResenaEnableOptions.setup();
}

function setupTesis() {
    TesisEnableOptions.setup();
}

function paisSetDefaultValue() {
    $('#Pais option').each(function() {
        if ($(this).text() == 'México')
            $(this).attr('selected', true);
    });
}

function setupSublistRows() {
    $('div.sublista:odd').addClass('sublista-dos');
    $('div.sublista:even').addClass('sublista');
}

function showMessage(message) {
    $('#mensaje-error').addClass('mensaje-acierto');
    $('#mensaje-error').html('<p>' + message + '</p>');
}

var EnableIdiomaOptions = {
    setup: function() {
        $(':input.tipo').change(EnableIdiomaOptions.enableOptions);
        $('#forma').unload(this.enableOptions);
        $('#forma').unload(this.enableOptions());
    },
    enableOptions: function() {

        var id = $(this).attr('id');

        $('#Idioma').attr('disabled', true);
        $('#SelectIdioma_p').slideUp('slow', function() {
            $('#SelectIdioma_p').fadeOut('fast');
        });

        $("#" + id + " option:selected:contains('otro idioma')").each(function() {
            $('#Idioma').attr('disabled', false);
            $('#SelectIdioma_p').slideDown('slow', function() {
                $('#SelectIdioma_p').fadeIn('fast');
            });
        });

        return false;
    }
}

var EnablePaginaInicialFinalOptions = {
    setup: function() {
        $(':input.estado').change(EnablePaginaInicialFinalOptions.enableOptions);
        $('#forma').unload(this.enableOptions);
        $('#forma').unload(this.enableOptions());
    },
    enableOptions: function() {

        var id = $(this).attr('id');

        $('#PaginaInicial').attr('readonly', true);
        $('#PaginaFinal').attr('readonly', true);

        $('#PaginaInicialFinal_div').slideUp('slow', function() {
            $('#PaginaInicialFinal_div').fadeOut('fast');
        });

        $("#" + id + " option:selected:contains('Publicado')").each(function() {
            $('#PaginaInicial').attr('readonly', false);
            $('#PaginaFinal').attr('readonly', false);

            $('#PaginaInicialFinal_div').slideDown('slow', function() {
                $('#PaginaInicialFinal_div').fadeIn('fast');
            });
        });

        return false;
    }
}

var LibroEnableOptions = {
    setup: function() {
        $(':checkbox').change(LibroEnableOptions.enableProyectos);
        $('#forma').unload(LibroEnableOptions.enableProyectos());
    },
    enableProyectos: function() {

        var active = $('input:checked').length;

        if (active == 1) {
            $('#SelectProyecto_p').slideDown('slow', function() {
                $('#SelectProyecto_p').fadeIn('fast');
                $('#Proyecto').attr('disabled', false);
            });
        }
        else {
            $('#SelectProyecto_p').slideUp('slow', function() {
                $('#Proyecto').attr('disabled', true);
                $('#SelectProyecto_p').fadeOut('fast');
            });
        }

        return false;
    }
}

var ParticipacionEnableOptions = {
    setup: function() {
        $('#OtraParticipacion').change(ParticipacionEnableOptions.enableOptions);
        $('#forma').unload(ParticipacionEnableOptions.enableOptions());
    },
    enableOptions: function() {

        $('#TipoPresentacion').attr('disabled', true);
        $('#Autor').attr('disabled', true);

        $('#PresentacionLibro_div').slideUp('slow', function() {
            $('#PresentacionLibro_div').fadeOut('fast');
        });

        $("#OtraParticipacion option:selected:contains('n de libro')").each(function() {
            $('#TipoPresentacion').attr('disabled', false);
            $('#Autor').attr('disabled', false);

            $('#PresentacionLibro_div').slideDown('slow', function() {
                $('#PresentacionLibro_div').fadeIn('fast');
            });
        });

        return false;
    }
}

var ParticipacionMedioEnableOptions = {
    setup: function() {
        $('#MedioImpreso').change(ParticipacionMedioEnableOptions.enableOptions);
        $('#forma').unload(ParticipacionMedioEnableOptions.enableOptions());
    },
    enableOptions: function() {

        $('#NotaPeriodistica').attr('disabled', false);

        $('#NotaPeriodistica_p').slideDown('slow', function() {
            $('#NotaPeriodistica_p').fadeIn('fast');
        });

        $("#MedioImpreso option:selected:contains('Seleccione')").each(function() {
            $('#NotaPeriodistica').attr('disabled', true);

            $('#NotaPeriodistica_p').slideUp('slow', function() {
                $('#NotaPeriodistica_p').fadeOut('fast');
            });
        });

        return false;
    }
}

var ReporteEnableOptions = {
    setup: function() {
        $('#TipoReporte').change(ReporteEnableOptions.enableOptions);
        $('#forma').unload(ReporteEnableOptions.enableOptions());
    },
    enableOptions: function() {

        $('#Editorial').attr('disabled', true);
        $('#InstitucionNombre').attr('disabled', true);
        $('#Descripcion').attr('disabled', true);

        $('#Institucion_p').slideUp('slow', function() {
            $('#Institucion_p').fadeOut('fast');
        });

        $('#Descripcion_p').slideUp('slow', function() {
            $('#Descripcion_p').fadeOut('fast');
        });

        $('#Editorial_p').slideUp('slow', function() {
            $('#Editorial_p').fadeOut('fast');
        });

        $("#TipoReporte option:selected:contains('Reporte')").each(function() {
            $('#InstitucionNombre').attr('disabled', false);
            $('#Descripcion').attr('disabled', false);

            $('#Institucion_p').slideDown('slow', function() {
                $('#Institucion_p').fadeIn('fast');
            });

            $('#Descripcion_p').slideDown('slow', function() {
                $('#Descripcion_p').fadeIn('fast');
            });
        });

        $("#TipoReporte option:selected:contains('Cuaderno')").each(function() {
            $('#Editorial').attr('disabled', false);

            $('#Editorial_p').slideDown('slow', function() {
                $('#Editorial_p').fadeIn('fast');
            });
        });

        return false;
    }
}

var ResenaEnableOptions = {
    setup: function() {
        $('#TipoResena').change(ResenaEnableOptions.enableOptions);
        $('#forma').unload(ResenaEnableOptions.enableOptions());
    },
    enableOptions: function() {

        $('#NombreProducto').attr('disabled', true);
        $('#NombreRevista').attr('disabled', true);
        $('#Editorial').attr('disabled', true);
        $('#ReferenciaBibliograficaLibro').attr('disabled', true);
        $('#ReferenciaBibliograficaRevista').attr('disabled', true);

        $('#NotaCritica_div').slideUp('slow', function() {
            $('#NotaCritica_div').fadeOut('fast');
        });

        $('#Editorial_p').slideUp('slow', function() {
            $('#Editorial_p').fadeOut('fast');
        });

        $('#ResenaBibliografica_div').slideUp('slow', function() {
            $('#ResenaBibliografica_div').fadeOut('fast');
        });

        $("#TipoResena option:selected:contains('Nota')").each(function() {
            $('#NombreProducto').attr('disabled', false);
            $('#NombreRevista').attr('disabled', false);
            $('#Editorial').attr('disabled', false);

            $('#NotaCritica_div').slideDown('slow', function() {
                $('#NotaCritica_div').fadeIn('fast');
            });

            $('#Editorial_p').slideDown('slow', function() {
                $('#Editorial_p').fadeIn('fast');
            });
        });

        $("#TipoResena option:selected:contains('Reseña')").each(function() {
            $('#ReferenciaBibliograficaLibro').attr('disabled', false);
            $('#ReferenciaBibliograficaRevista').attr('disabled', false);

            $('#ResenaBibliografica_div').slideDown('slow', function() {
                $('#ResenaBibliografica_div').fadeIn('fast');
            });
        });

        return false;
    }
}

var TesisEnableOptions = {
    setup: function() {
        $('#GradoAcademico').change(TesisEnableOptions.enableOptions);
        $('#forma').unload(TesisEnableOptions.enableOptions());
    },
    enableOptions: function() {

        $('#FechaGrado').attr('disabled', false);

        $('#FechaGrado_p').slideDown('slow', function() {
            $('#FechaGrado_p').fadeIn('fast');
        });

        $("#GradoAcademico option:selected:contains('Seleccione')").each(function() {
            $('#FechaGrado').attr('disabled', true);

            $('#FechaGrado_p').slideUp('slow', function() {
                $('#FechaGrado_p').fadeOut('fast');
            });
        });

        return false;
    }
}

var SubForm = {
    setup: function() {
        $('a.cancel').live("click", SubForm.cancel);
    },
    cancel: function() {
        var form = $(this).attr('rel');
        $('#' + form + '_form').hide();
        $('#' + form + '_new').show();
        $('#' + form + '_form').html('');
        
        return false;
    }
};

var DateTimePicker = {
    setup: function() {
        $.datepicker.setDefaults($.datepicker.regional['fr']);
        $.datepicker.setDefaults({
            dateFormat: 'dd/mm/yy',
            changeMonth: true, 
            changeYear: true
        });
        $('input.datetime').each(function() {
            $(this).datepicker();
        });
    }
};

var AutoComplete = {
    setup: function() {
        $('input.autocomplete').each(function() {
            var url = $(this).attr('rel');

            var value = $(this).val();
            $(this).autocomplete(url,
            {
                minChars: 5,
                delay: 400,
                matchSubset: 1,
                matchContains: 1,
                cacheLength: 10,
                autoFill: true,
                selectFirst: true,
                mustMatch: 1,
                onItemSelect: AutoComplete.selectItem,
                onFindValue: AutoComplete.findValue
            });

            $(this).val(value);
        });
    },
    selectItem: function(li, input) {
        AutoComplete.findValue(li, input);
    },
    findValue: function(li, input) {
        var hidden = $('input[rel=#' + input.attr('id') + ']').attr('id');
        field = $('#' + hidden);

        if (li == null) {
            $(field).val('');
            return;
        }

        if (!!li.extra & li.extra.length > 0)
            var sValue = li.extra[0];
        else if (input.val() != '')
            var sValue = $(field).val();
        else
            var sValue = li.selectValue;

        $(field).val(sValue);
    }
};

var SearchAutoComplete = {
    field: null,
    setup: function() {
        $('a.searchAutoComplete').each(function() {
            var url = $(this).attr('href');
            var textbox = $(this).attr('rel');

            $(textbox).autocomplete(url,
                {
                    minChars: 5,
                    delay: 400,
                    matchSubset: 1,
                    matchContains: 1,
                    cacheLength: 10,
                    onItemSelect: SearchAutoComplete.selectItem,
                    onFindValue: SearchAutoComplete.findValue,
                    autoFill: true
                });
            $(textbox).blur(SearchAutoComplete.setId);

            var baseId = $(this).attr('id');
            field = $('#' + baseId + 'Id');
            $(field).val('');
        });

        $('a.searchAutoComplete').live("click", SearchAutoComplete.click);
    },
    setId: function() {
        var autocomplete = $(this)[0].autocompleter;
        autocomplete.findValue();
    },
    click: function() {
        var baseId = $(this).attr('id');
        field = $('#' + baseId + 'Id');
        form = $('#' + baseId + 'Form');

        if ($(field).val() == '')
            return false;

        $(form).submit();
        $(field).val('');

        return false;
    },
    selectItem: function(li, input) {
        SearchAutoComplete.findValue(li, input);
    },
    findValue: function(li, input) {
        var baseId = $('a.searchAutoComplete[rel=#' + input.attr('id') + ']').attr('id');
        field = $('#' + baseId + 'Id');

        if (li == null) {
            $(field).val('');
            return;
        }

        if (!!li.extra) var sValue = li.extra[0];
        else var sValue = li.selectValue;

        $(field).val(sValue);
    }
}

var LocalForm = {
    setup: function() {
        $('input.local').live("click", LocalForm.formLocal);
    },
    formLocal: function() {
        var combo = $(this).attr('rel');
        combo = combo.replace('.', '_');

        var handle = $(combo).attr('rel');
        var value = $(combo).val();

        if (value == null | value == "")
            return false;

        if ($(handle + 'List ' + handle + '_' + value).length > 0) {
            $(handle + '_form').hide();
            $(handle + '_new').show();
            return false;
        }

        var text = $(combo + ' :selected').text();

        var newRow = '<div id="' + handle.replace('#', '') + '_' + value + '" class="sublista"><h6>' + text + '<input type="hidden" value="' + value + '" name="' + combo.replace('#', '').replace('_', '.') + '_New" id="' + combo.replace('#', '') + '_New"/></h6></div>';
        var row = $(handle + 'EmptyList_form');
        if (row.length == 0) {
            row = $(handle + 'List div:first');
            row.before(newRow);
        } else {
            row.before(newRow);
            row.remove();
        }

        $(handle + '_form').hide();
        $(handle + '_new').fadeIn('slow');

        return false;
    }
}

var RemoteForm = {
    setup: function() {
        $('input.remote').live("click", RemoteForm.formAjax);
    },
    formAjax: function() {
        var formname = $(this).attr('rel');
        var method = $(formname).attr('method');
        var url = $(formname).attr('action');
        var data = $(formname).serialize();

        var currentLink = $(this);

        var currentCombo = $(formname + ' p :input');
        var handle = $(currentCombo).attr('rel');
        var value = $(currentCombo).val();

        if (value == null | value == "")
            return false;

        if ($(handle + 'List ' + handle + '_' + value).length > 0) {
            $(handle + '_form').hide();
            $(handle + '_new').show();
            return false;
        }

        currentLink.showLoading();

        $.ajax({
            url: url,
            type: method,
            data: data,
            dataType: 'script',
            complete: function(request, settings) {
                currentLink.removeLoading();
            }
        });

        return false;
    }
};

var RemoteLink = {
    setup: function() {
        $('a.remote').live("click", RemoteLink.linkAjax);
    },
    linkAjax: function() {
        var method = "post";

        if ($(this).hasClass('put')) {
            method = "put";
        } else if ($(this).hasClass('delete')) {
            method = "delete";
        } else if ($(this).hasClass('get')) {
            method = "get";
        }

        var url = $(this).attr('href');
        var currentLink = $(this);

        currentLink.showLoading();
        $.ajax({
            url: url,
            type: method,
            dataType: 'script',
            success: function(msg) {
                currentLink.removeLoading();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                currentLink.removeLoading();
                alert(textStatus);
            }
        });
        
        return false;
    }
};