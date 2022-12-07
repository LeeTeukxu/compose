<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>技术领域</title>
    <link rel="stylesheet" type="text/css" href="/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/css/styletpsc.css" />
    <link rel="stylesheet" href="/themes/default/default.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/bigsmall/css/main.css" />
    <script id="script" src="/js/jquery-2.0.3.min.js" iconfont="true"></script>

    <script type="text/javascript">var IMGDIR = '/bigsmall/images/', VERHASH = 'zfhf', JSPATH = '/bigsmall/js/';</script>
    <script src="/bigsmall/js/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/bigsmall/images/style.css" />

    <script id="script" src="/js/Jsequencing.js?v=${version}" iconfont="true"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <script type="text/javascript" src="/bigsmall/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/bigsmall/js/main.js?v=${version}"></script>
    <script type="text/javascript" src="/js/layui/layui.js"></script>
    <style>
        .mini-textarea .mini-textbox-border{padding-left: 2px;padding-left: 0px;}
        #TechnicalFieldSave{height: 40px;width: 100px;background: rgba(150,209,150,1);border: none;border-radius:5px ;color: #FFFFFF;margin-top: 10px}
        .width_auto{width: 80%;height: 700px;}

        .shrink{float: right;width: 50px;margin-top: 5px;}
        .PictureDisplay{
            float: right;
            width: 17%;
            height: 858px;
            display: inline;
            overflow: hidden;
            position: absolute;
            top: -9px;
            left: 83%;
        }
        .Picturetag *{display:inline-block;vertical-align:middle;}
        .PictureDisplay .Picturetag{width: 102%;height: 250px;/*border-bottom: 1px solid #dfe4e6;*/}
        .PictureDisplay .Picturetag h3*{display: inline-block;  vertical-align: middle;  }
        .PictureDisplay .Picturetag h3{    margin-left: 7px;
            font-weight: bold;
            margin-top: 10px;
            height: 52px;
            width: 92.9%;
            border: none;
            background: rgb(224,224,224);}
        .PictureDisplay .Picturetag h3 p{margin-top: 8px;color: rgb(127,127,127);font-weight:bold;margin-left: 10px;}
        .PictureDisplay .Illustration{    width: 100%;
            height: 534px;
            margin-top: 5px;
            overflow-x: hidden;
            overflow-y: auto;
            margin-left: 4px;}
        .PictureDisplay .Illustration::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}

        #FileNametSave{height: 28px;width: 45px;background: rgb(87,184,236);border: none;border-radius: 5px;color: rgb(255,255,255);margin-top: 6px;margin-left: 108px;}
        #ftkuang{border: 1px solid #dfe4e6;width: 95%;margin-left: 8px;height: 591px;margin-top: -6px}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .MenuClick {background: rgb(87,184,236)!important;}
        #digitalSign .mini-textbox-border .mini-textbox-input{height: 178px;width: 312px;}

        /* drag */
        #drag{position:absolute;top:100px;left:785px;width: 30%;background-color:#0606066b;border:1px solid #444;border-radius:5px;box-shadow:0 1px 3px 2px #666;}
        #drag .title{position:relative;height:27px;margin:5px;}
        #drag .title h2{font-size:14px;height:27px;line-height:24px;border-bottom:1px solid #A1B4B0;}
        #drag .title div{position:absolute;height:19px;top:2px;right:0;}
        #drag .title a,a.open{float:left;width:21px;height:19px;display:block;margin-left:5px;}
        a.open{position:absolute;top:10px;left:50%;margin-left:-10px;background-position:0 0;}
        a.open:hover{background-position:0 -29px;}
        #drag .title a.min{background-position:-29px 0;}
        #drag .title a.min:hover{background-position:-29px -29px;}
        #drag .title a.max{background-position:-60px 0;}
        #drag .title a.max:hover{background-position:-60px -29px;}
        #drag .title a.revert{background-position:-149px 0;display:none;}
        #drag .title a.revert:hover{background-position:-149px -29px;}
        #drag .title a.close{background-position:-89px 0;}
        #drag .title a.close:hover{background-position:-89px -29px;}
        #drag .content{overflow:auto;margin:0 5px;}
        #drag .resizeBR{position:absolute;width:14px;height:14px;right:0;bottom:0;overflow:hidden;cursor:nw-resize;background:url(img/resize.png) no-repeat;}
        #drag .resizeL,#drag .resizeT,#drag .resizeR,#drag .resizeB,#drag .resizeLT,#drag .resizeTR,#drag .resizeLB{position:absolute;background:#000;overflow:hidden;opacity:0;filter:alpha(opacity=0);}
        #drag .resizeL,#drag .resizeR{top:0;width:5px;height:100%;cursor:w-resize;}
        #drag .resizeR{right:0;}
        #drag .resizeT,#drag .resizeB{width:100%;height:5px;cursor:n-resize;}
        #drag .resizeT{top:0;}
        #drag .resizeB{bottom:0;}
        #drag .resizeLT,#drag .resizeTR,#drag .resizeLB{width:8px;height:8px;background:#FF0;}
        #drag .resizeLT{top:0;left:0;cursor:nw-resize;}
        #drag .resizeTR{top:0;right:0;cursor:ne-resize;}
        #drag .resizeLB{left:0;bottom:0;cursor:ne-resize;}
        .highlightTextarea-container{margin-left: 310px;margin-top: -13px}
    </style>
