$(function(){

		alert('読み込みこまれました');
	  $('#reset-show').click(()=>{
		    $('#login-modal').fadeIn();
		  });

	  $(".close-modal").click(()=>{
		    $('#login-modal').fadeOut();
		  });

});