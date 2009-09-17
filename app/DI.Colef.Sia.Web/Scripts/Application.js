$(document.body).click(function() {
    PopMenu.closeInactiveMenu();
});

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
    PopMenu.setup();
    Cascade.setup();
};

function setupSublistRows() {
    $('div.sublista:odd').addClass('sublista-dos');
    $('div.sublista:even').addClass('sublista');
}

function showMessage(message) {
    $('#mensaje-error').addClass('mensaje-acierto');
    $('#mensaje-error').html('<p>' + message + '</p>');
}

var PopMenu = {
    currentPop: null,
    timeout: 500,
    closetimer: 0,
    setup: function() {
        $('.menu-pop').each(function() {
            var menu = $(this).attr('rel');
            $(menu).mouseover(PopMenu.over);
            $(menu).mouseout(PopMenu.out);

            $(this).mouseover(PopMenu.over);
            $(this).mouseout(PopMenu.out);
            $(this).hover(PopMenu.showMenu);
        });
    },
    showMenu: function() {
        if (PopMenu.currentPop == $(this))
            return;

        PopMenu.currentPop = $(this);

        var menu = PopMenu.currentPop.attr('rel');
        $(menu).addClass('pop');

        if ($.support.opacity)
            $(menu).slideDown('medium');
        else
            $(menu).show();

        PopMenu.cancelCloseTimer();
    },
    closeInactiveMenu: function() {
        if (PopMenu.currentPop == null) {
            var menu = $('.pop');

            if ($.support.opacity)
                $(menu).slideUp('medium');
            else
                $(menu).hide();

            $(menu).removeClass('.pop');
        }
    },
    over: function() {
        PopMenu.currentPop = $(this);
        PopMenu.cancelCloseTimer();
    },
    out: function() {
        PopMenu.currentPop = null;
        PopMenu.closeTimer();
    },
    cancelCloseTimer: function() {
        if (PopMenu.closetimer) {
            window.clearTimeout(PopMenu.closetimer);
            PopMenu.closetimer = null;
        }
    },
    closeTimer: function() {
        PopMenu.closetimer = window.setTimeout(PopMenu.closeInactiveMenu, PopMenu.timeout);
    }
};

var Cascade = {
    setup: function() {
        $('.cascade').change(Cascade.change);
    },
    change: function() {
        var url = $(this).attr('rel');
        var value = $(this).val();
        if (value == 0)
            value = 0;

        var currentLink = $(this);

        currentLink.showLoading();
        $.ajax({
            url: url,
            data: { id: value },
            type: 'get',
            dataType: 'script',
            success: function(msg) {
                currentLink.removeLoading();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                currentLink.removeLoading();
                alert(textStatus);
            }
        });
    }
};

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
};

var LocalForm = {
    setup: function() {
        $('input.local').live("click", LocalForm.formLocal);
    },
    formLocal: function() {
        var combo = $(this).attr('rel');
        var test = combo.split(',');

        for (var i = 0; i < test.length; i++) {
            combo = test[i].replace('.', '_');


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

            if (text == null | text == "") {
                text = $(combo).val();
            }

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
        }

        return false;
    }
};

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
