$(function(){
    modalConfirm.Init();
    page.offPrivent();
    page.setTime();
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