</head>
<body>
<div id="append_parent" class="append_parent"></div><div id="ajaxwaitid"></div>
<script src="/bigsmall/js/forum_viewthread.js" type="text/javascript"></script>
<script type="text/javascript">
    zoomstatus = parseInt(1);
    var imagemaxwidth = '500';//控制图片初始宽度
    var aimgcount = new Array();
</script>
<div class="width_auto" id="width_auto">
    <div class="Opendrawings" id="Opendrawings" style="display: inline;float: right;background: rgb(27,98,171);margin-right: 1px;width: 30px;text-align: center;border-radius: 2px;display: none;">
        <img src="/img/leftShens.png" style="margin-top: 5px;" onclick="shrink()">
    </div>
    <br><br><br><br><br><br><br><br><br>
    <div style="margin-top:200px ;text-align: center;" id="TechnicalFieldForm">
        <table id="zltable" style="margin-top: -50px;margin: 0px auto;">
            <tr>
                <td style="width:900px;">
                    <div style="margin-left: 30px;display: inline;">
                        <input  id="tcOne" name="tcOne" type="text"  style="border-width: 0px;width: 10%;height: 26px;float: left;margin-left: 38px;border: 1px solid rgb(221, 221, 221);border-radius: 4px;">
                        <input  id="technicalField" name="technicalField" type="text" style="border-width: 0px;width: 20%;height: 26px;float: left;padding: 0px;margin-left: 1px;border: 1px solid rgb(221, 221, 221);border-radius: 4px;">
                    </div>
                    <#--                <input  id="tcTwo" name="tcTwo" class="mini-textbox" style="border-width: 0px;width: 60%;height: 30px;float: left;padding: 0px;" value="领域，具体为${AssistName}。">-->
                    <input  id="tcTwo" name="tcTwo" type="text" style="width: 60%;height: 30px;float: left;padding: 0px;border: 1px solid #dddddd;border-radius: 4px;height: 26px;margin-left: 310px;margin-top: -18px"/>
                    <div id= "tip" style="width: 66%;float: right;" ></div>


                </td>
            <tr id="aaa" style="display: none;">
                <td>
                    <p style="width: 500px;margin-left: 120px;line-height: 2;text-align: left;">
                        发明或者实用新型的技术领域应当是要求保护的发明或者实用新型技术方案所 属或者直接应用的具体技术领域，而不是上位的或者相邻的技术领域，
                        也不是发明或 者实用新型本身。该具体的技术领域往往与发明或者实用新型在国际专利分类表中可 能分入的最低位置有关。例如，一项关于挖掘机悬臂的发明，
                        其改进之处是将背景技 术中的长方形悬臂截面改为椭圆形截面。其所属技术领域可以写成“本发明涉及一种 挖掘机，特别是涉及一种挖掘机悬臂” (具体的技术领域)，
                        而不宜写成“本发明涉及 一种建筑机械” (上位的技术领域)，也不宜写成“本发明涉及挖掘机悬臂的椭圆形截 面” 或者“本发明涉及一种截面为椭圆形的挖掘机悬臂” (发明本身)
                    </p>
                </td>
            </tr>
            </tr>
        </table>

        <div style="text-align: center;">
            <a id="zxiete" href="javascript:void(0)" style="color: #57b8ec;margin-top: 50px;margin-left: 685px;" onclick="Zhuanlidj()">撰写规范</a><br>
            <input id="TechnicalFieldSave" type="button" value="保存" onclick="Save()" />
        </div>
    </div>
    <div id="NewForm">
        <input class="mini-hidden" id="id" name="id">
        <input class="mini-hidden" id="userId" name="userId">
        <input class="mini-hidden" id="rowValue" name="rowValue">
    </div>
    <div id="NewDigitalForm">
        <input class="mini-hidden" id="id" name="id">
        <input class="mini-hidden" id="userId" name="userId">
        <input class="mini-hidden" id="rowValue" name="rowValue">
    </div>
