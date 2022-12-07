<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>知服帮知识产权管理系统登陆｜专利商标管理软件</title>
    <meta name="keywords" content="知识产权管理系统 , 专利管理软件, 商标管理软件" />
    <meta name="description" content="知服帮知识产权管理系统，专利商标客户拓展、专利商标流程管理、专利商标文件通知费用监控提醒、财务数据汇总统计。"/>

    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/reset.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/f-login.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="/QVerify/css/QVerify.min.css" charset="utf-8"/>
    <script src="/js/NewLogin/js/zepto.js" type="text/javascript" charset="utf-8"></script>
<#--    <script src="/js/NewLogin/js/f-login.js" type="text/javascript" charset="utf-8"></script>-->
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <style>

    </style>
</head>
<body>
<!--会员登录页面-->
<div class="f-memberlogin-wp">
    <!--头部-->
    <div class="f-ml-header">
        <!--头部下边-->
        <div class="f-ml-hd-bottom clearfix">
            <div class="f-ml-hd-logo">
                <a  href="">
                    <img src="/js/NewLogin/img/logo.png" alt="logo"/>
                </a>
                <div class="f-ml-hd-text r">
                    会员登录
                </div>
            </div>
        </div>
    </div>
    <!--内容-->
    <div class="f-login-middle">
        <div class="f-ml-middle-wp">
            <img class="f-ml-img2" src="/js/NewLogin/img/login_bg.png" alt="会员登录中间图"/>
            <div class="f-ml-middle-right r">
                <!--登录框头-->
                <div class="f-ml-right-title clearfix">
                    <span class="f-ml-font-logo">登录</span>
                    <a class="f-ml-right-a r" href="/login">
                        账号密码登录
                        <div class="f-icons-tele r" alt="我小图标"></div>
                    </a>
                </div>
                <!--账户名输入框-->
                <div id="PhoneLoginForm">
                    <!--手机号输入框-->
                    <!--手机号输入框-->
                    <div class="f-pl-input1 clearfix">
                        <input class="f-pl-put1 l" id="LoginCode" type="text" placeholder="  请输入手机号" />
                        <div class="pl-success">
                            <div class="f-plicons-on r"></div>
                        </div>
                        <!--输入正确图标-->
                    </div>
                    <!--未输入手机号警告-->
                    <div class="f-pl-warn clearfix"">
                        <div class="f-pl-phone-warn">
                            <div class="f-plicons-phone l"></div>
                            请输入手机号
                        </div>
                    </div>

                    <!--获取手机验证码-->
                    <div class="f-r-input5 clearfix">
                        <input class="l" type="text" id="PhoneCode" name="PhoneCode" placeholder="点击获取手机验证码输入" name="phoneCode" />
                        <a class="f-pl-int2a" href="javascript:void(0)" class="f-r-input5a" id="sendSMS">
                            <span id="dyMobileButton" style="color: white">获取验证码</span>
                        </a>
                    </div>

                    <!--验证码输入框-->
                    <div class="f-r-input4 clearfix">
                        <#--                        <input id="VerifyCode" name="VerifyCode" id class="l" type="text" placeholder="请输入验证码" />-->
                        <#--                        <img  class="verifyCode" onclick="changeCode()" />-->
                        <div class="f-ml-submit-button">
                            <input class="" type="button" id="btn" value="点击按钮进行验证" onclick="test();"/>
                        </div>
                        <div id="QVerify" style="visibility: hidden"></div>
                    </div>
                </div>
                <!--自动登录-->
                <div class="f-ml-input4 clearfix">
                    <a class="f-ml-pwpage r" onclick="editPwd();">
                        忘记密码 ?
                    </a>
                </div>
                <!--登录按钮-->
                <div class="f-ml-submit-button">
                    <input class="f-ml-btn mlbtn1" type="button" value="登录" onclick="PhoneLogin()"/>
                    <input class="f-ml-btn mlbtn2" type="button" value="会员注册" onclick="Registered()"/>
                </div>
                <!--合作网站登录-->
                <div class="f-ml-end">
                    <div class="f-ml-end-son1">
                        <a onclick="qrCode()">
                            <div class="f-icons-weixin" onclick="qrCode()"></div>
                        </a>
                        <a onclick="">
                            <div class="f-icons-qq" onclick="QQLogin()"></div>
                        </a>
                    </div>
                    <div class="f-ml-end-son2">
                        用合作网站登录
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var doVerify = "";
    var time = 60;
    var flag = true;
    var Type = "${Type}";
    $(function() {
        // changeCode();
        $('#dyMobileButton').click(function(){
            $("this").attr("disabled",true);
            var loginCode = $("#LoginCode").val();
            if(flag){
                var timer = setInterval(function () {
                    if(time == 60 && flag) {
                        flag = false;
                        var arg ={Phone:loginCode};
                        var url = "/getSMS";
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
    function changeCode() {
        var RANDOMCODEKEY = "VerifyCode";
        var src = "/doGetVerifyCode?RANDOMCODEKEY="+ RANDOMCODEKEY + "&" +new Date().getTime();
        $('.verifyCode').attr("src",src);
    }
    function Registered() {
        window.location.href = '/registered';
    }
    function qrCode() {
        window.location.href = '/getQRCode?ScanningType=Login';
    }
    function QQLogin(){
        window.location.href = '/systems/qqLogin/loginByQQ'
    }
    function PhoneLogin() {
        var write = /^1[3|4|5|7|8]\d{9}$/;
        var LoginCode = $("#LoginCode").val();
        var VerifyCode = $("#VerifyCode").val();
        var PhoneCode = $("#PhoneCode").val();
        if (doVerify == "" || doVerify == false){
            mini.alert("请先完成验证!");
            return false;
        }
        if (!write.test(LoginCode)){
            mini.alert("请输入正确的手机号码!");
            return false;
        }

        var url = '/systems/Bind/save';
        var postData={LoginCode:LoginCode, VerifyCode:VerifyCode, PhoneCode:PhoneCode, Type:Type};
        $.post(url,postData,function(result){
            if (result['success']) {
                window.location.href = "/grid";
            }
            else
            {
                mini.alert(result['message'] || "登录失败，请稍候重试。", '提示');
                mini.get('phoneCode ').setValue("");
            }
        });
    }

    function getSMS() {
        var loginCode = $("#LoginCode").val();
        var time = 60;
        var flag = true;   //设置点击标记，防止60内再次点击生效

        var url = "/getSMS";
        if (flag) {
            var timer = setInterval(function () {
                if (time == 60 && flag){
                    flag = false;
                    var arg ={Phone:loginCode};
                    $.post(url, arg, function (text) {
                        var res = mini.decode(text);
                        if (res.message == "OK") {
                            phoneCode = res.data;
                            $("#sendSMS").html("已发送");
                            flag = false;
                        }else {
                            mini.alert(res.message);
                            flag = true;
                            time = 60;
                            clearInterval(timer);
                        }
                    });
                }else if (time == 0){
                    $("#sendSMS").removeAttr("disabled");
                    $("#sendSMS").html("获取验证码");
                    clearInterval(timer);
                    time = 60;
                    flag = true;
                }else {
                    $("#sendSMS").html(time + " s 重新发送");
                    time--;
                }
            },1000);
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

    function editPwd() {
        mini.open({
            url:'/systems/Bind/bindphone?Type=ForGetPwd',
            width:'100%',
            height:'100%',
            showModal:true,
            ondestroy:function(action){
                if (action == "ok"){
                    var iframe = this.getIFrameEl();
                }
            }
        });
    }
</script>
</body>
</html>
