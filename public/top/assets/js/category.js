Vue.config.devtools = true;
var app = new Vue({
	el: '#MainApp',
	data: {
		isDoneOnload : false,
		isDoneCategory : false,
		isUpdate : false,
		CategoryName : "",
		statusCategory : null,
		id_category : null,
		listCategory : [],
		listHeaderCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
	},
	mounted : function() {
		this.InitOnload();
		this.GetCategory();
	},
    methods:
    {
        GetCategory : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'category',
                success: function(Result){
					var Category = $.grep(Result.data, function(value,key){
						return value != null;
					});
					app.renderTable(Category);
					app.listCategory.push(Category);
					$('#loading').hide();
					$('#CategoryPage').show();
					
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data agenda, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
		},
		
		create : function()
		{
			if ($("#FormCategory").valid()) 
			{
				var param = {
				nama_categori : this.CategoryName,
				status_categori : 0 // Default is no Active
				};
				var l = Ladda.create( document.querySelector( '#saveAddCategory'));
				l.start();
				var jqxhr = $.post(app.BaseUrl+"category/create",param)
					.done(function(data) {
						$('#TableCategory').DataTable().clear().destroy();
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
					app.GetCategory();
				})
				.fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetCategory();
				});
		}
		},
		createNew : function(){
				this.isUpdate = false;
				$('#CategoryModalLabel').text("Add Category");
				$('#categoryname').val(null);
				this.CategoryName = null;
				this.resetAlert();
				$('#CategoryModal').modal("show");
				
		},
		update : function(id_category,nama_category,status_categori){
			this.id_category = id_category;
			this.isUpdate = true;
			this.statusCategory = status_categori;
			this.CategoryName = nama_category;
			this.resetAlert();
			$("#statusCategory").val(this.statusCategory).trigger("change");
			$('#categoryname').val(nama_category);
			$('#CategoryModalLabel').text("Update Category");
			$('#CategoryModal').modal("show");
			
		},
		UpdateAction:function(){
			if ($("#FormCategory").valid()) 
			{
				var param = {
				nama_categori : this.CategoryName,
				status_categori :$("#statusCategory").val()// Default is no Active
				};
				
				$('#TableCategory').DataTable().clear().destroy();
				var l = Ladda.create( document.querySelector( '#saveUpdateCategory'));
				l.start();
				var jqxhr = $.post(app.BaseUrl+"category/update/"+this.id_category,param)
					.done(function(data) {
					var alert = "";
					var statusMessage ="";
					if(data.status){
						alert = "alert-primary";
						statusMessage = "Berhasil";
						$('#alertMessage').addClass("alert-primary");
					}else{
						alert = "alert-danger";
						statusMessage = "Terjadi kesalahan";
						$('#alertMessage').addClass("alert-danger");
					}
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#MainMessage').html(`
					<span><b> `+statusMessage+` - </b>`+data.message+` </span>
					`);
					l.stop();
					app.GetCategory();
				})
				.fail(function(jqxhr) {
					l.stop();
					app.GetCategory();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
				});
			}
		},
		deleteAction : function(){
				$('#TableCategory').DataTable().clear().destroy();
				var l = Ladda.create( document.querySelector( '#btn-confirm'));
				l.start();
				var jqxhr = $.post(app.BaseUrl+"category/delete/"+this.id_category)
					.done(function(data) {
					var alert = "";
					var statusMessage ="";
					if(data.status){
						alert = "alert-primary";
						statusMessage = "Success";
						app.GetCategory();
					}else{
						alert = "alert-danger";
						statusMessage = "Fail";
					}
					$('#CategoryModal').modal("hide");
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
			var oTable =	$('#TableCategory').DataTable({
			data: Category,
			columns: 
			[
				{ data: "id_categori" },
				{ data: "nama_categori"},
					
				{
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["status_categori"]==1 ? "Active":"No Active")+'</span>'
					}
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary text-center" onclick="app.update(\'' 
						+ row["id_categori"]+ '\','+'\'' + row["nama_categori"]+ '\','+'\'' + row["status_categori"]+ '\');">View</a>';
					},
					targets: -1,  // -1 is the last column, 0 the first, 1 the second, etc.
					width:"4%",
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

		$("#TableCategory_filter").html("").append(`
		<div class="pull-right mb-2">
		<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
		</div>   
		`);
		$('#TableCategory_length select').addClass("rounded-0");
		$('#TableCategory_length select').css("width","100px");

	
	},
	InitOnload: function(){
		$('#alertMessagePage').hide();
		$('#CategoryModal').on('hidden.bs.modal', function () {
			var validator = $("#FormCategory").validate();
				validator.resetForm();
				$("#categoryname").val("");
		});
		
		$('#FormCategory').validate({
			rules: {
				categoryname: { required: true, minlength : 3 }
			},
			messages: {
				categoryname: {
					required : "Kategori masih kosong",
					minlength : "Minimal 3 karakter"
				},
			},
			errorPlacement: function (error, element) {
				error.insertAfter(element.closest('div'));
			}
		});

		$('#alertMessagePage button').click(function(){
			app.resetAlert();
		});

		$("#statusCategory").select2({
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
			modalConfirm.callback(function(confirm){
				if(confirm)
				{
					app.deleteAction();
				}
			});

		} 
	}
});
