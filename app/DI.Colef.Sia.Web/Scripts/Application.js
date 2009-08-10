function setupDocument() {
    RemoteLink.setup();
    RemoteForm.setup();
    DateTimePicker.setup();
    SubForm.setup();
    
    $('tr.highlight').live("mouseover", setHighlight);
    $('tr.highlight').live("mouseout", clearHighlight);

    $('#tabs').tabs();
    $('.clearField').clearField();

    AutoComplete.setup();
}

function showMessage(message) {
    $('#message').addClass('message');
    $('#message').html(message);
}

function setHighlight() {
    $(this).addClass('rowHighlight');
}

function clearHighlight() {
    $(this).removeClass('rowHighlight');
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
        $('a.autoComplete').each(function() {
            var url = $(this).attr('href');
            var textbox = $(this).attr('rel');

            $(textbox).autocomplete(url,
                {
                    minChars: 5,
                    delay: 400,
                    matchSubset: 1,
                    matchContains: 1,
                    cacheLength: 10,
                    onItemSelect: AutoComplete.selectItem,
                    onFindValue: AutoComplete.findValue,
                    //formatItem: AutoComplete.formatItem,
                    autoFill: true
                });
            $(textbox).blur(AutoComplete.setId);
        });

        $('a.autoComplete').live("click", AutoComplete.click);
    },
    setId: function() {
        var autocomplete = $(this)[0].autocompleter;
        autocomplete.findValue();
    },
    click: function() {
        if ($('#SearchId').val() == '')
            return false;

        $('#SearchForm').submit();
        $('#SearchId').val('');

        return false;
    },
    selectItem: function(li) {
        AutoComplete.findValue(li);
    },
    findValue: function(li) {
        if (li == null) {
            $('#SearchId').val();
            return;
        }

        if (!!li.extra) var sValue = li.extra[0];
        else var sValue = li.selectValue;

        $('#SearchId').val(sValue);
    },
    formatItem: function(row) {
        return row[0] + " (id: " + row[1] + ")";
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