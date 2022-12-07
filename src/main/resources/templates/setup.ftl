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
        .mini-checkbox {
            font-size: 20px;
            line-height: 20px;
        }

    </style>
</head>
<body>
<form id="TemplateForm">
    <div class="temlatexx kuang" style="height: 50px;">
        <div class="Headline"><h3>模板信息</h3></div>
        <div class="content" style="margin-top: -47px;">
            <h4 style="margin-top: 23px;"><span>模板名称</span>:<input  id="templateName" name="templateName" class="mini-textbox" emptyText="请输入模板名称" required="true"  style="height: 30px;width: 20%;">
                <span>模板描述</span>:<input  id="templateDescription" name="templateDescription" class="mini-textbox" emptyText="请输入模板描述"  style="height: 30px;width: 20%;">
                <input class="mini-hidden" id="uploadTime" name="uploadTime">
                <input class="mini-hidden" id="uploadUser" name="uploadUser">
                <input class="mini-hidden" id="userId" name="userId">
                <input class="mini-hidden" id="level" name="level">
                <input class="mini-hidden" id="isShare" name="isShare">
                <input class="mini-hidden" id="id" name="id">
            </h4>
        </div>
    </div>
</form>
<form id="ConfigForm">
    <div class="DescriptionSummary kuang" style="height: 52px">
        <div class="Headline"><h3>说明书摘要</h3></div>
        <div class="content">
        <h4 ><strong>设置</strong>:<input  class="mini-checkbox" name="checkOne" id="checkOne"/>技术领域+&nbsp;<input class="mini-checkbox" name="checkTwo" id="checkTwo"/>
            独立发明目的+&nbsp;<input class="mini-checkbox" name="checkThree" id="checkThree"/>独立权利要求+&nbsp;<input class="mini-checkbox" name="checkFour" id="checkFour"/>独立有益效果</h4>
        </div>
    </div>
    <div class="Abstractattacheddrawings kuang" style="height: 52px">
        <div class="Headline"><h3>摘要附图</h3></div>
        <div class="content"><h4>规则:选用说明书附图中的一幅图为摘要附图</h4></div>
    </div>
    <div class="Claims kuang" style="height: 158px">
        <div class="Headline"><h3>权利要求书</h3></div>
        <div class="content">
            <h4>规则:选用“知服帮”中发明内容部分的“权利要求”</h4>
            <h4 style="margin-top: 25px;"><strong>设置</strong><span style="color: rgb(87,184,236)">无引用权利要求</span>:主题名称+，+ <input  id="quanLiYaoQiuDuQuan" name="quanLiYaoQiuDuQuan" class="mini-textbox" value="，"  style="height: 30px;width: 35%;"></h4>
            <h4 style="margin-top: 23px;"><strong>设置</strong><span style="color:red;">有引用权利要求</span>:<input  id="quanLiYaoQiuCongQuanOne" name="quanLiYaoQiuCongQuanOne" class="mini-textbox" value="根据权利要求"  style="height: 30px;width: 16%;"> +
                引用权利要求 + 主题名称， + <input  id="quanLiYaoQiuCongQuanTwo" name="quanLiYaoQiuCongQuanTwo" class="mini-textbox" value="其特征在于："  style="height: 30px;width: 11%;">
            </h4>
        </div>
    </div>
    <div class="instructions kuang" style="height: 997px;border-bottom: 1px solid #fff;">
        <div class="Headline"><h3>说明书</h3></div>
        <div class="content">
            <h3 >技术领域</h3>
            <h4 style="margin-top: -35px">规则:本<input  id="jiShuLingYuOne" name="jiShuLingYuOne" class="mini-textbox" value="发明"  style="height: 30px;width: 5%;">涉及 + 填写框 + 领域,具体为主题名称</h4>
        </div>
        <div class="content" style="margin-top: 70px;">
            <h3>背景技术</h3>
            <h4 style="margin-top: -35px">规则:获取“知服帮”背景技术</h4>
        </div>
        <div class="content" style="margin-top: 72px;">
            <h3>发明内容</h3>
            <h4 style="margin-top: -39px;">无引用权利要求的技术目的<strong>设置</strong>:<input id="duQuanFaMingMuDi" name="duQuanFaMingMuDi" class="mini-textbox" value="本技术方案所要解决的技术问题为："  style="height: 30px;width: 38%;"></h4>
            <h4 style="margin-top: 23px;">无引用权利要求的技术方案<strong>设置</strong>:<input  id="duQuanJiShuFangAn" name="duQuanJiShuFangAn" class="mini-textbox" value="为实现以上目的，本发明创造采用的技术方案："  style="height: 30px;width: 38%;"></h4>
            <h4 style="margin-top: 23px;">无引用权利要求的有益效果<strong>设置</strong>:<input  id="duQuanYouYiXiaoGuo" name="duQuanYouYiXiaoGuo" class="mini-textbox" value="本技术方案有益效果为："  style="height: 30px;width: 38%;"></h4>
            <h4 style="margin-top: 23px;">有引用权利要求的技术目的<strong>设置</strong>:<input  id="congQuanFaMingMuDi" name="congQuanFaMingMuDi" class="mini-textbox" value="本技术方案改进所要解决的技术问题为："  style="height: 30px;width: 38%;"></h4>
            <h4 style="margin-top: 23px;">有引用权利要求的技术方案<strong>设置</strong>:<input  id="congQuanJiShuFangAn" name="congQuanJiShuFangAn" class="mini-textbox" value="为实现以上目的，本发明创造改进后采用的技术方案："  style="height: 30px;width: 38%;"></h4>
            <h4 style="margin-top: 23px;">有引用权利要求的有益效果<strong>设置</strong>:<input  id="congQuanYouYiXiaoGuo" name="congQuanYouYiXiaoGuo" class="mini-textbox" value="本技术方案改进后的有益效果为："  style="height: 30px;width: 38%;"></h4>
        </div>
        <div class="content" style="margin-top: 67px;">
            <h3>附图说明</h3>
            <h4 style="margin-top: -35px">规则:“知服帮”系统中无附图，此部分没有；如有附图必须有此部分。</h4>
            <h4 style="margin-top: 23px;"><strong>设置</strong>:<input  id="fuTuShuoMingSheZhi" name="fuTuShuoMingSheZhi" class="mini-textbox" value="图中所述文字标注表示为:"  style="height: 30px;width: 29%;"></h4>
        </div>
        <div class="content" style="margin-top: 67px;">
            <h3>具体实施方式</h3>
            <h4 >
                <input class="mini-checkbox" name="checkShiShiLi" id="checkShiShiLi"/><strong>是否在从属权利要求的实施例前加文字</strong>:
                <input class="mini-textbox" id="shiShiLiContent" name="shiShiLiContent"  style="height: 30px;width: 25%;">
            </h4>
            <h4 style="margin-top: 31px;">
                <p style=""><strong>设置</strong>:</p>
                <textarea  id="juTiShiShiFangShiKaiTou" style="margin-left: 35px;margin-top: -41px;border-radius: 4px;resize: none;height: 91px;" name="juTiShiShiFangShiKaiTou"  cols="100" row="70">为了使本领域技术人员更好地理解本发明的技术方案，下面结合附图对本发明进行详细描述，本部分的描述仅是示范性和解释性，不应对本发明的保护范围有任何的限制作用。</textarea>
            </h4>
            <h4 style="margin-top: 17px;">中间读取"知服帮"中的实施例</h4>
            <h4 style="margin-top: 12px;">
                <p style="margin-top: 17px;"><strong>设置</strong>:</p>
                <textarea  id="juTiShiShiFangShiJieWei" style="margin-left: 35px;margin-top: -41px;height: 150px;border-radius: 4px;resize:none;" name="juTiShiShiFangShiJieWei"  cols="100" row="50">需要说明的是，在本文中，术语“包括”、“包含”或者其任何其他变体意在涵盖非排他性的包含，从而使得包括一系列要素的过程、方法、物品或者设备不仅包括那些要素，而且还包括没有明确列出的其他要素，或者是还包括为这种过程、方法、物品或者设备所固有的要素。
