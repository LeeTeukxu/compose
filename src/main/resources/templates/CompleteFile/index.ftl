<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>完整文件预览</title>
    <script src="/js/jquery-1.9.min.js"></script>
<#--    <script src="/js/webuploader.js"></script>-->
    <script src="/js/jquery.sortable.js"></script>
<#--    <script src="/js/upload.js"></script>-->
    <script type="text/javascript" src="/js/jquery-2.0.3.min.js" iconfont="true"></script>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src=/pageoffice.js id="po_js_main"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <style>
        .p3{text-align:center;hyphenate:auto;font-family:Calibri;font-size:10pt;}
    </style>
</head>
<body>
<form id="form">
    <div id="main" style="width:99%">
    <#--    <iframe src="https://www.zfbip.com/Assist/Assist/final.html" width="100%" height="800" frameborder="0">-->
    <#--                您的浏览器不支持iframe，请升级-->
    <#--    </iframe>-->
        <div class="list-container" id="list-container">

        </div>
        <iframe id="Browse" src="" width="100%" height="1000px"></iframe>
    </div>
</form>
<script type="text/javascript">
    mini.parse();
    var RowValue = '${RowValue}';
    $(function () {
        <#--var xmlhttp;-->
        <#--if (window.XMLHttpRequest) { // 兼容 IE7+, Firefox, Chrome, Opera, Safari-->
        <#--    xmlhttp = new XMLHttpRequest();-->
        <#--}-->
        <#--else { // 兼容IE6, IE5-->
        <#--    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");-->
        <#--}-->
        <#--xmlhttp.onreadystatechange = function() {-->
        <#--    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {-->
        <#--        document.getElementById("list-container").innerHTML = xmlhttp.responseText;-->
        <#--    }-->
        <#--}-->
        <#--xmlhttp.open("GET", "/doc/sc/${RowValue}/finalTemp.html", true);-->
        <#--xmlhttp.send();-->
        // POBrowser.openWindowModeless('/CompleteFile/word','width=1200px;height=800px;');
        var form = new mini.Form("form");
        var flag = true;
        form.loading("加载中......");
        var url = "/CompleteFile/responsefile";
        $.post(url,{},function (result) {
            if (result.success){
                LoadingPDF(flag, form);
            }
        });
    })

    function LoadingPDF(flag, form) {
        if (flag){
            var timer = setInterval(function () {
                if (flag) {
                    var url = "/CompleteFile/pdfisexists";
                    $.post(url,{},function (result) {
                        if (result.success && result.data == "true"){
                            g();
                            flag = false;
                        }
                    });
                }else {
                    clearInterval(timer);
                    form.unmask();
                }
            },3000);
        }
        function g() {
            $('#Browse').attr('src', 'http://${PdfPath}/pdfjs/web/viewer.html?file=/attImages/doc/sc/' + RowValue.replace(",","") + '/finalPDF.pdf');
        }
    }

</script>
</body>
</html>
