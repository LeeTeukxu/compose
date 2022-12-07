<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>技术交底书撰写列表</title>
    <meta name="keywords" content="技术交底书撰写列表" />
    <meta name="description" content="技术交底书撰写列表"/>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script type="text/javascript" src="/js/jquery.fileDownload.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
        body::-webkit-scrollbar {
            display: none;
        }
        form {
            margin: 0;
        }
        textarea {
            display: block;
        }
        header{width: 100%;height: 30px;}
        .toubu *{display:inline-block;vertical-align:middle;}
        .toubu {margin-top: 10px;border-bottom: 1px solid #dfe4e6;padding-bottom: 5px;margin-left: 10px;}
        .toubu img{width: 40px;}
        .toubu h1{color: #3d4757;font-size: 18px;margin-left: 8px;width: 211px;font-weight: 500;}
        .menuleft{width: 200px;height: 900px;margin-top: 30px;}
        .menuleft ul{list-style: none;padding-left: 10px;height: 850px;}
        .menuleft ul li{padding-top: 15px;width: 90%;height: 55px;background: rgb(27,98,171);border-top: 1px solid #fff;}
        .menuleft ul li:hover{background: rgb(87,184,236);}
        .menuleft ul li div{margin-bottom: 15px;margin-left: 10px;}
        .menuleft ul li div span{color: #fff;font-size: 15px;}
        .menudiv *{display:inline-block;vertical-align:middle;}
        .content{display: inline; width: 72.5%;float: left;margin-left:190px ; margin-top: -900px;height: 900px;text-align: center;}


        .PictureDisplay{float: right;width: 16%;height:980px;border-left: 1px solid #dfe4e6;display: inline;margin-top: -980px;}
        .Picturetag *{display:inline-block;vertical-align:middle;}
        .PictureDisplay .Picturetag{width: 102%;height: 230px;border-bottom: 1px solid #dfe4e6;}
        .PictureDisplay .Picturetag h3{    margin-left: 5px;font-weight: bold;margin-top: 10px;}
        .PictureDisplay .Illustration{width: 100%;height: 670px; margin-top:5px;overflow-x:hidden;overflow-y:auto;}
        .PictureDisplay .Illustration::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}

        .ybright{float: right;margin-top: 12px;margin-right: 10px;}
        .ybright a{text-decoration: none;}
        .bbzx{margin-left: 20px;text-decoration: none;color: black;}
        .MenuClick {background: rgb(87,184,236)!important;}
    </style>

</head>
<body>

<!--头部-->
<header id="header">
    <div class="toubu">
        <img src="img/zfblogo.jpg"  />
        <h1>知服帮专利撰写工具</h1>
        <div class="ybright">
            <a href="javascript:void(0)" onclick="editPwd();">
                <img src="/img/updatepwd.png"  style="width: 20px">
                <span style="color: #57b8ec">修改密码</span>
            </a>&nbsp;

            <a href="#" style="margin-left: 30px;">
                <img src="/img/Help.png"  style="width: 25px">
                <span style="color: black;">帮助中心</span>
            </a>&nbsp;

            <a href="javascript:void(0)" style="margin-left: 30px;" onclick="exitSystem();">
                <img src="/img/edit.png"  style="width: 25px">
                <span style="color: black;">退出</span>
            </a>
        </div>
    </div>

</header>
<div id="ss">
    <!--左边子菜单-->
    <div class="menuleft">
        <ul id="ul">
            <li id="my" onclick="SetIframeSrc('/Truth/hometruthgrid?State=1')"><div class="menudiv"><img src="/img/syzhuanli.png" /> <span>我的交底</span></div></li>
            <li onclick="SetIframeSrc('/Truth/hometruthgrid?State=2')"><div class="menudiv"><img src="/img/syzhuanli.png" /> <span>回收站</span></div></li>
            <li onclick="SetIframeSrc('/Technology/edit')"><div class="menudiv"><img src="/img/templatemeuli.png" /> <span>模板中心</span></div></li>
            <li onclick="SetIframeSrc('/accountsettings')"><div class="menudiv"><img src="/img/zhanghaoshezhi.png" /> <span>账号设置</span></div></li>
        </ul>
    </div>

    <!--主界面-->
    <div class="content" id="Attacheddrawings" >
        <iframe src="/Truth/hometruthgrid?State=1" style="width: 123%;height: 900px;border: none" id="frame"></iframe>
    </div>

</div>
</body>
<script type="text/javascript">
    mini.parse();
    var JumpPage = "${JumpPage}";
    var Modal = "${Modal}";
    if (JumpPage != ""){
        document.getElementById("frame").src=JumpPage;
    }
    if (Modal != ""){
        if ("${AlertInfo}" == "true"){
            mini.alert("该QQ已经绑定,请勿重复绑定!","系统提示",function () {
                opener.location.reload();
                window.close();
            });
        }else {
            opener.location.reload();
            window.close();
        }
    }else {
        if ("${AlertInfo}" == "true"){
            mini.alert("该微信已经绑定,请勿重复绑定!","系统提示",function () {
                opener.location.reload();
                window.close();
            });
        }
    }
    $(function () {
        $("#my").addClass("MenuClick");

        $("#ul li").click(function () {
            $(this).siblings('li').removeClass('MenuClick');
            $(this).addClass('MenuClick');
        })
    });
    function SetIframeSrc(src){
        document.getElementById("frame").src=src;
    }
    function MenuClick(PageName) {
        $("#" + PageName).addClass("MenuClick");
    }
    function exitSystem() {
        mini.confirm('您即将退出本系统，所有未保存的数据将会丢失，是否继续进行退出操作?', '退出系统', function (act) {
            if (act == 'ok') {
                $.post('/loginOut', {}, function (result) {
                    window.location = '/nl';
                });
            }
        });
    }
    function editPwd() {
        mini.open({
            url:'/systems/Bind/bindphone?Type=EditPwd',
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
    $(function () {
        document.documentElement.style.overflow='hidden';
        var move=function(e){
            e.preventDefault && e.preventDefault();
            e.returnValue=false;
            e.stopPropagation && e.stopPropagation();
            return false;
        }
        var keyFunc=function(e){
            if(37<=e.keyCode && e.keyCode<=40){
                return move(e);
            }
        }
        document.body.onkeydown=keyFunc;
    })
</script>
</html>
