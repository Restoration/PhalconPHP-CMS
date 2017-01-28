jQuery(function($){
	/*==================================================
	Post
	==================================================*/
	// edit
	var updatePost = function(){
		// Get EditorOne value
		var txt = $('#editor-one').text();
		$('#descr').val(txt);
	}

	// index
	var getPost = function(){
		$("#postTable").dataTable({
			lengthChange: true,
			searching: true,
			ordering: true,
			info: true,
			paging: true,
			stateSave: true,
		    ajax: { url: '/PhalconPHP-CMS/post/ajaxGetPost', dataSrc: ''},
		    columns: [
                {
                    data: null,
                    'title' : '<input type="checkbox" id="check-all" name="id[]" class="flat">',
                    render: function ( data, type, full, meta ) {
                        return '<th><input type="checkbox" id="check-all" name="id[]" class="flat"></th>';
                    }
                },
				{ data: "id" , "title": "ID" },
				{ data: "user_id" , "title": "UserID" },
				{ data: "post_title" , "title": "Title" },
				{ data: "post_message" , "title": "Message" },
				{ data: "created_at" , "title": "Create date" },
				{ data: "updated_at" , "title": "Update date" }

		    ],
		    initComplete: function () {
			    $("input.flat").iCheck({
					checkboxClass: "icheckbox_flat-green",
    			});
			}
		});
		return false;
	}

	var userInterface = function(){
		$(document).on('click','#postSubmit',updatePost);
	}
	var init = function(){
		userInterface();
		getPost();
	}
	init();
});