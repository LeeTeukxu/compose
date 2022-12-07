//data-mtpis
function HighLight(options) {
    var MistakeData = [];
    var Suggest = "";
    var TbTdHtml = "";
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
        $('#' + options.cid).highlightTextarea({
            words: MistakeData,
            debug: true
        });
        // $('#' + options.cid).highlightTextarea({
        //     words: {
        //         color: 'yellow',
        //         words: MistakeData
        //     },
        //     debug: true
        // });
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
                $( '#'+options.tip ).html( Suggest );
                appendScript("http://code.jquery.com/ui/1.10.4/jquery-ui.min.js",
                    function() {
                        appendScript("/js/HighLight/jquery.highlighttextarea.js",
                            RunMethod
                        )
                    }
                )
                if (options.module == "Bgechnology" || options.module == "Product" || options.module == "TechnicalField" || options.module == "Instruction") {
                    $('#' + options.tabid + ' tr').each(function (i) {
                        if (i == 0) {
                            $(this).children('td').each(function (j) {
                                TbTdHtml = $(this)[0].innerHTML;
                            });
                        }
                    });
                }
            }
        );
    }
    function GetTypoData(){
        var TypoData = options.typodata;
        if (TypoData.length > 0){
            var AssistName = $("#" + options.cid).val();
            if (AssistName != ""){
                for (var i=0;i<TypoData.length;i++){
                    if (AssistName.indexOf(TypoData[i].Mistake) > -1){
                        MistakeData.push(TypoData[i].Mistake);
                        Suggest += "<span style='color: red;float: left'> 修改建议：将"+TypoData[i].Mistake+"修改为"+TypoData[i].Correct+"。</span></br>";
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

        var Digital = $("#" + options.cid).val().match(re1);
        var Content = $("#" + options.cid).val().match(re2);
        var English = $("#" + options.cid).val().match(re3);
        var ReplaceResult = "";
        var SplitResults = [];
        if (Digital != null){
            var obj = {};
            var arrNew = [];
            // Digital = Digital.reverse();
            //数组去重
            for(var i=Digital.length-1;i>=0;i--){
                if(!obj[Digital[i]]){
                    obj[Digital[i]] = true;
                    arrNew.push(Digital[i]);
                }
            }
            //数组中数字倒叙排列
            arrNew.sort(function(a,b){return b-a});
            for (var i=0;i<arrNew.length;i++) {
                if (ReplaceResult == "") {
                    ReplaceResult = $("#" + options.cid).val().replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }else ReplaceResult = ReplaceResult.replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
            }
        }
        if (Content != null){
            var obj = {};
            var arrNew = [];
            //数组去重
            for(var i=Content.length-1;i>=0;i--){
                if(!obj[Content[i]]){
                    obj[Content[i]] = true;
                    arrNew.push(Content[i]);
                }
            }
            //数组内容按长度重新排序
            var arr = arrNew.map(i => ({raw: i, len: i.length}))
                .sort((p, n) => n.len - p.len)
                .map(i => i.raw);

            for (var i=0;i<arr.length;i++) {
                if (ReplaceResult == "") {
                    ReplaceResult = $("#" + options.cid).val().replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }else ReplaceResult = ReplaceResult.replace(new RegExp(arrNew[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
            }
        }

        if (English != null){
            var obj = {};
            var arrNew = [];
            //数组去重
            for(var i=English.length-1;i>=0;i--){
                if(!obj[English[i]]){
                    obj[English[i]] = true;
                    arrNew.push(English[i]);
                }
            }
            //数组内容按长度重新排序
            var arr = arrNew.map(i => ({raw: i, len: i.length}))
                .sort((p, n) => n.len - p.len)
                .map(i => i.raw);

            for (var i=0;i<arr.length;i++) {
                if (ReplaceResult == "") {
                    ReplaceResult = $("#" + options.cid).val().replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
                }else ReplaceResult = ReplaceResult.replace(new RegExp(arr[i],"gm"),"Ä").replace(new RegExp(" ","gm"),"Ä");
            }
        }
        if (ReplaceResult != "") {
            SplitResults = ReplaceResult.split('Ä');
            if (SplitResults.length > 0){
                for (var i=0;i<SplitResults.length;i++){
                    var j = 0;
                    var nowbd = "";
                    if (SplitResults[i].length > 1){
                        var sp = SplitResults[i];
                        for (var q=0;q<sp.length;q++){
                            var SplitResult = sp[q];
                            if (SplitResult == "," || SplitResult == "，" || SplitResult == "。" || SplitResult == ";" || SplitResult == "；" || SplitResult == ":" || SplitResult == "：" || SplitResult == "、"){
                                j++;
                                nowbd += SplitResult;
                            }if (j > 1){
                                if (Suggest.indexOf("存在连续的标点符号") == -1) {
                                    Suggest += "<span style='color: red;float: left'>存在连续的标点符号。</span></br>";
                                }
                            }
                        }
                    }
                    if (j > 1){
                        MistakeData.push(nowbd);
                    }
                }
            }
        }

        /*技术领域模块*/
        /*主题名称和专利名称需要一致*/
        if (options.module == "TechnicalField"){
            var val = $("#" + options.cid).val();
            var ReplaceVal = val.replace("领域，具体为","");
            if (ReplaceVal != (options.assistname + "。")){
                MistakeData.push(ReplaceVal);
                Suggest += "<span style='color: red;float: left;width: 87%'>修改建议：主题名称和专利名称不一致。(请参考如下格式：领域，具体为" + options.assistname +"。)</span></br>"
            }
        }

        /*字数统计*/
        if (options.module == "Product"){
            var TotalCount = Count();
            if (TotalCount > 25 && TotalCount <= 40) {
                Suggest += "<span style='color: blue;float: left'>已输入" + TotalCount + "个字</span></br>";
            }else if (TotalCount > 40){
                Suggest += "<span style='color: red;float: left'>已输入" + TotalCount + "个字</span></br>";
            }else Suggest += "<span style='float: left'>已输入" + TotalCount + "个字</span></br>";
        }else if (options.module == "Bgechnology"){
            var TotalCount = Count();
            Suggest += "<span style='float: left'>已输入" + TotalCount + "个字</span></br>";
        }else if (options.module == "Instruction"){
            var TotalCount = Count();
            var col = "";
            if (TotalCount > 300) {
                Suggest += "<span style='float: left;color: red'>已输入" + TotalCount + "个字</span></<br>";
            }else Suggest += "<span style='float: left;color: black'>已输入" + TotalCount + "个字</span></<br>";
        }
        return MistakeData;
    }
    //当文本框的值改变时重新加载错别字数组和修改建议信息
    InputValueChange();

    window.onload = MainMethod;

    //计算文本框字符长度
    function Count() {
        var reg = /[0-9]+/g;
        //替换回车
        var Content = $("#" + options.cid).val().replace(/[\r\n]/g, "");
        var Count = GetCount(Content);
        Content = Content.replace(reg,"");
        var TotalCount = (parseInt(Content.length) + parseInt(Count));
        return TotalCount;
    }

    function GetCount(Content) {
        if (Content != "") {
            var re = /(\d{1,3})+(?:\.\d+)?/g;
            var arr = Content.match(re);
            if (arr != null) {
                return arr.length;
            }else return 0;
        }else return 0;
    }

    function InputValueChange() {
        $('#' + options.cid).on("input propertychange", function (e) {
            //获取光标所在位置
            var pos = GetCursorPosition($(this).get(0));

            MistakeData.length = 0;
            Suggest = "";
            //清空所有的提示信息
            $( '#'+options.tip ).html( "" );


            if (options.module == "Bgechnology" || options.module == "Product" || options.module == "TechnicalField" || options.module == "Instruction") {
                $('#' + options.tabid + ' tr').each(function (i) {
                    if (i == 0) {
                        $(this).children('td').each(function (j) {
                            var ocontent = $("#" + options.cid).val();
                            var tcOne = "";
                            var technicalField = "";
                            if (options.module == "TechnicalField"){
                                tcOne = $("#tcOne").val();
                                technicalField = $("#technicalField").val();
                            }
                            $(this)[0].innerHTML = TbTdHtml;
                            $("#" + options.cid).val(ocontent);
                            if (options.module == "TechnicalField"){
                                $("#tcOne").val(tcOne);
                                $("#technicalField").val(technicalField);
                            }
                        });
                    }
                });
            }

            GetTypoData();
            $( '#'+options.tip ).html( Suggest );
            //重新加载了td中关于文本框的所有内容 需要重新加载一次文本框值改变事件
            InputValueChange();
            RunMethod();
            //重新设置光标位置
            $("#" + options.cid).focus();
            document.getElementById(options.cid).setSelectionRange(pos,pos);
/*            if(Suggest==""){
              document.getElementById("zxiete").style.cssText="color: #57b8ec;float: right;margin-top: 18px;margin-right: 80px;";
            }else{
              document.getElementById("zxiete").style.cssText="color: rgb(87, 184, 236);float: right;margin-top: 24px;margin-right: -514px;";
            }*/
        });
    }
    
    function GetCursorPosition(cid) {
        var el = cid;
        var pos = 0;
        pos = el.selectionStart;
        return pos;
    }
/*    if(document.getElementById("tip").innerHTML==""){
        document.getElementById("zxiete").style.cssText="color: #57b8ec;float: right;margin-top: 18px;margin-right: 80px;";
    }*/
}