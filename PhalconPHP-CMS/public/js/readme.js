$(function() {
    marked.setOptions({
        langPrefix: ''
    });
    var src = $('#readme').val();
	var html = marked(src);
	console.log(html);
    $('#result').html(html);
});