<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>背景技术</title>
    <link rel="stylesheet" href="/themes/default/default.css" />
    <link rel="stylesheet" type="text/css" href="/css/style.css" />

    <script type="text/javascript">var IMGDIR = '/bigsmall/images/', VERHASH = 'zfhf', JSPATH = '/bigsmall/js/';</script>
    <script src="/bigsmall/js/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/bigsmall/images/style.css" />

    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
<#--    <script charset="utf-8" src="/lang/zh_CN.js"></script>-->
    <script id="script" src="/js/jquery-2.0.3.min.js" iconfont="true"></script>
    <script id="script" src="/js/Jsequencing.js?v=${version}" iconfont="true"></script>
    <link rel="stylesheet" type="text/css" href="/css/anniu.css?v=${version}" />

    <style>
        .mini-textarea .mini-textbox-border{padding-left: 2px;padding-left: 0px;}
        #TechnicalFieldSave{height: 40px;width: 100px;background: rgba(150,209,150,1);border: none;border-radius:5px ;color: #FFFFFF;margin-top: 10px}
        .width_auto{width: 80%;}
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
            height: 37px;
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

        #FileNametSave{height: 28px;width: 45px;background: rgb(87,184,236);border: none;border-radius: 5px;color: rgb(255,255,255);margin-top: 6px;margin-left:108px;}
        #ftkuang{border: 1px solid #dfe4e6;width: 95%;margin-left: 8px;height: 591px;margin-top: -6px}

        #digitalSign .mini-textbox-border .mini-textbox-input{height: 178px;width: 312px;}
       #zltable .mini-textbox-input{height: 178px;width: 312px;}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .MenuClick {background: rgb(87,184,236)!important;}


        /* drag */
        #drag{position:absolute;top:100px;left:840px;width: 30%;height: 80%;background-color:#0606066b;border:1px solid #444;border-radius:5px;box-shadow:0 1px 3px 2px #666;/*display:flex;justify-content:center;align-items:center;*/}
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
<a href="javascript:void(0)" style="margin-left:66px;" class="btn btn3" onclick="Selandrep()"> <span class="btn-inner">查找与替换</span> <div class="btnbg-x"></div></a>
<div class="width_auto" id="width_auto">
    <div class="Opendrawings" id="Opendrawings" style="display: inline;float: right;background: rgb(27,98,171);margin-right: 1px;width: 30px;text-align: center;border-radius: 2px;display: none;">
        <img src="/img/leftShens.png" style="margin-top: 5px;" onclick="shrink()">
    </div>
    <br><br><br><br><br><br><br><br><br>
    <div style="margin-top:100px ;text-align: center;" id="BgtechnologyForm">
        <table id="zltable" style="margin-left:-110px;margin: 0px auto;">
            <tr>
                <td>
                    <textarea cols="15" rows="8" id="content" name="content" style="width: 1417px;height: 500px;margin-top: -264px;margin-left: 34px;"></textarea>