本文中应用了具体个例对本发明的原理及实施方式进行了阐述，以上实例的说明只是用于帮助理解本发明的方法及其核心思想。以上所述仅是本发明的优选实施方式，应当指出，由于文字表达的有限性，客观上存在无限的具体结构，对于本技术领域的普通技术人员来说，在不脱离本发明原理的前提下，还可以做出若干改进、润饰或变化，也可以将上述技术特征以适当的方式进行组合；这些改进润饰、变化或组合，或未经改进将发明的构思和技术方案直接应用于其它场合的，均应视为本发明的保护范围。</textarea>
            </h4>
        </div>
        <div class="saveanniu">
            <input id="Save" type="button" value="保存" onclick="save()" />
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    mini.parse();
    var DataGird = mini.get('#datagrid1');
    var ConfigForm = new mini.Form("ConfigForm");
    var TemplateForm = new mini.Form("TemplateForm");
    $(function () {
        if ("${Mode}" == "Browse") {
            $("#TemplateForm :input").prop("disabled", true);
            $("#ConfigForm :input").prop("disabled", true);
        }
        var TemplateData = ${TemplateData};
        if (TemplateData){
            TemplateForm.setData(TemplateData);
        }
        var TemplateConfigData = ${TemplateConfigData};
        if (TemplateConfigData){
            TemplateConfigData.filter(function (item) {
                if (item.field == "QuanLiYaoQiuDuQuan"){
                    mini.get('quanLiYaoQiuDuQuan').setValue(item.fieldContent);
                }
                if (item.field == "QuanLiYaoQiuCongQuanOne"){
                    mini.get('quanLiYaoQiuCongQuanOne').setValue(item.fieldContent);
                }
                if (item.field == "QuanLiYaoQiuCongQuanTwo"){
                    mini.get('quanLiYaoQiuCongQuanTwo').setValue(item.fieldContent);
                }
                if (item.field == "DuQuanFaMingMuDi"){
                    mini.get('duQuanFaMingMuDi').setValue(item.fieldContent);
                }
                if (item.field == "CongQuanFaMingMuDi"){
                    mini.get('congQuanFaMingMuDi').setValue(item.fieldContent);
                }
                if (item.field == "DuQuanJiShuFangAn"){
                    mini.get('duQuanJiShuFangAn').setValue(item.fieldContent);
                }
                if (item.field == "CongQuanJiShuFangAn"){
                    mini.get('congQuanJiShuFangAn').setValue(item.fieldContent);
                }
                if (item.field == "DuQuanYouYiXiaoGuo"){
                    mini.get('duQuanYouYiXiaoGuo').setValue(item.fieldContent);
                }
                if (item.field == "CongQuanYouYiXiaoGuo"){
                    mini.get('congQuanYouYiXiaoGuo').setValue(item.fieldContent);
                }
                if (item.field == "FuTuShuoMingSheZhi"){
                    mini.get('fuTuShuoMingSheZhi').setValue(item.fieldContent);
                }
                if (item.field == "JuTiShiShiFangShiKaiTou"){
                    $("#juTiShiShiFangShiKaiTou").val(item.fieldContent);
                }
                if (item.field == "JuTiShiShiFangShiJieWei"){
                    $("#juTiShiShiFangShiJieWei").val(item.fieldContent);
                }
                if (item.field == "CheckOne"){
                    mini.get('checkOne').setChecked(item.fieldContent);
                }
                if (item.field == "CheckTwo"){
                    mini.get('checkTwo').setChecked(item.fieldContent);
                }
                if (item.field == "CheckThree"){
                    mini.get('checkThree').setChecked(item.fieldContent);
                }
                if (item.field == "CheckFour"){
                    mini.get('checkFour').setChecked(item.fieldContent);
                }
                if (item.field == "CheckShiShiLi"){
                    mini.get('checkShiShiLi').setChecked(item.fieldContent);
                }
                if (item.field == "ShiShiLiContent"){
                    mini.get('shiShiLiContent').setValue(item.fieldContent);
                }
                if (item.field == "JiShuLingYuOne"){
                    mini.get('jiShuLingYuOne').setValue(item.fieldContent);
                }
            });
        }
    });
    function save(){
        var Data = ConfigForm.getData();
        var TemplateData = TemplateForm.getData();
        var KT = $("#juTiShiShiFangShiKaiTou").val();
        var JW = $("#juTiShiShiFangShiJieWei").val();
        var ID = "${ID}";
        var Mode = "${Mode}";

        TemplateForm.validate();
        if (TemplateForm.isValid()){
            ConfigForm.loading("保存中......");
            $("#Save").attr("disabled", true);
            $("#Save").val("保存中......");
            var arg = {
                Data:mini.encode(Data),
                TemplateData:mini.encode(TemplateData),
                KT:KT,
                JW:JW,
                ID:ID,
                Mode:Mode
            };
            var url = "/Template/save";

            $.post(url,arg,function (result) {
                if (result.success){
                    mini.alert("模板设置成功!","系统提示",function (act) {
                        if (act == 'ok'){
                            CloseWindow("ok");
                        }
                    })
                }else mini.alert("模板设置失败,请稍后再试!");
                ConfigForm.unmask();
            })
        }
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