</div>

<div class="PictureDisplay" id="PictureDisplay">
    <div class="Picturetag" id="DigitalForm">
        <h3>
            <p><img src="/img/rightShens.png" id="zktb"  onclick="shrink()"> 填写数字标记</p>
        </h3>
        <br>
        <table>
            <tr>
                <td>
                    <#--id="Numbermark"-->
                    <textarea  id="digitalSign" name="digitalSign" onchange="DigitalSignSave()" rows="12" cols="900" style="border-width: 0px;margin-left: 7px;margin-top: -16px;height: 180px;width: 93%;padding: 0px;overflow: hidden;border: 1px solid rgb(224,224,224);resize: none;" placeholder="请用户必须按照以下格式输入：数字、部件；数字、部件（最后以句号结尾）（举例：1、机架；2、机身。）"   ></textarea>
                </td>
                <td style="width: 100%;"></td>
            </tr>
        </table>
    </div>
    <div id="ftkuang">
        <div id="anniuzy"  style="height: 46px; margin-top: 10px;text-align: center;">
            <button onClick="imgulp.zhaiyao()" style="height: 40px;width: 44%;border: 1px dashed #bdcbd8;background:rgb(87,184,236);font-size:10px ;font-weight:inherit;color: rgb(255,255,255);" class="btn btn-danger radius">设置摘要附图</button>
            <button onclick="imgulp.dragsort()" style="height: 40px;width: 44%;border: 1px dashed #bdcbd8;background:rgb(5,145,252);font-size:10px ;font-weight:inherit;color: rgb(255,255,255);" class="btn btn-danger radius">批量管理</button>
            <span style="float: left;margin-top: 10px;margin-left: 6px;font-size: 15px;">说明书附图（${PicNum}）</span>
        </div>
        <!--图片展示-->
        <div class="Illustration" id="Illustration">
            <div class="cl imglist" id="img_ul" style="margin-left: 84px;"></div>
        </div>
    </div>
</div>
<div id="ExclusiveWindow2"  class="mini-window" title="修改附图说明详情" style="width:360px;height:140px;position: absolute;top: 174px;left: 549px;" >
    <div id="ExForm" style="padding:15px;padding-top:10px;">
        <form action="#" method="post" id="myform1">
            <table>
                <tr>
                    <td style="width:90px;">&nbsp;附图说明:</td>
                    <td>
                        <input id="Descriptiondrawings" name="Descriptiondrawings" type="text" class="Yytext" required="true" style="border: 1px solid #e4e4e4;width: 173px;height: 26px;border-radius: 3px;"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-top:24px;">
                        <a  class="mini-button" onclick="updatefutu()" style="width:60px;" id="login">确定</a>
                        <a  class="mini-button" onclick="closefutu()" style="width:60px;" id="furguanbi">关闭</a>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-top:5px;">
                        <span style="color:#FF0000;" id="msg"></span>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

<div id="drag" class="sop" style="display: none;">
    <div class="title">
        <div style="color: #fff;float: right;" title="关闭附图窗口" onclick="Close()">X</div>
    </div>
    <div id="imgDiv" class="simg" tabIndex="1" style="text-align: center"><img src="" id="imgSrc" class="imgs" /><div class="mov"></div></div>
    <div class="bigimg" id="bigimg" style="box-shadow: 0 1px 3px 2px #666;left: 100%">
        <img class="bimg" src="" width="800" height="800" border="0">
    </div>
    <div class="resizeL"></div>
    <div class="resizeT"></div>
    <div class="resizeR"></div>
    <div class="resizeB"></div>
    <div class="resizeLT"></div>
    <div class="resizeTR"></div>
    <div class="resizeBR"></div>
    <div class="resizeLB"></div>
