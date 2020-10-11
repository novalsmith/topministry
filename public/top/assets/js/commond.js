$(function(){
    modalConfirm.Init();
    page.offPrivent();
    page.setTime();
    Auth.Init();
});

// Modal Confirm Delete Handling.
var modalConfirm = 
{
    Init : function()
    {
        $("#btn-confirm").on("click", function(){
            $('#CategoryModal').modal("hide");
            $("#mi-modal").modal('show');
        });

        $("#modal-btn-true").on("click", function(){
            modalConfirm.callback(true);
        $("#mi-modal").modal('hide');
        
        });
        
        $("#modal-btn-false").on("click", function(){
            modalConfirm.callback(false);
        $("#mi-modal").modal('hide');
        });
    },
    callback : function(data){
        return data;
    }
}

var page = {
    BaseUrl : "http://localhost:8080/api/top/", 
	BaseUrlroot : "http://localhost:8080/", 
    offPrivent : function(){
        // Do for All forms, to off auto on Enter 
        $("form").submit(function(event){
            event.preventDefault();
        });
    },
    setTime :  function(){
        // Set Auto Date Now
        var event = new Date(Date.now());
        var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
        $('#timeNow').text(event.toLocaleDateString('id-ID', options));
    },
    getQueryParam : function getParameterByName( name ){
        var regexS = "[\\?&]"+name+"=([^&#]*)", 
      regex = new RegExp( regexS ),
      results = regex.exec( window.location.search );
      if( results == null ){
        return "";
      } else{
        return decodeURIComponent(results[1].replace(/\+/g, " "));
      }
    }
}

var Auth = {
    Init : function(){
        
        $('#formLoginPage').validate({
            rules: {
                email : {  required: true },
                password : { required: true}
            },
            messages: {
                email: {
                    required : "Email masih kosong"
                },
                password: {
                    required : "Password masih kosong"
                },
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element.closest('div'));
            }
        });

        $('#buttonLogin').click(function(){
             
            if ($("#formLoginPage").valid()) {
                Auth.login();
            }

        });
    },
    login :  function(){
        var messageError = $('#messageError');
        var messageSuccess = $('#messageSuccess');
        // if success
        var param = {
			email : $('#email').val(),
			password : $('#password').val()
		};
		 
		var l = Ladda.create( document.querySelector('#buttonLogin'));
        l.start();
         
        $.post(page.BaseUrlroot+"page/top/auth/login",param)
            .done(function(data) {
                
                if(data.status != 200){
                     
                    l.stop();
                    messageError.show();
                    messageError.text(data.message);

                    messageSuccess.hide();
                    messageSuccess.text('');

                }else{
                    messageError.hide();
                    messageError.text('');  
                     
                    messageSuccess.show();
                    messageSuccess.text('Berhasil Login');  
                    
                    Auth.getTokenAuth(param);
                }
               
            })
            .fail(function(jqxhr) {
                l.stop();
                messageError.show();
                messageError.text(jqxhr.responseJSON.message);

                messageSuccess.hide();
                messageSuccess.text('');
            }); 

    },
    getTokenAuth : function(param){
         
        var messageError = $('#messageError');
        $.post(page.BaseUrlroot+"api/top/account/login",param)
        .done(function(data) {
             
            if(data.token != null)
            {
                Cookies.set('token', data.token, { expires: data.expireAt, path: '/' });
                Cookies.set('id', data.id, { expires: data.expireAt, path: '/' });
                Cookies.set('roles', data.roles, { expires: data.expireAt, path: '/' });
                $.ajaxSetup({
                    headers: {
                      'Authorization': "Bearer " + Cookies.get('token')
                    }
                  });
                window.location = page.BaseUrlroot+'main';
            }
        })
        .fail(function(jqxhr) {
           
            messageError.show();
            messageError.text(jqxhr.responseJSON.message);
        }); 

    },
    getToken : function(){
        $.ajaxSetup({
            headers: {
              Authorization: 'Bearer ' + Cookies.get('token')
          },
            error: function(Result) {
                // if(Result.status === 401){
                
                //     window.location = page.BaseUrlroot+'page/top/main/auth';
                // }
            }, 
          });
    },
    logout : function(){
        if (confirm("Anda yakin untuk logout ?")) 
        {
            Cookies.remove('token');
            Cookies.remove('id');
            Cookies.remove('roles');
            Cookies.remove('token', { path: '', domain: 'localhost' });
            Cookies.remove('id', { path: '', domain: 'localhost' });
            Cookies.remove('roles', { path: '', domain: 'localhost' });
            window.location = page.BaseUrlroot+'auth/logout';
        } 
    }
}