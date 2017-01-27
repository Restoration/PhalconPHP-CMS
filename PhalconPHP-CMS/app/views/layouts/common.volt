<body class="nav-md">
    <div class="container body">
	    <div class="main_container">

		{% include 'parts/sidebar.volt' %}

		{% include 'parts/top-nav.volt' %}

		{{ content() }}

		<!-- footer content -->
		<footer>
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
			</div>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
		</div>
	</div>
	{% include 'parts/js.volt' %}
</body>



