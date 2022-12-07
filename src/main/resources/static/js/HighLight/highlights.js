//data-mtpis
//[0]表格ID
//[1]提示ID
//[2]控件ID
var MistakeData = [];
var AllMistakeData = [];
var Suggest = "";
var ListSuggest = [];
var txtHtml = "";
var RemoveDivHtml = "";
function HighLight(options) {
    function appendScript(src, callback) {
        var head = document.getElementsByTagName('head')[0];

        if (src.endsWith(".js")) {
            var elt = document.createElement("script");
            elt.type = "text/javascript";
            elt.src = src;
        } else {
            var elt = document.createElement("link");
            elt.rel = "stylesheet";
            elt.link = src;
        }

        elt.onload = function() {
            callback();
        };

        head.appendChild(elt);
    }
    function RunMethod() {

        //重新加载列中的文本框
        if (options.posid != undefined){
            var Contents = options.lists;
            //文本框内容改变后遍历新的文本框控件和提示信息控件
            for (var x=0;x<Contents.length;x++){
                var option = Contents[x];
                //获取文本框内容改变后的文本
                var txtContent = $("#" + option[2]).val();
                //获取文本框HTML
                txtHtml = options.posid.outerHTML;

                //如果文本框改变之前有错误提示信息则删除文本框重新加载(此处是为了清空文本框的高亮文本样式)
                if ($("#" + option[2]).parent()[0].innerHTML.indexOf("highlightTextarea") > -1) {
                    //删除文本框高亮信息样式
                    $("#" + option[2]).parent().remove();
                    //由于删除高亮信息样式会一起把文本款删除，需重新加载文本框
                    $("#" + option[1]).after(txtHtml);
                }
                //重新加载的是文本框内容改变之前的内容，需将改变之后的内容赋值到重新加载的文本框
                $("#" + option[2]).val(txtContent);
            }
        }
        if (AllMistakeData.length > 0){
            for (var i=0;i<AllMistakeData.length;i++){
                var listMis = [];
                var mistakes = AllMistakeData[i];
                if (mistakes.length > 1) {
                    var cid = mistakes[0];
                    for (var x=1;x<mistakes.length;x++){
                        listMis.push(mistakes[x]);
                    }
                    $('#' + cid).highlightTextarea({
                        words: listMis,
                        debug: true
                    });
                }
            }
            //光标重新定位到鼠标点击位置
            if (options.posid != undefined) {
                var Contents = options.lists;
                for (var x=0;x<Contents.length;x++) {
                    var option = Contents[x];

                    var pos = GetCursorPosition(options.posid);
                    $("#" + option[2]).focus();
                    document.getElementById(option[2]).setSelectionRange(pos, pos);
                }
            }
        }
    }
    function MainMethod() {
        var jqv = "jquery-2.2.0.js";

        // try {
        //     jqv = window.location.search.split('?')[1].split('=')[1];
        // } catch (e) {}

        appendScript("http://code.jquery.com/" + jqv,
            function() {
                $('#jqv').val(jqv);
                GetTypoData();
                if (ListSuggest.length > 0){
                    for (var i=0;i<ListSuggest.length;i++){
                        var sugs = ListSuggest[i];
                        var sug = sugs.split("；");
                        $('#' + sug[0]).attr("data-mtpis",sug[1]);
                    }
                }
/*                appendScript("http://code.jquery.com/ui/1.10.4/jquery-ui.min.js",
                    function() {
                        appendScript("/js/HighLight/jquery.highlighttextarea.js",
                            RunMethod
                        )
                    }
                );*/
            }
        );
    }
    function GetTypoData(){
        var Contents = options.lists;
        //遍历所有的文本框和提示信息控件ID
        for (var x=0;x<Contents.length;x++) {
            Suggest = "";
            MistakeData = [];
            var option = Contents[x];
            var TypoData = options.typodata;
            // 遍历错别字识别并查找出文本框中出现的错别字
            if (TypoData.length > 0) {
                var val = $("#" + option[2]).val();
                MistakeData.push(option[2]);
                if (val != "") {

                    if (option[2].indexOf("CqTechnicalsolutions")>-1){
                        var DqExclusiveorder=option[2].replace(/[^0-9]/ig,"");
                        var s1 = val.replace(/，/ig, ',');
                        var ywdhw = s1.indexOf(",")//英文逗号
                        var zwdhw = s1.indexOf("，")//中文逗号
                        var lw = null;
                        if (ywdhw != -1) {
                            lw = s1.substring(0, ywdhw);
                        } else {
                            lw = s1.substring(0, zwdhw);
                        }
                        //引用权利要求书
                        var wz1 = lw.indexOf('求');
                        var wz2 = lw.indexOf('所');
                        var Referenceclaims = lw.substring(wz1 + 1, wz2);
                        if (Referenceclaims >= DqExclusiveorder) {
                            Suggest += "<span style='color: white;float: left'>引用的权利要求序号大于或等于当前权利要求，请更改。</span></br>";
                        }
                    }

                    for (var i = 0; i < TypoData.length; i++) {
                        if (val.indexOf(TypoData[i].Mistake) > -1) {
                            MistakeData.push(TypoData[i].Mistake);
                            Suggest += "<span style='color: white;float: left'> 修改建议1：将文本框中红色标记的" + TypoData[i].Mistake + "修改为" + TypoData[i].Correct + "。</span></br>";

                            var typedatareg=new RegExp(TypoData[i].Mistake,"g");
                            var wowp=val.replace(typedatareg,"<span class='cwo'>"+TypoData[i].Mistake+"</span>");
                            Suggest += wowp;
                        }
                    }
                }
            }
            /*连续标点符号查找*/
            //数字正则表达式
            var re1 = /(\d{1,3})+(?:\.\d+)?/g;
            //汉字正则表达式
            var re2 = /[\u4e00-\u9fa5]{1,}/g;
            //英文字母正则表达式
            var re3 = /[a-zA-Z]/g;

            var Digital = $("#" + option[2]).val().match(re1);
            var Content = $("#" + option[2]).val().match(re2);
            var English = $("#" + option[2]).val().match(re3);
            var ReplaceResult = "";
            var SplitResults = [];
            if (Digital != null) {
                var obj = {};
                var arrNew = [];
                // Digital = Digital.reverse();
                //数组去重
                for (var i = Digital.length - 1; i >= 0; i--) {
                    if (!obj[Digital[i]]) {
                        obj[Digital[i]] = true;
                        arrNew.push(Digital[i]);
                    }
                }
                //数组中数字倒叙排列
                arrNew.sort(function (a, b) {
                    return b - a
                });
                for (var i = 0; i < arrNew.length; i++) {
                    if (ReplaceResult == "") {
                        ReplaceResult = $("#" + option[2]).val().replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                    } else ReplaceResult = ReplaceResult.replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }
            }
            if (Content != null) {
                var obj = {};
                var arrNew = [];
                //数组去重
                for (var i = Content.length - 1; i >= 0; i--) {
                    if (!obj[Content[i]]) {
                        obj[Content[i]] = true;
                        arrNew.push(Content[i]);
                    }
                }
                //数组内容按长度重新排序
                var arr = arrNew.map(i => ({raw: i, len: i.length}))
                    .sort((p, n) => n.len - p.len)
                    .map(i => i.raw);

                for (var i = 0; i < arr.length; i++) {
                    if (ReplaceResult == "") {
                        ReplaceResult = $("#" + option[2]).val().replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                    } else ReplaceResult = ReplaceResult.replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }
            }

            if (English != null) {
                var obj = {};
                var arrNew = [];
                //数组去重
                for (var i = English.length - 1; i >= 0; i--) {
                    if (!obj[English[i]]) {
                        obj[English[i]] = true;
                        arrNew.push(English[i]);
                    }
                }
                //数组内容按长度重新排序
                var arr = arrNew.map(i => ({raw: i, len: i.length}))
                    .sort((p, n) => n.len - p.len)
                    .map(i => i.raw);

                for (var i = 0; i < arr.length; i++) {
                    if (ReplaceResult == "") {
                        ReplaceResult = $("#" + options[2]).val().replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                    } else ReplaceResult = ReplaceResult.replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }
            }
            if (ReplaceResult != "") {
                SplitResults = ReplaceResult.split('Ä');
                if (SplitResults.length > 0) {
                    for (var i = 0; i < SplitResults.length; i++) {
                        var j = 0;
                        var nowbd = "";
                        if (SplitResults[i] != "") {
                            if (SplitResults[i].length > 1){
                                var sp = SplitResults[i];
                                for (var q=0;q<sp.length;q++){
                                    var SplitResult = sp[q];
                                    if (SplitResult == "," || SplitResult == "，" || SplitResult == "。" || SplitResult == ";" || SplitResult == "；" || SplitResult == ":" || SplitResult == "：" || SplitResult == "、"){
                                        j++;
                                    }if (j > 1){
                                        if (Suggest.indexOf("存在连续的标点符号") == -1) {
                                            Suggest += "</br><span style='color: white;'>修改建议2：存在连续的标点符号。</span></br>";
                                        }
                                    }
                                    nowbd += SplitResult;
                                }
                            }
                            if (j > 1){
                                MistakeData.push(nowbd);
                            }
                        }
                    }
                }
            }

            /*字数统计*/
            // var TotalCount = Count(option[2]);
            // Suggest += "<span style='float: left;color: white'>已输入" + TotalCount + "个字</span></<br>";

            //给错误提示信息数组中的每一行添加提示信息控件ID以确定是由哪个控件显示错误提示信息
            ListSuggest.push(option[1] + "；" + Suggest);
            if (MistakeData.length > 0) {
                if (options.module == "Claim"){
                    AllMistakeData.length = 0;
                }
                AllMistakeData.push(MistakeData);
            }
            if (MistakeData.length > 1){
                $("#" + option[1]).show();
            }else  $("#" + option[1]).hide();debugger;
        }
    }


    //高亮文本和提示信息主方法
    MainMethod();

}
//某个文本框输入改变函数
function InputValueChange(tip,id,TypoData){
    MistakeData.length = 0;
    Suggest = "";
    //清空异常提示
    $( '#' + tip.id).removeAttr( "data-mtpis" );

    //重新获取输入的文本框和对应的错误提示控件
    var lists = [];
    var listAll = [];
    lists.push("");
    lists.push(tip.id);
    lists.push(id.id);
    listAll.push(lists);

    //由于文本框输入内容改变此处需重新加载文本框的高亮文本信息和错误提示信息
    HighLight({
        lists:listAll,
        typodata:TypoData,
        posid:id,
        module:"Claim"
    });

    //清空错误提示信息
    $("#" + tip.id).attr("data-mtpis",Suggest);
}


function GetCursorPosition(cid) {
    var el = cid;
    var pos = 0;
    pos = el.selectionStart;
    return pos;
}