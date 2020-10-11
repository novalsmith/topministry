Vue.config.devtools = true;
var app = new Vue({
	el: '#MainApp',
	data: {
		isDoneOnload : false,
		isDoneCategory : false,
        isUpdate : false,
        categoryVideo : "",
		keterangan : "",
		fileuploadNamePoster : "",
		fileuploadNameWarta : "",
		status : null,
		value : "",
		url : "",
		waktu : "",
		fileupload : "",
        listDataVideo : [],
        listCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
	},
	mounted : function() {
		Auth.getToken();
		this.InitOnload();
        this.GetDataLookup();
		this.GetCategory();
		CKEDITOR.replace('keterangan');
	},
    methods:
    {
        GetDataLookup : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'lookup',
                success: function(Result){
					var Category = $.grep(Result.data, function(value,key){
						return value != null;
					});
					app.renderTable(Category);
					app.listDataVideo.push(Category);
					$('#loading').hide();
					$('#VideoPage').show();
					
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data video, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
        },
        GetCategory : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'lookup/category',
                success: function(Result){
					var lisdata = [];
					$.each(Result.data, function(key,val){
						app.listCategory.push({
                            id : val.idlookupCategory,
							text : val.categoryName
                        });	 
					});
					app.InitListBox();
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
		},
		InitListBox :  function(){
            $("#category").select2({
                theme: 'bootstrap4',
                dropdownParent: $('#CategoryPages'),
                width: "100%", 
                placeholder: "Category",
                data :  app.listCategory,
				minimumResultsForSearch: 6,
				allowClear : true
                });
                $("#category").val("").trigger("change");
        },
		create : function()
		{
			 
			if ($("#FormLookup").valid()) 
			{ 	
				var param = { 
				value : $('#value').val(),
				description : CKEDITOR.instances.keterangan.getData(),
				id_categori : $('#category').val(),
				code : $('#code').val(),
				status : 0
				};
				var l = Ladda.create( document.querySelector( '#saveAddWarta'));
			 
			$.ajax({
				type:'POST',
				url: app.BaseUrl+"lookup/create",
				data:param,
				 
				beforeSend: function(){
					l.start();
				},
				header:{
					'Content-Type' : 'multipart/form-data'
				},
				success:function(data){
					$('#TableEwarta').DataTable().clear().destroy();
					var alert = "";
					var statusMessage ="";
					if(data.status){
						alert = "alert-primary";
						statusMessage = "Berhasil";
						$('#alertMessage').addClass("alert-primary");
					}else{
						alert = "alert-danger";
						statusMessage = "Terjadi Kesalahan";
						$('#alertMessage').addClass("alert-danger");
					}
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#MainMessage').html(`
					<span><b> `+statusMessage+` - </b>`+data.message+` </span>
					`);
					l.stop();
					app.GetDataLookup();
				}
			}).fail(function(jqxhr) {
				console.log(jqxhr.responseJSON.message['description']);
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON.message['description']);
					app.GetDataLookup();
				});
			} 
		},
		previewVideo : function()
		{
			var getCategory = $.grep(app.listCategory[0], function(val, key){
				return val.id == app.id_categori;
			})[0];
			 
			$('#modalVideo').modal("show");
			if( app.fileuploadNamePoster !=null){
				$('#preview_img').html("<img class='col-md-12 col-sm-12 col-xs-12' src='" + app.BaseUrlroot + "top/assets/img/Admin/warta/" + app.fileuploadNamePoster + "'></img>");		
			}else{
				$('#preview_img').html("<p class='col-md-12'>Tidak ada poster</div>");
			}
			if( app.fileuploadNameWarta !=null){
				$('#preview_download').html("<a class='btn btn-sm btn-primary' target='_blank' href='" + app.BaseUrlroot + "top/assets/img/Admin/warta/" + app.fileuploadNameWarta + "'>Download Pdf</a>");
			}else{
				 
				$('#preview_download').html("<p>Tidak ada file warta</div>");
			}
			$('#preview_title').text(app.value);
			$('#preview_status').text(app.status == 1 ? "Active" : "No Active");
			$('#preview_kategori').text(getCategory.text);
			$('#preview_waktu').text(app.waktu);
			
			$('#CategoryModal').modal("hide");
		},
		createNew : function(){
				this.isUpdate = false;
				this.idlookup = null;
				this.isUpdate = false;
				this.status = "";
				this.value = "";
				this.waktu = "";
				this.fileuploadNamePoster = "";
				this.keterangan = "";
				CKEDITOR.instances.keterangan.setData("");
				this.resetAlert();
				$('#showimage').hide();
				$('#ModalLabel').text("Add Lookup");
				$('#status').val("").trigger("change");
				$("#code").val("").attr("disabled",false);
				$('#category').val("").trigger("change");
				$('#dateStart').val("");
				$('#CategoryModal').modal("show");
				
		},
		update : function(idlookup){
			this.resetAlert();
            this.isUpdate = true;
            var table = $('#TableEwarta').DataTable();
			var listdata = []; 
				table.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
					var data = this.data();
					listdata.push(data);
				} );
			var row = $.grep(listdata, function(val, key){
				return val.idlookup === idlookup;
			});
			this.idlookup = row[0].idlookup;
			this.value = row[0].valueCategory;
			this.status = row[0].status;
			this.keterangan = row[0].description;
			this.id_categori = row[0].id_categori;
			CKEDITOR.instances.keterangan.setData(row[0].description);
			$("#status").val(row[0].status).trigger("change");
			$("#code").val(row[0].code).attr("disabled",true);
			$("#category").val(row[0].idlookupCategory).trigger("change");
			$('#ModalLabel').text("Update Lookup");
			$('#CategoryModal').modal("show");
		},
		UpdateAction:function()
		{
			if ($("#FormLookup").valid()) 
			{ 	
				var param = { 
					value : $('#value').val(),
					description : CKEDITOR.instances.keterangan.getData(),
					id_categori : $('#category').val(),
					status : $('#status').val()
					};
				var l = Ladda.create( document.querySelector( '#saveUpdateWarta'));
				$.ajax({
					type:'POST',
					url:app.BaseUrl+"lookup/update/"+app.idlookup,
					data:param,
					beforeSend: function(){
						l.start();
					},
					success:function(data){
						$('#TableEwarta').DataTable().clear().destroy();
						var alert = "";
						var statusMessage ="";
						if(data.status){
							alert = "alert-primary";
							statusMessage = "Berhasil";
						
						}else{
							alert = "alert-danger";
							statusMessage = "Terjadi Kesalahan";
						}
						$('#CategoryModal').modal("hide");
						$('#alertMessagePage').show();
						$('#alertMessage').addClass(""+alert+"");
						$('#MainMessage').html(`
						<span><b> `+statusMessage+` - </b>`+data.message+` </span>
						`);
						l.stop();
						app.GetDataLookup();
					}
					}).fail(function(jqxhr) {
						l.stop();
						$('#CategoryModal').modal("hide");
						$('#alertMessagePage').show();
						$('#alertMessage').addClass("alert-danger");
						$('#status').text("Fail");
						$('#statusMessage').text(jqxhr.responseJSON);
						app.GetDataLookup();
					});
			}
		},
		deleteAction : function(){
					$('#TableEwarta').DataTable().clear().destroy();
					var l = Ladda.create( document.querySelector( '#modal-btn-true'));
					l.start();
					var param = {
						oldfileuploadPoster : app.fileuploadNamePoster,
						oldfileuploadWarta : app.fileuploadNameWarta
						};
					var jqxhr = $.post(app.BaseUrl+"ewarta/delete/"+this.idlookup,param)
						.done(function(data) {
						var alert = "";
						var statusMessage ="";
						if(data.status){
							alert = "alert-primary";
							statusMessage = "Success";
							app.GetDataLookup();
						}else{
							alert = "alert-danger";
							statusMessage = "Fail";
						}
						
						$('#alertMessagePage').show();
						$('#alertMessage').addClass(""+alert+"");
						$('#MainMessage').html(`
						<span><b> `+statusMessage+` - </b>`+data.message+` </span>
						`);
						l.stop();
					})
					.fail(function(jqxhr) {
						l.stop();
						$('#CategoryModal').modal("hide");
						$('#alertMessagePage').show();
						$('#alertMessage').addClass("alert-danger");
						$('#status').text("Fail");
						$('#statusMessage').text(jqxhr.responseJSON);
					});
		},
		resetAlert : function(){
			// Reset Alert
			$("#FormLookup").validate().resetForm();
			$('#alertMessagePage').hide();
			$('#alertMessage').removeClass("alert-primary");
			$('#alertMessage').removeClass("alert-danger");
			$('#MainMessage').html('');
		// Reset Alert
		},
		renderTable : function(Category){
			var oTable =	$('#TableEwarta').DataTable({
			data: Category,
			retrieve: true,
			columns: 
			[
                { data: "idlookup" },
				{ data: "code" },
				{ data: "valueCategory" },
                { data: "categoryName"},
				{
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["status"]==1 ? "Active":"No Active")+'</span>'
					},
					width:"10%",
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary" onclick="app.update(\''+ row["idlookup"]+ '\');">View</a>';
					},
					targets: -1,  // -1 is the last column, 0 the first, 1 the second, etc.
					width:"5%",
					orderable: false,
					className: "text-center" 
				}
			],
			columnDefs:
			[
				{
					searchable: false,
					orderable: false,
					targets : 0
				} 
			],
			lengthMenu: [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],
			order: [[ 1, 'asc' ]],
			language: 
			{
				paginate: {
					next	: '<i class="fa fa-arrow-right" aria-hidden="true"></i>',
					previous:  '<i class="fa fa-arrow-left" aria-hidden="true"></i>'
				}
			}
		});
		
		$('#searching').keyup(function(){
			oTable.search( $(this).val() ).draw();
		});
		oTable.on( 'order.dt search.dt', function () {
			oTable.column(0, {search:'applied', order:'applied'}).nodes().each( function (cell, i) {
				cell.innerHTML = i+1;
			} );
		} ).draw();

		$("#TableEwarta_filter").html("").append(`
		<div class="pull-right mb-2">
		<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
		</div>   
		`);
		$('#TableEwarta_length select').addClass("rounded-0");
		$('#TableEwarta_length select').css("width","100px");

	
	},
	InitOnload: function()
	{
		$('#alertMessagePage').hide();
		$('#FormLookup').validate({
			rules: {
				value: { required: true, minlength : 2 },
				category : { required: true}, 
				waktu: { required: true},
				statusVideo : { required: true},
				code : { required: true, maxlength : 4},
				keterangan : { required: true, minlength : 10}
			},
			messages: {
				value: {
					required : "value masih kosong",
					minlength : "Minimal 2 karakter"
				},
				waktu : {	required : "Waktu masih kosong"},
				statusVideo : {	required : "Status masih kosong"},
				category : {	required : "Category masih kosong"},
				code : {	required : "Kode masih kosong"},
				keterangan : {	required : "Keterangan masih kosong", minlength : "Minimal 10 karakter"},
			},
			errorPlacement: function (error, element) {
				error.insertAfter(element.closest('div'));
			}
		});
		$('#alertMessagePage button').click(function(){
			app.resetAlert();
		});
		$("#status").select2({
        theme: 'bootstrap4',
        dropdownParent: $('#StatusPage'),
        width: "100%", 
        placeholder: "Status",
        minimumResultsForSearch: -1
        });
        $("#status").val(0).trigger("change");
    
        $('#dateStart').datepicker({
            weekStart: 1,
            daysOfWeekHighlighted: "6,0",
            autoclose: true,
            todayHighlight: true,
        });
		
		modalConfirm.callback(function(confirm){
			if(confirm)
			{
				app.deleteAction();
			}
		});

		$('#category').change(function(){
			if($('#category').val() !=""){
				
				$('#FormVideo label[for="category"]').hide();
			}
		});
}
}
});
