    <!-- jQuery -->
    {{ javascript_include("public/vendors/jquery/dist/jquery.min.js") }}
    <!-- Bootstrap -->
    {{ javascript_include("public/vendors/bootstrap/dist/js/bootstrap.min.js") }}
    <!-- FastClick -->
    {{ javascript_include("public/vendors/fastclick/lib/fastclick.js") }}
    <!-- NProgress -->
    {{ javascript_include("public/vendors/nprogress/nprogress.js") }}
    <!-- bootstrap-progressbar -->
    {{ javascript_include("public/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js") }}
    <!-- iCheck -->
    {{ javascript_include("public/vendors/iCheck/icheck.min.js") }}
    <!-- bootstrap-daterangepicker -->
    {{ javascript_include("public/vendors/moment/min/moment.min.js") }}
    {{ javascript_include("public/vendors/bootstrap-daterangepicker/daterangepicker.js") }}


{% if router.getRewriteUri() === "/index/index" or router.getRewriteUri() === "/index" %}

    <!-- Chart.js -->
    {{ javascript_include("public/vendors/Chart.js/dist/Chart.min.js") }}
    <!-- gauge.js -->
    {{ javascript_include("public/vendors/gauge.js/dist/gauge.min.js") }}
    <!-- Skycons -->
    {{ javascript_include("public/vendors/skycons/skycons.js") }}
    <!-- Flot -->
    {{ javascript_include("public/vendors/Flot/jquery.flot.js") }}
    {{ javascript_include("public/vendors/Flot/jquery.flot.pie.js") }}
    {{ javascript_include("public/vendors/Flot/jquery.flot.time.js") }}
    {{ javascript_include("public/vendors/Flot/jquery.flot.stack.js") }}
    {{ javascript_include("public/vendors/Flot/jquery.flot.resize.js") }}
    <!-- Flot plugins -->
    {{ javascript_include("public/vendors/flot.orderbars/js/jquery.flot.orderBars.js") }}
    {{ javascript_include("public/vendors/flot-spline/js/jquery.flot.spline.min.js") }}
    {{ javascript_include("public/vendors/flot.curvedlines/curvedLines.js") }}
    <!-- DateJS -->
    {{ javascript_include("public/vendors/DateJS/build/date.js") }}
    <!-- JQVMap -->
    {{ javascript_include("public/vendors/jqvmap/dist/jquery.vmap.js") }}
    {{ javascript_include("public/vendors/jqvmap/dist/maps/jquery.vmap.world.js") }}
    {{ javascript_include("public/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js") }}


{% elseif router.getRewriteUri() === "/post/index" %}
    <!-- Datatables -->
	{{ javascript_include("public/vendors/datatables.net/js/jquery.dataTables.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-buttons/js/dataTables.buttons.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-buttons/js/buttons.flash.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-buttons/js/buttons.html5.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-buttons/js/buttons.print.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-responsive/js/dataTables.responsive.min.js") }}
	{{ javascript_include("public/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js") }}
	{{ javascript_include("public/vendors/datatables.net-scroller/js/dataTables.scroller.min.js") }}
	{{ javascript_include("public/vendors/jszip/dist/jszip.min.js") }}
	{{ javascript_include("public/vendors/pdfmake/build/pdfmake.min.js") }}
	{{ javascript_include("public/vendors/pdfmake/build/vfs_fonts.js") }}

    <!-- Original Scripts -->
    {{ javascript_include("public/js/function.js") }}
{% elseif router.getRewriteUri() === "/post/edit" %}

    <!-- bootstrap-wysiwyg -->
    {{ javascript_include("public/vendors/bootstrap-wysiwyg/js/bootstrap-wysiwyg.min.js") }}
    {{ javascript_include("public/vendors/jquery.hotkeys/jquery.hotkeys.js") }}
    {{ javascript_include("public/vendors/google-code-prettify/src/prettify.js") }}
	<!-- jQuery Tags Input -->
    {{ javascript_include("public/vendors/jquery.tagsinput/src/jquery.tagsinput.js") }}
    <!-- Switchery -->
    {{ javascript_include("public/vendors/switchery/dist/switchery.min.js") }}
    <!-- Select2 -->
    {{ javascript_include("public/vendors/select2/dist/js/select2.full.min.js") }}
    <!-- Parsley -->
    <!-- {{ javascript_include("public/vendors/parsleyjs/dist/parsley.min.js") }} -->
    <!-- Autosize -->
   {{ javascript_include("public/vendors/autosize/dist/autosize.min.js") }}
    <!-- jQuery autocomplete -->
    {{ javascript_include("public/vendors/devbridge-autocomplete/dist/jquery.autocomplete.min.js") }}
    <!-- starrr -->
    {{ javascript_include("public/vendors/starrr/dist/starrr.js") }}

    <!-- Original Scripts -->
    {{ javascript_include("public/js/function.js") }}

{% elseif router.getRewriteUri() === "/readme" %}

    {{ javascript_include("public/js/marked.min.js") }}
    {{ javascript_include("public/js/readme.js") }}

{% endif %}



    <!-- Custom Theme Scripts -->
    {{ javascript_include("public/js/custom.min.js") }}

