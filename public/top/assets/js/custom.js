Vue.config.devtools = true;
var app = new Vue({
	el: '#app',
	data: {
		username : "",
		password: "",
		setText : "",
		errorMsg: '',
		errorMsgPwd: '',
		DataNik: "",
		DataPassword: "",
		LoginPage: true,
		RegisterPage: false,
		errorPassword: false,
		errorNik: false,
		errorFoto : false,
		errorFotoType : false,
		suksesNik: false,
		isDisabled: true,
		isDisabledReg : false,
		isDisabledLupaPassword : true,
		isDisabledAgree : true,
		isShowAlertDanger :  false,
		isShowAlertDangerReg : false,
		isShowAlertSuccess :  false,
		isShowAlertSuccessReg : false,
		RegDataNik : "",
		RegDataEmail : "",
		RegDataTlp : "",
		errorNikReg : "",
		errorEmailReg : "",
		errorTlpReg : "",
		errorMsgnik : "",
		errorMsgemail : "",
		errorMsgtlp : "",
		regMsg : "",
		SuksesVerifikasi : false,
		statusEmailAlready : false,
		FinalAgreements : false,
		SelectFileUpload : null,
		Agree : "",
		nama : "",
		alamat: "",
		jk : "",
		ttl : "",
		kodePassword : "",
		LupaPassword : "",
		Setimgcek : "",
		Setagree : "",
		RegisterPageGetPassword : false ,
		BaseUrl : "http://localhost:8080/topministry/" //"http://dev.mosframtech.com/",
		// BaseUrlDev : "http://localhost:1412/App/eDesa"
	},
	mounted : function() {
		this.FirstLoad();
		// this.onLoadUser();
	
	},
	methods: {
		registerPage() {
			
			this.isDisabledReg= true;
			app.isShowAlertDanger = false;
			app.DataNik = "";
			app.DataPassword = "";
			app.FinalAgreements = false;
			$('#LoginPage').hide();
			$('#LupasPassword').hide();
			$('#RegisterPage').fadeIn(500);
			$('#FinalAgreements').hide();
			this.RemoveSessionRegister();
			app.SuksesVerifikasi = false;
		},
		loginPage() {
			
			app.LupaPassword = "";
			app.errorNikReg  = false;
			app.errorEmailReg  = false;
			app.errorTlpReg  = false;
			app.RegDataNik = "";
			app.RegDataEmail = "";
			app.RegDataTlp = "";
			app.errorNik = false;
			app.errorPassword = false;
			this.isDisabled= true;
			app.SuksesVerifikasi = false;
			app.RegisterPageGetPassword = false;
			app.FinalAgreements = false;
			$('#RegisterPage').hide();
			$('#LupasPassword').hide();
			$('#LoginPage').fadeIn(500);
			$('#FinalAgreements').hide();
			this.RemoveSessionRegister();
		},
		nik() {
			nikConfig.Init();
		},
		password() {
			passwordConfig.Init();
		},
		create() {
			LoginConfig.Init();
		},
		nikReg(){
			nikConfigRegist.Init();
		},
		emailReg(){
			emailConfigRegist.Init();
		},
		tlpReg(){
			tlpConfigRegist.Init();
		},
		CreateRegister(){
			RegisterConfig.Init();
		},
		agreement(){
			var imgcek = $('#profile-img').val();
			var agree = this.Agree; 
			if(agree == true && imgcek ==""){
				app.errorFoto = true;
				this.isDisabledAgree = true;
			}

			else if(agree == false && imgcek !=""){
				app.errorFoto = false;
				this.isDisabledAgree = true;
			}

			else if(agree == true && imgcek !=""){
				app.errorFoto = false;
				this.isDisabledAgree = false;
			}

			else if(agree == true && imgcek ==""){
				app.errorFoto = true;
				this.isDisabledAgree = true;
			}
		},
		RemoveSessionRegister(){
			$.ajax({
				type: "GET",
				contentType: "application/json",
				dataType: 'json',
				url:app.BaseUrl+'/Auth/RemoveSession',
				success: function(res){
				console.log(res);
				}
			});
		},
		onFileChanged(){
			var imgcek = $('#profile-img').val();
			var file = document.querySelector("#profile-img");
			if ( /\.(jpe?g|png|gif)$/i.test(file.files[0].name) === false ) 
			{
				this.errorFotoType = true;
				this.isDisabledAgree = true;
				$('#profile-img').val("");
			}else{
				this.errorFotoType = false;
				var agree = this.Agree; 
				if(agree == true && imgcek ==""){
					app.errorFoto = true;
					this.isDisabledAgree = true;
				}
				else if(agree == false && imgcek !=""){
					app.errorFoto = false;
					this.isDisabledAgree = true;
				}
				else if(agree == true && imgcek !=""){
					app.errorFoto = false;
					this.isDisabledAgree = false;
				}
				else if(agree == true && imgcek ==""){
					app.errorFoto = true;
					this.isDisabledAgree = true;
				}
			}
		},
		UploadRegisterClick(){
			UploadRegist.Init();
		},
		selesai(){
			FinalRegisterConfig.Init();
		},
		lupa (){
			app.isDisabledLupaPassword = true,
			app.LupaPassword = "";
			$('#LoginPage').hide();
			$('#RegisterPage').hide();
			$('#LupasPassword').fadeIn(500);
		},
		EmailLupaPassword(){
			var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/i);
			var valid = emailRegex.test(app.LupaPassword);
			if(app.LupaPassword == ""){
				app.errorEmailReg = true;
				app.errorMsgemail = "Email masih kosong !";
				app.isDisabledLupaPassword = true;
			}
			else if (!valid) {
				app.errorEmailReg = true;
				app.errorMsgemail = "Email tidak valid !";
				app.isDisabledLupaPassword = true;
				 
			}else{
				app.errorEmailReg = false;
				app.errorMsgemail = "";
				app.isDisabledLupaPassword = false;
			}
		},
		FirstLoad(){

		
		
			this.setText = "Top Ministry";
			$('#customFileLangHTML').text('Pilih Foto');
			$('#LoginPage').fadeIn(500);
			$('.close').click(function () {
			app.isShowAlertDanger = false;
			app.isShowAlertDangerReg = false;
			app.isShowAlertSuccessReg = false;
			
			});
			$('#formLoginPage').validate({
				rules: {
					username : 
					{ 
						required: true
					},
					password: { required: true, minlength : 5 }
				},
				messages: {
					username: {
						required : "Username masih kosong"
					},
					password: {
						required : "Password masih kosong",
						minlength : "Minimal 5 karakter"
					},
				},
				errorPlacement: function (error, element) {
					error.insertAfter(element.closest('div'));
				}
			});

			$('#buttonLogin').unbind().click(function () {
				if ($("#formLoginPage").valid()) {
					LoginConfig.Init();
				}
			});
		},
		onLoadUser : function(){
			// $.post("http://localhost:8080/km/auth/login",{
			// 	username:"manfred", password: "12345"
			// }).done(function(data){
			// 	console.log(data);
			// 	localStorage.setItem('token', data.token);
			// });
jQuery.ajax({
	url: 'http://localhost:8080/km/user?id_hakakses=47',
	headers: { 
	//'Authorization': 'Bearer '+token,
	'Content-Type': 'application/json'//,
	},
	crossDomain: true,
	method: 'GET',

	// data: JSON.stringify({username:"manfred", password : 12345})
	})
	.done(function(data) {
	// console.log(data);
	})
	.fail(function(data) {
	// console.log(data);
	});
			// 	let token = `
		// 	eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODA4MFwva20iLCJhdWQiOiJUSEVfQVVESUVOQ0UiLCJpYXQiOjE1OTUzNTE5MTEsIm5iZiI6MTU5NTM1MTkyMSwiZXhwIjoxNTk1MzU1NTExLCJkYXRhIjp7ImlkIjoiNDgiLCJuYW1hX2xlbmdrYXAiOiJNYW5mcmVkIiwidXNlcm5hbWUiOiJtYW5mcmVkIiwiZW1haWwiOiJtYW5mcmVkQGthYmFybWFwZWdhYS5jb20ifX0.hzS8FfuyZdFSIjCWHjGq8lvY-5DbovrI7oIE6icBMlQ
		//  `;
		//  $.cookie('token',token);


		// setTimeout(() => {
		// 	$.ajaxSetup({
		// 		headers:{
		// 			'Authorization': $.cookie('token')
		// 		}
		// 	})
		// }, 1000);

		// setTimeout(() => {
		// 	$.ajax({
		// 		type: "GET",
		// 		url: 'http://localhost:8080/km/user',
		// 		dataType: 'json',
		// 		headers: {"Authorization": localStorage.getItem('token')},
		// 		success: function (result, status, xhr) {
		// 		 console.log(result);
		// 		 console.log("sukses");
		// 		},
		// 		error: function (xhr, status, error) {
		// 			console.log(error);
		// 			console.log("gagal");
		// 		}
		// 	});
	
		// }, 1000);
		 
 
		}
	}
});


