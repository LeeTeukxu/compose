var isSave = true;
//	 点击注册时的弹框
$('.f-r-btn').click(function() {
	var write = /^1[3|4|5|7|8]\d{9}$/;
	var LoginCode = mini.get('loginCode').getValue();
	var pwd1 = mini.get('password').getValue();
	var pwd2 = mini.get('confirmPassword').getValue();
	if (!write.test(LoginCode)){
		mini.alert("请输入正确的手机号码!");
		return false;
	}
	if (pwd1 != pwd2){
		mini.alert("两次输入的密码不一致!");
		return false;
	}
	if (doVerify == "" || doVerify == false){
		mini.alert("请先完成验证!");
		return false;
	}
	var form = new mini.Form("#registeredForm");
	var user = form.getData();
	form.validate();
	// user["createTime"]=mini.formatDate(user["createTime"],'yyyy-MM-dd HH:mm:ss');
	// user["lastLoginTime"]=mini.formatDate(user["lastLoginTime"],'yyyy-MM-dd HH:mm:ss');
	var url = '/systems/loginUser/saveAll';
	delete user.confirmPassword;
	var postData={Data:mini.encode(user)};
	$.post(url,postData,function(result){
		if (result['success']) {
			mini.alert('账号注册成功', '提示', function (r) {
				window.location.href="/login";
			});
		}
		else
		{
			mini.alert(result['message'] || "保存失败，请稍候重试。", '提示');
			mini.get('phoneCode').setValue("");
		}
		form.unmask();
	});
	if (form.isValid()){
		form.loading("注册中......");
	}
});