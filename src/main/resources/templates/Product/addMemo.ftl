<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <link rel="stylesheet" type="text/css" href="/css/style.css" />
</head>
<body style="overflow: hidden;">
<div style="float: left">
    <a class="mini-button" iconCls="icon-add" onclick="onAdd">增加</a>
    <a class="mini-button" iconCls="icon-save" onclick="onSave" id="CmdSave">保存</a>
    <a class="mini-button" iconCls="icon-remove" onclick="onRemove" id="CmdDelete">删除</a>
</div>
<div style="height:800px;width: 100%">
    <div class="mini-fit" style="width: 100%;" id="fitt">
        <div class="mini-datagrid" id="grid1" style="width:100%;height:100%" allowcellselect="true" allowcelledit="true"
             url="/Product/getMemoData?ProductID=${ProductID}" oncellbeginedit="beforeEdit" allowCellWrap="true"
             autoload="true" onselect="onSelectRow">
            <div property="columns">
                <div type="indexcolumn"></div>
                <div field="Memo" width="300"  align="center" headerAlign="center">
                    进度信息
                    <div property="editor" class="mini-textarea" style="width:100%;height:60px"></div>
                </div>
                <#--        <div field="CreateManName" width="60" align="center" headerAlign="center">创建人</div>-->
                <div field="CreateTime" width="100" dataType="date" dateFormat="yyyy-MM-dd HH:mm:ss"  align="center" headerAlign="center">创建日期</div>
                <#--        <div field="UpdateManName" width="60" align="center" headerAlign="center">修改人</div>-->
                <div field="UpdateTime" width="100" dataType="date" dateFormat="yyyy-MM-dd HH:mm:ss" align="center" headerAlign="center">修改日期</div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var ProductID = "${ProductID}";
    mini.parse();
    var grid = mini.get('grid1');
    function onAdd() {
        grid.addRow({ProductID:ProductID});
    }
    function onSave() {
        var rows = grid.getChanges();
        var rs=[];
        for (var i = 0; i < rows.length; i++) {
            var row=mini.clone(rows[i]);
            delete row._id;
            delete row._uid;
            delete row._state;
            rs.push(row);
        }
        var url = '/Product/saveMemo';
        $.post(url, { Data: mini.encode(rs) }, function (r) {
            if (r.success) {
                mini.alert('保存成功。');
                grid.reload();
            }
            else {
                var msg = r.message || "保存失败";
                mini.alert(msg);
            }
        });
    }
    function beforeEdit(e) {
        var field = e.field;
        var record = e.record;
        if (field == "Memo") {
            var memo = record["Memo"];
            if (memo) {
                var edit = parseInt(record["Edit"] || 0);
                e.cancel = !(edit == 1);
            }
        } else {
            e.cancel = false;
        }
    }
    function onRemove() {
        var changes = grid.getChanges();
        if (changes.length > 0) {
            alert('删除数据之前，请先保存更改。');
            return;
        }
        var row = grid.getSelected();
        if (row) {
            var fu = function () {
                var id = row["ID"];
                var url = '/Product/removeMemo';
                $.post(url, {ProductID:row["ProductID"],ID: id }, function (r) {
                    if (r.success) {
                        mini.alert('选择记录删除成功!');
                        grid.reload();
                    }
                    else {
                        var msg = r.message || "删除失败，请稍候重试。";
                        mini.alert(msg);
                    }
                });
            };
            var edit = parseInt(row["Edit"] || 0);
            if (edit == 0) {
                mini.alert('不允许删除。');
                return;
            }
            mini.confirm('是否确认删除选择的记录。', '删除提示', function (r) {
                if (r == "ok") fu();
            });
        }
    }
    function onSelectRow(e) {
        var record = e.record;
        var memo = record["Memo"];
        var cmdSave = mini.get('CmdSave');
        var cmdDelete = mini.get('CmdDelete');
        if (memo) {
            var edit = parseInt(record["Edit"] || 0);
            if (edit) {
                cmdDelete.show();
                cmdSave.show();
            } else {
                cmdDelete.hide();
                cmdSave.hide();
            }
        } else {
            cmdDelete.show();
            cmdSave.show();
        }
    }
</script>