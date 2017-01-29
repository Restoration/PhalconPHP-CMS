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
                    data: "id",
                    'title' : '<input type="checkbox" id="check-all" name="id[]" class="flat">',
                    render: function ( data, type, full, meta ) {
                        return '<th><input type="checkbox" id="check-all" name="id[]" data-id="'+data+'" class="flat"></th>';
                    }
                },
				{ data: "user_id" , "title": "UserID" },
				{ data: "post_title" , "title": "Title" },
				{ data: "created_at" , "title": "Create date" },
				{ data: "updated_at" , "title": "Update date" },
                {
                    data: "id",
                    'title' : 'Post Edit',
                    render: function ( data, type, full, meta ) {
                        return '<a href="/PhalconPHP-CMS/post/edit&id='+data+'">Edit</a>';
                    }
                },

		    ],
		    order: [[ 4, "ASC" ]],
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