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
    <a class="mini-button" iconcls=""  onclick='doQuery("UserID","${UserID}","All")'>模板汇总</a>
    <a class="mini-button" iconcls=""  onclick='doQuery("UserID",0,"System")'>系统预设模板</a>
    <a class="mini-button" iconcls=""  onclick='doQuery("UserID","${UserID}","Mine")'>自我设置模板</a>
    <a class="mini-button" iconcls="" style="background: #ff5b5bc4;border: 1px solid #ff5b5bc4;color: #fff;"  onclick='doQuery("IsShare","1","Share")'>公共分享模板库</a>
    <br><br>

    <#--    <a class="mini-button" iconcls=""  onclick="">下载</a>
        <form method="post" name="multiform" action="" enctype="multipart/form-data" style="display: inline;">
            <a class="mini-button" iconcls="icon-add"  onclick="">上传</a>
            <input style="display: none" type="file"  name="file" id="getF" onchange="clickF()">
        </form>-->
    <a class="mini-button" iconcls="" id="Add"  onclick="AddTemplate()">新增</a>
    <a class="mini-button" iconcls="" id="Edit"  onclick="EditTemplate()">编辑</a>
    <a class="mini-button" iconcls=""  onclick="browse">预览</a>
    <a class="mini-button" iconcls="" id="delete"  onclick="DelTemplate()">删除</a>
    <a class="mini-button" iconcls="" id="enjoy"  onclick="enjoy()">分享至模板库</a>
    <a class="mini-button" iconcls="" id="cancelenjoy"  onclick="cancelenjoy()">取消分享至模板库</a>
    <a class="mini-hidden" iconcls="" id="PageType"  name="PageType"></a>
