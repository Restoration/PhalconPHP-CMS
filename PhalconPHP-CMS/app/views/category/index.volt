        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Category</h3>
              </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">


              <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>Category Addition<small></small></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#">Settings 1</a>
                      </li>
                      <li><a href="#">Settings 2</a>
                      </li>
                    </ul>
                  </li>
                  <li><a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
				<div id="alerts">{{ flashSession.output() }}</div>
					<div class="ln_solid"></div>

					{{ form("category/save","method": "post","class" : "form-horizontal form-label-left" , "id":"categoryForm") }}

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="category-name">Category Name <span class="required">*</span><br />(60 chars max)
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          {{ text_field('category_name', 'class': 'form-control col-md-7 col-xs-12' , ' name':'category_name','required':'required','id':'category-name','data-parsley-trigger':'keyup','data-parsley-minlength':'1','data-parsley-maxlength':'60','data-parsley-minlength-message':'Enter within 60 characters.')}}
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="slug">Slug <span class="required">*</span><br />(60 chars max)
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          {{ text_field('category_slug', 'class': 'form-control col-md-7 col-xs-12' , ' name':'category_slug','required':'required','id':'category-slug','data-parsley-trigger':'keyup','data-parsley-minlength':'1','data-parsley-maxlength':'60','data-parsley-minlength-message':'Enter within 60 characters.')}}
                        </div>
                      </div>

                      <div class="form-group">
                      	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Description <br />(200 chars max) :
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							{{ text_area('category_description', 'class': 'form-control' , ' name':'category_description','id':'category-description','id':'category-description','data-parsley-trigger':'keyup','data-parsley-minlength':'0','data-parsley-maxlength':'200','data-parsley-minlength-message':'Enter within 100 characters.','data-parsley-validation-threshold','10','rows':'6')}}

                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-md-offset-11">
	                        {{ submit_button('Save','type':'submit','class':'btn btn-success','id':'categorySave') }}
                        </div>
                      </div>



				{{ endForm() }}
              </div>
            </div>
              </div>



              <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="x_panel">
              <div class="x_title">
                <h2>Category List<small></small></h2>
                <ul class="nav navbar-right panel_toolbox">
                  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                  </li>
                  <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                    <ul class="dropdown-menu" role="menu">
                      <li><a href="#">Settings 1</a>
                      </li>
                      <li><a href="#">Settings 2</a>
                      </li>
                    </ul>
                  </li>
                  <li><a class="close-link"><i class="fa fa-close"></i></a>
                  </li>
                </ul>
                <div class="clearfix"></div>
              </div>
              <div class="x_content">
				<div id="alerts">{{ flashSession.output() }}</div>
					<div class="ln_solid"></div>
					<table id="categoryTable" class="table table-striped table-bordered bulk_action"></table>
				{{ endForm() }}
              </div>
            </div>
              </div>
            </div>

          </div>
        </div>
        <!-- /page content -->