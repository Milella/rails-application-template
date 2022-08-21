$(document).ready(function(){
    setTimeout(function(){
        $('.alert, .notice, #flash_alert').fadeOut(4000, function() {
            $(this).remove();
        })
    }, 8000);

});
