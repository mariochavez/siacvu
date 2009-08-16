function setupDocument() {
    RemoteLink.setup();
    RemoteForm.setup();
    LocalForm.setup();
    DateTimePicker.setup();
    SubForm.setup();

    $('div.elementodescripcion:odd').addClass('elementolista-dos');
    setupSublistRows();

    $('.clearField').clearField();

    SearchAutoComplete.setup();
}

function setupSublistRows() {
    $('div.sublista:odd').addClass('sublista-dos');
    $('div.sublista:even').addClass('sublista');
}

function showMessage(message) {
    $('#mensaje-error').addClass('mensaje-acierto');
    $('#mensaje-error').html('<p>' + message + '</p>');
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
    },
    formatItem: function(row) {
        return row[0] + " (id: " + row[1] + ")";
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

        if (value == null)
            return false;

        if ($(handle + 'List #' + value).length > 0) {
            $(handle + '_form').hide();
            $(handle + '_new').show();
            return false;
        }

        var text = $(combo + ' :selected').text();

        var newRow = '<tr id="' + value + '"><td>' + text + '<input type="hidden" value="' + value + '" name="' + combo.replace('#', '').replace('_', '.') + '_New" id="' + combo.replace('#', '') + '_New"/></td></tr>';
        var row = $(handle + 'EmptyList_form');
        if (row.length == 0) {
            row = $(handle + 'List tr:nth-child(2)');
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