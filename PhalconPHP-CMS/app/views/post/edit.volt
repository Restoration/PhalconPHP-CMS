<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>New Post</h3>
				</div>
			</div>

			<div class="clearfix"></div>

			<div class="row">

			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="x_panel">
					<div class="x_title">
						<h2>Post</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
								<ul class="dropdown-menu" role="menu">
									<li>
										<a href="#">Settings 1</a>
									</li>
									<li>
										<a href="#">Settings 2</a>
									</li>
								</ul>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div><!-- /.x_title -->

					<div class="x_content">
						{{ form("post/save","method": "post") }}
							<div id="alerts">{{ flashSession.output() }}</div>
							<div class="col-md-12 col-sm-12 col-xs-12 form-group">
								{{ text_field('post_title', 'class':'form-control', 'placeholder': 'Post Title','name':'post_title') }}
							</div>

							<div class="clearfix"></div>

							<div class="btn-toolbar editor" data-role="editor-toolbar" data-target="#editor-one">

								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="fa fa-font"></i><b class="caret"></b></a>
									<ul class="dropdown-menu">
									</ul>
								</div>

								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li>
											<a data-edit="fontSize 5"><p style="font-size:17px">Huge</p></a>
										</li>
										<li>
											<a data-edit="fontSize 3"><p style="font-size:14px">Normal</p></a>
										</li>
										<li><a data-edit="fontSize 1"><p style="font-size:11px">Small</p></a></li>
									</ul>
								</div>

								<div class="btn-group">
									<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="fa fa-bold"></i></a>
									<a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="fa fa-italic"></i></a>
									<a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="fa fa-strikethrough"></i></a>
									<a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="fa fa-underline"></i></a>
								</div>

								<div class="btn-group">
									<a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="fa fa-list-ul"></i></a>
									<a class="btn" data-edit="insertorderedlist" title="Number list"><i class="fa fa-list-ol"></i></a>
									<a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="fa fa-dedent"></i></a>
									<a class="btn" data-edit="indent" title="Indent (Tab)"><i class="fa fa-indent"></i></a>
								</div>

								<div class="btn-group">
									<a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="fa fa-align-left"></i></a>
									<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="fa fa-align-center"></i></a>
									<a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="fa fa-align-right"></i></a>
									<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="fa fa-align-justify"></i></a>
								</div>

								<div class="btn-group">
									<a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="fa fa-link"></i></a>
									<div class="dropdown-menu input-append">
										<input class="span2" placeholder="URL" type="text" data-edit="createLink" />
										<button class="btn" type="button">Add</button>
									</div>
									<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="fa fa-cut"></i></a>
								</div>

								<div class="btn-group">
									<a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="fa fa-picture-o"></i></a>
									<input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
								</div>

								<div class="btn-group">
									<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="fa fa-undo"></i></a>
									<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="fa fa-repeat"></i></a>
								</div>
							</div>

							<div id="editor-one" class="editor-wrapper"></div>

							{{ text_area("post_message", 'name': 'post_message', 'id': 'descr','style':'display:none;') }}

							<br />

							<div class="ln_solid"></div>

							<div class="col-md-offset-10">
								{{ submit_button('Cancel','type':'button','class':'btn btn-primary') }}
								{{ submit_button('Submit','type':'submit','class':'btn btn-success','id':'postSubmit') }}
							</div>
						{{ endForm() }}
					</div><!-- /.x_content -->
				</div><!-- /.x_panel -->
			</div>
			</div>
		</div>
	</div>
<!-- /page content -->