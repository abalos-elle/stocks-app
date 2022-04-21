import 'select2'

require("jquery")

$(function() {
    $('#search').prepend('<option selected=""></option>').select2({
        placeholder: "Search Company..."
    });
    $('#search').bind('change', function() { window.location.pathname = "companies/" + $(this).val() });
});