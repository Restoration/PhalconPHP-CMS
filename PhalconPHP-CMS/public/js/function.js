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
	var checkBoxEvent  = function(){
		$("input.flat").iCheck({
			checkboxClass: "icheckbox_flat-green",
    	});
		var checkAll = $('input#check-all');
		var checkboxes = $('input.check');
		checkAll.on('ifChecked ifUnchecked', function(event) {
    		if (event.type == 'ifChecked') {
	    		checkboxes.iCheck('check');
	    	} else {
		    	checkboxes.iCheck('uncheck');
		    }
		});
		checkboxes.on('ifChanged', function(event){
			if(checkboxes.filter(':checked').length == checkboxes.length) {
				checkAll.prop('checked', 'checked');
			} else {
				checkAll.removeProp('checked');
			}
			checkAll.iCheck('update');
		});
	}
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
                        return '<th><input type="checkbox" name="id[]" value="'+data+'" class="flat check"></th>';
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
    			checkBoxEvent();
			},
			fnDrawCallback: function( oSettings ) {
				checkBoxEvent();
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