var nikConfig =
{
	Init: function () {
		if (app.DataNik == "") {
			app.errorNik = true;
			app.suksesNik = false;
			app.errorMsg = "NIK masih kosong !";
			app.isDisabled = true;
		}else{
			app.errorNik = false;
			app.suksesNik = false;
			app.errorMsg = "";
			if (app.DataPassword == "") {
				app.isDisabled = true;
			} else {
				app.isDisabled = false;
			}
		}
	}
}

var passwordConfig =
{
	Init: function () {
		if (app.DataPassword == "") {
			app.errorPassword = true;
			app.errorMsgPwd = "Password masih kosong !";
			app.isDisabled = true;
		} else {
			app.errorPassword = false;
			app.errorMsgPwd = "";

			if (app.DataNik == "") {
				app.isDisabled = true;
			} else {
				app.isDisabled = false;
			}
		}
	}
}

var LoginConfig ={
	Init : function(){
		var param = {
			username : app.username,
			password : app.password
		};
		console.log(param);
		var l = Ladda.create( document.querySelector( '#buttonLogin'));
	 
				l.start();
				var jqxhr = $.post(app.BaseUrl+"auth/login",param)
					.done(function(data) {
						l.stop();
					  console.log(data);
					  console.log("sukses 1");
					})
					.fail(function(jqxhr) {
						l.stop();
						console.log(jqxhr.responseJSON);
					})
					.always(function() {
						l.stop();
						console.log("sukses 2");
					});
				   
				  // Perform other work here ...
				   
				  // Set another completion function for the request above
				  jqxhr.always(function() {
					console.log("sukses 3");
				  });	 
		// $.post("http://localhost:8080/km/auth/login",{
		// 				username: app.username, password: app.password
		// 			 })
		// 			 .done(function(data){
		// 				console.log(data);
		// 				l.stop();
		// 				//localStorage.setItem('token', data.token);
		// 			});
	
		// jQuery.ajax({
		// 	type: "POST",
		// 	data : [{
		// 		'username' : 'sd',
		// 		'password' : 'aa'
		// 	}], 
		// 	url: 'http://localhost:8080/km/auth/login',
		// 	beforeSend: function() {
		// 		l.start();
		// 	},
		// 	success: function(res){
				
		// 		console.log(res);
		// 		l.stop(); 
		// 	}
		// }).fail(function(xhr){
		// 	console.log(xhr);
		// 	l.stop(); 
		// });
	}
}

