Vue.config.devtools = true;
var app = new Vue({
	el: '#MainApp',
	data: {
		isDoneOnload : false,
		isDoneCategory : false,
        isUpdate : false,
        categoryVideo : "",
		keterangan : "",
		fileuploadName : "",
		status : null,
		judul : "",
		url : "",
		fileupload : "",
        listDataVideo : [],
        listCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
	},
	mounted : function() {
		this.InitOnload();
        this.GetDataVideo();
		this.GetCategory();
	},
    methods:
    {
        GetDataVideo : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'video',
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
				url:this.BaseUrl+'category',
                success: function(Result){
					var lisdata = [];
					$.each(Result.data, function(key,val){
						lisdata.push({
                            id : val.id_categori,
							text : val.nama_categori,
							status : val.status_categori
                        });	 
					});
				var isActiveData =	$.grep(lisdata, function(val, key){
					return val.status == 1;
					});
					app.listCategory.push(isActiveData);
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
                data :  app.listCategory[0],
				minimumResultsForSearch: 6,
				allowClear : true
                });
                $("#category").val("").trigger("change");
        },
		create : function()
		{
			if ($("#FormVideo").valid()) 
			{ 	
				var dataAgenda = $('#judul').val();
				var dataKeterangan = this.keterangan;
				var category = $('#category').val();
				var url = $('#url').val();
				var filename = app.$refs.file.files[0]; 
				var formData =  new FormData();
				formData.append('judul',dataAgenda);
				formData.append('keterangan',dataKeterangan);
				formData.append('category',category);
				formData.append('fileupload',filename);
				formData.append('status',0);
				formData.append('url',url);
				var l = Ladda.create( document.querySelector( '#saveAddAgenda'));
			$.ajax({
				type:'POST',
				url: app.BaseUrl+"video/create",
				data:formData,
				cache:false,
				contentType: false,
				processData: false,
				beforeSend: function(){
					l.start();
				},
				header:{
					'Content-Type' : 'multipart/form-data'
				},
				success:function(data){
					$('#TableVideo').DataTable().clear().destroy();
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
					app.GetDataVideo();
				}
			}).fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetDataVideo();
				});
			} 
		},
		previewVideo : function()
		{
			$("iframe").attr("src", this.url);
			$('#modalVideo').modal("show");
			$('#CategoryModal').modal("hide");
		},
		createNew : function(){
				this.isUpdate = false;
				this.id_video = null;
				this.isUpdate = false;
				this.status = "";
				this.judul = "";
				this.url = "";
				this.fileuploadName = "";
				this.keterangan = "";
				this.resetAlert();

				$('#showimage').hide();
				$('#CategoryModalLabel').text("Add Video");
				$('#category').val("").trigger("change");
				$('#CategoryModal').modal("show");
				
		},
		update : function(id_video){
            this.isUpdate = true;
            var table = $('#TableVideo').DataTable();
			var listdata = []; 
				table.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
					var data = this.data();
					listdata.push(data);
				} );
			var row = $.grep(listdata, function(val, key){
				return val.id_video === id_video;
			});
			this.id_video = row[0].id_video;
			this.url = row[0].link;
			this.judul = row[0].judul;
			this.fileupload = "";
			this.status = row[0].status;
			this.fileuploadName = row[0].poster;
			this.keterangan = row[0].keterangan;
			$("#status").val(row[0].status).trigger("change");
			$("#category").val(row[0].id_categori).trigger("change");
			if(row[0].poster !=""){
				$('#showimage').show();
				$('#showimage').html('<a href="'+app.BaseUrlroot+'top/assets/img/Admin/video/'+row[0].poster+'" target="_blank">Lihat Poster</a>');
			}else{
				$('#showimage').hide();
				$('#showimage').html('');
			}
			$('#fileupload').val("");
			this.resetAlert();
			$('#CategoryModalLabel').text("Update Video");
			$('#CategoryModal').modal("show");
		},
		UpdateAction:function(){
			if ($("#FormVideo").valid()) 
			{ 	
			
				var judul = $('#judul').val();
				var dataKeterangan = this.keterangan;
				var category = $('#category').val();
				var url = $('#url').val();
				var status = $('#status').val();
				console.log();
				
				var filename = app.$refs.file.files[0]; 
				var formData =  new FormData();
				formData.append('judul',judul);
				formData.append('keterangan',dataKeterangan);
				formData.append('category',category);
				formData.append('fileupload',filename);
				formData.append('status',status);
				formData.append('url',url);
				formData.append('oldfileupload',app.fileuploadName);

				var l = Ladda.create( document.querySelector( '#saveUpdateAgenda'));
			$.ajax({
				type:'POST',
				url:app.BaseUrl+"video/update/"+app.id_video,
				data:formData,
				cache:false,
				contentType: false,
				processData: false,
				beforeSend: function(){
					l.start();
				},
				success:function(data){
					$('#TableVideo').DataTable().clear().destroy();
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
					app.GetDataVideo();
				}
			}).fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetDataVideo();
				});
			}
		},
		deleteAction : function(){
					$('#TableVideo').DataTable().clear().destroy();
					var l = Ladda.create( document.querySelector( '#modal-btn-true'));
					l.start();
					var param = {
						oldfileupload : this.fileuploadName
						};
					var jqxhr = $.post(app.BaseUrl+"video/delete/"+this.id_video,param)
						.done(function(data) {
						var alert = "";
						var statusMessage ="";
						if(data.status){
							alert = "alert-primary";
							statusMessage = "Success";
							app.GetDataVideo();
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
			$('#alertMessagePage').hide();
			$('#alertMessage').removeClass("alert-primary");
			$('#alertMessage').removeClass("alert-danger");
			$('#MainMessage').html('');
		// Reset Alert
		},
		renderTable : function(Category){
			var oTable =	$('#TableVideo').DataTable({
			data: Category,
			retrieve: true,
			columns: 
			[
				{ data: "id_video" },
                { 
                    render: function ( data, type, row ) {
                        
						return row['judul'].length > 50 ? row['judul'].substring(1, 50)+' ...' : row['judul'];
					},
					width:"30%",
                },
                { data: "nama_categori"},
				{
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["status"]==1 ? "Active":"No Active")+'</span>'
					},
					width:"10%",
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary" onclick="app.update(\''+ row["id_video"]+ '\');">View</a>';
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

		$("#TableVideo_filter").html("").append(`
		<div class="pull-right mb-2">
		<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
		</div>   
		`);
		$('#TableVideo_length select').addClass("rounded-0");
		$('#TableVideo_length select').css("width","100px");

	
	},
	InitOnload: function()
	{
		$('#alertMessagePage').hide();
		$('#FormVideo').validate({
			rules: {
				judul: { required: true, minlength : 3 },
				category : { required: true}, 
				waktu: { required: true},
				statusVideo : { required: true},
				url : { required: true},
				keterangan : { required: true, minlength : 10}
			},
			messages: {
				judul: {
					required : "Video masih kosong",
					minlength : "Minimal 3 karakter"
				},
				waktu : {	required : "Waktu masih kosong"},
				statusVideo : {	required : "Status masih kosong"},
				category : {	required : "Category masih kosong"},
				url : {	required : "Url masih kosong"},
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
		// 	$("#fileupload").change(function(e) {
		// 	var _URL = window.URL || window.webkitURL;
		// 	var file, img;
		// 	if ((file = this.files[0])) {
		// 		img = new Image();
		// 		img.onload = function() {
		// 			if(this.width == 300 && this.height == 500){
		// 				sizeValidate
		// 			}else{

		// 			}
		// 			alert(this.width + " " + this.height);
		// 		};
		// 		img.onerror = function() {
		// 			$("#fileupload").val(null);
		// 			alert( "not a valid file: " + file.type);
		// 		};
		// 		img.src = _URL.createObjectURL(file);
		// 	}
		// }); 

		
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
