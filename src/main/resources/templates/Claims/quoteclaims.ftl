<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        .showCellTooltip {
            color: blue;
            text-decoration: underline;
        }
        .ui-tooltip {
            max-width: 850px;
        }
        .mini-fit{.height: 150px;}
    </style>
    <link rel="stylesheet" href="/css/style.css" />
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script charset="utf-8" src="/js/kindeditor-min.js"></script>
    <script charset="utf-8" src="/lang/zh_CN.js"></script>
    <script src="/js/jquery-1.11.0.min.js"></script>
</head>
<body>
<div style="height:190px;">
    <div class="mini-fit" >
        <!--多选 multiSelect="true"-->
    <div id="datagrid1" class="mini-datagrid" style="width: 100%;height: 100%"
         allowresize="true" url="/Claims/getData" multiSelect="true"  pagesize="20" sortfield="DqExclusiveorder" sortorder="desc"
         autoload="true" onrowdblclick="onRowDblClick">
        <div property="columns">
            <#--<div type="indexcolumn"></div>-->
            <div type="checkcolumn"></div>
            <div field="DqExclusiveorder" sortField="DqExclusiveorder" id="DqExclusiveorder" name="DqExclusiveorder" width="200" headeralign="center" allowsort="true">
                权利要求
            </div>
        </div>
    </div>
</div></div><br>
<div class="mini-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderstyle="border:0;">
    <a class="mini-button" style="width:60px;" onclick="onOk()">确定</a>
    <span style="display:inline-block;width:25px;"></span>
    <a class="mini-button" style="width:60px;" onclick="onCancel()">取消</a>
</div>
<script>
    mini.parse();

    var grid = mini.get("datagrid1");

    grid.load();

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
        CloseWindow("ok");
    }

    function onCancel() {
        CloseWindow("cancel");
    }
</script>
</body>
</html>
