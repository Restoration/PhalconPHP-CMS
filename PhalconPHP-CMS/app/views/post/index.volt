        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Post</h3>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>Post List</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>

						{% if action === "trash" %}
	                        <ul class="dropdown-menu" role="menu">
	                          <li><a href="#">{{ link_to('post/index','List') }}</a>
	                          </li>
	                          <li><a href="#">Settings 2</a>
	                          </li>
	                        </ul>
						{% else %}
	                        <ul class="dropdown-menu" role="menu">
	                          <li><a href="#">{{ link_to('post/index&action=trash','Trash') }}</a>
	                          </li>
	                          <li><a href="#">Settings 2</a>
	                          </li>
	                        </ul>
						{% endif %}




                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
	                <div id="alerts">{{ flashSession.output() }}</div>
	                {{ form("post/delete","method": "post") }}
					{% if action === "trash" %}
						<div class="col-lg-offset-9">
							{{ submit_button('Restore','type':'submit','class':'btn btn-success','id':'postRestore') }}
							{{ submit_button('Delete','type':'submit','class':'btn btn-danger','id':'postDelete') }}
						</div>
					{% else %}
						<div class="col-md-offset-11">
							{{ submit_button('Delete','type':'submit','class':'btn btn-danger','id':'postDelete') }}
						</div>
					{% endif %}
					<div class="ln_solid"></div>
                    <table id="postTable" class="table table-striped table-bordered bulk_action">
                      <thead>
                      </thead>
                      <tbody>
                      </tbody>
                    </table>
					{{ endForm() }}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->