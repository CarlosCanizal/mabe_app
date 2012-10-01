$(document).ready(function(){

	var month_total = getTotal();
	$('#total').html("$"+month_total+" MXN");

	var unique_payment = uniquePayment();
	$('#uniquePayment').html("$"+unique_payment+" MXN");

	$('select').change(function(){
		var month_total = getTotal();
		$('#total').html("$"+month_total+" MXN");

		var unique_payment = uniquePayment();
		$('#uniquePayment').html("$"+unique_payment+" MXN");
	});

	function convert(MyNumberAsString){
		return MyNumberAsString.replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
	}

	function getTotal(){
		var prices = new Array(0,0,192.57,267.75);
		var familiares = new Array(0,216.00,408.67,520.00);
		var downpayment = new Array(0,404,404,2199);
		var user_phone_id  = $('#user_phone_id').val();
		var price_user = prices[user_phone_id];
		var month_total = price_user;

		var total_phone1  = $('#user_phone1').val();
		var price_phone1 = familiares[1];
		month_total += price_phone1 * total_phone1;

		var total_phone2  = $('#user_phone2').val();
		var price_phone2 = familiares[2];
		month_total += price_phone2 * total_phone2;

		var total_phone3  = $('#user_phone3').val();
		var price_phone3 = familiares[3];
		month_total += price_phone3 * total_phone3;
		month_total = convert(month_total.toFixed(2).toString());
		return month_total;
	}

	function uniquePayment(){
		var prices = new Array(0,0,192.57,267.75);
		var familiares = new Array(0,0,192.57,267.75);
		var downpayment = new Array(0,404,404,2199);
		var user_phone_id  = $('#user_phone_id').val();
		var price_user = prices[user_phone_id];
		var unique_total = 0;

		var total_phone1  = $('#user_phone1').val();
		var price_phone1 = downpayment[1];
		unique_total += price_phone1 * total_phone1;

		var total_phone2  = $('#user_phone2').val();
		var price_phone2 = downpayment[2];
		unique_total += price_phone2 * total_phone2;

		var total_phone3  = $('#user_phone3').val();
		var price_phone3 = downpayment[3];
		unique_total += price_phone3 * total_phone3;
		unique_total = convert(unique_total.toFixed(2).toString());
		return unique_total;
	}
});

