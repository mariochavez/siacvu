(function($) {
    function Loading() {
        var self = this

        this.html = function() {
            var html = '';
            html += '<div class="ajax-loading">'
            html += ' Trabajando ...';
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

    $.fn.showLoading = function() {
        return this.each(function() {
            //$(this).removeLoading().parent().after(new Loading().html());
            $('#Pagina').after(new Loading().html());
        });
    }
})(jQuery);