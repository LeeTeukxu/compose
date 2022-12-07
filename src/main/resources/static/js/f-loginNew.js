$(function() {
	var bool = false;
//	账号登录切换
	$('.f-ml-right-a').click(function() {
		if(bool == true) {
			$(this).html('账号密码登录' + '<div class="f-icons-my r" alt="手机小图标"' + '></div>');
			$('.f-login-middle').show();
			$('.f-phonelogin-middle').hide();
			bool = false;
		} 
		else {
			$(this).html('手机验证码登录' + '<div class="f-icons-tele r" alt="我小图标"' + '></div>');
			$('.f-login-middle').hide();
			$('.f-phonelogin-middle').show();
			bool = true;
		}
	});
	
//	手机验证登录切换
	$('.f-pl-right-a').click(function() {
		if(bool == false) {
			$(this).html('手机验证码登录' + '<div class="f-icons-tele r" alt="我小图标"' + '></div>');
			$('.f-login-middle').hide();
			$('.f-phonelogin-middle').show();
			bool = brue;
		}else{
			$(this).html('账号密码登录' + '<div class="f-icons-my r" alt="手机小图标"' + '></div>');
			$('.f-login-middle').show();
			$('.f-phonelogin-middle').hide();
			bool = false;
		}
	});


//	账号登录页面会员注册页面跳转
//	$('.mlbtn2').click(function() {
//		$('.f-registered-middle').show();
//		$('.f-login-middle').hide();
//		$('.f-ml-hd-text').html('会员注册');
//	});
	
//	手机号登录页面会员注册页面跳转
	$('.plbtn2').click(function() {
		$('.f-registered-middle').show();
		$('.f-phonelogin-middle').hide();
		$('.f-ml-hd-text').html('会员注册');
	});

//	账号登录页面找回密码页面跳转
	$('.f-ml-pwpage').click(function() {
		$('.f-password-middle').show();
		$('.f-login-middle').hide();
		$('.f-ml-hd-text').html('找回密码');
	});
	
//	手机号登录页面找回密码页面跳转
	$('.f-pl-pwpage').click(function() {
		$('.f-password-middle').show();
		$('.f-phonelogin-middle').hide();
		$('.f-ml-hd-text').html('找回密码');
	});
	

//==========================账号登录页面验证=====================================
//	 点击登录时手机号为空的弹框
	$('.mlbtn1').click(function() {
		var val = $('.f-ml-put1').val();
		if(val == '') {
			$('.f-ml-alternull').show();
		} 
		setTimeout(function(){
			$('.f-ml-alternull').hide();
		},1000);
	});

//	 验证帐号
$('.f-ml-put1').blur(function() {
		var passw = /^[0-9_a-zA-Z]{6,18}$/;
		if(!$('.f-ml-put1').val()) {
			$('.success').removeClass('f-icons-on');
			$('.f-ml-phone-warn').show();
			$('.f-ml-phone-warn').html('<div class="f-icons-phone l"' + '></div>' + '请输入密码!');
		}else if (!passw.test($('.f-ml-put1').val())) {
			$('.success').removeClass('f-icons-on');
			$('.f-ml-phone-warn').html('<div class="f-icons-phone l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-ml-phone-warn').show();
		}else {
			$('.success').addClass('f-icons-on');
			$('.success').show();
			$('.f-ml-phone-warn').hide();
		}
	});


//	密码验证
	$('.f-ml-put2').blur(function() {
		var passw = /^[0-9_a-zA-Z]{6,18}$/;
		if(!$('.f-ml-put2').val()) {
			$('.successpw').removeClass('f-icons-on2');
			$('.f-ml-pass-warn').show();
			$('.f-ml-pass-warn').html('<div class="f-icons-pass l"' + '></div>' + '请输入密码!');
		}else if (!passw.test($('.f-ml-put2').val())) {
			$('.successpw').removeClass('f-icons-on2');
			$('.f-ml-pass-warn').html('<div class="f-icons-pass l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-ml-pass-warn').show();
		}else {
			$('.successpw').addClass('f-icons-on2');
			$('.successpw').show();
			$('.f-ml-pass-warn').hide();
		}
	});
	
	
////	手机登录验证码
//	$('.f-ml-btn mlbtn1').click(function() {
//		var yan = /^(0|[1-9][0-9]*){4}$/;
//		var yanma = $.trim($('.f-ml-put3').val());
//		if(yanma ==''){
//			$('.f-ml-alterdiv').show();
//		} else {
//			$('.f-ml-alterdiv').hide();
//		}
//	});


////===========================手机号登录页面验证==============================
////	 点击登录时手机号为空的弹框
//	$('.plbtn1').click(function() {
//		var valb = $('.f-pl-put1').val();
//		if(valb == '') {
//			$('.f-pl-alternull').show();
//		} 
//		setTimeout(function(){
//			$('.f-pl-alternull').hide();
//		},1000);
//	});
//	
////	 验证手机号
//	$('.f-pl-put1').blur(function() {
//		var writepl = /^1[3|4|5|7|8]\d{9}$/;
//		var valp = $.trim($('.f-pl-put1').val());
//		if(valp==''){
//			$('.pl-success').removeClass('f-plicons-on');
//			$('.f-pl-phone-warn').show();
//		}else{
//			var boolt = writepl.test(valp);
//			if(boolt){
//				$('.f-plicons-on').show();
//				$('.f-pl-phone-warn').hide();
//			}else{
//				$('.f-plicons-on').hide();
//				$('.f-pl-phone-warn').html('<div class="f-plicons-phone l"' + '></div>' + '手机号不正确,请重新输入!');
//				$('.f-pl-phone-warn').show();
//			}
//		}
//	});
	
//	 点击手机登录页面会员注册时手机号为空的弹框
	$('.plbtn2').click(function() {
		var val = $('.f-plput1').val();
		if(val == '') {
			$('.f-pl-alternull').show();
		} 
		setTimeout(function(){
			$('.f-pl-alternull').hide();
		},1000);
	});
//==========================注册页面验证=====================================
//	 点击会员注册时手机号为空的弹框
	$('.f-r-btn2').click(function() {
		rtan();
		var val = $('.f-r-put1').val();
		if(val == '') {
			$('.f-r-alternull').show();
		} 
		setTimeout(function(){
			$('.f-r-alternull').hide();
		},1000);
		$('.f-r-btn').click(function() {
			$('.f-login-middle').show();
			$('.f-registered-middle').hide();
			$('.f-ml-hd-text').html('会员登录');
		});
	});
	function rtan() {
		$('.f-r-btn').click(function() {
			$('.f-login-middle').show();
			$('.f-registered-middle').hide();
			$('.f-ml-hd-text').html('会员登录');
		});
	}
	rtan();
	
//	 验证手机号
$('.f-r-put1').blur(function() {
		var write = /^1[3|4|5|7|8]\d{9}$/;
		var val = $.trim($('.f-r-put1').val());
		if(val==''){
			$('.r-success').removeClass('f-ricons-on');
			$('.f-r-phone-warn').show();
		}else{
			var boolt = write.test(val);
			if(boolt){
				$('.f-ricons-on').show();
				$('.f-r-phone-warn').hide();
			}else{
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
			$('.f-r-pass-warn').show();
			$('.f-r-pass-warn').html('<div class="f-ricons-pass l"' + '></div>' + '请输入密码!');
		}else if (!passw.test($('.f-r-put2').val())) {
			$('.r-success2').removeClass('f-ricons-on2');
			$('.f-r-pass-warn').html('<div class="f-ricons-pass l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-r-pass-warn').show();
		}else {
			$('.r-success2').addClass('f-ricons-on2');
			$('.r-success2').show();
			$('.f-r-pass-warn').hide();
		}
	});
	
//	确认密码验证
	$('.f-r-put3').blur(function() {
		var passwa = /^[0-9_a-zA-Z]{6,18}$/;
		if(!$('.f-r-put3').val()) {
			$('.r-success3').removeClass('f-ricons-on3');
			$('.f-r-pass-warn2').show();
			$('.f-r-pass-warn2').html('<div class="f-ricons-pass2 l"' + '></div>' + '请输入密码!');
		}else if (!passwa.test($('.f-r-put3').val())) {
			$('.r-success3').removeClass('f-ricons-on3');
			$('.f-r-pass-warn2').html('<div class="f-ricons-pass l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-r-pass-warn2').show();
		}else {
			$('.r-success3').addClass('f-ricons-on3');
			$('.r-success3').show();
			$('.f-r-pass-warn2').hide();
		}
	});
	

//==========================找回密码验证=====================================
//	 点击找回密码时手机号为空的弹框
	$('.f-p-btn2').click(function() {
		ptan();
		var val = $('.f-p-put1').val();
		if(val == '') {
			$('.f-p-alternull').show();
		} 
		setTimeout(function(){
			$('.f-p-alternull').hide();
		},1000);
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
		if(val==''){
			$('.p-success').removeClass('f-picons-on');
			$('.f-p-phone-warn').show();
		}else{
			var boolt = writep.test(val);
			if(boolt){
				$('.f-picons-on').show();
				$('.f-p-phone-warn').hide();
			}else{
				$('.f-picons-on').hide();
				$('.f-p-phone-warn').html('<div class="f-picons-phone l"' + '></div>' + '手机号不正确,请重新输入!');
				$('.f-p-phone-warn').show();
			}
		}
	});
	
	//	密码验证
	$('.f-p-put2').blur(function() {
		var passw = /^[0-9_a-zA-Z]{6,18}$/;
		if(!$('.f-p-put2').val()) {
			$('.p-success2').removeClass('f-picons-on2');
			$('.f-p-pass-warn').show();
			$('.f-p-pass-warn').html('<div class="f-picons-pass l"' + '></div>' + '请输入密码!');
		}else if (!passw.test($('.f-p-put2').val())) {
			$('.p-success2').removeClass('f-picons-on2');
			$('.f-p-pass-warn').html('<div class="f-picons-pass l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-p-pass-warn').show();
		}else {
			$('.p-success2').addClass('f-picons-on2');
			$('.p-success2').show();
			$('.f-p-pass-warn').hide();
		}
	});
	
//	确认密码验证
	$('.f-p-put3').blur(function() {
		var passwa = /^[0-9_a-zA-Z]{6,18}$/;
		if(!$('.f-p-put3').val()) {
			$('.p-success3').removeClass('f-picons-on3');
			$('.f-p-pass-warn2').show();
			$('.f-p-pass-warn2').html('<div class="f-picons-pass2 l"' + '></div>' + '请输入密码!');
		}else if (!passwa.test($('.f-p-put3').val())) {
			$('.p-success3').removeClass('f-picons-on3');
			$('.f-p-pass-warn2').html('<div class="f-picons-pass2 l"' + '></div>' + '密码不正确,请重新输入!');
			$('.f-p-pass-warn2').show();
		}else {
			$('.p-success3').addClass('f-picons-on3');
			$('.p-success3').show();
			$('.f-p-pass-warn2').hide();
		}
	});
});
