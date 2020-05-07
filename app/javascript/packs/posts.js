Bloodhound = require("packs/typeahead.bundle")

$(document).on('turbolinks:load', function () {
    var posts = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.whitespace,
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        remote: {
            url: '/posts/autocomplete?search=%SEARCH',
            wildcard: '%SEARCH'
        }
    });
    $('#search').typeahead(null, {
        source: posts
    });
})