function setupDocument() {
    $('a.remote').live("click", linkAjax);
    
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

function linkAjax() {
    var method = "post";
    
    if ($(this).hasClass('put')) {
        method = "put";
    } else if ($(this).hasClass('delete')) {
        method = "delete";
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
            alert(textStatus);
        }
    });
    return false;
}