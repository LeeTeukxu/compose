<!doctype html>
<html>
<head>
    <meta charset="utf-8" />
    <title>知服帮专利撰写工具</title>
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
        .toubu {margin-top: -8px;border-bottom: 1px solid #dfe4e6;padding-bottom: 5px;margin-left: -6px;height: 33px;background: rgb(79,83,88);width: 100.7%;}
        .toubu img{width: 40px;}
        .toubu h1{color: #3d4757;font-size: 18px;margin-left: 8px;width: 211px;font-weight: 500;}
        .menuleft{width: 200px;height: 900px;margin-top: 40px;}
        .menuleft ul{list-style: none;padding-left: 10px;height: 850px;}
        .menuleft ul li{padding-top: 15px;width: 90%;height: 40px;background: rgb(27,98,171);border-top: 1px solid #fff;}
        .menuleft ul li:hover{background: rgb(87,184,236);}
        .menuleft ul li div{margin-bottom: 15px;margin-left: 10px;}
        .menuleft ul li div span{color: #fff;font-size: 15px;}
        .menudiv *{display:inline-block;vertical-align:middle;}
        .content{display: inline;width: 81.5%;float: left;margin-left: 2px;margin-top: -3px;height: 900px;text-align: center;}

        .PictureDisplay{float: right;width: 16%;height:980px;border-left: 1px solid #dfe4e6;display: inline;margin-top: -980px;}
        .Picturetag *{display:inline-block;vertical-align:middle;}
        .PictureDisplay .Picturetag{width: 102%;height: 230px;border-bottom: 1px solid #dfe4e6;}
        .PictureDisplay .Picturetag h3{margin-left: 5px;font-weight: bold;margin-top: 10px;}
        .PictureDisplay .Illustration{width: 100%;height: 670px; margin-top:5px;overflow-x:hidden;overflow-y:auto;}
        .PictureDisplay .Illustration::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}
        .cursor {cursor: pointer;}
/*        .MenuClick {background: rgb(65 173 231)!important;color: #fff;width: 90px;text-align: center;border-radius: 5px;}*/
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}

        .ybright{float: right;margin-top: 5px;margin-right: 30px;}
        .ybright a{text-decoration: none;color:rgb(255,255,255);}
        .menusss ul li{float: left;font-size: 19px;margin-left: 37px;color: rgb(255,255,255);width: 131px;text-align: center;border-radius: 5px;}
        @media screen and (max-width: 1600px) {
            .menusss ul li{margin-left: 18px;}
        }
        @media screen and (max-width: 1410px) {
            .menusss ul li{margin-left: 3px;}
        }
        .menusss ul li:hover{background: rgb(42,184,254)}

        .zisize{margin-top: -2px;/*margin-right: -16px;*/}
        .zisize a{text-decoration: none;color: rgb(255,255,255);font-size: 14px;}

    </style>
<#--    <link rel="stylesheet" href="/css/bootstrap.min.css" />
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>-->
    <link rel="stylesheet" href="/themes/default/default.css" />
<#--    <script charset="utf-8" src="/js/kindeditor-min.js"></script>-->
<#--    <script charset="utf-8" src="/lang/zh_CN.js"></script>-->
    <!--图片展示脚本-->
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <script id="script" src="/js/jquery-2.0.3.min.js" iconfont="true"></script>

    <#--    <script id="script" src="/js/upload.js" iconfont="true"></script>-->
</head>
<body id="zdmax">
<!--头部-->
<#--<div class="row">
    <div class="col-md-12">-->
        <header id="header">
            <div class="toubu">
                <div class="menusss" style="float: left;margin-top: -10px;margin-left: 5px;">
                    <ul style="margin-left: -48px;">
                        <#if firsts??>
                            <#list firsts as first>
                                <li id="${first.pageName}" class="cursor"  onclick="SetIframeSrc('${first.url}','${first.pageName}')">
                                    ${first.title}
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </div>

            <#--<h1>知服帮专利撰写工具</h1>-->
            <div class="ybright">
                <div class="zisize">
                    <a href="javascript:void(0)" onclick="zimax()">大</a>&nbsp;<a href="javascript:void(0)" onclick="zizhong()">中</a>&nbsp;<a href="javascript:void(0)" onclick="zimin()">小</a>
                </div>
                 <a href="javascript:void(0)" style="margin-left: 30px;" onclick="back();">


                <img src="/img/edit.png"  style="width: 25px">
                <span style="font-size: 15px">返回首页</span>
            </a>
            </div>
           </div>
        </header>
<#--</div>
</div>-->


<!--左边子菜单-->
<#--<div class="menuleft" id="menuleft">
    <ul id="ul">
        <#if firsts??>
            <#list firsts as first>
                <li id="${first.pageName}" class="cursor" onclick="SetIframeSrc('${first.url}','${first.pageName}')">
                    <div class="menudiv"><img src="${first.icon}">&nbsp;<span>${first.title}</span> </div>
                </li>
            </#list>
        &lt;#&ndash;        <li style="background: #f2f5fa;"><div class="menudiv"><img src="/img/cpname.png" /> <span>产品名称</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/jishu.png" /> <span>说明书附图</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div cl ass="menudiv"><img src="/img/beijingjis.png" /> <span>技术领域</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/famingmude.png" /> <span>背景技术</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/duliquanliyaoqiu.png" /> <span>权利要求</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/chongshu.png" /> <span>说明书摘要</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/jishufangan.png" /> <span>摘要附图</span></div></li>&ndash;&gt;
        &lt;#&ndash;        <li><div class="menudiv"><img src="/img/youyixiaoguo.png" /> <span>完整文件预览</span></div></li>&ndash;&gt;
        </#if>
    </ul>
</div>-->



<!--主界面-->
<div class="content" id="Attacheddrawings" >
    <iframe src="/Product/index?Mode=${Mode}" style="width: 123%;height: 900px;border: none;" id="frame"></iframe>
</div>



<script>
    $(function () {
        //描述文件非空判断
        var Description=$(".Descriptionfigures");
        for(var i=0;i<Description.length;i++){
            if(Description[i].innerHTML==""){
                Description[i].innerHTML="请填写文件描述";
            }
        }

        $("#ProductName").addClass("MenuClick");

        $("#ul li").click(function () {
            $(this).siblings('li').removeClass('MenuClick');
            $(this).addClass('MenuClick');
        })

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
    });

    //附图框展示关闭
    function shrink(){
        var display = $("#PictureDisplay").css("display");
        if(display=="none"){
            document.getElementById("PictureDisplay").style.display="";
            document.getElementById("header").style.width="84%";
            document.getElementById("Attacheddrawings").style.width="72.5%";
            document.getElementById("zktb").title ="关闭附图框";
        }
        else
        {
            document.getElementById("PictureDisplay").style.display="none";
            document.getElementById("header").style.width="100%";
            document.getElementById("Attacheddrawings").style.width="85%";
            document.getElementById("zktb").title ="展开附图框";
        }
    }
    function SetIframeSrc(src,PageName){
        document.getElementById("frame").src=src;
    /*    alert(src);*/
    }
    function back() {
        window.top.location.href = "/grid";
    }
    function zimax() {
        var arg={Fontsize:18};
        var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            alert("修改成功");
        })
        var ssrc=document.getElementById("frame").src;
         document.getElementById("frame").src=ssrc;
    }
    function zizhong() {
        var arg={Fontsize:15};
        var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            alert("修改成功");
        })
        var ssrc=document.getElementById("frame").src;
        document.getElementById("frame").src=ssrc;
    }
    function zimin() {
        var arg={Fontsize:10};
        var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            alert("修改成功");
        })
        var ssrc=document.getElementById("frame").src;
        document.getElementById("frame").src=ssrc;
    }
</script>
</body>
</html>
