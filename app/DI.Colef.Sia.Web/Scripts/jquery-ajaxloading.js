(function($) {
    function Loading() {
        var self = this

        this.html = function(message) {
            var html = '';
            html += '<div class="ajax-loading">'
            html += message;
            html += '</div>';
            return html;
        }
    }

    $.fn.removeLoading = function() {
        return this.each(function() {
            //$(this).parent().parent().find('.ajax-loading').remove();
            $('div.ajax-loading').remove();
        });
    }

    $.fn.showLoading = function(message) {
        if (message === undefined) message = 'Trabajando ...';
        return this.each(function() {
            //$(this).removeLoading().parent().after(new Loading().html());
            $('#Pagina').after(new Loading().html(message));
        });
    }
})(jQuery);