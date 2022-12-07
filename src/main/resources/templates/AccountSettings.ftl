<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>专利撰写书列表</title>
    <meta name="keywords" content="账号设置" />
    <meta name="description" content="账号设置"/>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script type="text/javascript" src="/js/jquery.fileDownload.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
        .Pagetitle{    height: 400px;
            background: rgba(255, 255, 255, 1);
            border-radius: 4px;
            overflow: hidden;}
        .top-title{
            font-size: 18px;
            font-weight: 400;
            color: rgba(0, 0, 0, 0.85);
            width: 100%;
            height: 65px;
            line-height: 65px;
            border-bottom: 1px solid #E8E8E8;
            padding-left: 52px;}
        .Pagetitle .bdkuang{width: 800px;margin-left: 70px;margin-top: 35px;}
        .Pagetitle .bd_phone{margin-top: 100px;}
        .Pagetitle .bd_qq{margin-top: 165px;}
        .Pagetitle .bd_name{float: left;}
        .bd_name .imgs{
            display: inline-block;
            vertical-align: middle;
        }
        .bd_name .infos{
            display: inline-block;
        }
        .bd_state{display: inline;margin-left: 150px;}
        .bd_anniu{display: inline;margin-left: 150px;}
        .Accountname{display: inline;margin-left: 150px;height: 30px;}
        .bdan{width: 75px;height: 30px;border: none;background: #ff787e;color: white;border-radius: 4px;}
        .bd_AccName{width: 120px;}
    </style>
</head>
<body>
<div class="Pagetitle">
    <p class="top-title">账号设置</p>

    <div class="bdkuang bd_wx">
        <div class="bd_name bd_wxbitle">
            <div class="imgs"><img src="/img/wx.ico" style="width: 20px"></div>
            <div class="infos"> <span>绑定微信</span></div>

            <div class="bd_state">
                <div class="infos bd_wxstate" id="divWechatbinding">未绑定</div>
            </div>

            <div class="Accountname">
                <div class="infos bd_AccName"><span id="wxaccname">${WXName}</span></div>
            </div>

            <div class="bd_anniu">
                <div class="infos bd_wxanniu"><input id="Wechatbinding" class="bdan" type="button" value="绑定" onclick="" /></div>
            </div>


        </div>
    </div>

    <div class="bdkuang bd_phone">
        <div class="bd_name bd_phonebitle">
            <div class="imgs"><img src="/img/phone.ico" style="width: 20px"></div>
            <div class="infos"> <span>绑定手机</span></div>

            <div class="bd_state">
                <div class="infos bd_phonestate" id="divphonebinding">未绑定</div>
            </div>

            <div class="Accountname">
                <div class="infos bd_AccName"><span id="phoneaccname">${PHONE}</span></div>
            </div>

            <div class="bd_anniu">
                <div class="infos bd_phoneanniu"><input id="phonebinding" class="bdan" type="button" value="绑定" onclick="" /></div>
            </div>
        </div>
    </div>

    <div class="bdkuang bd_qq">
        <div class="bd_name bd_qqbitle">
            <div class="imgs"><img src="/img/QQ.ico" style="width: 20px"></div>
            <div class="infos"> <span>绑定QQ</span></div>

            <div class="bd_state" style="margin-left: 156px;">
                <div class="infos bd_qqstate" id="divqqbinding">未绑定</div>
            </div>

            <div class="Accountname">
                <div class="infos bd_AccName"><span id="qqaccname">${QQName}</span></div>
            </div>

            <div class="bd_anniu">
                <div class="infos bd_qqanniu"><input id="qqbinding" class="bdan" type="button" value="绑定" onclick="" /></div>
            </div>
        </div>
    </div>


</div>

</body>
<script type="text/javascript">
    mini.parse();
    var WX = "${WX}";
    var QQ = "${QQ}";
    var PHONE = "${PHONE}";
    var WXName = "${WXName}";
    var QQName = "${QQName}";
    $(function () {
        var wxaccname=document.getElementById("wxaccname").innerHTML;
        var phoneaccname=document.getElementById("phoneaccname").innerHTML;
        var qqaccname=document.getElementById("qqaccname").innerHTML;
       if (wxaccname.length>7){
           var result='';
           result=wxaccname.substring(0,7)+"..."
           document.getElementById("wxaccname").innerHTML=result;
       }
       if (phoneaccname.length>7) {
           var result = '';
           result = phoneaccname.substring(0, 7) + "..."
           document.getElementById("phoneaccname").innerHTML = result;
       }
       if(qqaccname.length > 7){
           var result='';
           result=qqaccname.substring(0,7)+"..."
           document.getElementById("qqaccname").innerHTML=result;
       }
        if (WX == ""){
            $("#divWechatbinding").text("未绑定");
            $("#Wechatbinding").val("绑定");
            $("#Wechatbinding").click(function(){
                mini.open({
                    url:'/getQRCode?ScanningType=BindWx',
                    width:'50%',
                    height:'50%',
                    showModal:true,
                    ondestroy:function(){

                    }
                });
            });

        }else {
            $("#divWechatbinding").text("已绑定");
            document.getElementById("divWechatbinding").style.color = "red";
            $("#Wechatbinding").val("解绑");
            $("#Wechatbinding").click(function(){
                function g(){
                    var msgId = mini.loading('正在解绑.........');
                    try {
                        var url = "/cancelBindWx";
                        $.post(url,{},function (result) {
                            if (result.success){
                                mini.alert("解绑微信成功");
                                window.location.reload();
                            }else mini.alert(result.message || "解绑微信失败,请稍后重试!");
                        })
                    }catch (e) {
                        mini.alert(e);
                    }finally {
                        mini.hideMessageBox(msgId);
                    }
                }
                if (QQ == "" && PHONE == ""){
                    mini.alert("解除绑定失败,请至少绑定一种登录信息!");
                    return;
                }
                mini.confirm('确认解绑微信？', '系统提示', function (action) {
                    if (action == 'ok') g();
                });
            });
        }

        if (QQ == ""){
            $("#divqqbinding").text("未绑定");
            $("#qqbinding").val("绑定");
            $("#qqbinding").click(function(){
                window.open("/systems/qqLogin/loginByQQ?ScanningType=BindQQ",'','height=500,width=611,scrollbars=yes,status =yes')
            });
        }else {
            $("#divqqbinding").text("已绑定");
            document.getElementById("divqqbinding").style.color = "red";
            $("#qqbinding").val("解绑");
            $("#qqbinding").click(function() {
                function g() {
                    var msgId = mini.loading('正在解绑.........');
                    try {
                        var url = "/systems/qqLogin/cancelBindQQ";
                        $.post(url, {}, function (result) {
                            if (result.success) {
                                mini.alert("解绑QQ成功");
                                window.location.reload();
                            } else mini.alert(result.message || "解绑QQ失败,请稍后重试!");
                        })
                    } catch (e) {
                        mini.alert(e);
                    } finally {
                        mini.hideMessageBox(msgId);
                    }
                }
                if (WX == "" && PHONE == ""){
                    mini.alert("解除绑定失败,请至少绑定一种登录信息!");
                    return;
                }
                mini.confirm('确认解绑QQ？', '系统提示', function (action) {
                    if (action == 'ok') g();
                });
            });
        }

        if (PHONE == ""){
            $("#divphonebinding").text("未绑定");
            $("#phonebinding").val("绑定");
            $("#phonebinding").click(function(){
                mini.open({
                    url:'/systems/Bind/bindphone?Type=BindPhone',
                    width:'100%',
                    height:'100%',
                    showModal:true,
                    ondestroy:function(){

                    }
                });
            });
        }else {
            $("#divphonebinding").text("已绑定");
            document.getElementById("divphonebinding").style.color = "red";
            $("#phonebinding").val("解绑");
            $("#phonebinding").click(function() {
                function g() {
                    var msgId = mini.loading('正在解绑.........');
                    try {
                        var url = "/systems/loginUser/cancelBindPhone";
                        $.post(url, {}, function (result) {
                            if (result.success) {
                                mini.alert("解绑手机");
                                window.location.reload();
                            } else mini.alert(result.message || "解绑手机失败,请稍后重试!");
                        })
                    } catch (e) {
                        mini.alert(e);
                    } finally {
                        mini.hideMessageBox(msgId);
                    }
                }
                if (WX == "" && QQ == ""){
                    mini.alert("解除绑定失败,请至少绑定一种登录信息!");
                    return;
                }
                mini.confirm('确认解绑手机？', '系统提示', function (action) {
                    if (action == 'ok') g();
                });
            });
        }
    });
</script>
</html>