<#--                    <input type="text" id="content" name="content" style="width: 1300px;height: 500px;margin-top: -269px;margin-left: -4px;"/><br />-->
                    <div style="margin-top: 5px;margin-right: -116px;" id= "tip" >&nbsp;&nbsp;&nbsp;</div>
                    <div style="color: #0066ff;margin-top: -20px;float: right;margin-left: -53px;"><a id="zxie" href="javascript:void(0)" style="color: #57b8ec;"  onclick="Zhuanlidj()">撰写规范</a></div>
                </td>
            </tr>
            <tr id="aaa" style="display: none;">
                <td>
                    <p style="line-height: 2;">
                        发明或者实用新型说明书的背景技术部分应当写明对发明或者实用新型的理解、检索、审查有用的背景技术，并且尽可能引证反映这些背景技术的文件。
                        尤其要引证包含发明或者实用新型权利要求书中的独立权利要求前序部分技术特征的现有技术文件，即引证与发明或者实用新型专利申请最接近的现有技术文件。
                        说明书中引证的文件可以是专利文件，也可以是非专利文件，例如期刊、杂志、手册和书籍等。引证专利文件的，至少要写明专利文件的国别、公开号，最好包括公开日期；
                        引证非专利文件的，要写明这些文件的标题和详细出处。
                        此外，在说明书背景技术部分中，还要客观地指出背景技术中存在的问题和缺点，但是，仅限于涉及由发明或者实用新型的技术方案所解决的问题和缺点。在可能的情况下，
                        说明存在这种问题和缺点的原因以及解决这些问题时曾经遇到的困难。
                    </p>
                </td>
            </tr>
        </table>
        <div style="text-align: center;">
            <input id="TechnicalFieldSave" type="button" value="保存" onclick="Save()" />
        </div>
    </div>
    <div id="NewForm">
        <input class="mini-hidden" id="exception" name="exception">
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
    var BgechnologyData = ${Bgtechnology};
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
        document.getElementById("content").style.visibility="";
        var form = new mini.Form("NewDigitalForm");
        var NewForm = new mini.Form("NewForm");
        if (DigitalSignForm.id != undefined) {
            document.getElementById("digitalSign").value=DigitalSignForm.digitalSign;
            form.setData(DigitalSignForm);
        }
        if (BgechnologyData){
            $("#content").val(BgechnologyData.content);
            NewForm.setData(BgechnologyData);
        }
        //描述文件非空判断
        var Description=$(".Descriptionfigures");
        for(var i=0;i<Description.length;i++){
            if(Description[i].innerHTML==""){
                Description[i].innerHTML="请填写文件描述";
            }
        }

        $(".imgs").mouseover(function(event){
            var bigImage = $("<img id='bimg' src='"+$(this).attr("src")+"' />");

            //追加到body中
            $("body").append(bigImage);
            //多久展示出来 毫秒
            bigImage.show(1000);
        }).mouseout(function(){
            $("#bimg").remove();
        }).mousemove(function(e){
            $("#bimg").css({
                "top":event.pageY,
                // "left":event.pageX+10,
                "right":event.pageX-500,
                "width":"50%",
                "height":"50%",
                "position":"absolute",
                "border":"5px solid #ccaadd",
                "border-radius":"50px 50px"
            });
        });
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

        var imgulp = new Jsequencing({
            listid: "img_ul",//页面图片列表ID
            thumbherf: "/attImages",//列表图片前缀
            bigherf: "/attImages",//原图前缀[同列表图相同时，省略]
            jsondata: true,
            imgsrcarr: [//图片数据数组
                <#if Pictuers??>
                <#list Pictuers as Pictuer>
                {
                    src: getImageURL('${Pictuer.path}'),
                    des: '${Pictuer.pictureDescription}',
                    cnsort: '${Pictuer.cnSort}',
                    attid: '${Pictuer.attId}',
                    path: '${Pictuer.path}',
                    showPageName: '/Bgtechnology/index'
                },
                </#list>
                </#if>
            ],
        });

        function getImageURL(url) {
            return url;
        }

        //附图框展示关闭
        function shrink() {
            var display = $("#PictureDisplay").css("display");
            if (display == "none") {
                //展开附图框
                document.getElementById("PictureDisplay").style.display = "";
                document.getElementById("width_auto").style.width = "80%";
                document.getElementById("zktb").title = "关闭附图框";
                document.getElementById("Opendrawings").style.display = "none";
            } else {
                //关闭附图框
                document.getElementById("PictureDisplay").style.display = "none";
                document.getElementById("width_auto").style.width = "100%";
                document.getElementById("zktb").title = "展开附图框";
                document.getElementById("Opendrawings").style.display = "";
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
            window.location.href="/Bgtechnology/index";
        })
    }
    function closefutu() {
        window.location.href="/Bgtechnology/index";
    }
        function Close() {
            document.getElementById("drag").style.display = "none";
        }

        function addimg() {
            imgulp.addimgarr([
                {src: 't1.jpg?id=1'}
            ])
        }

        function Zhuanlidj() {
            var aaazt = document.getElementById("aaa").style.display;
            if (aaazt == "none") {
                document.getElementById("aaa").style.cssText = "display:block";
       /*         document.getElementById("PictureDisplay").style.cssText = "margin-top: -728px;";*/
            } else {
                document.getElementById("aaa").style.cssText = "display:none";
            /*    document.getElementById("PictureDisplay").style.cssText = "margin-top: -586px;";*/
            }
        }

        function Save() {
            var form = new mini.Form("#NewForm");
            var Data = form.getData();
            form.validate();
            if (form.isValid()) {
                form.loading("保存中......");
                var arg = {
                    Data: mini.encode(Data),
                    Content: (document.getElementById('content').value)
                };
                var url = "/Bgtechnology/save";
                $.post(url, arg,
                    function (text) {
                        var res = mini.decode(text);
                        if (res.success) {
                            var data = res.data || {};
                            mini.alert('背景技术保存成功', '系统提示', function () {
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

        //数字标记保存
        function DigitalSignSave() {
            var form = new mini.Form("DigitalForm");
            var newform = new mini.Form("NewDigitalForm");
            var Data = form.getData();
            var newData = newform.getData();
            form.validate();
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
            if (form.isValid()) {
                form.loading("保存中......");
                var arg = {
                    DigitalSign:Digitalsigndata,
                    Data: mini.encode(newData),
                };
                var url = "/DigitalSign/save";
                $.post(url, arg,
                    function (text) {
                        var res = mini.decode(text);
                        if (res.success) {
                            var data = res.data || {};
                            mini.alert('数字标记保存成功', '系统提示', function () {
                                form.setData(data);
                            })
                        } else {
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
            $("#content").val($("#content").val().replace(/\./g,Replacewith));
        }else {
            $("#content").val($("#content").val().replace(lookreg,Replacewith));
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
    var dragMinHeight = 370;
    /*-------------------------- +
      拖拽函数
     +-------------------------- */
    function drag(oDrag, handle)
    {
        var guanbianiu=document.getElementById("Guanbi");
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
                guanbianiu.style.top=iT+10+"px";

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
<script type="text/javascript" src="/js/HighLight/highlight.js"></script>
<script type="text/javascript">
    /*cid:高亮文本框,typodata:要识别的错别字数组,tip:显示修改建议,module:功能模块,tabid:表格名称*/
    var highlight = new HighLight({
        cid:"content",
        typodata:${TypoData},
        tip:"tip",
        module:"Bgechnology",
        tabid:"zltable"
    });
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/js/HighLight/jquery.highlighttextarea.css" rel="stylesheet">
</body>
</html>
