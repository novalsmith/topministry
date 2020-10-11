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
		listLookup : [],
		listCategory : [],
		BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot,
		rolesId : Cookies.get('roles')
	},
	mounted : function() {
		Auth.getToken();
		this.InitOnload();
		this.GetLookup();
        this.GetDataArticle();
        this.GetCategory();
	},
    methods:
    {
        GetDataArticle : function()
        {
			// show 1 data when status is member, if admin the show all data 			 
			var setRolesId = parseInt(this.rolesId) != 1 ? Cookies.get('id') : null;

            $.ajax({
                type: "GET",
                contentType: "application/json",
                dataType: 'json',
				url:this.BaseUrl+'article',
                success: function(Result){
					 
					var listData = $.grep(Result.data, function(value,key){

						if(setRolesId != null){
							return  value.createby == setRolesId;
						}else{
							return value != null;
						}
					});
					app.renderTable(listData);
					app.listDataVideo.push(listData);
					$('#loading').hide();
					$('#VideoPage').show();
					
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data artikel, Info : '+jqxhr.statusText+'</span>');
				$('#loading').hide();
			});
		},
		reload : function(){
			app.GetDataArticle();
		},
		GetLookup: function() {
			$.ajax({
			  type: "GET",
			  contentType: "application/json",
			  dataType: 'json',
			  url: this.BaseUrl + 'lookup',
			  success: function(Result) {
				var listData = [];
				$.each(Result.data, function(key, value) {
	  
				  var getData = {
					id: value.code,
					text: value.valueCategory,
					status: value.idlookupCategory
				  };
				  listData.push(getData);
				});
	  
				var setnew = $.grep(listData, function(val, key) {
				  return val.status == 2;
				});
				listLookup = setnew;
			  }
			}).fail(function(jqxhr) {
			  app.renderTable([]);
			  $('#alertMessagePage').show();
			  $('#alertMessage').addClass('alert-danger');
			  $('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data lookup, Info : ' + jqxhr.statusText + '</span>');
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
					$.each(Result.data, function(key,val){
                        app.listCategory.push({
                            id : val.id_categori,
                            text : val.nama_categori,
                        });	 
					});
					app.InitListBox();
                }
            }).fail(function(jqxhr){
				app.renderTable([]);
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data kategori, Info : '+jqxhr.statusText+'</span>');
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
        articleDetail : function(id_article=null){
            window.open(app.BaseUrlroot+'page/top/main/articledetail?id_article='+id_article,'_blank');
		},
		createNew : function(){
			window.open(app.BaseUrlroot+'page/top/main/articledetail','_blank');
		},
		InitDelete : function(id_article=null){
			this.id_article = id_article;
			$("#mi-modal-article").modal('show');
			$.ajax({
				type: "GET",
				contentType: "application/json",
				dataType: 'json',
				data: {
				id_article: id_article
				},
				url: this.BaseUrl + 'article',
				success: function(Result) {
				if (Result.data != null) {
				
					app.fileuploadName = Result.data.poster;
					$("#modal-btn-article-true").on("click", function() {
						app.deleteArticle();
						$("#mi-modal-article").modal('hide');
				
					});
				}
				$('#loading').hide();
				$('#articleDetailPage').show();
				}
			}).fail(function(jqxhr) {
				$('#alertMessagePage').show();
				$('#alertMessage').addClass('alert-danger');
				$('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : ' + jqxhr.statusText + '</span>');
				$('#loading').hide();
			});

			$("#modal-btn-article-false").on("click", function() {
			$("#mi-modal-article").modal('hide');
			});
		},
		
		deleteArticle : function(){
			$('#TableArticle').DataTable().clear().destroy();
			var l = Ladda.create( document.querySelector( '#modal-btn-article-true'));
			l.start();
			var param = {
				oldfileupload : this.fileuploadName
				};
			
				$.post(app.BaseUrl+"article/delete/"+this.id_article,param)
				.done(function(data) {
				
					if(!data.error){
					app.GetDataArticle();
					$('#alertMessage').removeClass("alert-danger");
					$('#alertMessage').addClass("alert-primary");
					$('#MainMessage').html(`
					<span><b> Success - </b>`+data.message+` </span>
					`);
				}else{
					$('#alertMessage').removeClass("alert-primary");
					$('#alertMessage').addClass("alert-danger");
					$('#MainMessage').html(`
					<span><b> Failed - </b>`+data.message+` </span>
					`);
				} 
			
				$('#alertMessagePage').show();
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
			$('#TableArticle').DataTable().clear().destroy();
			var oTable =	$('#TableArticle').DataTable({
			data: Category,
			retrieve: true,
			columns: 
			[
				{ data: "id_article" },
                { 
                    render: function ( data, type, row ) {
                        
						return row['judul'].length > 50 ? row['judul'].substring(1, 50)+' ...' : row['judul'];
					},
					width:"30%",
                },
                { data: "nama_categori"},
				{
					render: function ( data, type, row ) {
						var statusName = $.grep(listLookup, function(val, key) {
							return val.id == row.status;
						  })[0];
						  return '<span class="badge badge-secondary">' + (statusName.text) + '</span>';
					 
					},
					width:"10%",
				},
				{
					render: function ( data, type, row ) {
                        var view = '<a href="javascript:" class="badge badge-primary" onclick="app.articleDetail(\''+ row["id_article"]+ '\');"><i class="fa fa-cog" aria-hidden="true"></i> &nbspView</a>';
                        var remove = '<a href="javascript:" class="badge badge-default" onclick="app.InitDelete(\''+ row["id_article"]+ '\');"><i class="fa fa-trash" aria-hidden="true"></i>  &nbspDelete</a>';
                        return remove +" "+ view;
					},
					targets: -1,  // -1 is the last column, 0 the first, 1 the second, etc.
					width:"15%",
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
		$("#TableArticle_filter").html("").append(`
		<div class="pull-right mb-2">
		<button type="button" class="btn btn-secondary btn-sm" onclick="app.reload()"> <i class="fa fa-refresh"></i> Refresh</button>
		<button type="button" class="btn btn-primary btn-sm" onclick="app.createNew()"> <i class="fa fa-plus"></i> Create new</button>
		</div>   
		`);
		$('#TableArticle_length select').addClass("rounded-0");
		$('#TableArticle_length select').css("width","100px");
	},
	InitOnload: function()
	{
		$('#alertMessagePage').hide();
		$('#alertMessagePage button').click(function(){
			app.resetAlert();
		});
	}
}
});