var RegisterConfig ={
	Init : function(){
		var url = app.BaseUrl+'/Auth/register';
		var param = {
			nik : app.RegDataNik,
			email : app.RegDataEmail,
			tlp : app.RegDataTlp
		}
		$.ajax({
			type: "GET",
			contentType: "application/json",
			dataType: 'json',
			url:url,
			data : param,
			beforeSend: function() {
				app.errorMsgnik = "";
				app.errorMsgemail = "";
				app.errorMsgPwd = "";
				app.isDisabledReg = true;
			},
			success: function(res){
				if(res.status == true){
					app.errorMsgnik = "";
					app.errorMsgemail = "";
					app.errorMsgPwd = "";
					app.isDisabledReg = true;
					app.RegDataNik = "";
					app.RegDataEmail = "";
					app.RegDataTlp = "";
					app.isShowAlertSuccessReg = false;
					$('#FinalAgreements').fadeIn(500);
					$('#RegisterPage').hide();
				}else{
					app.errorMsgnik = res.pesan;
					app.errorMsgemail = "";
					app.errorMsgPwd = "";
					app.errorNikReg = true;
					app.isDisabledReg = false;
				} 
			}
		});
	}
}

var FinalRegisterConfig ={
	Init : function(){
		var url = app.BaseUrl+'/Auth/FinalReg';
		$.ajax({
			type: "POST",
			contentType: "application/json",
			dataType: 'json',
			url:url,
			success: function(res){
				console.log();
				if(res.status == true){
					$('#FinalAgreements').hide();
					$('#RegisterPage').hide();
					$('#LoginPage').hide();
					window.open(app.BaseUrl+"/Welcome", "_self");
				}  
			}
		});
	}
}
var nikConfigRegist =
{
	Init: function () {
		if (app.RegDataNik == "") {
			app.errorNikReg = true;
			app.errorMsgnik = "NIK masih kosong !";
			app.isDisabledReg = true;
		}else{
			
			if(app.RegDataNik.length !=16){
				app.errorNikReg = true;
				app.errorMsgnik = "NIK tidak valid !";
				app.isDisabledReg = true;
				app.SuksesVerifikasi = false;
			}else{
				var url = app.BaseUrl+'/Auth/cekPenduduk';
				var param = {
					nik : app.RegDataNik,
				}
				$.ajax({
					type: "GET",
					contentType: "application/json",
					dataType: 'json',
					url:url,
					data : param,
					beforeSend: function() {
						app.errorMsgnik = "";
						app.errorMsgemail = "";
						app.errorMsgPwd = "";
						app.isDisabledReg = true;
					},
					success: function(res){
						if(res.status == true){
							app.SuksesVerifikasi = true;
							app.isShowAlertSuccessReg = true;
							 app.nama = res.data[0].nama;
							 app.alamat = res.data[0].alamat;
							 app.jk = res.data[0].jenkel;
							 app.ttl = res.data[0].tempatlahir;
						}else{
							app.SuksesVerifikasi = false;
							app.errorNikReg = true;
							app.errorMsgnik = "NIK tidak terdaftar !";
						} 
					}
				});
				app.errorNikReg = false;
				app.errorMsgnik = "";
				if (app.RegDataEmail == "" || app.RegDataTlp == "" || app.RegDataNik == "") {
					app.isDisabledReg = true;
				} else {
					app.isDisabledReg = false;
				}
			}
		
		}
	}
}
 
