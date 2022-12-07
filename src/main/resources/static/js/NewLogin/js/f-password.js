//==========================找回密码验证=====================================
//	 点击找回密码时手机号为空的弹框
$('.f-p-btn2').click(function() {
	ptan();
	var val = $('.f-p-put1').val();
	if(val == '') {
		$('.f-p-alternull').show();
	}
	setTimeout(function() {
		$('.f-p-alternull').hide();
	}, 1000);
	$('.f-p-btn').click(function() {
		$('.f-login-middle').show();
		$('.f-password-middle').hide();
		$('.f-ml-hd-text').html('会员登录');
	});
});

function ptan() {
	$('.f-p-btn').click(function() {
		$('.f-login-middle').show();
		$('.f-password-middle').hide();
		$('.f-ml-hd-text').html('会员登录');
	});
}
ptan();

//	 验证手机号
$('.f-p-put1').blur(function() {
	var writep = /^1[3|4|5|7|8]\d{9}$/;
	var val = $.trim($('.f-p-put1').val());
	if(val == '') {
		$('.p-success').removeClass('f-picons-on');
		$('.f-p-phone-warn').show();
	} else {
		var boolt = writep.test(val);
		if(boolt) {
			$('.f-picons-on').show();
			$('.f-p-phone-warn').hide();
		} else {
			$('.f-picons-on').hide();
			$('.f-p-phone-warn').html('<div class="f-picons-phone l"' + '></div>' + '手机号不正确,请重新输入!');
			$('.f-p-phone-warn').show();
		}
	}
});

//	密码验证
$('.f-p-put2').blur(function(){
	alert('ncwdv');
	var passw = /^[0-9_a-zA-Z]{6,18}$/;
	if(!$('.f-p-put2').val()) {
		$('.p-success2').removeClass('f-picons-on2');
		$('.f-p-pass-warn2').show();
		$('.f-p-pass-warn2').html('<div class="f-picons-pass l"' + '></div>' + '请输入密码!');
	} else if(!passw.test($('.f-p-put2').val())) {
		$('.p-success2').removeClass('f-picons-on2');
		$('.f-p-pass-warn2').html('<div class="f-picons-pass l"' + '></div>' + '密码不正确,请重新输入!');
		$('.f-p-pass-warn2').show();
	} else {
		$('.p-success2').addClass('f-picons-on2');
		$('.p-success2').show();
		$('.f-p-pass-warn2').hide();
	}
});

//	确认密码验证
$('.f-p-put3').blur(function() {
	var passwa = /^[0-9_a-zA-Z]{6,18}$/;
	if(!$('.f-p-put3').val()) {
		$('.p-success3').removeClass('f-picons-on3');
		$('.f-p-pass-warn3').show();
		$('.f-p-pass-warn3').html('<div class="f-picons-pass2 l"' + '></div>' + '请输入密码!');
	} else if(!passwa.test($('.f-p-put3').val())) {
		$('.p-success3').removeClass('f-picons-on3');
		$('.f-p-pass-warn3').html('<div class="f-picons-pass2 l"' + '></div>' + '密码不正确,请重新输入!');
		$('.f-p-pass-warn3').show();
	} else {
		$('.p-success3').addClass('f-picons-on3');
		$('.p-success3').show();
		$('.f-p-pass-warn3').hide();
	}
});