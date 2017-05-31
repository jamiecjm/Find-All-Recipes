// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

document.addEventListener("turbolinks:load",function(){
	$('body').on('focus',".datepicker", function(){
	    $(this).datepicker({
	    	dateFormat: 'yy-mm-dd',
			changeMonth: true,
			changeYear: true,
			yearRange: "-100:+0" 
	    });
	})

	main_list = $('.main-ingredient li')
	hidden_list1 = main_list.slice(5,main_list.length-1)
	hidden_list1.hide();

	cuisine_list = $('.cuisine li')
	hidden_list2 = cuisine_list.slice(5,cuisine_list.length-1)
	hidden_list2.hide();

	$(".main-ingredient .last").click(function(){
		hidden_list1.toggle();
	});

	$(".cuisine .last").click(function(){
	    hidden_list2.toggle();
	});	

})