</div>
<script type="text/javascript">
    mini.parse();
    var RowValue = "${RowValue}";
    var DigitalSignForm = ${DigitalSign};
    var TechnicalFieldData = ${TechnicalField};
    var DigitalSignid="${DigitalSignid}";
    var userid="${userid}";
    $(function () {
        if (RowValue=="0"){
            mini.alert("请先保存专利名称！","系统提示",function (act) {
                if (act == 'ok'){
                    window.location.href="/Product/index?Mode=Add"
                }
            });
        }
        document.getElementById("technicalField").style.visibility="";
        var form = new mini.Form("NewDigitalForm");
        var NewForm = new mini.Form("NewForm");
        if (DigitalSignForm.id != undefined) {
            document.getElementById("digitalSign").value=DigitalSignForm.digitalSign;
            form.setData(DigitalSignForm);
        }
        if (JSON.stringify(TechnicalFieldData) != '{}'){
            NewForm.setData(TechnicalFieldData);
            $("#tcOne").val(TechnicalFieldData.tcOne);
            if (TechnicalFieldData.tcTwo.lastIndexOf('。') == -1){
                TechnicalFieldData.tcTwo = TechnicalFieldData.tcTwo + "。";
            }
            $("#tcTwo").val(TechnicalFieldData.tcTwo);
        }else {
            $("#tcOne").val("本${JiShuLingYuOne}涉及");
            $('#tcTwo').val("领域，具体为${AssistName}。");
        }
        $("#technicalField").val(TechnicalFieldData.technicalField);

        //描述文件非空判断
        var Description=$(".Descriptionfigures");
        for(var i=0;i<Description.length;i++){
            if(Description[i].innerHTML==""){
                Description[i].innerHTML="请填写文件描述";
            }
        }

    });
    var imgulp = new Jsequencing({
        listid:"img_ul",//页面图片列表ID
        thumbherf:"/attImages",//列表图片前缀
        bigherf:"/attImages",//原图前缀[同列表图相同时，省略]
        jsondata:true,
        imgsrcarr:[//图片数据数组
            <#if Pictuers??>
            <#list Pictuers as Pictuer>
            {src:getImageURL('${Pictuer.path}'),des:'${Pictuer.pictureDescription}',cnsort:'${Pictuer.cnSort}',attid:'${Pictuer.attId}',path:'${Pictuer.path}',showPageName:'/TechnicalField/index'},
            </#list>
            </#if>
        ],
    });
    function getImageURL(url){
        return url;
    };


    function Zhuanlidj() {
        var aaazt=document.getElementById("aaa").style.display;
        if (aaazt=="none"){
            document.getElementById("aaa").style.cssText="display:block";

        }else {
            document.getElementById("aaa").style.cssText="display:none";

        }
    }
    //附图框展示关闭
    function shrink(){
        var display = $("#PictureDisplay").css("display");
        if(display=="none"){
            //展开附图框
            document.getElementById("PictureDisplay").style.display="";
            document.getElementById("width_auto").style.width="80%";
            document.getElementById("zktb").title ="关闭附图框";
            document.getElementById("Opendrawings").style.display="none";
        }
        else
        {
            //关闭附图框
            document.getElementById("PictureDisplay").style.display="none";
            document.getElementById("width_auto").style.width="100%";
            document.getElementById("zktb").title ="展开附图框";
            document.getElementById("Opendrawings").style.display="";

        }
    }
    $(function () {
        //描述文件非空判断
        var Description=$(".Descriptionfigures");
        for(var i=0;i<Description.length;i++){
            if(Description[i].innerHTML==""){
                Description[i].innerHTML="请填写文件描述";
            }
        }
    });
    function addimg(){
        imgulp.addimgarr([
            {src:'t1.jpg?id=1'}
        ])
    };
    function Save() {
        var form = new mini.Form("#NewForm");
        var Data = form.getData();
        form.validate();
        if (form.isValid()){
            form.loading("保存中......");
            var arg={
                Data: mini.encode(Data),
                TcOne: $("#tcOne").val(),
                TechnicalField:$("#technicalField").val(),
                TcTwo: $("#tcTwo").val()
            };
            var url="/TechnicalField/save";
            $.post(url, arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success) {
                        var data=res.data || {};
                        mini.alert('技术领域保存成功','系统提示',function(){
                            form.setData(data);
                        });
                    } else {
                        mini.alert(res.message);
                    }
                    form.unmask();
                }
            );
        }
    }

    function DigitalSignSave() {
        var form = new mini.Form("DigitalForm");
        var newform = new mini.Form("NewDigitalForm");
        var Data = form.getData();
        var newData = newform.getData();
        var Digitalsigndata=document.getElementById("digitalSign").value;
        var str = Digitalsigndata.substr(Digitalsigndata.length-1,1);
        if(str != "。"){
            mini.alert("数字标记最后一位必须为。");
            return false;
        }
        if (DigitalSignid=="{}"){
            var jsonp={"digitalSign":Digitalsigndata,"id":'',"userId":'',"rowValue":''};
        }else {
            var jsonp={"digitalSign":Digitalsigndata,"id":DigitalSignid,"userId":userid,"rowValue":RowValue};
        }
        form.validate();
        if (form.isValid()){
            form.loading("保存中......");
            var arg = {
                DigitalSign:Digitalsigndata,
                Data:mini.encode(newData)
            };
            var url = "/DigitalSign/save";
            $.post(url,arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success){
                        var data = res.data || {};
                        mini.alert('数字标记保存成功','系统提示',function () {
                            form.setData(data);
                        })
                    }else {
                        mini.alert(res.message);
                    }
                    form.unmask();
                }
            )
        }
    }
