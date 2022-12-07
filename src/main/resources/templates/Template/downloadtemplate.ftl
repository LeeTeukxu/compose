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
    <div style="height:400px;width: 100%">
        <div class="mini-fit" style="width: 100%;">
            <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 100%;"
                 onrowdblclick="editAssist"
                 allowresize="true" url="/Template/getData" multiselect="true"
                 pagesize="20" sizelist="[5,10,20,50,100,150,200]" sortfield="UploadTime" sortorder="desc"
                 autoload="true" onDrawCell="onDraw" onload="">
                <div property="columns">
                    <div type="indexcolumn"></div>
                    <div field="TemplateName" width="80" headerAlign="center">模板名称</div>
                    <div field="TemplateDescription" headerAlign="center" width="100" >模板描述</div>
                    <div field="UploadUser" width="50" headerAlign="center">上传人</div>
                    <div field="UploadTime" width="50" headeralign="center" datatype="date" dateformat="yyyy-MM-dd HH:mm:ss" allowsort="true" allowsort="true">模板上传时间</div>
                </div>
            </div>
        </div>
    </div><br>
    <div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderstyle="border:0;">
        <a class="mini-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
    </div>
</body>
<script type="text/javascript">
    mini.parse();
    var DataGird = mini.get('#datagrid1');

    var grid = mini.get("datagrid1");

    grid.load();

    $(function () {
        var arg = {};
        var cs = [];
        var op = {field: "UserID", oper: 'EQ', value: "${UserID}"};
        cs.push(op);
        var ops = {field: "UserID", oper: 'EQ', value: '0'};
        cs.push(ops);
        if (cs.length > 0) arg["Query"] = mini.encode(cs);
        DataGird.load(arg);
    });

    function GetData() {
        var row = grid.getSelecteds();
        return row;
    }
    function search() {
        var key = mini.get("key").getValue();
        if(!key)  return;
        grid.load({key:encodeURI(key)});
    }
    function onKeyEnter(e) {
        search();
    }
    function onRowDblClick(e) {
        onOk();
    }
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }

    function onOk() {
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要下载的专利类型!");
            return;
        }
        var TemplateID = row["ID"];
        var Type = "${Type}";
        if (Type == "DownLoad") {
            TemplateDownload(TemplateID, "${RowValue}");
        }else TemplateBrowse(TemplateID, "${RowValue}");
        CloseWindow("ok");
    }
    
    function onDraw() {

    }

    function onCancel() {
        CloseWindow("cancel");
    }
    
    function TemplateDownload(TemplateID, RowValue) {
        var arg = {TemplateID:TemplateID,RowValue:RowValue};
        var url = '/Template/savedownloadtemplate';
        $.post(url,arg,function (result) {
            if (result['success']) {
                mini.alert('下载成功!','系统提示',function () {
                    window.location.href = "/downloadtemplate?TemplateID=" + TemplateID +"&RowValue=" + RowValue;
                });
            }
        })
    }

    function TemplateBrowse(TemplateID, RowValue) {
        var arg = {TemplateID:TemplateID,RowValue:RowValue};
        var url = '/CompleteFile/templatebrowse';
        $.post(url,arg,function (result) {

        })
    }
</script>
</html>
