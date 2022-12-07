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
    <title>会员注册页面</title>
    <style>
        .mini-textbox-border{width: 200%;height: 36px;}
        .mini-textbox-input{height: 40px;}
        .clearfix{margin-top: 20px;}
        #VerifyCode{width: 50px;}
        #phoneCode{width: 100px;}
        .f-r-input5{background-color: white;}
        .QVerify .QVerify-verify .QVerify-verify-img > img{width: 105%;}
        .f-r-input4 img{margin: 0px 5px 3px -4px;}
    </style>
</head>
<body>
<!--头部-->
<div class="f-ml-header">
    <!--头部下边-->
    <div class="f-ml-hd-bottom clearfix">
        <div class="f-ml-hd-logo" style="margin-left: -350px;">
            <a  href="/nl">
                <img  src="/js/NewLogin/img/logo123.png" style="margin-top: 16px;" alt="logo"/>
            </a>
            <div class="f-ml-hd-text r">

            </div>
        </div>
    </div>
</div>
<!--============================会员注册页面==============================-->
<!--内容-->
<div class="f-registered-middle" style="background: url(/js/NewLogin/img/bg.png) no-repeat, -webkit-linear-gradient(-45deg, #48C8FF, #54B7FE);margin-top: -39px;">
    <div class="f-r-middle-wp" style="width: 1180px;height: 590px;margin: 0 auto;position: relative;">
        <img class="f-r-img2" style="margin: 150px 0 0 -53px; width: 676px;" src="/js/NewLogin/img/login_bg.png" alt="会员登录中间图"/>
        <div class="f-r-middle-right r" style="height: 500px;">
            <#--返回首页-->
            <a href="/nl" style="float: right;margin-top: 10px;margin-right: 10px;">返回首页</a>
            <!--登录框头-->
            <div class="f-r-right-title">
                <!--<span class="f-r-font-logo">-->
                注册<!--</span>-->
            </div>
            <div id="registeredForm">
                <!--手机号输入框-->
                <div class="f-r-input1 clearfix">
                    <input  id="loginCode" name="loginCode" class="mini-textbox f-r-put1 l" emptyText="请输入手机号码" required="true">
                </div>

                <!--密码输入框-->
                <div class="f-r-input2 clearfix">
                    <input id="password" name="password" class="mini-password f-r-put2 l" emptyText="请输入密码" required="true" vtype="minLength:6;maxLength:12"/>
                </div>

                <!--确认密码输入框-->
                <div class="f-r-input3 clearfix">
                    <input id="confirmPassword" name="confirmPassword" class="mini-password f-r-put3 l" emptyText="请再次输入密码" required="true" vtype="minLength:6;maxLength:6"/>
                </div>

                <!--获取手机验证码-->
                <div class="f-r-input5 clearfix">
                    <input  id="phoneCode" name="phoneCode" class="mini-textbox phoneCode" required="true" emptyText="点击获取手机验证码输入">
                    <a href="javascript:void(0)" class="f-r-input5a" id="sendSMS" >
                        <span id="dyMobileButton" style="color: white">获取验证码</span>
                    </a>
                </div>

                <!--验证码输入框-->

                    <#--                    <input  id="VerifyCode" name="VerifyCode" class="mini-textbox l" emptyText="请输入验证码" required="true">-->
                    <#--                    <img style="margin-left: 70px;margin-top: 5px;" class="verifyCode" onclick="changeCode()" />-->
                    <div class="f-ml-submit-button" style="text-align: center;">
                        <input class="" type="button" id="btn" style="height: 44px;width: 85.5%;margin-top: 30px;" value="点击按钮进行验证" onclick="test();"/>
                    </div>
                    <div id="QVerify" style="visibility: hidden"></div>


                <!--登录按钮-->
                <div class="f-r-submit-button" style="    margin-top: -19px;">
                    <#--<input class="f-r-btn" style="background-color: rgb(219 , 82 , 0);" type="button" value="登录"/>-->
                    <input class="f-r-btn" style="background-color: rgb(34 , 119 , 223);    margin-top: 33px;" type="button" value="注册"/>
                </div>
                <!--合作网站登录-->
                <div class="f-r-end">
                    <div class="f-r-end-son1">
                        <a href="###">
                            <div class="f-ricons-weixin"></div>
                        </a>
                        <a href="###">
                            <div class="f-ricons-qq"></div>
                        </a>
                    </div>
                    <div class="f-r-end-son2">
                        用合作网站登录
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
    <div class="footer" style="color: #8C8C8C;font-size: 14px;text-align: center;width: 100%;margin-top: 40px;">
        opyright © 2020 湖南知名未来科技有限公司版权所有  备案号:湘ICP备20007640号-2
    </div>
</body>
    <script type="text/javascript">
        mini.parse();
        var doVerify = "";
        var time = 60;
        var flag = true;
        var phoneCode = "";
        $(function() {
            // changeCode();
            $('#dyMobileButton').click(function(){
                $("this").attr("disabled",true);
                var loginCode = mini.get('loginCode').getValue();
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
    </script>

<script src="/js/NewLogin/js/f-registered.js?v=${version}" type="text/javascript" charset="utf-8"></script>
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
</html>
