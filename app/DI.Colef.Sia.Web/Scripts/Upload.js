var totalSize = 0;

function progress(event, queueID, fileObj, data) {
    $('.status_message').html('Subiendo ' + fileObj.name + '...');
    var stepSize = 200 / totalSize;
    var step = (stepSize * data.allBytesLoaded) * 2;

    $('.progress').attr('style', 'width: ' + step + 'px;');

    return false;
}

function complete(event, queueID, fileObj, response, data) {
    var fileInfo = JSON.parse(response);
    return false;
}

function completeAll(event, data) {
    $('.status_message').html('');
    $('.progress').attr('style', 'width: 0px;');

    $('.progress_container').hide();

    $('#fileQueue img').each(function() {
        $(this).show();
    });
}

function selectOnce(event, data) {
    totalSize = data.allBytesTotal;

    $('span.percentage').each(function() {
        $(this).remove();
    });

    $('div.uploadifyProgress').each(function() {
        $(this).remove();
    });

    if ($('#archivoEmptyListForm').is(':visible')) {
        $('#archivoEmptyListForm').hide();
    }

    $('div.cancel').each(function() {
        var action = $(this).children()[0];
        var id = $(action).attr('href').match(/\('(\w*)'\)/)[1];
        var filename = $('#uploadify' + id + ' > span').text();

        $('#uploadify' + id).addClass('sublista');

        $(action).attr('href', id);
        $(action).click(removeFromQueue);

        $('#uploadify' + id + ' > span').remove();
        $('#uploadify' + id).append('<h6></h6>');
        $('#uploadify' + id + ' > h6').append(action);
        $('#uploadify' + id + ' > h6 > a').after(filename);

        $(this).remove();
    });

    setupSublistRows();    
}

function removeFromQueue() {
    var id = $(this).attr('href');
    $('#uploadify').uploadifyCancel(id);

    if ($('#fileQueue > div.uploadifyQueueItem').length == 1) {
        $('#archivoEmptyListForm').show();
    }

    setupSublistRows();
    
    return false;
}

function startUpload() {
    if ($('#fileQueue > div.uploadifyQueueItem').length == 0) {
        window.location.href = $('#regresar').attr('href');
        return;
    }
    
    $('#fileQueue img').each(function() {
        $(this).hide();
    });

    $('.progress_container').show();

    $('#uploadify').uploadifySettings(
        'scriptData', { '__RequestVerificationToken': $('input:hidden[name=__RequestVerificationToken]').val(), 'investigadorId': $('#Id').val() }
    );
    
    $('#uploadify').uploadifyUpload();
}

function error(event, queueID, fileObj, errorObj) {
    alert('Error');
}