</div><br><br>
<div style="height:765px;width: 100%">
    <div class="mini-fit" style="width: 100%;">
        <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 100%;"
             onrowdblclick="EditTemplate"
             allowresize="true" url="/Template/getData" multiselect="true"
             pagesize="20" sizelist="[5,10,20,50,100,150,200]" sortfield="UploadTime" sortorder="desc"
             autoload="true" onDrawCell="onDraw" onrowClick="rowClick">
            <div property="columns">
                <div type="indexcolumn" width="30" headerAlign="center" align="center">模板序号</div>
                <div type="checkcolumn" width="20"></div>
                <div field="TemplateName" width="160" headerAlign="center" align="center">模板名称</div>
                <div field="TemplateDescription" headerAlign="center" width="160" align="center" >模板描述</div>
                <div field="Level" headerAlign="center" width="80" align="center" >模板级别</div>
                <div field="IsShare" headerAlign="center" width="80" align="center" >是否分享</div>
                <div field="UploadUser" width="50" headerAlign="center" align="center">上传人</div>
                <div field="UploadTime" width="40" headeralign="center" datatype="date" dateformat="yyyy-MM-dd" allowsort="true" align="center">模板上传时间</div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    mini.parse();
    var DataGird = mini.get('#datagrid1');
    var cmdAdd = mini.get('Add');
    var cmdEdit = mini.get('#Edit');
    var cmdEnjoy = mini.get('#enjoy');
    var cmdCancelEnjoy = mini.get('#cancelenjoy');
    var cmdDelete = mini.get('#delete');

    $(function () {
        var arg = {};
        var cs = [];
        var op = {field: "UserID", oper: 'EQ', value: "${UserID}"};
        cs.push(op);
        var ops = {field: "UserID", oper: 'EQ', value: '0'};
        cs.push(ops);
        if (cs.length > 0) arg["Query"] = mini.encode(cs);
        cmdAdd.hide();
        cmdEdit.hide();
        cmdDelete.hide();
        cmdEnjoy.hide();
        cmdCancelEnjoy.hide();
        DataGird.load(arg);
    });

    function onDraw(e) {
        var field = e.field;
        var record = e.record;
        if (field == "IsShare"){
            var dd = record["IsShare"];
            if (dd == '0') {
                e.cellHtml = '<SPAN>未分享</span>';
            }
            if (dd == '1') {
                e.cellHtml = '<SPAN style="color:red">已分享</span>';
            }
        }
    }

    function EditTemplate() {
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要编辑的模板!");
            return;
        }
        var ID = row["ID"];
        mini.open({
            url:'/Template/setup?ID='+ID+'&Mode=Edit',
            width:'100%',
            height:'100%',
            showModal:true,
            ondestroy:function(action){
                if (action == "ok"){
                    window.location.reload();
                }
            }
        });
    }

    function AddTemplate() {
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("新增之前请先选择一条基础模板,有益于您更快速的设置模板!");
            return;
        }
        var ID = row["ID"];
        mini.open({
            url:'/Template/setup?ID='+ID+'&Mode=Add',
            width:'100%',
            height:'100%',
            showModal:true,
            ondestroy:function(action){
                if (action == "ok"){
                    window.location.reload();
                }
            }
        });
    }
    function browse() {
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择您要预览的专利模板!");
            return;
        }
        var ID = row["ID"];
        mini.open({
            url:'/Template/setup?ID='+ID+'&Mode=Browse',
            width:'100%',
            height:'100%',
            showModal:true,
            ondestroy:function(action){
                if (action == "ok"){
                    window.location.reload();
                }
            }
        });
    }
    function rowClick(e) {
        var record = e.record;
        var ID = parseInt(record["ID"]);
        var Share = parseInt(record["IsShare"]);
        var CreateID = parseInt(record["UserID"]);
        var LoginID = parseInt("${UserID}");

        if (ID == 1){
            cmdAdd.show();
            cmdEdit.hide();
            cmdDelete.hide();
            cmdEnjoy.hide();
            cmdCancelEnjoy.hide();
        }
        if (ID != 1 && Share == 0){
            cmdAdd.show();
            cmdEdit.show();
            cmdDelete.show();
            cmdEnjoy.show();
            cmdCancelEnjoy.hide();
        }else if (ID != 1 && Share == 1){
            var PageType = mini.get('PageType').getValue();
            cmdAdd.show();
            if (PageType == "Share") {
                cmdEdit.hide();
                cmdDelete.hide();
            }else {
                cmdEdit.show();
                cmdDelete.show();
            }
            cmdEnjoy.hide();
            cmdCancelEnjoy.show();
        }
        if (ID != 1 && Share == 1 && CreateID == LoginID){
            cmdAdd.show();
            if (PageType == "Share") {
                cmdEdit.hide();
                cmdDelete.hide();
            }else {
                cmdEdit.show();
                cmdDelete.show();
            }
            cmdCancelEnjoy.show();
        }else if (ID != 1 && Share == 1 && CreateID != LoginID){
            cmdAdd.show();
            if (PageType == "Share") {
                cmdEdit.hide();
                cmdDelete.hide();
            }else {
                cmdEdit.show();
                cmdDelete.show();
            }
            cmdCancelEnjoy.hide();
        }
    }
    function DelTemplate() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
            if (row[i]["ID"] == "1"){
                mini.alert("无法删除系统默认模板!");
                return;
            }
        }
        if (ids.length == 0){
            mini.alert("请选择要删除的模板!");
            return;
        }
        var url = "/Template/deltetemplate";
        mini.confirm("确认删除？","系统提示",function (action) {
            if (action == 'ok'){
                $.ajax({
                    contentType: 'application/json',
                    method: 'post',
                    url: url,
                    data: mini.encode(ids),
                    success: function (r) {
                        if (r['success'] == true) {
                            mini.alert("删除成功！");
                            window.location.reload();
                        }else mini.alert(r['message']);
                    },
                    failure: function (error) {
                        mini.alert(error);
                    }
                });
            }
        })

    }
    function enjoy() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
        }
        if (ids.length == 0){
            mini.alert("请选择要分享的模板!");
            return;
        }
        var url = "/Template/enjoy";
        $.ajax({
            contentType: 'application/json',
            method: 'post',
            url: url,
            data: mini.encode(ids),
            success: function (r) {
                if (r['success']) {
                    mini.alert("分享成功","系统提示",function () {
                        window.location.reload();
                    })
                }else mini.alert(r['message']);
            },
            failure: function (error) {
                mini.alert(error);
            }
        });
    }

    function cancelenjoy() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
        }
        if (ids.length == 0){
            mini.alert("请选择要取消分享的模板!");
            return;
        }
        var url = "/Template/cancelenjoy";
        $.ajax({
            contentType: 'application/json',
            method: 'post',
            url: url,
            data: mini.encode(ids),
            success: function (r) {
                if (r['success']) {
                    mini.alert("取消分享成功","系统提示",function () {
                        window.location.reload();
                    })
                }else mini.alert(r['message']);
            },
            failure: function (error) {
                mini.alert(error);
            }
        });
    }
    function doQuery(field, value, Type) {
        var arg = {};
        var cs = [];
        if (Type == "All") {
            var op = {field: field, oper: 'EQ', value: value};
            cs.push(op);
            var ops = {field: field, oper: 'EQ', value: '0'};
            cs.push(ops);
            cmdAdd.hide();
            cmdAdd.setText("新增");
            cmdEdit.hide();
            cmdDelete.hide();
            cmdEnjoy.hide();
            cmdCancelEnjoy.hide();
            mini.get('#PageType').setValue("All");
        }else if (Type == "System"){
            var op = {field: field, oper: 'EQ', value: '0'};
            cs.push(op);
            cmdAdd.hide();
            cmdAdd.setText("新增");
            cmdEdit.hide();
            cmdDelete.hide();
            cmdEnjoy.hide();
            cmdCancelEnjoy.hide();
            mini.get('#PageType').setValue("System");
        }else if (Type == "Mine"){
            var op = {field: field, oper: 'EQ', value: value};
            cs.push(op);
            cmdAdd.hide();
            cmdAdd.setText("新增");
            cmdEdit.hide();
            cmdDelete.hide();
            cmdEnjoy.hide();
            cmdCancelEnjoy.hide();
            mini.get('#PageType').setValue("Mine");
        }else if (Type == "Share"){
            var op = {field: field, oper: 'EQ', value: value}
            cs.push(op);
            cmdAdd.hide();
            cmdAdd.setText("引用为自我模板");
            cmdEdit.hide();
            cmdDelete.hide();
            cmdEnjoy.hide();
            cmdCancelEnjoy.hide();
            mini.get('#PageType').setValue("Share");
        }
        if (cs.length > 0) arg["Query"] = mini.encode(cs);
        DataGird.load(arg);
    }
</script>
</html>
