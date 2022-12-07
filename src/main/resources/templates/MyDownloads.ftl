<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>专利撰写书列表</title>
    <meta name="keywords" content="专利撰写书列表" />
    <meta name="description" content="专利撰写书列表"/>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script type="text/javascript" src="/js/jquery.fileDownload.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/style.css" />

</head>
<body>


    <div style="float: left">
        <a class="mini-button" iconcls=""  onclick="download()">下载word文档</a>
        <a class="mini-button" iconcls=""  onclick="">下载五书</a>
        <a class="mini-button" iconcls=""  onclick="">删除</a>
    </div><br><br>
    <div style="height:765px;width: 100%">
        <div class="mini-fit" style="width: 100%;">
            <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 100%;"
                 onrowdblclick="editAssist"
                 allowresize="true" url="/Template/getMyDownLoadData" multiselect="true"
                 pagesize="20" sizelist="[5,10,20,50,100,150,200]" sortfield="ID" sortorder="desc"
                 autoload="true" onDrawCell="onDraw" onload="">
                <div property="columns">
                    <div type="indexcolumn"></div>
                    <div field="AssistName" width="80" headerAlign="center">专利名称</div>
                    <div field="TemplateName" headerAlign="center" width="100" >选用模板名称</div>
                    <div field="DownloadNum" width="50" headerAlign="center">下载次数</div>
                    <div field="DownloadTime" width="50" headeralign="center" datatype="date" dateformat="yyyy-MM-dd HH:mm:ss" allowsort="true" allowsort="true">最后下载时间</div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    mini.parse();
    var DataGird = mini.get('#datagrid1');
    function onDraw() {

    }
    function download() {
        var form = new mini.Form("#datagrid1");
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要下载的专利类型!");
            return;
        }
        var RowValue = row["AssistNameID"];
        var TemplateID = row["TemplateID"];
        var ID = row["ID"];
        form.loading("下载中......");
         $.fileDownload('/Template/download?TemplateID='+TemplateID+"&RowValue="+RowValue+"&ID="+ID, {
             httpMethod: 'POST',
             successCallback:function(url){
                 uploadDownCount(ID);
                 form.unmask();
                 window.location.reload();
             },
             failCallback: function (html, url) {
                 mini.alert('下载错误:' + html, '系统提示');
             }
         });
    }
    function uploadDownCount(ID) {
        var url = "/Template/uploaddowncount";
        var arg = {ID:ID};
        $.post(url,arg,function () {

        });
    }
</script>
</html>
