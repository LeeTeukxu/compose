//===========================手机号登录页面验证==============================
//	 点击登录时手机号为空的弹框
$('.plbtn1').click(function() {
	var valb = $('.f-pl-put1').val();
	if(valb == '') {
		$('.f-pl-alternull').show();
	}
	setTimeout(function() {
		$('.f-pl-alternull').hide();
	}, 1000);
});

//	 验证手机号
$('.f-pl-put1').blur(function() {
	var writepl = /^1[3|4|5|7|8]\d{9}$/;
	var valp = $.trim($('.f-pl-put1').val());
	if(valp == '') {
		$('.pl-success').removeClass('f-plicons-on');
		$('.f-pl-phone-warn').show();
	} else {
		var boolt = writepl.test(valp);
		if(boolt) {
			$('.f-plicons-on').show();
			$('.f-pl-phone-warn').hide();
		} else {
			$('.f-plicons-on').hide();
			$('.f-pl-phone-warn').html('<div class="f-plicons-phone l"' + '></div>' + '手机号不正确,请重新输入!');
			$('.f-pl-phone-warn').show();
		}
	}
});