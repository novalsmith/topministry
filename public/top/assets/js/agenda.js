Vue.config.devtools = true;
var app = new Vue({
	el: '#MainApp',
	data: {
		isDoneOnload : false,
		isDoneCategory : false,
		isUpdate : false,
		agenda : "",
		keterangan : "",
		tgl_posting : "",
		AgendaName : "",
		fileuploadName : "",
		status_posting : null,
		id_agenda : null,
		fileupload : "",
		listAgenda : [],
		listHeaderCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
	},
	mounted : function() {
		this.InitOnload();
		this.GetAgenda();
	},
    methods:
    {
        GetAgenda : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'agenda',
                success: function(Result){
					var Category = $.grep(Result.data, function(value,key){
						return value != null;
					});
					app.renderTable(Category);
					app.listAgenda.push(Category);
					$('#loading').hide();
					$('#CategoryPage').show();
					
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
		},
		
		create : function()
		{
		
				if ($("#UploadAgenda").valid()) 
				{ 	
				var dataAgenda = $('#agendaname').val();
				var dataKeterangan = this.keterangan;
				var dataTglPosting = $('#dateStart').val();
				var filename = app.$refs.file.files[0]; 
				var formData =  new FormData();
				formData.append('nama_agenda',dataAgenda);
				formData.append('keterangan',dataKeterangan);
				formData.append('tgl_posting',dataTglPosting);
				formData.append('fileupload',filename);
				formData.append('status_tampil',0);
				var l = Ladda.create( document.querySelector( '#saveAddAgenda'));
			$.ajax({
				type:'POST',
				url: app.BaseUrl+"agenda/create",
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
					$('#TableAgenda').DataTable().clear().destroy();
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
				
					app.GetAgenda();
					
				}
			}).fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetAgenda();
				});
			} 
		},
		createNew : function(){
				this.isUpdate = false;
				$('#showimage').hide();
				$('#CategoryModalLabel').text("Add Agenda");
				this.id_agenda = null;
				this.isUpdate = false;
				this.status_posting = null;
				this.agenda = "";
				this.fileuploadName = "";
				this.keterangan = "";
				$('#dateStart').val(null);

				this.resetAlert();
				$('#CategoryModal').modal("show");
				
		},
		update : function(id_agenda){
			var table = $('#TableAgenda').DataTable();
			var listdata = []; 
				table.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
					var data = this.data();
					listdata.push(data);
				} );
			var row = $.grep(listdata, function(val, key){
				return val.id_agenda === id_agenda;
			});
			this.id_agenda = row[0].id_agenda;
			this.isUpdate = true;
			this.status_posting = row[0].status_tampil;
			this.agenda = row[0].nama_agenda;
			this.fileupload = "";
			this.fileuploadName = row[0].fotoagenda;
			this.keterangan = row[0].keterangan;
			$("#status_posting").val(row[0].status_tampil).trigger("change");
			$('#dateStart').val(row[0].tgl_posting);
			if(row[0].fotoagenda !=""){
				$('#showimage').show();
				$('#showimage').html('<a href="'+app.BaseUrlroot+'top/assets/img/Admin/agenda/'+row[0].fotoagenda+'" target="_blank">Lihat Poster</a>');
			}else{
				$('#showimage').hide();
				$('#showimage').html('');
			}
			$('#categoryname').val(row[0].nama_agenda);
			$('#fileupload').val("");
			this.resetAlert();
			$('#CategoryModalLabel').text("Update Agenda");
			$('#CategoryModal').modal("show");
		},
		UpdateAction:function(){
			if ($("#UploadAgenda").valid()) 
			{ 	
			var dataAgenda = $('#agendaname').val();
				var dataKeterangan = this.keterangan;
				var dataTglPosting = $('#dateStart').val();
				var filename = app.$refs.file.files[0]; 
				var formData =  new FormData();
				formData.append('nama_agenda',dataAgenda);
				formData.append('keterangan',dataKeterangan);
				formData.append('tgl_posting',dataTglPosting);
				formData.append('fileupload',filename);
				formData.append('status_tampil',$("#status_posting").val());
				formData.append('oldfileupload',app.fileuploadName);

				var l = Ladda.create( document.querySelector( '#saveUpdateAgenda'));
			$.ajax({
				type:'POST',
				url:app.BaseUrl+"agenda/update/"+app.id_agenda,
				data:formData,
				cache:false,
				contentType: false,
				processData: false,
				beforeSend: function(){
					l.start();
				},
				success:function(data){
					$('#TableAgenda').DataTable().clear().destroy();
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
					app.GetAgenda();
				}
			}).fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetAgenda();
				});
			}
		},
		deleteAction : function(){
					$('#TableAgenda').DataTable().clear().destroy();
					var l = Ladda.create( document.querySelector( '#modal-btn-true'));
					l.start();
					var param = {
						oldfileupload : this.fileuploadName
						};
					var jqxhr = $.post(app.BaseUrl+"agenda/delete/"+this.id_agenda,param)
						.done(function(data) {
						var alert = "";
						var statusMessage ="";
						if(data.status){
							alert = "alert-primary";
							statusMessage = "Success";
							app.GetAgenda();
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
			var oTable =	$('#TableAgenda').DataTable({
			data: Category,
			retrieve: true,

			columns: 
			[
				{ data: "id_agenda" },
				{ data: "nama_agenda"},
				{ data: "tgl_posting"},	
				{
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["status_tampil"]==1 ? "Active":"No Active")+'</span>'
					}
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary" onclick="app.update(\''+ row["id_agenda"]+ '\');">View</a>';
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

		$("#TableAgenda_filter").html("").append(`
		<div class="pull-right mb-2">
		<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
		</div>   
		`);
		$('#TableAgenda_length select').addClass("rounded-0");
		$('#TableAgenda_length select').css("width","100px");

	
	},
	InitOnload: function(){
 
		$('#alertMessagePage').hide();
		$('#CategoryModal').on('hidden.bs.modal', function () {
			var validator = $("#UploadAgenda").validate();
				validator.resetForm();
				$("#categoryname").val("");
		});
		
		$('#UploadAgenda').validate({
			rules: {
				agendaname: { required: true, minlength : 3 },
				waktu: { required: true},
				status_posting : { required: true},
				keterangan : { required: true, minlength : 10}
			},
			messages: {
				agendaname: {
					required : "Agenda masih kosong",
					minlength : "Minimal 3 karakter"
				},
				waktu : {	required : "Waktu masih kosong"},
				status_posting : {	required : "Status masih kosong"},
				keterangan : {	required : "Keterangan masih kosong", minlength : "Minimal 10 karakter"},
			},
			errorPlacement: function (error, element) {
				error.insertAfter(element.closest('div'));
			}
		});
        $('#dateStart').datepicker({
            weekStart: 1,
            daysOfWeekHighlighted: "6,0",
            autoclose: true,
            todayHighlight: true,
		});
		$('#dateEnd').datepicker({
			weekStart: 1,
            daysOfWeekHighlighted: "6,0",
            autoclose: true,
            todayHighlight: true,
		});

		$('#alertMessagePage button').click(function(){
			app.resetAlert();
		});
		$("#status_posting").select2({
			theme: 'bootstrap4',
			dropdownParent: $('#StatusPage'),
			width: "100%", 
			placeholder: "Status",
			data : [
				{id : 0, text:"No Active"},
				{id : 1, text:"Active"}
			],
			minimumResultsForSearch: -1
			});
			
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

		$('#dateStart').change(function(){
			if($('#dateStart').val() !=""){
				$('#waktu > .error').hide();
			}
		});

}
}
});
