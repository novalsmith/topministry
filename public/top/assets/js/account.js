Vue.config.devtools = true;
var app = new Vue({
	el: '#MainApp',
	data: {
		isDoneOnload : false,
		isDoneCategory : false,
		isUpdate : false,
		CategoryName : "",
		statusCategory : null,
		id_account : null,
		isChangePassword : "",
		listCategory : [],
		listHeaderCategory : [],
		listEmail : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot,
		rolesId : Cookies.get('roles')
	},
	mounted : function() {
		Auth.getToken();
		this.GetEmail();
		this.InitOnload();
		this.GetAccount();
	},
    methods:
    {
        GetAccount : function()
        { 
			// show 1 data when status is member, if admin the show all data 			 
			var setRolesId = parseInt(this.rolesId) != 1 ? Cookies.get('id') : null;

            $.ajax({
                type: "GET",
                contentType: "application/json",
				dataType: 'json',
				url:this.BaseUrl+'account',
                success: function(Result){
					var accountData = $.grep(Result.data, function(value,key){
					 
						if(setRolesId != null){
							return  value.id_account == setRolesId;
						}else{
							return value != null;
						}
						 
					});
					 
					app.renderTable(accountData);
					app.listCategory.push(accountData);
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
		GetEmail : function()
        { 
            $.ajax({
                type: "GET",
                contentType: "application/json",
				dataType: 'json',
				url:this.BaseUrlroot+'top/assets/json/email.json',
                success: function(Result){
					var listData = $.grep(Result, function(value,key){
							return value.status == 1;
					});
				
					app.listEmail = listData;
                }
            }).fail(function(jqxhr){
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data email, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
		},
		create : function()
		{
			var email = $('#email').val();
			var validateEmail = email.search("topministry.net");
			if(validateEmail == -1){
				$('#emailValidateError').text('Harap gunakan email topministry.net').show();
				return;
			}else{
				
				var list = $.grep(app.listEmail, function(val, key){
					return val.email == email;
				});
				  
				if(list.length == 0){
					$('#emailValidateError').text("Email tidak terdaftar pada system, silahkan hubungi admin.").show();
					return;
				}else{
					$('#emailValidateError').text('').hide();
				}
			} 

			if ($("#FormAccount").valid()) 
			{
				$('#emailValidateError').hide();
				var param = 
				{
					nama     :  $('#nama').val(),
					email    : $('#email').val(),
					role     : $('#role').val(),
					password : $('#password').val(),
					status   : 0 // Default is no Active
				};
				 
				var l = Ladda.create( document.querySelector( '#saveAddCategory'));
				l.start();
				
				$.post(app.BaseUrl+"account/create",param)
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
					app.GetAccount();
				})
				.fail(function(jqxhr) {
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
					app.GetAccount();
				});
			}
		},
		changePassword :  function(){
				this.resetAlert();
				$('#ChangePasswordModal').modal("show");
				$('#CategoryModal').modal("hide");
				
		},
		createNew : function(){
			$('#emailValidateError').hide();
			$('#status').val('');
			$('#nama').val('');
			$('#email').val('');
			this.isUpdate = false;
			$('#CategoryModalLabel').text("Add Account");
			this.CategoryName = null;
			this.resetAlert();
			$('#CategoryModal').modal("show");
				
		},
		update : function(id_account){
			$('#emailValidateError').hide();
			this.id_account = id_account;
			this.isUpdate = true;
			var table = $('#TableCategory').DataTable();
			var listdata = []; 
				table.rows().every( function ( rowIdx, tableLoop, rowLoop ) {
					var data = this.data();
					listdata.push(data);
				} );
			var row = $.grep(listdata, function(val, key){
				return val.id_account === id_account;
			})[0];
 
			$('#status').val(row['status']).trigger('change');
			$('#nama').val(row['name']);
			$('#email').val(row['email']);
	 
			$('#role').val(row['roles']).trigger('change');
			
			this.resetAlert();
			
			$('#CategoryModalLabel').text("Update Account");
			$('#CategoryModal').modal("show");
			
		},
		UpdateAction:function(){
			var email = $('#email').val();
			var validateEmail = email.search("topministry.net");
			if(validateEmail == -1){
				$('#emailValidateError').show();
				return;
			} 

			if ($("#FormAccount").valid()) 
			{
				$('#emailValidateError').hide();

				var param = 
				{
					nama : $('#nama').val(),
					email : $('#email').val(),
					role : $('#role').val(),
					// password : $('#password').val(),
					status :  $('#status').val() // Default is no Active
				};
				
				$('#TableCategory').DataTable().clear().destroy();
				var l = Ladda.create( document.querySelector( '#saveUpdateCategory'));
				l.start();
				$.post(app.BaseUrl+"account/update/"+this.id_account,param)
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
					app.GetAccount();
				})
				.fail(function(jqxhr) {
					l.stop();
					app.GetAccount();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON);
				});
			}
		},
		UpdateChangePassword:function(){
			if ($("#FormAccountChangePassword").valid()) 
			{  
				var param = 
				{
					password : this.isChangePassword
				};
				 
				$('#TableCategory').DataTable().clear().destroy();
				var l = Ladda.create( document.querySelector( '#updatePassword'));
				l.start();
				$.post(app.BaseUrl+"account/changePassword/"+this.id_account,param)
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
					$('#ChangePasswordModal').modal("hide");
					$('#alertMessagePage').show();
					$('#MainMessage').html(`
					<span><b> `+statusMessage+` - </b>`+data.message+` </span>
					`);
					l.stop();
					app.GetAccount();
				})
				.fail(function(jqxhr) {
					l.stop();
					app.GetAccount();
					$('#ChangePasswordModal').modal("hide");
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
				var jqxhr = $.post(app.BaseUrl+"account/delete/"+this.id_account)
					.done(function(data) {
					var alert = "";
					var statusMessage ="";
					if(data.status){
						alert = "alert-primary";
						statusMessage = "Success";
						app.GetAccount();
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
				{ data: "id_account" },
				{ data: "name"},
                { data: "email"},
                {
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["roles"]==1 ? "Admin":"Member")+'</span>'
					}
				},
				{
					render: function ( data, type, row ) {
						return '<span class="badge badge-secondary">'+(row["status"]==1 ? "Active":"No Active")+'</span>'
					}
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary text-center" onclick="app.update(\'' 
						+ row["id_account"]+ '\');">View</a>';
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
		 
		if(this.rolesId !=1){
			$("#TableCategory_filter").html("").app
		}else{
			$("#TableCategory_filter").html("").append(`
			<div class="pull-right mb-2">
			<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
			</div>   
			`);
		}
		
		$('#TableCategory_length select').addClass("rounded-0");
		$('#TableCategory_length select').css("width","100px");

	
	},
	InitOnload: function(){
		
		$('#alertMessagePage').hide();
		$('#CategoryModal').on('hidden.bs.modal', function () {
			var validator = $("#FormAccount").validate();
				validator.resetForm();
				$("#categoryname").val("");
		});
		
		$('#FormAccount').validate({
			rules: {
				nama: { required: true, minlength : 2 },
				email : { required : true},
				role : { required : true},
				status : { required : true},
				password : { required : true}
			},
			messages: {
				nama: {
					required : "Nama masih kosong"
				},
				email : {
					required : "Email masih kosong"
				},
				role : {
					required : "Role masih kosong"
				},
				status : {
					required : "Status masih kosong"
				},
				password : {
					required : "Password masih kosong"
				}
			},
			errorPlacement: function (error, element) {
				error.insertAfter(element.closest('div'));
			}
		});

		$('#FormAccountChangePassword').validate({
			rules: {
				changePassword: { required: true, minlength : 5 },
			},
			messages: {
				changePassword: {
					required : "Password masih kosong",
					minlength : "Minimal 5 karakter"
				}
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
			data : [
				{id : 0, text:"No Active"},
				{id : 1, text:"Active"}
			],
			minimumResultsForSearch: -1
			});
			
			$("#role").select2({
				theme: 'bootstrap4',
				dropdownParent: $('#rolePage'),
				width: "100%", 
				placeholder: "Status",
				data : [
					{id : 0, text:"Member"},
					{id : 1, text:"Admin"}
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
