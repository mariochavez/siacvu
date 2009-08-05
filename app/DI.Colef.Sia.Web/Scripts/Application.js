function setupDocument() {
    RemoteLink.setup();
    RemoteForm.setup();
    DateTimePicker.setup();
    SubForm.setup();
    
    $('tr.highlight').live("mouseover", setHighlight);
    $('tr.highlight').live("mouseout", clearHighlight);
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