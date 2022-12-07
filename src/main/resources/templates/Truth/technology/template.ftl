<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>模板设置</title>
    <meta name="keywords" content="模板设置" />
    <meta name="description" content="模板设置"/>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script type="text/javascript" src="/js/jquery.fileDownload.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
    <style>
        .kuang{width: 100%;border-bottom: 1px solid #d8d8d8}
        .kuang .Headline h3{font-size: 19px;margin-top: 22px;margin-left: 69px;}
        .kuang .content h4{margin-left: 215px;margin-top: -42px;font-size: 15px;font-weight: 500;color: #5d7388;margin-left: 305px;}
        .kuang .content h3{margin-left: 69px;}
        .kuang .content h4 strong{color: black;}
        .saveanniu{width: 100%;text-align: center}
        #Save{height: 42px;width: 88px;background: rgb(87,184,236);border: none;border-radius: 5px;color: rgb(255,255,255);margin-left: 40px;margin-top: 6px;}

    </style>
</head>
<body>
    <div id="ConfigForm">
        <div class="Name kuang" style="height: 52px">
            <div class="Headline"><h3>技术归属领域</h3></div>
            <div class="content">
                <h4 style="margin-top: -39px;"><input id="Name" name="Name" class="mini-textbox"  style="height: 30px;width: 38%;"></h4>
            </div>
        </div>
        <div class="SubjectTemplate kuang" style="height: 52px">
            <div class="Headline"><h3>主题名称示例</h3></div>
            <div class="content">
                <h4 style="margin-top: -39px;"><input id="SubjectTemplate" name="SubjectTemplate" class="mini-textbox"  style="height: 30px;width: 38%;"></h4>
            </div>
        </div>
        <div class="BackGroundTemplate kuang" style="height: 52px">
            <div class="Headline"><h3>背景技术示例</h3></div>
            <div class="content">
                <h4 style="margin-top: -39px;"><input id="BackGroundTemplate" name="BackGroundTemplate" class="mini-textbox"  style="height: 30px;width: 38%;"></h4>
            </div>
        </div>
        <div class="SpecificTemplate kuang" style="height: 52px">
            <div class="Headline"><h3>技术方案示例</h3></div>
            <div class="content">
                <h4 style="margin-top: -39px;"><input id="SpecificTemplate" name="SpecificTemplate" class="mini-textbox"  style="height: 30px;width: 38%;"></h4>
            </div>
        </div>
        <div class="instructions kuang" style="height: 98px;border-bottom: 1px solid #fff;">
            <div class="saveanniu">
                <input id="Save" type="button" value="保存" onclick="save()" />
            </div>
        </div>
        <input class="mini-hidden" id="TechnologyTemplateID" name="TechnologyTemplateID">
        <input class="mini-hidden" id="TechnologyID" name="TechnologyID">
        <input class="mini-hidden" id="CreateMan" name="CreateMan">
        <input class="mini-hidden" id="CreateTime" name="CreateTime">
    </div>
</body>
<script type="text/javascript">
    mini.parse();
    var ConfigForm = new mini.Form("ConfigForm");
    var TechnologyID = '${TechnologyID}';
    var Data = ${Data};
    $(function () {
        if ("${Mode}" == "Browse") {
            $("#ConfigForm :input").prop("disabled", true);
        }else if ("${Mode}" == "Edit") {
            if (Data.CreateTime != undefined) {
                Data.CreateTime = new Date(Data.CreateTime);
            }
            ConfigForm.setData(Data);
        }
    });
    function save(){
        var form = new mini.Form("#ConfigForm");
        var data = form.getData();
        var url = "/Technology/saveTemplate";
        var arg = {Data : mini.encode(data),
                    TechnologyID: TechnologyID};
        $.post(url, arg, function (text) {
            var res = mini.decode(text);
            if (res.success) {
                var data = res.data || "{}";
                mini.alert("保存成功！", "系统提示", function () {
                    // form.setData(data);
                });
            }else mini.alert(res.message);
        })
    }

    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
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
    }


</script>
</html>
