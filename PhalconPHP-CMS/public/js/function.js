jQuery(function($){
	/*==================================================
	Post
	==================================================*/
	var updatePost = function(){
		// Get EditorOne value
		var txt = $('#editor-one').text();
		$('#descr').val(txt);
	}
	var userInterface = function(){
		$(document).on('click','#postSubmit',updatePost)
	}
	var init = function(){
		userInterface();
	}
	init();
});