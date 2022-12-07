<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>专利名称</title>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <link rel="stylesheet" href="/themes/default/default.css" />
    <script charset="utf-8" src="/js/kindeditor-min.js"></script>
    <script charset="utf-8" src="/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/js/layui/layui.js"></script>
    <style>
        #FileName{padding-top: 200px;}
        #assistName{width: 500px;height: 35px;}
        #FileNametSave{height: 40px;width: 100px;background: rgba(150,209,150,1);border: none;border-radius:5px ;color: #FFFFFF;}

        .mini-textbox-border{height: 35px;margin-left: 160px;margin-top: -47px;}
        .mini-textbox-input{ width: 500px;height: 35px;}
    </style>
</head>
<body>

<div style="margin-top:200px;text-align: center;" id="AssistForm">
    <table id="zltable" style="margin-top: -50px;margin-left: 500px;margin: 0px auto;">
        <tr>
            <td>
                <h2 id="zlname" style="margin-left: -102px;width: 100px;margin-bottom: -30px;">专利名称:</h2>
<#--                <input  id="assistName" name="assistName" class="mini-textbox" emptyText="不得超过25个字" onvaluechanged="WordSearch(this)"  onblur="OnInput(event,25,'count')" style="height: 30px;width: 40%;display: inline">-->
                <input  id="assistName" name="assistName" type="text" emptyText="不得超过25个字" onblur="OnInput(event,25,'count')" style="height: 30px;display: inline"/>
                <div id= "tip" ></div>
                <a id="zxie" href="javascript:void(0)" style="color: #57b8ec;float: right;margin-top: -18px;" onclick="Zhuanlidj()">撰写规范</a>
            </td>
        </tr>
        <tr id="aaa" style="display: none;">
            <td>

                <p style="width: 500px;line-height: 2;text-align: left;" href="javascript:void(O)">
                    请求书中的发明名称和说明书中的发明名称应当一致。发明名称应当简短、准确地表明发明专利申请要求保护的主题和类型。
                    发明名称中不得含有非技术词语， 例如人名、单位名称、商标、代号、型号等；也不得含有含糊的词语，例如“及其他”、
                    “及其类似物” 等；也不得仅使用笼统的词语，致使未给出任何发明信息，例如仅用“方法”、“装置”、“组合物”、“化合物” 等词作为发明名称。
                    发明名称一般不得超过25个字，特殊情况下，例如，化学领域的某些发明，可以允许最多到40个字。
                </p>
            </td>
        </tr>
    </table>

    <span id="Errorprompt" style="display: none;font-size:10px;">内容过长,最多25字!</span>
    <div class='weui-textarea-counter' style="display: none;"><span id="count"></span>25</div><br /><br />
    <input id="FileNametSave" type="button" value="保存" onclick="Save()" />
</div>
<div id="NewForm">
    <input class="mini-hidden" id="id" name="id">
    <input class="mini-hidden" id="exception" name="exception">
    <input class="mini-hidden" id="userId" name="userId">
    <input class="mini-hidden" id="addTime" name="addTime">
    <input class="mini-hidden" id="updateTime" name="updateTime">
    <input class="mini-hidden" id="templateId" name="templateId">
    <input class="mini-hidden" id="downloadNum" name="downloadNum">
    <input class="mini-hidden" id="downloadFiveNum" name="downloadFiveNum">
    <input class="mini-hidden" id="downloadTime" name="downloadTime">
    <input class="mini-hidden" id="state" name="state">
    <input class="mini-hidden" id="fontsize" name="fontsize">
</div>

<script>
    mini.parse();
    var Mode = "${Mode}";
    var formData = ${LoadData};
    if (Mode == "Add"){
        mini.open({
            url:"/Product/selecttemplate",
            title: "请选择专利模板",
            width: 1000,
            height:500,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);
                    mini.get('templateId').setValue(data[0].ID);
                }else {
                    window.top.document.location = "/grid";
                }
            }
        })
    }


    var form = new mini.Form('#NewForm');
    form.setData(formData);
    $("#assistName").val(formData.assistName);
    var layer = null;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });
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

    $(function () {
        $.fn.scrollUnique = function() {
            return $(this).each(function() {
                var eventType = 'mousewheel';
                if (document.mozHidden !== undefined) {
                    eventType = 'DOMMouseScroll';
                }
                $(this).on(eventType, function(event) {
                    // 一些数据
                    var scrollTop = this.scrollTop,
                        scrollHeight = this.scrollHeight,
                        height = this.clientHeight;

                    var delta = (event.originalEvent.wheelDelta) ? event.originalEvent.wheelDelta : -(event.originalEvent.detail || 0);

                    if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight - height - scrollTop <= -1 * delta)) {
                        // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                        this.scrollTop = delta > 0? 0: scrollHeight;
                        // 向上滚 || 向下滚
                        event.preventDefault();
                    }
                });
            });
        };
        $('#AssistForm').scrollUnique();
    });

    function Zhuanlidj() {
     var aaazt=document.getElementById("aaa").style.display;
     if (aaazt=="none"){
      document.getElementById("aaa").style.cssText="display:block";

     }else{
      document.getElementById("aaa").style.cssText="display:none";

     }
    }

    function Save() {
        // var form = new mini.Form("#AssistForm");
        // var Data = form.getData();
        var form = new mini.Form("#NewForm");
        var Data = form.getData();
        form.validate();
        if (form.isValid()){
            form.loading("保存中......");
            var AssistName = $("#assistName").val();
            var arg={
                Data: mini.encode(Data),
                AssistName:AssistName
            };
            var url="/Product/save";
            $.post(url, arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success) {
                        var data=res.data || {};
                        mini.alert('专利名称保存成功','系统提示',function(){
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
    function exit() {
        layer.confirm('您即将退出本系统，所有未保存的数据将会丢失，是否继续进行退出操作？', {icon: 3, title: '退出系统'}, function (act) {
            $.post('/loginOut', {}, function (result) {
                window.location = '/login';
            });
        });
    }
</script>

<#--HighLight-->
<script type="text/javascript" src="/js/HighLight/highlight.js?v=${version}"></script>
<script type="text/javascript">
    /*cid:高亮文本框,typodata:要识别的错别字数组,tip:显示修改建议,module:功能模块,tabid:表格名称*/
    var highlight = new HighLight({
        cid:"assistName",
        typodata:${TypoData},
        tip:"tip",
        module:"Product",
        tabid:"zltable"
    });
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/js/HighLight/jquery.highlighttextarea.css" rel="stylesheet">
</body>
</html>
