function setUpRemoteLinks() {
    $('a.remote').live("click", linkAjax);
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