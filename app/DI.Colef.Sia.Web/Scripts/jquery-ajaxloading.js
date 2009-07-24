(function($) {
    function Loading() {
        var self = this

        this.html = function() {
            var html = '';
            html += '<div class="ajax-loading">'
            html += ' ';
            html += '</div>';
            return html;
        }
    }

    $.fn.removeLoading = function() {
        return this.each(function() {
            $(this).parent().find('.ajax-loading').remove();
        });
    }

    $.fn.showLoading = function() {
        return this.each(function() {
            $(this).removeLoading().after(new Loading().html());
        });
    }
})(jQuery);