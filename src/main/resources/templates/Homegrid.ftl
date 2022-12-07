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
<body style="overflow: hidden;">


    <div style="float: left">
        <a class="mini-button" iconcls="" id="AssistName_Add" style="background:#209fdc;border: 1px solid #209fdc;color: #fff;" onclick="addAssistName">增加</a>
        <a class="mini-button" iconcls="" id="AssistName_Edit" style="background: #ff5b5bc4;border: 1px solid #ff5b5bc4;color: #fff;" onclick="editAssistName">编辑</a>
            <a class="mini-button" iconcls="" id="AssistName_Delete" STYLE="background: rgba(107, 191, 145, 0.77);border: 1px solid rgba(107, 191, 145, 0.77);color: #fff;" onclick="remove">删除</a>
            <a class="mini-button" iconcls="" id="AssistName_ReBack" onclick="reback">找回</a>
        <a class="mini-button" iconcls="" id="Assist_DownLoad" style="background: #ffad33;border: 1px solid #ffad33;color: #fff;" onclick="download()">下载</a>
            <a class="mini-button" iconcls="" id="Assist_DownLoadFive" style="background: #ab4eff;border: 1px solid #ab4eff;color: #fff;" onclick="downloadfive()">下载五书</a>
        <a class="mini-button" iconcls="" id="Assist_Copy" style="background: #ab4eff;border: 1px solid #ab4eff;color: #fff;" onclick="copy()">复制</a>
    <#--    <form method="post" name="multiform" action="/Product/upload" enctype="multipart/form-data" style="display: inline;">-->
    <#--        <a class="mini-button" iconcls="icon-add" id="Assist_upload" onclick="getFile()">上传</a>-->
    <#--        <input style="display: none" type="file"  name="file" id="getF" onchange="clickF()">-->
    <#--    </form>-->

    </div>
    <div style="float: right">
        <a class="mini-button mini-button-danger" id="HighQuery" onclick="expand">高级搜索</a>
    </div>
    <div id="p1" style="border:1px solid #909aa6;border-top:0;height:150px;padding:5px;display:none">
        <table style="width:100%;" id="highQueryForm">
            <tr>
                <td style="width:6%;padding-left:10px;">专利名称：</td>
                <td style="width:13%;">
                    <input class="mini-textbox" data-oper="LIKE" name="AssistName" style="width:100%" />
                </td>
                <td style="width:6%;padding-left:10px;">使用的模板：</td>
                <td style="width:15%;">
                    <input class="mini-textbox" data-oper="LIKE" name="TemplateName" style="width:100%" />
                </td>
                <td style="width:6%;padding-left:10px;">添加时间：</td>
                <td style="width:13%;">
                    <input name="AddTime" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd"
                           data-oper="GE" style="width:100%"/>
                </td>
                <td style="width:6%;padding-left:10px;">到：</td>
                <td style="width:15%;">
                    <input name="AddTime" data-oper="LE" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd H:mm:ss" timeFormat="23:59:59" showTime="true" style="width:100%"/>
                </td>
            </tr>
            <tr>
                <td style="width:6%;padding-left:10px;">最后操作时间：</td>
                <td style="width:13%;">
                    <input name="UpdateTime" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd"
                           data-oper="GE" style="width:100%"/>
                </td>
                <td style="width:6%;padding-left:10px;">到：</td>
                <td style="width:15%;">
                    <input name="UpdateTime" data-oper="LE" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd H:mm:ss" timeFormat="23:59:59" showTime="true" style="width:100%"/>
                </td>
                <td style="width:6%;padding-left:10px;">最后下载时间：</td>
                <td style="width:13%;">
                    <input name="DownloadTime" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd"
                           data-oper="GE" style="width:100%"/>
                </td>
                <td style="width:6%;padding-left:10px;">到：</td>
                <td style="width:15%;">
                    <input name="DownloadTime" data-oper="LE" class="mini-datepicker" datatype="date"
                           dateformat="yyyy-MM-dd H:mm:ss" timeFormat="23:59:59" showTime="true" style="width:100%"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="8">
                    <a class="mini-button mini-button-success" style="width:120px"
                       href="javascript:doHightSearch();">搜索</a>
                    <a class="mini-button mini-button-danger" style="margin-left:30px;width:120px"
                       href="javascript:expand();">收起</a>
                </td>
            </tr>
        </table>
    </div>
    <br>
    <br>
    <div style="height:800px;width: 100%">
        <div class="mini-fit" style="width: 100%;" id="fitt">
            <div id="datagrid1" class="mini-datagrid" style="width: 100%; height: 100%;"
                 onrowdblclick="edit"
                 allowresize="true" url="/Product/getData?State=${State}" multiselect="true"
                 pagesize="20" sizelist="[5,10,20,50,100,150,200]" sortfield="ID" sortorder="desc"
                 autoload="true" onDrawCell="onDraw" onload="afterload">
                <div property="columns">
                    <div type="indexcolumn" width="20" headerAlign="center" align="center">专利序号</div>
                    <div type="checkcolumn" width="20"></div>
                    <div field="Action" width="20" headerAlign="center" align="center">备注</div>
                    <div field="AssistName" width="120" headerAlign="center" align="center" allowsort="true">专利名称</div>
                    <div field="TemplateName" width="120" headerAlign="center" align="center">使用的模板</div>
                    <div field="DownloadNum" width="20" headerAlign="center" align="center" allowsort="true">下载次数</div>
                    <div field="DownloadFiveNum" width="30" headerAlign="center" align="center" allowsort="true">五书下载次数</div>
                    <div field="DownloadTime" width="40" headeralign="center" align="center" datatype="date" dateformat="yyyy-MM-dd" allowsort="true" allowsort="true">最后下载时间</div>
                    <div field="AddTime" width="40" headeralign="center" datatype="date" align="center" dateformat="yyyy-MM-dd" allowsort="true" allowsort="true">添加时间</div>
                    <div field="UpdateTime" width="40" headeralign="center" datatype="date" align="center" dateformat="yyyy-MM-dd" allowsort="true" allowsort="true">最后操作时间</div>
                    <div field="UserID" name="UserID" visible="false"></div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    mini.parse();
    var tip = new mini.ToolTip();
    var DataGird = mini.get('#datagrid1');
    var cmdAdd = mini.get('#AssistName_Add');
    var cmdEdit = mini.get('#AssistName_Edit');
    var cmdDow = mini.get('#Assist_DownLoad');
    var cmdReBack = mini.get('#AssistName_ReBack');
    var fit = mini.get('fitt');
    function afterload() {
        tip.set({
            target: document,
            selector: '.showCellTooltip',
            onbeforeopen: function (e) {
                e.cancel = false;
            },
            onopen: function (e) {
                var el = e.element;
                if (el) {
                    var code = $(el).attr('hCode');
                    var row = DataGird.findRow(function (row) {
                        if (row["ID"] == code) return true;
                    });
                    if (row) {
                        var memo = row["MEMO"];
                        if (memo) {
                            tip.setContent('<table style="width:400px;height:auto;table-layout:fixed;' +
                                'word-wrap:break-word;word-break:break-all;text-align:left;vertical-align:  ' +
                                'text-top; "> <tr><td>' + row["MEMO"] + '</td></tr></table>');
                        }
                    }
                }
            }
        });
    }
    function onDraw(e) {
        var field = e.field;
        var record = e.record;
        if (field == "Action") {
            var memo = record["MEMO"];
            var editMemo = parseInt(record["EDITMODE"] || 0);
            var text = ((memo == null || memo == "") ? "<span style='color:green'>添加</span>" : "<span style='color:blue'>修改</span>");
            if (editMemo == 0) {
                if (memo) text = "<span style='color:gay'>查看</span>";
            }
            e.cellHtml ='<a href="#"  data-placement="bottomleft"  hCode="' + record["ID"] + '" ' +
                'class="showCellTooltip" onclick="ShowMemo(' + "'" + record["ID"] + "'," + "'" +
                record["AssistName"] + "'" + ')">' + text + '</a>';
        }
    }
    function ShowMemo(id, title) {
        mini.open({
            url: '/Product/addMemo?ProductID=' + id,
            showModal: true,
            width: 900,
            height: 400,
            title: "【" + title + "】的备注信息",
            onDestroy: function () {
                refreshData(DataGird);
            }
        });
    }

    function refreshData(grid) {
        var pa = grid.getLoadParams();
        var pageIndex = grid.getPageIndex() || 0;
        var pageSize = grid.getPageSize() || 20;
        pa = pa || { pageIndex: pageIndex, pageSize: pageSize };
        grid.load(pa);
    }
    $(function () {
        if ("${State}" == 1){
            cmdAdd.show();
            cmdEdit.show();
            cmdDow.show();
            cmdReBack.hide();
        }else {
            cmdAdd.hide();
            cmdEdit.hide();
            cmdDow.hide();
            cmdReBack.show();
        }
    });
    function addAssistName() {
        // mini.open({
        //     url:'/index?Mode=Add',
        //     width:'100%',
        //     height:'100%',
        //     title:'新增专利申请书',
        //     showModal:true,
        //     ondestroy:function(){
        //         DataGird.reload();
        //     }
        // });
        window.top.location.href = '/index?Mode=Add';
    }
    function edit() {
        var row=DataGird.getSelected();
        if (row['State'] == 1){
            editAssistName();
        }
    }
    function editAssistName() {
        var row=DataGird.getSelected();
        if(!row) {
            mini.alert('请选择要编辑的专利申请书信息!');
            return ;
        }
        var ID=row['ID'];
        var url = "/Product/updateTime";
        $.ajax({
            contentType: 'application/json',
            method: 'POST',
            url: url,
            success:function (res) {

            },error:function (err) {

            }
        });
        window.top.location = "/editAssistName?ID="+ID;
        // mini.open({
        //     url:'/editAssistName?ID='+ID,
        //     width:'100%',
        //     height:'100%',
        //     title:'修改专利申请书',
        //     showModal:true,
        //     ondestroy:function(){
        //         var url = "/Product/updateTime";
        //         $.ajax({
        //             contentType: 'application/json',
        //             method: 'POST',
        //             url: url,
        //             success:function (res) {
        //
        //             },error:function (err) {
        //
        //             }
        //         });
        //         DataGird.reload();
        //     }
        // })
    }
    function remove() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
        }
        if (ids.length == 0){
            mini.alert("请选择要删除的专利!");
            return;
        }
        if ("${State}" == "1"){
            mini.confirm("您选择的专利将添加到回收站,并可在回收站找回.是否继续?","系统提示",function (act) {
                if (act == 'ok'){
                    respo(ids);
                }
            });
        }else {
            mini.confirm("您选择的专利被删除后将无法找回,是否继续删除?","是否删除",function (r) {
                if (r == 'ok'){
                    respo(ids);
                }
            })
        }
    }
    function respo(ids) {
        var url = "/Product/remove?State=${State}";
        $.ajax({
            contentType: 'application/json',
            method: 'post',
            url: url,
            data: mini.encode(ids),
            success: function (r) {
                if (r['success']) {
                    if ("${State}" == "1") {
                        mini.alert("已将您选择的专利添加到回收站,并可在回收站找回该专利！", '删除提示', function () {
                            DataGird.reload();
                        });
                    }else {
                        mini.alert("删除成功！", '删除提示', function () {
                            DataGird.reload();
                        });
                    }
                }else mini.alert("删除失败！");
            },
            failure: function (error) {
                mini.alert(error);
            }
        });
    }
    function reback() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
        }
        if (ids.length == 0){
            mini.alert("请选择要找回的专利!");
            return;
        }
        var url = "/Product/reback";
        $.ajax({
            contentType: 'application/json',
            method: 'post',
            url: url,
            data: mini.encode(ids),
            success: function (r) {
                if (r['success']) {
                    mini.alert("找回专利成功！", '删除提示', function () {
                        DataGird.reload();
                    });
                }else mini.alert("找回失败！");
            },
            failure: function (error) {
                mini.alert(error);
            }
        });
    }
    // function setRowNum(ID) {
    //     var rowValue = ID;
    //     var url="/Product/setRowValue?RowValue=" + rowValue;
    //     $.ajax({
    //         type : "post",
    //         url : url,
    //         data : rowValue,
    //         async : false,
    //         success : function(r){
    //         }
    //     });
    // }
    function DownLoadAssist() {
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要下载的专利!");
            return;
        }
        var RowValue = row["ID"];
        mini.open({
            url:"/downloadtemplate?RowValue="+RowValue,
            title: "请选择下载模板",
            width: 1000,
            height:500,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须

                }

            }
        })
    }
    function getFile(){
        $("#getF").click();
    }
    var filename="";
    function clickF() {
        filename=$("#getF").val();
        var filenames=filename.split("\\");
        filename=filenames[filenames.length-1];
        document.multiform.submit();
    }

    function download() {
        var form = new mini.Form("#datagrid1");
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要下载的专利!");
            return;
        }
        var RowValue = row["ID"];
        var AssistName = row["AssistName"];
        form.loading("下载中......");
        $.fileDownload('/Template/download?RowValue='+RowValue+'&AssistName='+AssistName, {
            httpMethod: 'POST',
            successCallback:function(url){
                updateDownCount(RowValue);
                form.unmask();
                window.location.reload();
            },
            failCallback: function (html, url) {
                mini.alert('下载错误:' + html, '系统提示');
            }
        });
    }
    function updateDownCount(ID) {
        var url = "/Product/updatedowncount";
        var arg = {ID:ID};
        $.post(url,arg,function () {

        });
    }function updateFiveDownCount(ID) {
        var url = "/Product/updateFiveDownCount";
        var arg = {ID:ID};
        $.post(url,arg,function () {

        });
    }

    function downloadfive() {
        var form = new mini.Form("#datagrid1");
        var row = DataGird.getSelected();
        if (!row){
            mini.alert("请选择要下载的五书!");
            return;
        }
        var RowValue = row["ID"];
        var AssistName = row["AssistName"];
        var url = "/Template/downloadfive?RowValue="+RowValue+"&AssistName="+AssistName;
        form.loading("下载中......");
        $.fileDownload(url, {
            httpMethod: 'POST',
            successCallback:function(url){
                updateFiveDownCount(RowValue);
                form.unmask();
                window.location.reload();
            },
            failCallback: function (html, url) {
                mini.alert('下载错误:' + html, '系统提示');
            }
        });
    }
    function copy() {
        var row = DataGird.getSelecteds();
        var ids = [];
        for (var i=0;i<row.length;i++){
            ids.push(row[i]["ID"]);
        }
        if (ids.length == 0){
            mini.alert("请选择要复制的专利!");
            return;
        }else if (ids.length > 1){
            mini.alert("每次只能复制一条专利!");
            return;
        }
        var url = "/Product/copy";
        $.ajax({
            contentType: 'application/json',
            method: 'post',
            url: url,
            data: mini.encode(ids),
            success: function (r) {
                if (r['success']) {
                    refreshData(DataGird);
                    mini.alert("复制专利成功!");
                }else mini.alert("复制专利失败！");
            },
            failure: function (error) {
                mini.alert(error);
            }
        });
    }
    function expand(e) {
        e=e||{};
        var btn = e.sender;
        if(!btn){
            btn=mini.get('#HighQuery');
        }
        var display = $('#p1').css('display');
        if (display == "none") {
            btn.setIconCls("panel-collapse");
            btn.setText("高级查询");
            $('#p1').css('display', "block");

        } else {
            btn.setIconCls("panel-expand");
            btn.setText("高级查询");
            $('#p1').css('display', "none");
        }
        fit.setHeight('100%');
        fit.doLayout();
    }
    function doHightSearch(){
        var arg = {};
        var form = new mini.Form('#highQueryForm');
        var fields = form.getFields();
        var result = [];
        for (var i = 0; i < fields.length; i++) {
            var field = fields[i];
            var val = field.getValue();
            if (val != null && val != undefined) {
                if (val != '') {
                    var obj = {
                        field: field.getName(),
                        value: field.getValue(),
                        oper: field.attributes["data-oper"]
                    };
                    result.push(obj);
                }
            }
        }
        arg["High"] = mini.encode(result);
        DataGird.load(arg);
    }
</script>
</html>
