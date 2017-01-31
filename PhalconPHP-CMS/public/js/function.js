jQuery(function($){
	/*==================================================
	Post
	==================================================*/
	// edit
	var updatePost = function(){
		// Get EditorOne value
		var txt = $('#editor-one').html();
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
                    'title' : '<input type="checkbox" id="check-all" name="check-all[]" class="flat">',
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
                        return '<a href="/PhalconPHP-CMS/post/edit&id='+data+'" class="btn btn-success">Edit</a>';
                    }
                },

		    ],
		    order: [[ 4, "ASC" ]],
		    initComplete: function () {
    			checkBoxEvent();
			},
			fnDrawCallback: function( oSettings ) {
				checkBoxEvent();
			},
			fnInitComplete: function(settings, json){
				console.log(json);
				if (Object.keys(json).length === 0) {
					$('#postRestore').attr('disabled',true);
					$('#postDelete').attr('disabled',true);
				}
			},

		});
		return false;
	}

	// Trash post view
	var getDeletePost = function(){
		$("#postTable").dataTable({
			lengthChange: true,
			searching: true,
			ordering: true,
			info: true,
			paging: true,
			stateSave: true,
		    ajax: { url: '/PhalconPHP-CMS/post/ajaxGetPost&action=trash', dataSrc: ''},
		    columns: [
                {
                    data: "id",
                    'title' : '<input type="checkbox" id="check-all" name="check-all[]" class="flat">',
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
                    'title' : 'Post Delete',
                    render: function ( data, type, full, meta ) {
                        return '<button type="submit" class="btn btn-danger" name="id[]" value="'+data+'" >Delete</button>';
                    }
                },

		    ],
		    order: [[ 4, "ASC" ]],
		    initComplete: function () {
    			checkBoxEvent();
			},
			fnDrawCallback: function( oSettings ) {
				checkBoxEvent();
			},
			fnInitComplete: function(settings, json){
				console.log(json);
				if (Object.keys(json).length === 0) {
					$('#postRestore').attr('disabled',true);
					$('#postDelete').attr('disabled',true);
				}
			},
		});
		return false;
	}

	function getUrlVars()
	{
	    var vars = [], hash;
	    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	    for(var i = 0; i < hashes.length; i++)
	    {
	        hash = hashes[i].split('=');
	        vars.push(hash[0]);
	        vars[hash[0]] = hash[1];
	    }
	    return vars;
	}



	var userInterface = function(){
		$(document).on('click','#postSubmit',updatePost);

	}
	var init = function(){
		userInterface();
		if(getUrlVars()['action'] == 'trash'){
			getDeletePost();
		} else {
			getPost();
		}
	}
	init();
});