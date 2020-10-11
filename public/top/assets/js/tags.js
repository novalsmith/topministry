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
        listDataTags : [],
        listDataTagsDetail : [],
        listCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
	},
	mounted : function() {
		Auth.getToken();
		this.InitOnload();
        this.GetDataTags();
		this.GetCategory();
		 
	},
    methods:
    {
        GetDataTags : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'tags',
                success: function(Result){
					var tagList = $.grep(Result.data, function(value,key){
						return value != null;
					});
					 
					app.listDataTags.push(tagList);
					$('#loading').hide();
					$('#VideoPage').show();
					app.GetDataArticle();
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data video, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
        },
        GetDataArticle : function()
        {
            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'article',
                success: function(Result){
					var list = $.grep(Result.data, function(value,key){
						return value != null;
					});
                     var listtags =[];
                    $.each(list, function(key, val){
                        var tagsArticle = val.tags.split(',');
                            for(var i = 0; i < tagsArticle.length; i++){
                                
                                var arr = {
                                    id : val.id_article,
                                    judul : val.judul,
									tags : tagsArticle[i],
									poster : val.poster,
									content : val.content
                                };
                                
                                listtags.push(arr);
                            }
                    });
                    app.listDataTagsDetail = listtags;
                    
                    var groupedPeople=app.groupArrayOfObjects(listtags,"tags");
                    var tmpArray = [];
                        $.each(groupedPeople, function(key,val){
                                var arr = {
                                    tags : val[0].tags,
                                    total : val.length
                                };
                                tmpArray.push(arr);
                    });

                    if(tmpArray != null){
                        app.renderTable(tmpArray);
                        $('#loading').hide();
                        $('#VideoPage').show();
                    }
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data artikel, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
        },
        groupArrayOfObjects : function(list, key){
            return list.reduce(function(rv, x) {
                (rv[x[key]] = rv[x[key]] || []).push(x);
                return rv;
              }, {});
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
				
				id_categori : $('#category').val(),
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
					$('#TableTags').DataTable().clear().destroy();
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
					app.GetDataTags();
				}
			}).fail(function(jqxhr) {
				 
					l.stop();
					$('#CategoryModal').modal("hide");
					$('#alertMessagePage').show();
					$('#alertMessage').addClass("alert-danger");
					$('#status').text("Fail");
					$('#statusMessage').text(jqxhr.responseJSON.message['description']);
					app.GetDataTags();
				});
			} 
		},
		preview : function(tags)
		{
            $('#pageTagsDetail').html('');
            $('#modalVideo').modal("show");

            var list = $.grep(app.listDataTagsDetail, function(val, key){
                return val.tags == tags;
			});
			 
			$.each(list, function(key, val){
                $('#TitleVideo').text('Preview Tag #'+val.tags);
				$('#pageTagsDetail').append(`
				<ul class="list-unstyled">
				<li class="media">
					<img src="`+app.BaseUrlroot+'top/assets/img/Admin/article/'+val.poster+`" class="mr-3 col-md-2 col-sm-2 col-xs-2" alt="...">
					<div class="media-body">
					<a target="blank" href="`+app.BaseUrlroot+'/page/top/main/articledetail?id_article='+val.id+`"><h5 class="mt-0 mb-1">`+val.judul+`</h5></a>
					
					<p>`+(val.content.length > 150 ? val.content.substring(0,150)+" ..." : val.content  )+`</p>
					</div>
				</li>
				</ul>
				`);
            });
 
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
			   
				this.resetAlert();
				$('#showimage').hide();
				$('#ModalLabel').text("Add Lookup");
				$('#status').val("").trigger("change");
				$('#category').val("").trigger("change");
				$('#dateStart').val("");
				$('#CategoryModal').modal("show");
				
		},
		update : function(idlookup){
			this.resetAlert();
            this.isUpdate = true;
            var table = $('#TableTags').DataTable();
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
			 
			$("#status").val(row[0].status).trigger("change");
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
						$('#TableTags').DataTable().clear().destroy();
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
						app.GetDataTags();
					}
					}).fail(function(jqxhr) {
						l.stop();
						$('#CategoryModal').modal("hide");
						$('#alertMessagePage').show();
						$('#alertMessage').addClass("alert-danger");
						$('#status').text("Fail");
						$('#statusMessage').text(jqxhr.responseJSON);
						app.GetDataTags();
					});
			}
		},
		deleteAction : function(){
					$('#TableTags').DataTable().clear().destroy();
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
							app.GetDataTags();
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
			var oTable =	$('#TableTags').DataTable({
			data: Category,
			retrieve: true,
			columns: 
			[
                {
					render: function ( data, type, row ) {
						return row["tags"];
					},
					width:"5%",
                },
                {
					render: function ( data, type, row ) {
						return row["tags"];
					},
					width:"30%",
				},
                {
					render: function ( data, type, row ) {
						return '<span class="badge badge-default">'+row["total"]+'</span>'
					},
                    width:"15%",
                    className: "text-center" 
				},
				{
					render: function ( data, type, row ) {
						return '<a href="javascript:" class="badge badge-primary" onclick="app.preview(\''+ row["tags"]+ '\');">View</a>';
					},
					targets: -1,  // -1 is the last column, 0 the first, 1 the second, etc.
					width:"20%",
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
        $("#TableTags_filter").html("").append(`
		<div class="pull-right mb-2">
		 
		</div>   
		`);
		$('#TableTags_length select').addClass("rounded-0");
		$('#TableTags_length select').css("width","100px");

	
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
				url : { required: true},
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