var emailConfigRegist =
{
	Init: function () {
		if (app.RegDataEmail == "") {
			app.errorEmailReg = true;
			app.errorMsgemail = "Email masih kosong !";
			app.isDisabledReg = true;
		}else{
			var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/i);
			var valid = emailRegex.test(app.RegDataEmail);
			if (!valid) {
				app.errorEmailReg = true;
				app.errorMsgemail = "Email tidak valid !";
				app.isDisabledReg = true;
				 
			} else{
				app.errorEmailReg = false;
				app.errorMsgemail = "";

				var url = app.BaseUrl+'/Auth/cekEmail';
				var param = {
					email : app.RegDataEmail,
				}
				$.ajax({
					type: "GET",
					contentType: "application/json",
					dataType: 'json',
					url:url,
					data : param,
					beforeSend: function() {
						app.errorMsgnik = "";
						app.errorMsgemail = "";
						app.errorMsgPwd = "";
						app.isDisabledReg = true;
					},
					success: function(res){
						if(res.status == true){
							app.errorEmailReg = true;
							app.errorMsgemail = res.pesan;
							app.isDisabledReg = true;
							app.statusEmailAlready = true;
						}else{
							if (app.RegDataNik == "" || app.RegDataTlp =="" || app.RegDataEmail == "") {
								app.isDisabledReg = true;
							} else {
								app.isDisabledReg = false;
							}
							app.statusEmailAlready = false;
							 
						} 
					}
				});
				
			}
		}
	}
}

 var UploadRegist = {
	 Init : function(){
		 app.imgcek = $('#profile-img').val();
		 app.Setagree = $('#agreeid').val();
		$('#UploadRegist').on('submit',(function(e) {
			e.preventDefault();
			var img = $('#profile-img').val();
			var formData = new FormData(this);
				formData.append('fileupload',img);
				 
			console.log('masuk');
			$.ajax({
				type:'POST',
				url:app.BaseUrl+'/Auth/UploadRegister',
				data: formData,
				type: "post",
				dataType: "json",
				processData: false,
				contentType: false,
				cache: false,
				async: false,
				success:function(data){
					console.log(data);
					app.FinalAgreements = false;
				 	app.kodePassword = data.Temppassword;
					app.RegisterPageGetPassword = true;
					app.FinalAgreements = false;
					$('#FinalAgreements').hide();
				},
				error: function(data){
					 
					console.log(data);
				}
			});
		}));
	 }
 }

var tlpConfigRegist =
{
	Init: function () {
		var emailRegex = new RegExp(/^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$/i);
		var valid = emailRegex.test(app.RegDataEmail);
		
		if (app.RegDataTlp == "") {
			app.errorTlpReg = true;
			app.errorMsgtlp = "Tlp masih kosong !";
			app.isDisabledReg = true;
		}else{
			app.errorTlpReg = false;
			app.errorMsgtlp = "";
			app.isDisabledReg = false;
			if (app.RegDataEmail == "" || !valid  || app.RegDataNik == "" || app.RegDataTlp == "" ||   app.statusEmailAlready == true) {
				app.isDisabledReg = true;
			} else {
				app.isDisabledReg = false;
			}
		}
	}
}
 
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$('#profile-img-tag').attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
$("#profile-img").change(function(){
	readURL(this);
}); 


