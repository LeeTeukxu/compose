<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>知服帮专利撰写辅助系统</title>
    <meta name="keywords" content="专利撰写工具 , 专利撰写系统, 专利文件转五书" />
    <meta name="description" content="专利撰写工具 , 专利撰写系统, 专利文件转五书，专利撰写质量检查，高质量专利撰写辅助。"/>

    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/reset.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="/js/NewLogin/css/f-login.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="/QVerify/css/QVerify.min.css" charset="utf-8"/>
    <script src="/js/NewLogin/js/zepto.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/NewLogin/js/f-login.js?v=${version}" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>
<!--会员登录页面-->
<div class="f-memberlogin-wp">
    <!--头部-->
    <div class="f-ml-header">
        <!--头部下边-->
        <div class="f-ml-hd-bottom clearfix">
            <div class="f-ml-hd-logo">
                <a  href="/website">
                    <img src="/js/NewLogin/img/logo123.png" style="margin-top: 16px;" alt="logo"/>
                </a>
                <div class="f-ml-hd-text r">

                </div>
            </div>
        </div>
    </div>
    <!--内容-->
    <div class="f-login-middle" style="background: url(/js/NewLogin/img/bg.png) no-repeat, -webkit-linear-gradient(-45deg, #48C8FF, #54B7FE);">
        <div class="f-ml-middle-wp">
            <img class="f-ml-img2" src="/js/NewLogin/img/login_bg.png" alt="会员登录中间图"/>
            <div class="f-ml-alterdiv">
                图型验证码有误
            </div>
            <!--验证码弹框-->
            <div class="f-ml-alternull">
                请输入帐号
            </div>
            <div class="f-ml-middle-right r">
                <!--登录框头-->
                <div class="f-ml-right-title clearfix">
                    <span class="f-ml-font-logo">登录</span>
                    <a class="f-ml-right-a r" href="javascript:void(0)" onclick="PhoneLogin()">
                        手机验证码登录
                        <div class="f-icons-tele r" alt="我小图标"></div>
                    </a>
                </div>
                <!--账户名输入框-->
                <div class="f-ml-input1 clearfix">
                    <input class="f-ml-put1 l" type="text" placeholder="  请输入账号" id="username" />
                    <div class="success">
                        <div class="f-icons-on r"></div>
                    </div>
                    <!--输入正确图标-->
                </div>
                <!--未输入手机号警告-->
                <div class="f-ml-warn clearfix">
                    <div class="f-ml-phone-warn">
                        <div class="f-icons-phone l"></div>
                        请输入帐号
                    </div>
                </div>

                <!--密码输入框-->
                <div class="f-ml-input2 clearfix">
                    <input class="f-ml-put2 l" type="password" placeholder="  请输入密码" id="pwd" />
                    <div class="successpw">
                        <div class="f-icons-on2 r"></div>
                    </div>
                    <!--输入正确图标-->
                </div>
                <!--未输入密码警告-->
                <div class="f-ml-warn clearfix">
                    <div class="f-ml-pass-warn">
                        <div class="f-icons-pass l"></div>
                        请输入密码
                    </div>
                </div>

                <!--验证码输入框-->
<#--                <div class="f-ml-input3 clearfix" >-->
<#--                    <input class="f-ml-put3 l" type="text" placeholder="请输入验证码" id="vcode" />-->
<#--                    <img class="verifyCode" onclick="changeCode()" />-->
                    <div class="f-ml-submit-button">
                        <input class="" type="button" id="btn" value="点击按钮进行验证" onclick="test();"/>
                    </div>
                    <div id="QVerify" style="visibility: hidden"></div>
<#--                </div>-->
                <!--自动登录-->
                <div class="f-ml-input4 clearfix">
                    <a class="f-ml-pwpage r" onclick="editPwd();">
                        忘记密码 ?
                    </a>
                </div>
                <!--登录按钮-->
                <div class="f-ml-submit-button">
                    <input class="f-ml-btn mlbtn1" type="button" value="登录" id="btnlogin"/>
                    <input class="f-ml-btn mlbtn2" type="button" value="会员注册" onclick="Registered()"/>
                </div>
                <!--合作网站登录-->
                <div class="f-ml-end">
                    <div class="f-ml-end-son1">
                        <a onclick="qrCode()">
                            <div class="f-icons-weixin"></div>
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

<div class="footer" style="color: #8C8C8C;font-size: 14px;text-align: center;width: 100%;margin-top: 40px;">
    opyright © 2020 湖南知名未来科技有限公司版权所有  备案号:湘ICP备20007640号-2
</div>
<script type="text/javascript">
    mini.parse();
    var doVerify = "";
    $(function() {
        changeCode();
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
        window.location.href = '/phonelogin?Type=Login';
    }
    $('#vcode').on('keydown',function(e){
        if(e.keyCode==13){
            $('#btnlogin').trigger('click');
            return false;
        }
    });
    $('#username').on('keydown',function(e){
        if(e.keyCode==13){
            $('#btnlogin').trigger('click');
            return false;
        }
    });
    $('#pwd').on('keydown',function(e){
        if(e.keyCode==13){
            $('#btnlogin').trigger('click');
            return false;
        }
    });
</script>
</body>
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
            slideDifference: 20,  // 滑动误差值 默认 5
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
</html>
