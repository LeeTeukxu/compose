<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>说明书摘要</title>
    <link rel="stylesheet" type="text/css" href="/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/css/styletpsc.css" />
    <link rel="stylesheet" href="/themes/default/default.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/css/anniu.css?v=${version}" />
    <link rel="stylesheet" type="text/css" href="/bigsmall/css/main.css" />

    <script type="text/javascript">var IMGDIR = '/bigsmall/images/', VERHASH = 'zfhf', JSPATH = '/bigsmall/js/';</script>
    <script src="/bigsmall/js/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/bigsmall/images/style.css" />

    <script id="script" src="/js/jquery-2.0.3.min.js" iconfont="true"></script>
    <script id="script" src="/js/Jsequencing.js?v=${version}" iconfont="true"></script>
    <script type="text/javascript" src="/bigsmall/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/bigsmall/js/main.js?v=${version}"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <script charset="utf-8" src="/js/kindeditor-min.js"></script>
    <script charset="utf-8" src="/lang/zh_CN.js"></script>
    <script type="application/javascript">
        var editor;
        KindEditor.ready(function(K) {
            K.create('textarea[name="technicalField"]', {
                themeType: 'simple',
                resizeType: 1,
                uploadJson: 'common/KEditor/upload_json.php',
                fileManagerJson: 'common/KEditor/file_manager_json.php',
                allowFileManager: true,
                afterBlur: function(){this.sync();}
            });
            editor = K.create('textarea[name="technicalField"]', {
                allowFileManager : true
            });
            K('input[name=getHtml]').click(function(e) {
                alert(editor.html());
            });
            K('input[name=isEmpty]').click(function(e) {
                alert(editor.isEmpty());
            });
            K('input[name=getText]').click(function(e) {
                alert(editor.text());
            });
            K('input[name=selectedHtml]').click(function(e) {
                alert(editor.selectedHtml());
            });
            K('input[name=setHtml]').click(function(e) {
                editor.html('<h3>Hello KindEditor</h3>');
            });
            K('input[name=setText]').click(function(e) {
                editor.text('<h3>Hello KindEditor</h3>');
            });
            K('input[name=insertHtml]').click(function(e) {
                editor.insertHtml('<strong>插入HTML</strong>');
            });
            K('input[name=appendHtml]').click(function(e) {
                editor.appendHtml('<strong>添加HTML</strong>');
            });
            K('input[name=clear]').click(function(e) {
                editor.html('');
            });
        });
    </script>
    <style>
        html{overflow: hidden;overflow-y: hidden;}
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
            height: 496px;
            margin-top: 5px;
            overflow-x: hidden;
            overflow-y: auto;
            margin-left: 4px;}
        .PictureDisplay .Illustration::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}
        #FileNametSave{height: 28px;width: 45px;background: rgb(87,184,236);border: none;border-radius: 5px;color: rgb(255,255,255);margin-top: 6px;margin-left: 108px;}
        #ftkuang{border: 1px solid #dfe4e6;width: 95%;margin-left: 8px;height: 591px;margin-top: -6px}
        #digitalSign .mini-textbox-border .mini-textbox-input{height: 178px;width: 312px;}
        #zltable .mini-textbox-input{height: 178px;width: 312px;}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .MenuClick {background: rgb(87,184,236)!important;}
        .Operationgroup{width: 100%;margin-top: -10px;margin-left: 636px}

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
        .Yytext{width: 170px;height: 24px;border: 1px solid #d0d0d0;border-radius: 5px;}
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
<a href="javascript:void(0)" style="margin-left: 40px;" class="btn btn3" onclick="Selandrep()"> <span class="btn-inner">查找与替换</span> <div class="btnbg-x"></div></a>
<div class="width_auto" id="width_auto">
    <div class="Opendrawings" id="Opendrawings" style="display: inline;float: right;background: rgb(27,98,171);margin-right: 1px;width: 30px;text-align: center;border-radius: 2px;display: none;">
        <img src="/img/leftShens.png" style="margin-top: 5px;" onclick="shrink()">
    </div>
    <br><br><br><br><br><br><br><br><br>
    <div class="Da">

        <div style="margin-left: 30px;margin-top: -70px" id="InstructionForm">
            <table id="zltable">
                <tr>
                    <td>

                        <textarea id="instruction" name="instruction" style="margin-left: 9px;margin-top: -88px;height: 500px;width: 1511px;color: black;" placeholder="请生成说明书摘要..."></textarea>
                        <div id= "tip" ></div>
                        <div style="color: #0066ff;margin-top: -2px;float: right"><a id="zxie" href="javascript:void(0)" style="color: #57b8ec;"  onclick="Zhuanlidj()">撰写规范</a></div>
                    </td>
                </tr>
                <tr id="aaa" style="display: none;">
                    <td>
                        <p style="line-height: 2;">
                            摘要是说明书记载内容的概述，它仅是一种技术信息，不具有法律效力。
                            摘要的内容不属于发明或者实用新型原始记载的内容，不能作为以后修改说明书或者权利要求书的根据，也不能用来解释专利权的保护范围。
                            摘要应当满足以下要求：
                            (1)摘要应当写明发明或者实用新型的名称和所属技术领域，并清楚地反映所要解决的技术问题、解决该问题的技术方案的要点以及主要用途，其中以技术方案为主；
                            摘要可以包含最能说明发明的化学式；
                            (2)有附图的专利申请，应当提供或者由审查员指定一幅最能反映该发明或者实用新型技术方案的主要技术特征的附图作为摘要附图，该摘要附图应当是说明书附图中的一幅；
                            (3)摘要附图的大小及清晰度应当保证在该图缩小到 4 厘米×6 厘米时，仍能清楚地分辨出图中的各个细节；
                            (4)摘要文字部分(包括标点符号) 不得超过 300 个字，并且不得使用商业性宣传用语。
                            此外，摘要文字部分可以有附图标记或无附图标记，若出现附图标记，则应当加括号。
                        </p>
                    </td>
                </tr>
            </table>
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
        <br><br><br><br>

        <div class="Operationgroup" id="Operationgroup">
            <!--操作按钮组-->
            <div class="btn_list" id="btn_list" style="margin-left: 20px;">
                <ul class="clearfix">
                    <li>
                        <a href="javascript:void(0)" class="btn btn7" onclick="shengcheng()"><span class="btn-inner">自动生成</span><div class="btnbg-x"></div></a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="btn btn4" onclick="Save()"> <span class="btn-inner">保存</span> <div class="btnbg-x"></div></a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
</div>
<#--图片展示-->
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
            </tr></table>
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
                        <a  class="mini-button" onclick="closefutu()"  style="width:60px;"  id="furguanbi">关闭</a>
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
<#--查找替换框-->
<div id="ExclusiveWindow3"  class="mini-window" title="查找并替换" style="width:360px;height:180px;" >
    <div id="ExclusiveForm3" style="padding:15px;padding-top:10px;">
        <form action="#" method="post" id="myform3">
            <table>
                <tr>
                    <td style="width:90px;">查找内容(N):</td>
                    <td>
                        <input id="lookup" name="lookup" type="text"  class="Yytext" required="true" />
                    </td>
                </tr>
                <tr>
                    <td style="width:90px;">应替换为(I):</td>
                    <td>
                        <input id="Replacewith" name="Replacewith" type="text" class="Yytext" required="true" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-top:5px;padding-left: 10px">
                        <a  class="mini-button" onclick="Startreplacement()" style="width:90px;" id="thw">开始替换</a>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="padding-top:5px;">
                        <span style="color:#FF0000;" id="msg1"></span>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var RowValue = "${RowValue}";
    var DigitalSignForm = ${DigitalSign};
    var InstructionData = ${Instruction};
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
        var form = new mini.Form("NewDigitalForm");
        var NewForm = new mini.Form("NewForm");
        if (DigitalSignForm.id != undefined) {
            document.getElementById("digitalSign").value=DigitalSignForm.digitalSign;
            form.setData(DigitalSignForm);
        }
        if (InstructionData){
            $("#instruction").val(InstructionData.instruction);
            NewForm.setData(InstructionData);
        }
        //描述文件非空判断
        var Description=$(".Descriptionfigures");
        for(var i=0;i<Description.length;i++){
            if(Description[i].innerHTML==""){
                Description[i].innerHTML="请填写文件描述";
            }
        }
    });
    function GetDigitalCount(Content) {
        if (Content != "") {
            var re = /(\d{1,3})+(?:\.\d+)?/g;
            var arr = Content.match(re);
            if (arr != null) {
                return arr.length;
            }else return 0;
        }else return 0;
    }
    function Zhuanlidj() {
        var aaazt=document.getElementById("aaa").style.display;
        if (aaazt=="none"){
            document.getElementById("aaa").style.cssText="display:block";
            /*document.getElementById("PictureDisplay").style.cssText="margin-top: -785px;";*/

        }else {
            document.getElementById("aaa").style.cssText="display:none";
      /*      document.getElementById("PictureDisplay").style.cssText="margin-top: -700px;";*/

        }
    }
    var imgulp = new Jsequencing({
        listid:"img_ul",//页面图片列表ID
        thumbherf:"/attImages",//列表图片前缀
        bigherf:"/attImages",//原图前缀[同列表图相同时，省略]
        jsondata:true,
        imgsrcarr:[//图片数据数组
            <#if Pictuers??>
            <#list Pictuers as Pictuer>
            {src:getImageURL('${Pictuer.path}'),des:'${Pictuer.pictureDescription}',cnsort:'${Pictuer.cnSort}',attid:'${Pictuer.attId}',path:'${Pictuer.path}',showPageName:'/Instruction/index'},
            </#list>
            </#if>
        ],
    });
    function getImageURL(url){
        return url;
    };
    //附图框展示关闭
    function shrink(){
        var display = $("#PictureDisplay").css("display");
        if(display=="none"){
            //展开附图框
            document.getElementById("PictureDisplay").style.display="";
            document.getElementById("width_auto").style.width="80%";
            document.getElementById("zktb").title ="关闭附图框";
            document.getElementById("Opendrawings").style.display="none";
            document.getElementById("instruction").style.width="1265px";
        }
        else
        {
            //关闭附图框
            document.getElementById("PictureDisplay").style.display="none";
            document.getElementById("width_auto").style.width="100%";
            document.getElementById("zktb").title ="展开附图框";
            document.getElementById("Opendrawings").style.display="";
            document.getElementById("instruction").style.width="1590px";
        }
    }
    function addimg(){
        imgulp.addimgarr([
            {src:'t1.jpg?id=1'}
        ])
    };

    $("#count").html("0");//初始化字数计数器
    /* 此方法兼容大部分浏览器，如：Firefox, Google Chrome, Opera, Safari, Internet Explorer from version 9
         监听输入框字数变化*/
    function OnInput(event, length, id) {
        if(event.srcElement.value.length <= length) {
            var idw = event.srcElement.id;
            document.getElementById(idw).style.color="#000000";
            document.getElementById("Errorprompt").style.display="none";
            $("#" + id).html(event.srcElement.value.length);
        }
        else
        {
            /*如超出25字则出现错误提示(error)*/
            document.getElementById("Errorprompt").style.display="";
            /*获取输入框id值*/
            var id2 = event.srcElement.id;
            document.getElementById(id2).style.color="red";
            /*超出规定长度后禁止继续输入*/
            var value = event.srcElement.value.substring(0, length);
            $("#" + id2).val(value);
        }

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
            window.location.href="/Instruction/index";
        })
    }
    function closefutu() {
        window.location.href="/Instruction/index";
    }
    /**
     * 文本框根据输入内容自适应高度
     * @param                {HTMLElement}        输入框元素
     * @param                {Number}                设置光标与输入框保持的距离(默认0)
     * @param                {Number}                设置最大高度(可选)
     */
    var autoTextarea = function (elem, extra, maxHeight) {
        extra = extra || 0;
        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
            isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
            addEvent = function (type, callback) {
                elem.addEventListener ?
                    elem.addEventListener(type, callback, false) :
                    elem.attachEvent('on' + type, callback);
            },
            getStyle = elem.currentStyle ? function (name) {
                var val = elem.currentStyle[name];
                if (name === 'height' && val.search(/px/i) !== 1) {
                    var rect = elem.getBoundingClientRect();
                    return rect.bottom - rect.top -
                        parseFloat(getStyle('paddingTop')) -
                        parseFloat(getStyle('paddingBottom')) + 'px';
                };
                return val;
            } : function (name) {
                return getComputedStyle(elem, null)[name];
            },
            minHeight = parseFloat(getStyle('height'));
        elem.style.resize = 'none';
        var change = function () {
            var scrollTop, height,
                padding = 0,
                style = elem.style;
            if (elem._length === elem.value.length) return;
            elem._length = elem.value.length;
            if (!isFirefox && !isOpera) {
                padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
            };
            scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            elem.style.height = minHeight + 'px';
            if (elem.scrollHeight > minHeight) {
                if (maxHeight && elem.scrollHeight > maxHeight) {
                    height = maxHeight;
                    style.overflowY = 'auto';
                } else {
                    height = elem.scrollHeight;
                    style.overflowY = 'hidden';
                };
                style.height = height + extra + 'px';
                // scrollTop += parseInt(style.height) - elem.currHeight;
                // document.body.scrollTop = scrollTop;
                // document.documentElement.scrollTop = scrollTop;
                elem.currHeight = parseInt(style.height);
            };
        };
        addEvent('propertychange', change);
        addEvent('input', change);
        addEvent('focus', change);
        change();
    };

    //自动生成说明书摘要
    function shengcheng(){
        $.ajax({
            type : "post",
            url :"/Instruction/findTechAndInde",
            data : {},
            async : false,
            success : function (r) {
                if (r['success']){
                    var Data = r['data'];
                    $("#instruction").val(Data);
                    var highlight = new HighLight({
                        cid:"instruction",
                        typodata:${TypoData},
                        tip:"tip",
                        module:"Instruction",
                        tabid:"zltable"
                    });
                }
            }
        });
        Save();
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

    function Save() {
        var form = new mini.Form("NewForm");
        var Data = form.getData();
        var Digitalsigndata=document.getElementById("digitalSign").value;
        if (DigitalSignid=="{}"){
            var jsonp={"digitalSign":Digitalsigndata,"id":'',"userId":'',"rowValue":''};
        }else {
            var jsonp={"digitalSign":Digitalsigndata,"id":DigitalSignid,"userId":userid,"rowValue":RowValue};
        }
        form.validate();
        if (form.isValid()){
            form.loading("保存中......");
            var arg = {
                Instruction:$("#instruction").val(),
                Data:mini.encode(Data)
            };
            var url = "/Instruction/save";
            $.post(url,arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success){
                        mini.alert("说明书摘要生成成功!","系统提示",function (act) {
                            if (act == 'ok'){
                                var data = res.data || {};
                                form.setData(data);
                            }
                        })
                    }else {
                        mini.alert(res.message);
                    }
                    form.unmask();
                }
            )
        }
    }

    //查找与替换
    function Selandrep() {
        var ExclusiveWindow3 = mini.get("ExclusiveWindow3");
        ExclusiveWindow3.show();
    }
    function Startreplacement(){
        var iid = mini.loading('正在替换内容.....');
        var lookup=$("#lookup").val();//查找
        var Replacewith=$("#Replacewith").val();//替换
        var lookreg=new RegExp(lookup,"g");
        if(lookup.indexOf(".")!=-1){
            $("#instruction").val($("#instruction").val().replace(/\./g,Replacewith));
        }else {
            $("#instruction").val($("#instruction").val().replace(lookreg,Replacewith));
        }

        mini.hideMessageBox(iid);
        mini.alert("替换完成！");
        var ExclusiveWindow3 = mini.get("ExclusiveWindow3");
        ExclusiveWindow3.hide();
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
    var dragMinHeight = 374;
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
    /*cid:高亮文本框,typodata:要识别的错别字数组,tip:显示修改建议,module:功能模块,tabid:表格名称*/
    var highlight = new HighLight({
        cid:"instruction",
        typodata:${TypoData},
        tip:"tip",
        module:"Instruction",
        tabid:"zltable"
    });
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/js/HighLight/jquery.highlighttextarea.css" rel="stylesheet">
</body>
</html>
