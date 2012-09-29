$(document).ready(function(){

	var total = getTotal();
	$('#total').html("$"+total);

	$('select').change(function(){
		var total = getTotal;
		$('#total').html("$"+total);
	});


	function getTotal(){
		var prices = new Array(0,10,20,30)
		var user_phone_id  = $('#user_phone_id').val();
		var price_user = prices[user_phone_id];
		var total = price_user;

		var total_phone1  = $('#user_phone1').val();
		var price_phone1 = prices[1];
		total += price_phone1 * total_phone1;

		var total_phone2  = $('#user_phone2').val();
		var price_phone2 = prices[2];
		total += price_phone2 * total_phone2;

		var total_phone3  = $('#user_phone3').val();
		var price_phone3 = prices[3];
		total += price_phone3 * total_phone3;
		total = total.toFixed(2);
		return total;
	}


});