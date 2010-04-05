var UploadMulti = {
    totalSize: 0,
    fileData: null,
    queue: null,
    setup: function (fileUpload, queue, uploader, cancelImg, uploadImg, action, auth) {
        $(fileUpload).uploadify({
            'uploader': uploader,
            'script': action,
            'cancelImg': cancelImg,
            'folder': action,
            'queueID': queue,
            'auto': false,
            'multi': true,
            'buttonText': '',
            'buttonImg': uploadImg,
            'width': 190,
            'onSelect': UploadMulti.onSelect,
            'onSelectOnce': UploadMulti.onSelectOnce,
            'onProgress': UploadMulti.onProgress,
            'onComplete': UploadMulti.onComplete,
            'onAllComplete': UploadMulti.onAllComplete,
            'onCancel': UploadMulti.onCancel,
            'onError': UploadMulti.onError,
            'scriptData': { token: auth }
        });
    },
    onSelect: function (event, queueID, fileObj) {
        UploadMulti.fileData = fileObj;
        UploadMulti.queue = queueID;
    },
    onSelectOnce: function (event, data) {
        UploadMulti.totalSize = data.allBytesTotal;

        $('span.percentage').each(function () {
            $(this).remove();
        });

        $('div.uploadifyProgress').each(function () {
            $(this).remove();
        });

        if ($('#archivoEmptyListForm').is(':visible')) {
            $('#archivoEmptyListForm').hide();
        }

        $('div.cancel').each(function () {
            var action = $(this).children()[0];
            var id = $(action).attr('href').match(/\('(\w*)'\)/)[1];
            var filename = $('#uploadify' + id + ' > span').text();

            $('#uploadify' + id).addClass('sublista');

            $(action).attr('href', id);
            $(action).click(UploadMulti.removeFromQueue);

            $('#uploadify' + id + ' > span').remove();
            $('#uploadify' + id).append('<h6></h6>');
            $('#uploadify' + id + ' > h6').append(action);
            $('#uploadify' + id + ' > h6 > a').after(filename);

            $(this).remove();
        });

        setupSublistRows();
    },
    removeFromQueue: function () {
        var id = $(this).attr('href');
        $('#uploadify').uploadifyCancel(id);

        return false;
    },
    onCancel: function (event, queueID, fileObj, data) {
        $('#fileQueue > #uploadify' + queueID).remove();

        if ($('#fileQueue > div.uploadifyQueueItem').length == 0) {
            $('#archivoEmptyListForm').show();
        }

        UploadMulti.totalSize -= fileObj.size;
        setupSublistRows();
    },
    upload: function () {
        $('#uploadify').uploadifySettings(
                'scriptData',
                {
                    '__RequestVerificationToken': $('input:hidden[name=__RequestVerificationToken]').val(),
                    'Id': $('#Id').val(),
                    'tipoArchivo': 1//$(uploadify).attr('id').split('_')[0]
                });

        var queueSize = $('#uploadify').uploadifySettings('queueSize');
        if (queueSize == 0) {
            window.location.href = $('#regresar').attr('href');
            return;
        }

        $('.progress_container').show();
        $('#progressbar').progressbar({ value: 0 });
        $('#uploadify').uploadifyUpload();
    },
    onProgress: function (event, queueID, fileObj, data) {
        $('.status_message').html('Subiendo ' + fileObj.name + '...');

        stepSize = 100 / UploadMulti.totalSize;
        step = (stepSize * data.allBytesLoaded);

        $('#progressbar').progressbar("option", "value", step);

        return false;
    },
    onComplete: function (event, queueID, fileObj, response, data) {
        return false;
    },
    onAllComplete: function (event, data) {
        $('.progress_container').hide();

        $('#fileQueue img').each(function () {
            $(this).show();
        });

        window.location.href = $('#regresar').attr('href');
    },
    onError: function (event, queueID, fileObj, errorObj) {
        alert('Error');
    }
};