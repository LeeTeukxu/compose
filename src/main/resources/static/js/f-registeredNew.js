//	 验证手机号
$('.f-r-put1').blur(function() {
	var write = /^1[3|4|5|7|8]\d{9}$/;
	var val = $.trim($('.f-r-put1').val());
	if(val == '') {
		$('.r-success').removeClass('f-ricons-on');
		$('.f-r-phone-warn').show();
	} else {
		var boolt = write.test(val);
		if(boolt) {
			$('.f-ricons-on').show();
			$('.f-r-phone-warn').hide();
		} else {
			$('.f-icons-on').hide();
			$('.f-r-phone-warn').html('<div class="f-ricons-phone l"' + '></div>' + '手机号不正确,请重新输入!');
			$('.f-r-phone-warn').show();
		}
	}
});

//	密码验证
$('.f-r-put2').blur(function() {
	var passw = /^[0-9_a-zA-Z]{6,18}$/;
	if(!$('.f-r-put2').val()) {
		$('.r-success2').removeClass('f-ricons-on2');
		$('.f-r-pass-warn2').show();
		$('.f-r-pass-warn2').html('<div class="f-ricons-pass l"' + '></div>' + '请输入密码!');
	} else if(!passw.test($('.f-r-put2').val())) {
		$('.r-success2').removeClass('f-ricons-on2');
		$('.f-r-pass-warn2').html('<div class="f-ricons-pass l"' + '></div>' + '密码不正确,请重新输入!');
		$('.f-r-pass-warn2').show();
	} else {
		$('.r-success2').addClass('f-ricons-on2');
		$('.r-success2').show();
		$('.f-r-pass-warn2').hide();
	}
});

//	确认密码验证
$('.f-r-put3').blur(function() {
	var passwa = /^[0-9_a-zA-Z]{6,18}$/;
	if(!$('.f-r-put3').val()) {
		$('.r-success3').removeClass('f-ricons-on3');
		$('.f-r-pass-warn3').show();
		$('.f-r-pass-warn3').html('<div class="f-ricons-pass2 l"' + '></div>' + '请输入密码!');
	} else if(!passwa.test($('.f-r-put3').val())) {
		$('.r-success3').removeClass('f-ricons-on3');
		$('.f-r-pass-warn3').html('<div class="f-ricons-pass l"' + '></div>' + '密码不正确,请重新输入!');
		$('.f-r-pass-warn3').show();
	} else {
		$('.r-success3').addClass('f-ricons-on3');
		$('.r-success3').show();
		$('.f-r-pass-warn3').hide();
	}
});