Vue.config.devtools = true;
var app = new Vue({
  el: '#articleDetail',
  data: {
    isDoneOnload: false,
    isDoneCategory: false,
    isUpdateStatus: false,
    categoryVideo: "",
    keterangan: "keterangan test",
    fileuploadName: "",
    oldfilename: "",
    status: null,
    idArticleParam: "",
    judularticle: "",
    url: "",
    fileupload: "",
    listDataVideo: [],
    listTags: [],
    listDetailArticle: [],
    listCategory: [],
    BaseUrl : page.BaseUrl,
		BaseUrlroot : page.BaseUrlroot
  },
  mounted: function() {
    this.InitOnload();
    this.GetCategory();
    this.InitDelete();
    this.GetTags();
    this.idArticleParam = page.getQueryParam("id_article");
    if (this.idArticleParam != "") {
      this.isUpdateStatus = true;
      this.GetDataArticle(this.idArticleParam);
    } else {
      this.isUpdateStatus = false;
      $('#loading').hide();
      $('#articleDetailPage').show();
    }
    CKEDITOR.replace('content');

  },
  methods: {
    GetCategory: function() {
      $.ajax({
        type: "GET",
        contentType: "application/json",
        dataType: 'json',
        url: this.BaseUrl + 'category?isAll=true',
        success: function(Result) {
          var listarray = [];
          $.each(Result.data, function(key, val) {

            app.listCategory.push({
              id: val.id_categori,
              text: val.nama_categori,
              status: val.status_categori
            });
          });

          app.InitListBox();

        }
      }).fail(function(jqxhr) {
        app.renderTable([]);
        $('#alertMessagePage').show();
        $('#alertMessage').addClass('alert-danger');
        $('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : ' + jqxhr.statusText + '</span>');
        $('#loading').hide();
      });
    },
    GetTags: function() {
      $.ajax({
        type: "GET",
        contentType: "application/json",
        dataType: 'json',
        url: this.BaseUrl + 'tags',
        success: function(Result) {
          $.each(Result.data, function(key, val) {
            app.listTags.push({
              id: val.tags_name,
              text: val.tags_name
            });
          });

          $('#tags').select2({
            placeholder: "Enter values",
            allowClear: true,
            width: "100%",
            data: app.listTags,
            maximumSelectionLength: 10,
            tags: true,
            tokenSeparators: [',', ' ']
          });
          $('#tags').val(null).trigger('change.select2');
        }
      }).fail(function(jqxhr) {
        app.renderTable([]);
        $('#alertMessagePage').show();
        $('#alertMessage').addClass('alert-danger');
        $('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : ' + jqxhr.statusText + '</span>');
        $('#loading').hide();
      });
    },
    preview: function() {
      $('#articleDetail').hide();
      $('#articleDetailPreview').show();
      app.resetAlert();
      $.ajax({
        type: "GET",
        contentType: "application/json",
        dataType: 'json',
        data: {
          id_article: app.idArticleParam
        },
        url: this.BaseUrl + 'article',
        success: function(Result) {
          var tagsList = [];
          if (Result.data != null) {
            $('#preview_title').text(Result.data.judul);
            $('#preview_img').html("<img class='col-md-12 col-sm-12 col-xs-12' src='" + app.BaseUrlroot + "top/assets/img/Admin/article/" + Result.data.poster + "'></img>");
            $('#preview_content').html(Result.data.content);
            var splits = Result.data.tags.split(',');
            for (var i = 0; i < splits.length; i++) {
              tagsList.push("<a href='javascript:void(0)' class='btn btn-sm btn-secondary mr-2'>#" + splits[i] + "</a>");
            }
            $('#preview_tags').html(tagsList);
            $('#articleDetailPagePreview').show();
          } else {
            $('#alertMessagePage').show();
            $('#alertMessage').addClass('alert-danger');
            $('#MainMessage').html('<span><b> Perhatian - </b> Tidak dapat memuat data, silahkan ulang beberapa saat lagi</span>');
          }
          $('#loadingPreview').hide();
        }
      }).fail(function(jqxhr) {
        $('#alertMessagePage').show();
        $('#alertMessage').addClass('alert-danger');
        $('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : ' + jqxhr.statusText + '</span>');
        $('#loadingPreview').hide();
      });
    },
    closewindow: function() {
      $('#articleDetail').show();
      $('#articleDetailPreview').hide();
    },
    GetDataArticle: function(idArticleParam) {
      $.ajax({
        type: "GET",
        contentType: "application/json",
        dataType: 'json',
        data: {
          id_article: idArticleParam
        },
        url: this.BaseUrl + 'article',
        success: function(Result) {
          if (Result.data != null) {
            app.listDetailArticle.push(Result.data);
            app.oldfilename = Result.data.poster;
            this.judularticle = Result.data.judul;
            // this.status =  Result.data.status_categori; 
            var splistr = Result.data.tags.split(',');
            var setData = [];
            for (var i = 0; i < splistr.length; i++) {
              setData.push(splistr[i]);
            }
            $('#tags').val(setData).trigger('change.select2');
            $('#judul').val(Result.data.judul);
            $('#category').val(Result.data.id_categori).trigger('change');
            $('#status').val(Result.data.status_categori).trigger('change');
            CKEDITOR.instances.content.setData(Result.data.content);
          }
          $('#loading').hide();
          $('#articleDetailPage').show();
        }
      }).fail(function(jqxhr) {
        // app.renderTable([]);
        $('#alertMessagePage').show();
        $('#alertMessage').addClass('alert-danger');
        $('#MainMessage').html('<span><b> Perhatian - </b> Terjadi kesalahan saat meminta data, Info : ' + jqxhr.statusText + '</span>');
        $('#loading').hide();
      });
    },
    create: function() {
      if ($("#FormArticleDetail").valid()) {
        var dataAgenda = $('#judul').val();
        var dataKeterangan = CKEDITOR.instances.content.getData();

        var category = $('#category').val();
        var url = $('#url').val();
        var tags = $('#tags').val();

        var filename = app.$refs.file.files[0];
        var formData = new FormData();
        formData.append('judul', dataAgenda);
        formData.append('keterangan', dataKeterangan);
        formData.append('category', category);
        formData.append('fileupload', filename);
        formData.append('status', 0);
        formData.append('url', url);
        formData.append('tags', tags);
        var l = Ladda.create(document.querySelector('#saveAdd'));
        $.ajax({
          type: 'POST',
          url: app.BaseUrl + "article/create",
          data: formData,
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            l.start();
          },
          header: {
            'Content-Type': 'multipart/form-data'
          },
          success: function(data) {
            $('#TableVideo').DataTable().clear().destroy();
            var alert = "";
            var statusMessage = "";
            if (data.status) {
              alert = "alert-primary";
              statusMessage = "Berhasil";
              $('#alertMessage').removeClass("alert-danger");
              $('#alertMessage').addClass("alert-primary");
            } else {
              alert = "alert-danger";
              statusMessage = "Terjadi Kesalahan";
              $('#alertMessage').removeClass("alert-primary");
              $('#alertMessage').addClass("alert-danger");
            }
            $('#CategoryModal').modal("hide");
            $('#alertMessagePage').show();

            $('#MainMessage').html(`
					<span><b> ` + statusMessage + ` - </b>` + data.message + ` </span>
					`);
            l.stop();
          }
        }).fail(function(jqxhr) {
          l.stop();
          $('#CategoryModal').modal("hide");
          $('#alertMessagePage').show();
          $('#alertMessage').addClass("alert-danger");
          $('#status').text("Fail");
          $('#statusMessage').text(jqxhr.responseJSON);
        });
      }
    },
    update: function() {
      if ($("#FormArticleDetail").valid()) {
        var dataAgenda = $('#judul').val();
        var dataKeterangan = CKEDITOR.instances.content.getData();
        var category = $('#category').val();
        var tags = $('#tags').val();
        console.log(tags);
        var filename = app.$refs.file.files[0];
        var formData = new FormData();
        formData.append('judul', dataAgenda);
        formData.append('keterangan', dataKeterangan);
        formData.append('category', category);
        formData.append('fileupload', filename);
        formData.append('status', $('#status').val());
        formData.append('tags', tags);
        formData.append('oldfileupload', app.oldfilename);
        var l = Ladda.create(document.querySelector('#saveUpdate'));
        $.ajax({
          type: 'POST',
          url: app.BaseUrl + "article/update/" + this.idArticleParam,
          data: formData,
          cache: false,
          contentType: false,
          processData: false,
          beforeSend: function() {
            l.start();
          },
          header: {
            'Content-Type': 'multipart/form-data'
          },
          success: function(data) {
            $('#TableVideo').DataTable().clear().destroy();
            var alert = "";
            var statusMessage = "";
            if (data.status) {
              alert = "alert-primary";
              statusMessage = "Berhasil";
              $('#alertMessage').addClass("alert-primary");
              if (data.poster != "") {
                $('#showimage').show();
                $('#showimage').html('<a href="' + app.BaseUrlroot + 'top/assets/img/Admin/article/' + data.poster + '" target="_blank">Lihat Poster</a>');
              } else {
                $('#showimage').hide();
                $('#showimage').html('');
              }
            } else {
              alert = "alert-danger";
              statusMessage = "Terjadi Kesalahan";
              $('#alertMessage').addClass("alert-danger");
            }
            $('#CategoryModal').modal("hide");
            $('#alertMessagePage').show();

            $('#MainMessage').html(`
					<span><b> ` + statusMessage + ` - </b>` + data.message + ` </span>
					`);
            l.stop();

            // app.GetDataArticle();

          }
        }).fail(function(jqxhr) {
          l.stop();
          $('#CategoryModal').modal("hide");
          $('#alertMessagePage').show();
          $('#alertMessage').addClass("alert-danger");
          $('#status').text("Fail");
          $('#statusMessage').text(jqxhr.responseJSON);
          // app.GetDataArticle();
        });
      }
    },
    closewindowPage: function() {
      window.close();
    },
    InitListBox: function() {
      $("#category").select2({
        theme: 'bootstrap4',
        dropdownParent: $('#CategoryPages'),
        width: "100%",
        placeholder: "Category",
        data: app.listCategory,
        minimumResultsForSearch: 6,
        allowClear: true
      });
      $("#category").val("").trigger("change");


    },
    articleDetail: function(id_article = null) {
      window.location.assign(app.BaseUrlroot + 'page/topministry/main/articledetail?id_article=' + id_article);
    },
    deleteActionDetail: function() {
       
      var l = Ladda.create( document.querySelector( '#modal-btn1-true'));
      l.start();
      var param = {
      	oldfileupload : this.fileuploadName
      	};
        $.post(app.BaseUrl+"article/delete/"+this.idArticleParam,param)
      	.done(function(data) {
      	var alert = "";
      	var statusMessage ="";
      	if(!data.error){
      		alert = "alert-primary";
      		statusMessage = "Success";
			  window.open(app.BaseUrlroot+'page/topministry/main/article','_self');
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
    resetAlert: function() {
      // Reset Alert
      $('#alertMessagePage').hide();
      $('#alertMessage').removeClass("alert-primary");
      $('#alertMessage').removeClass("alert-danger");
      $('#MainMessage').html('');
      // Reset Alert
    },
    InitDelete: function() {
      $("#btn-confirm-detail").on("click", function() {
        $("#mi-modal-detail").modal('show');
      });

      $("#modal-btn1-true").on("click", function() {
        app.deleteActionDetail();
        $("#mi-modal-detail").modal('hide');

      });

      $("#modal-btn1-false").on("click", function() {
        $("#mi-modal-detail").modal('hide');
      });
    },
    InitOnload: function() {
      $('#alertMessagePage').hide();
      $('#FormArticleDetail').validate({
        rules: {
          judul: {
            required: true,
            minlength: 3
          },
          category: {
            required: true
          },
          waktu: {
            required: true
          },
          status: {
            required: true
          },
          url: {
            required: true
          },
          tags: {
            required: true
          },
          keterangan: {
            required: true,
            minlength: 10
          }
        },
        messages: {
          judul: {
            required: "Judul masih kosong",
            minlength: "Minimal 3 karakter"
          },
          status: {
            required: "Status masih kosong"
          },
          tags: {
            required: "Tags masih kosong"
          },
          category: {
            required: "Category masih kosong"
          },
          url: {
            required: "Url masih kosong"
          },
          keterangan: {
            required: "Keterangan masih kosong",
            minlength: "Minimal 10 karakter"
          },
        },
        errorPlacement: function(error, element) {
          error.insertAfter(element.closest('div'));
        }
      });
      $('#alertMessagePage button').click(function() {
        app.resetAlert();
      });
      $('#closepage').click(function() {
        app.closewindow();
      });

      $("#status").select2({
        theme: 'bootstrap4',
        dropdownParent: $('#StatusPage'),
        width: "100%",
        placeholder: "Status",
        data: [{
            id: 0,
            text: "No Active"
          },
          {
            id: 1,
            text: "Active"
          }
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

      $('#category').change(function() {
        if ($('#category').val() != "") {

          $('#FormArticleDetail label[for="category"]').hide();
        }
      });
      $('#tags').change(function() {
        if ($('#tags').val() != "") {

          $('#FormArticleDetail label[for="tags"]').hide();
        }
      });
    }
  }
});