</script>
<script type="text/javascript">
    /*-------------------------- +
      获取id, class, tagName
     +-------------------------- */
    var get = {
        byId: function(id) {
            return typeof id === "string" ? document.getElementById(id) : id
        },
        byClass: function(sClass, oParent) {
            var aClass = [];
            var reClass = new RegExp("(^| )" + sClass + "( |$)");
            var aElem = this.byTagName("*", oParent);
            for (var i = 0; i < aElem.length; i++) reClass.test(aElem[i].className) && aClass.push(aElem[i]);
            return aClass
        },
        byTagName: function(elem, obj) {
            return (obj || document).getElementsByTagName(elem)
        }
    };
    var dragMinWidth = 250;
    var dragMinHeight = 370;
    /*-------------------------- +
      拖拽函数
     +-------------------------- */
    function drag(oDrag, handle)
    {

        var disX = dixY = 0;
        handle = handle || oDrag;
        handle.style.cursor = "move";
        handle.onmousedown = function (event)
        {
            var event = event || window.event;
            disX = event.clientX - oDrag.offsetLeft;
            disY = event.clientY - oDrag.offsetTop;

            document.onmousemove = function (event)
            {
                var event = event || window.event;
                var iL = event.clientX - disX;
                var iT = event.clientY - disY;
                var maxL = document.documentElement.clientWidth - oDrag.offsetWidth;
                var maxT = document.documentElement.clientHeight - oDrag.offsetHeight;

                iL <= 0 && (iL = 0);
                iT <= 0 && (iT = 0);
                iL >= maxL && (iL = maxL);
                iT >= maxT && (iT = maxT);

                oDrag.style.left = iL + "px";
                oDrag.style.top  = iT + "px";

                return false
            };

            document.onmouseup = function ()
            {
                document.onmousemove = null;
                document.onmouseup = null;
                this.releaseCapture && this.releaseCapture()
            };
            this.setCapture && this.setCapture();
            return false
        };
    }
    /*-------------------------- +
      改变大小函数
     +-------------------------- */
    function resize(oParent, handle, isLeft, isTop, lockX, lockY)
    {
        handle.onmousedown = function (event)
        {
            var event = event || window.event;
            var disX = event.clientX - handle.offsetLeft;
            var disY = event.clientY - handle.offsetTop;
            var iParentTop = oParent.offsetTop;
            var iParentLeft = oParent.offsetLeft;
            var iParentWidth = oParent.offsetWidth;
            var iParentHeight = oParent.offsetHeight;

            document.onmousemove = function (event)
            {
                var event = event || window.event;

                var iL = event.clientX - disX;
                var iT = event.clientY - disY;
                var maxW = document.documentElement.clientWidth - oParent.offsetLeft - 2;
                var maxH = document.documentElement.clientHeight - oParent.offsetTop - 2;
                var iW = isLeft ? iParentWidth - iL : handle.offsetWidth + iL;
                var iH = isTop ? iParentHeight - iT : handle.offsetHeight + iT;

                isLeft && (oParent.style.left = iParentLeft + iL + "px");
                isTop && (oParent.style.top = iParentTop + iT + "px");

                iW < dragMinWidth && (iW = dragMinWidth);
                iW > maxW && (iW = maxW);
                lockX || (oParent.style.width = iW + "px");

                iH < dragMinHeight && (iH = dragMinHeight);
                iH > maxH && (iH = maxH);
                lockY || (oParent.style.height = iH + "px");

                if((isLeft && iW == dragMinWidth) || (isTop && iH == dragMinHeight)) document.onmousemove = null;

                return false;
            };
            document.onmouseup = function ()
            {
                document.onmousemove = null;
                document.onmouseup = null;
            };
            return false;
        }
    };
    window.onload = window.onresize = function ()
    {
        var oDrag = document.getElementById("drag");
        var oTitle = get.byClass("title", oDrag)[0];
        var oL = get.byClass("resizeL", oDrag)[0];
        var oT = get.byClass("resizeT", oDrag)[0];
        var oR = get.byClass("resizeR", oDrag)[0];
        var oB = get.byClass("resizeB", oDrag)[0];
        var oLT = get.byClass("resizeLT", oDrag)[0];
        var oTR = get.byClass("resizeTR", oDrag)[0];
        var oBR = get.byClass("resizeBR", oDrag)[0];
        var oLB = get.byClass("resizeLB", oDrag)[0];

        drag(oDrag, oTitle);
        //四角
        resize(oDrag, oLT, true, true, false, false);
        resize(oDrag, oTR, false, true, false, false);
        resize(oDrag, oBR, false, false, false, false);
        resize(oDrag, oLB, true, false, false, false);
        //四边
        resize(oDrag, oL, true, false, false, true);
        resize(oDrag, oT, false, true, true, false);
        resize(oDrag, oR, false, false, false, true);
        resize(oDrag, oB, false, false, true, false);

        oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
        oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
    }

    function Close() {
        document.getElementById("drag").style.display = "none";
    }
    function updatefutu() {
        var PictureDescription=document.getElementById("Descriptiondrawings").value;
        var AttID = wow;
        var url = "/DrawingSpecification/updatepicturedescription";
        var arg = {AttID:AttID,PictureDescription:PictureDescription};
        var iid = mini.loading('正在保存数据.....');
        $.post(url,arg,function (result) {
            if (result.success == false){
                mini.alert(result.message);
            }
            mini.hideMessageBox(iid);
            window.location.href="/TechnicalField/index";
        })
    }
    function closefutu() {
        window.location.href="/TechnicalField/index";
    }
</script>
<script type="text/javascript" reload="1">
    var ListPic = ${ListPic};
    var arr = [];
    for (var i=0;i<ListPic.length;i++){
        arr.push(ListPic[i].attId);
    }
    aimgcount[1000] = arr;
    attachimggroup(1000);
    attachimgshow(1000);
    var aimgfid = 0;
</script>
<#--HighLight-->
<script type="text/javascript" src="/js/HighLight/highlight.js?v=${version}"></script>
<script type="text/javascript">
    /*cid:高亮文本框,typodata:要识别的错别字数组,tip:显示修改建议,module:功能模块,tabid:表格名称,assistname:专利名称*/
    var highlight = new HighLight({
        cid:"tcTwo",
        typodata:${TypoData},
        tip:"tip",
        module:"TechnicalField",
        tabid:"zltable",
        assistname:"${AssistName}"
    });
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/js/HighLight/jquery.highlighttextarea.css" rel="stylesheet">
</body>
</html>
