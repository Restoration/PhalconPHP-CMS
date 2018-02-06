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

					{{ form("category/save","method": "post","class" : "form-horizontal form-label-left") }}

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="category-name">Category Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="category-name" required="required" class="form-control col-md-7 col-xs-12" name="category_name">
                        </div>
                      </div>

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="slug">Slug <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="slug" class="form-control col-md-7 col-xs-12" name="category_slug">
                        </div>
                      </div>

                      <div class="form-group">
                      	<label class="control-label col-md-3 col-sm-3 col-xs-12" for="description">Description <br />(20 chars min, 100 max) :
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<textarea id="message" name="category_description" required="required" class="form-control" name="description" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.." data-parsley-validation-threshold="10" rows="6"></textarea>
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