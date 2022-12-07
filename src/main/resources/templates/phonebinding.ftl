<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/f-registered.css"/>
    <link rel="stylesheet" type="text/css" href="/QVerify/css/QVerify.min.css" charset="utf-8"/>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <script src="/js/NewLogin/js/zepto.js" type="text/javascript" charset="utf-8"></script>
    <title>账号绑定页面</title>
  <style>
      .f-ml-hd-bottom{width: 100%;height: 88px;margin: 0 auto;border-bottom: 1px solid #ccc;}
      .content{width: 100%;height: 700px;}
      .contentiele{width: 40%;height: 40px;margin: 0px auto;text-align: center;margin-top: 40px;border-bottom: 1px solid #ccc;}
      .contentiele h3{font-weight: bold;font-size: 20px;color: #ff6000;}
      .information{width: 20%;height: 300px;margin: 0px auto;margin-top: 40px;}
      .information .fillin{width:100%;margin: 0px auto;}
      .information .fillin p{font-size: 15px;font-weight: bold;}
      .bqxx{width: 35%;margin: 0px auto;text-align: center;}
      .bqxx p{color: #666;font-size: 15px;  }
     .mini-textbox-border{height: 36px;}
       .mini-textbox-input{height: 40px;}
      .f-r-input5{background-color: white;}

      #loginCode{margin-left: -29px;overflow: visible;height: 26px;width: 170px;}
      #VerifyCode{margin-left: -29px;overflow: visible;height: 26px;width: 150px;}
      #phoneCode{margin-left: -29px;width: 190px;}
      .p_but {height: 40px;width: 97%;color: #fff;text-align: center;background-color: #ff6000;border: 1px solid #ff6000;border-radius: 2px;font-size: 18px;}

  </style>
</head>
<body>
<!--头部-->
<div class="f-ml-header">
    <!--头部下边-->
    <div class="f-ml-hd-bottom clearfix">
        <div class="f-ml-hd-logo">
            <a  href="">
                <img  src="/js/NewLogin/img/logo.png" style="height: 85px" alt="logo"/>
            </a>
            <div class="f-ml-hd-text r" id="divHeader">
                绑定手机
            </div>
        </div>
    </div>
</div>
<!--============================会员绑定手机页面==============================-->
<!--内容-->
<div class="content">
      <div class="contentiele" id="divCenter">
          <h3>手机绑定</h3>
      </div>
    <div id="bindLoginForm">
        <div class="information" id="dyibu" style="">
            <!--手机号码框-->
            <div class="fillin">
                <div class="f-r-input1 clearfix" style="margin-top: 6px">
                    <input  id="loginCode" style="width: 100%;" name="loginCode" class="mini-textbox f-r-put1 l" emptyText="请输入手机号码" required="true">
                </div>
            </div>

            <!--获取手机验证码-->
            <div class="fillin" style="margin-top: 40px">
                <div class="f-r-input5 clearfix" style="margin-top: 6px">
                    <input  id="phoneCode" name="phoneCode" class="mini-textbox phoneCode" required="true" emptyText="点击获取手机验证码输入">
                    <a href="javascript:void(0)" class="f-r-input5a" id="sendSMS" style="margin-left: -90px;">
                        <span id="dyMobileButton" style="color: white">获取验证码</span>
                    </a>
                </div>
            </div>

            <!--图形验证码-->
                        <div class="fillin" style="margin-top: 40px">
            <#--                <div class="f-r-input4 clearfix" style="margin-top: 6px">-->
            <#--                    <input  id="VerifyCode" name="VerifyCode"  class="mini-textbox l" emptyText="请输入验证码" required="true">-->
            <#--                    <img style="margin-left: 130px;margin-top: -28px;height: 38px;" class="verifyCode" onclick="changeCode()" />-->
            <#--                </div>-->
                            <div class="f-ml-submit-button">
                                <input class="" id="btn" style="height: 40px;" type="button" value="点击按钮进行验证" onclick="test();"/>
                            </div>
                            <div id="QVerify" style="visibility: hidden"></div>
                        </div>
            <!--绑定-->
            <div class="fillin" style="margin-top: 40px">
                <input class="p_but" id="submitbtn" type="button">
            </div>
        </div>
    </div>
    <div id="savePwdForm">
        <div class="information" id="derbu" style="display: none">
            <!--输入密码框-->
            <div class="fillin">
                <div class="f-r-input1 clearfix" style="margin-top: 6px">
                    <input  id="password" name="password" style="width: 100%;"  type="password" class="mini-password f-r-put1 l" emptyText="请输入密码" required="true">
                </div>
            </div>


            <div class="fillin">
                <div class="f-r-input1 clearfix" style="margin-top: 30px">
                    <input  id="password1" name="password1" style="width: 100%;" type="password" class="mini-password f-r-put1 l" emptyText="请确认密码" required="true">
                </div>
            </div>

            <!--绑定-->
            <div class="fillin" style="margin-top: 40px">
                <input class="p_but" id="save" value="保存" type="button">
            </div>
        </div>
    </div>
    <div class="bqxx" style="margin-top: 50px" id="bqxx">
        <p>注：绑定成功的手机号码可以做为帐号进行登录和找回密码。</p><br>
        <p>未经知名未来同意，不得转载本网站之所有信息及作品 | 知名未来网版权所有©1999-2021</p>
    </div>


</div>

<script type="text/javascript">
    mini.parse();
    var doVerify = "";
    var time = 60;
    var flag = true;
    var phoneCode = "";
    $(function() {
        // changeCode();
        if ("${Type}" == "EditPwd" || "${Type}" == "ForGetPwd"){
            $("#submitbtn").val("下一步");
            $("#divHeader").html("密码修改");
            $("#divCenter").html("<h3>修改密码</h3>");
            $('#submitbtn').bind('click',function () {
                var url = "/systems/Bind/updatepasswordyz";
                var form = new mini.Form("#bindLoginForm");
                var user = form.getData();
                var arg = {Data: mini.encode(user)};
                form.validate();
                if (doVerify == "" || doVerify == false){
                    mini.alert("请先完成验证!");
                    return false;
                }
                $.post(url, arg, function (result) {
                    if (result['success']) {
                        $("#dyibu").css('display','none');
                        $("#derbu").css('display','block');
                        $('#save').bind('click',function () {
                            var pwd1 = mini.get('password').getValue();
                            var pwd2 = mini.get('password1').getValue();
                            if (pwd1 != pwd2){
                                mini.alert("两次输入的密码不一致!");
                            }else {
                                if ("${Type}" == "EditPwd") {
                                    updatepassword();
                                }else if ("${Type}" == "ForGetPwd") {
                                    var LoginCode = mini.get('loginCode').getValue();
                                    var PassWord = mini.get('password').getValue();
                                    forgetpassword(LoginCode,PassWord);
                                }
                            }
                        })
                    } else {
                        var msg = result['message'] || "验证失败，请稍候重试。";
                        mini.alert(msg);
                    }
                    form.unmask();
                });
            })
        }else {
            $("#divHeader").html("绑定手机");
            $("#divCenter").html("<h3>手机绑定</h3>");
            $("#submitbtn").val("保存");
            $('#submitbtn').bind('click',function () {
                if (doVerify == "" || doVerify == false){
                    mini.alert("请先完成验证!");
                    return false;
                }
                BindLogin();
            })
            $("#dyibu").css('display','block')
            $("#derbu").css('derbu','none');
        }
        $('#dyMobileButton').click(function(){
            $("this").attr("disabled",true);
            var loginCode = mini.get('loginCode').getValue();
            if(flag){
                var timer = setInterval(function () {
                    if(time == 60 && flag) {
                        flag = false;
                        var arg ={Phone:loginCode};
                        var url = "/systems/Bind/getBindSMS";
                        $.post(url, arg, function (text) {
                            var res = mini.decode(text);
                            if (res.message == "OK") {
                                $("#dyMobileButton").html("已发送");
                            }else {
                                mini.alert(res.message);
                                flag = true;
                                time = 60;
                                clearInterval(timer);
                            }
                        });
                    }else if (time == 0){
                        $("#dyMobileButton").removeAttr("disabled");
                        $("#dyMobileButton").html("获取验证码");
                        clearInterval(timer);
                        time = 60;
                        flag = true;
                    }else {
                        $("#dyMobileButton").html(time + " s 重新发送");
                        time--;
                    }
                },1000);
            }
        });
    });
    function updatepassword() {
        var url = "/systems/Bind/updatepassword";
        var form = new mini.Form("#savePwdForm");
        var user = form.getData();
        var arg = {Data: mini.encode(user)};
        form.validate();
        if (doVerify == "" || doVerify == false){
            mini.alert("请先完成验证!");
            return false;
        }
        $.post(url, arg, function (result) {
            if (result['success']) {
                mini.alert("修改密码成功!");
                onOk();
            } else {
                var msg = result['message'] || "修改密码失败，请稍候重试。";
                mini.alert(msg);
            }
            form.unmask();
        });
    }
    function forgetpassword(LoginCode, Password) {
        var url = "/systems/Bind/forgetpassword";
        var arg = {LoginCode: mini.encode(LoginCode),Password: mini.encode(Password)};
        $.post(url, arg, function (result) {
            if (result['success']) {
                mini.alert("修改密码成功!");
                window.location.href = "/nl"
            } else {
                var msg = result['message'] || "修改密码失败，请稍候重试。";
                mini.alert(msg);
            }
            form.unmask();
        });
    }
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    function onOk() {
        CloseWindow("ok");
    }
    function changeCode() {
        var RANDOMCODEKEY = "VerifyCode";
        var src = "/doGetVerifyCode?RANDOMCODEKEY="+ RANDOMCODEKEY + "&" +new Date().getTime();
        $('.verifyCode').attr("src",src);
    }
    function BindLogin() {
        if ("${Type}" == "BindPhone"){
            var url = "/systems/Bind/bindphonetosql";
            var form = new mini.Form("#bindLoginForm");
            var user = form.getData();
            var arg = {Data:mini.encode(user),OpenID:"${OpenID}",Type:"${Type}"};
            form.validate();
            if (doVerify == "" || doVerify == false){
                mini.alert("请先完成验证!");
                return false;
            }
            $.post(url,arg,function (result) {
                if (result['success']) {
                    window.location.href="/grid?JumpPage=accountsettings";
                }else {
                    var msg=result['message'] || "绑定失败，请稍候重试。";
                    mini.alert(msg,'系统提示',function(){
                        window.location.href="/grid?JumpPage=accountsettings";
                    });
                }
                form.unmask();
            });
        }else {
            var url = "/systems/Bind/bindLogin";
            var form = new mini.Form("#bindLoginForm");
            var user = form.getData();
            var arg = {Data: mini.encode(user), OpenID: "${OpenID}", Type: "${Type}"};
            form.validate();
            if (doVerify == "" || doVerify == false){
                mini.alert("请先完成验证!");
                return false;
            }
            $.post(url, arg, function (result) {
                if (result['success']) {
                    window.location.href = "/grid";
                } else {
                    var msg = result['message'] || "登录失败，请稍候重试。";
                    mini.alert(msg);
                }
                form.unmask();
            });
        }
    }
</script>
<script type="text/javascript" src="/QVerify/js/QVerify.min.js"></script>
<script type="text/javascript">
    function test () {
        QVerify({
            name: "人机验证",  // 验证面板标题
            desc: "滑动滑块，使图片显示角度为正",  // 验证操作提示文字
            cloneTxt: "点我关闭",  // 关闭验证面板文字
            successTxt: "验证成功，{0}秒后自动关闭",  // {0}必须有，延迟关闭时间显示
            errorTxt: "验证失败，请重试",
            images: [
                "/QVerify/img/t1.png",
                "/QVerify/img/t2.png",
                "/QVerify/img/t3.png"
            ],  // 图片数组 将会随机从里面选取一张
            duration: 2,  //定时关闭时间 默认 2
            mountDiv: "#QVerify",  // 装载div 默认 #QVerify
            slideDifference: 5,  // 滑动误差值 默认 5
            defaultDifference: 50,  // 默认图片角度最小差值 默认 50
            mousedown: function (e) {  // 按下鼠标事件
                // e: 元素本身
                console.log('按下了鼠标');
            },
            mousemove: function (e, moveWidth) {  // 移动鼠标事件
                // e: 元素本身
                // moveWidth: 移动距离
                console.log("移动了鼠标");
                console.log(moveWidth);
            },
            mouseup: function (e, moveWidth) {  // 抬起鼠标事件
                // e: 元素本身
                // moveWidth: 移动距离
                console.log("抬起了鼠标");
                console.log(moveWidth);
            },
            success: function () {  // 验证成功事件
                doVerify = true;
                document.getElementById('btn').value = "验证成功";
                console.log("验证成功");
            },
            fail: function () {  // 验证失败事件
                doVerify = false;
                console.log("验证失败");
            },
            complete: function () {  // 验证完成事件 成功失败都会执行(执行顺序: complete->success 或 complete->fail)
                console.log("触发验证");
            },
            clone: function (status) {  // 关闭验证面板事件
                // status 返回的状态
                // false: 失败状态下关闭; true: 成功状态下关闭;
                console.log(status);
            }
        });
    };
</script>
</body>

</html>
