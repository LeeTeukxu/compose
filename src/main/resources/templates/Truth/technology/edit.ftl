<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>技术领域编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-store, must-revalidate"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="shortcut icon" href="http://www.cpquery.com/upload/images/1165242391.png" type="image/x-icon"/>
    <style type="text/css">
        html, html body {
            padding: 0;
            border: 0;
            margin: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            font-family: Verdana;
            font-size: 12px;
            line-height: 22px;
        }

        html body .searchbox .mini-buttonedit-icon {
            background: url(/js/miniui/themes/icons/search.gif) no-repeat 50% 50%;
        }

        .k-icon.k-i-calendar {
            margin-top: 4px;
        }

        input.k-textbox {
            border-color: #c7bfbf;
        }

        .mini-layout-region-title {
            color: black;
        }

        .panel-expand {
            background-image: url(/js/miniui/themes/icons/collapse.gif);
        }

        .panel-collapse {
            background-image: url(/js/miniui/themes/icons/collapse.gif);
        }
    </style>
    <script type="text/javascript" src="/js/boot.js"></script>
</head>
<body>
    <div id="tbTechnology_toolbar" class="mini-toolbar">
        <a class="mini-button" id="tbTechnology_Refresh" iconcls="icon-reload" onclick="Refresh" plain="true">刷新</a>
        <a class="mini-button" id="tbTechnology_AddRoot" iconcls="icon-add" onclick="addRoot" plain="true">新增根节点</a>
        <a class="mini-button" id="tbTechnology_AddChild" iconcls="icon-add" onclick="addChild" plain="true">新增子节点</a>
        <span class="separator"></span>
        <a class="mini-button" id="tbTechnology_Save" iconcls="icon-save" onclick="Save" plain="true">保存</a>
        <a class="mini-button" id="tbTechnology_Remove" iconcls="icon-remove" onclick="Delete" plain="true">删除</a>
    </div>
    <div style="height:800px;width: 100%">
        <div class="mini-fit">
        <div id="tbTechnology_treegrid" class="mini-treegrid" style="width:100%;height:100%" url="/Technology/getAll"
             treeColumn="sn" idField="technologyId" parentField="pid" resultAsTree="false" editNextOnEnterKey="true"
             allowCellValidate="true"
             editNextRowCell="true" allowCellEdit="true" allowCellSelect="true" showTreeIcon="true" ondrawcell="renderCheck"
             ondrop="ondrop" allowdrag="true" allowdrop="true" allowleafdropin="true" sortField="sn" sortOrder="asc"
             expandOnload="true">
            <div property="columns">
                <div type="indexcolumn"></div>
                <div name="oper" field="oper" width="50" headeralign="center" align="center">编辑技术领域

                </div>
                <div id="sn" name="sn" field="sn" width="100" headeralign="center" vtype="required">技术领域编号
                    <input property="editor" class="mini-textbox" style=" width:100%"/>
                </div>
                <div name="name" field="name" width="200" headeralign="center" vtype="required">技术领域名称
                    <input property="editor" class="mini-textbox"/>
                </div>
                <div name="canUse" field="canUse" width="50" headeralign="center">是否显示
                    <input property="editor" class="mini-combobox" data="IsUsable"/>
                </div>
                <div name="memo" field="memo" width="150" headeralign="center">备注
                    <input property="editor" class="mini-textarea"/>
                </div>
            </div>
        </div>
    </div>
    </div>
</body>
<script type="text/javascript">
    var IsUsable = [{id: true, text: '可用'}, {id: false, text: '不可用'}];
    var treeGrid = null, TypeID = null;
    $(function () {
        mini.parse();
        treeGrid = mini.get("tbTechnology_treegrid");
    });

    function onLoad(e) {
        var result = e['result'];
        if (result) {
            var ds = result['data'] || [];
            if (ds.length < 100) e.source.expandAll();
        }
    }

    function Refresh() {
        treeGrid.reload();
    }

    function addRoot() {
        var row = treeGrid.addNode({canUse: "true"});
        treeGrid.validateRow(row);
    }

    function addChild() {
        var node = treeGrid.getSelectedNode();
        if (!node) {
            mini.alert("请选择父节点!");
            return;
        }
        var pId = node.technologyId;
        var row = treeGrid.addNode({pid: pId, canUse: "true"}, 'add', node);
        treeGrid.validateRow(row);
    }

    function Save() {
        treeGrid.validate();
        var rows = treeGrid.getChanges();
        if (rows.length > 0) {
            function g() {
                var iid = mini.loading('正在保存数据......');
                var url = '/Technology/saveAll';
                $.ajax({
                    contentType: 'application/json',
                    method: 'post',
                    url: url,
                    data: mini.encode(rows),
                    success: function (r) {
                        mini.hideMessageBox(iid);
                        if (r['success']) {
                            mini.alert("技术领域保存成功", "系统提示", function () {
                                treeGrid.reload();
                            });
                        }
                        else mini.alert("保存失败，请稍后再试...");
                    },
                    failure: function (error) {
                        mini.hideMessageBox(iid);
                        mini.alert(error);
                    }
                });
            }

            if (treeGrid.isValid() == true) {
                g();
            } else mini.alert('数据录入不完整，不能进行保存!');
        } else mini.alert('没有可保存内容!');
    }

    function Delete() {
        var nodes = treeGrid.getSelecteds();
        if (nodes.length <= 0) {
            mini.alert('请选择要删除的数据！');
            return;
        }
        mini.confirm("确定要删除选中的技术领域数据吗？", "系统提示", function (action) {
            if (action == "ok") g(nodes);
        });

        function g(nodes) {
            var ids = [];
            for (var i = 0; i < nodes.length; i++) {
                ids.push(nodes[i]["technologyId"]);
            }
            var iid = mini.loading('正在删除数据.....');
            var url = "/Technology/removeAll";
            $.ajax({
                contentType: 'application/json',
                method: 'post',
                url: url,
                data: mini.encode(ids),
                success: function (r) {
                    mini.hideMessageBox(iid);
                    if (r['success']) {
                        mini.alert("选择的技术领域已删除成功！", '删除提示', function () {
                            treeGrid.reload();
                        });

                    } else mini.alert(r.message || "选择的技术领域删除失败！");
                },
                failure: function (error) {
                    mini.hideMessageBox(iid);
                    mini.alert(error);
                }
            });
        }
    }

    function renderCheck(a, b, c) {
        var val = a.value;
        var field = a.field;
        var record = a.record;
        if (a.field == "canUse") {
            if (val == true || val == "true")
                a.cellHtml = '<div style="color:green;text-align:center">可用</div>';
            else
                a.cellHtml = '<div style="color:red;text-align:center">不可用</div>';
        }
        if (a.field == "oper") {
            if(record["_level"] == 1) {
                var TechnologyID = record["technologyId"];
                var Name = record["name"];
                a.cellHtml = '<a href="#" style=color:blue;text-decoration:underline" onclick="editTemplate(\'' + TechnologyID + '\',\'' + Name + '\')">编辑</a>';
            }
        }
    }

    function Search() {
        var SearchValue = mini.get('tbTechnology_SearchValue').getValue();
        var p = new gridFilterHelper();
        p.setMatch("Name", SearchValue);
        treeGrid.load({"FilterParam": mini.encode(p.getResult())});
    }

    function Reset() {
        var value = mini.get("tbTechnology_SearchValue");
        value.setValue("");
        Refresh();
    }

    function onClear() {
        treeGrid.deselectAll();
    }

    function lockGrid() {
        treeGrid.setAllowCellEdit(false);
    }

    function unLockGrid() {
        treeGrid.setAllowCellEdit(true);
    }

    function beforeOpen(e) {
        e.htmlEvent.preventDefault();
        var menu = e.sender;
        var node = treeGrid.getSelectedNode();
        var items = menu.getItems();
        for (var i = 0; i < items.length; i++) {
            var n = items[i];
            var name = n["name"] || "";
            var fun = (name == "Root" ? (node ? "hide" : "show") : (node ? "show" : "hide"));
            n[fun]();
        }
    }

    function ondrop(sender) {
        var nodes = sender.dragNodes || [];
        for (var i = 0; i < nodes.length; i++) {
            var node = nodes[i];
            var parentNode = treeGrid.getParentNode(node);
            var parentId = parentNode["technologyId"] || 0;
            node.pid = parentId;
        }
    }

    function addBefore() {
        var node = treeGrid.getSelectedNode();
        var pId = 0;
        if (node) pId = node.pid;
        treeGrid.addNode({pid: pId, canUse: "true"}, 'after', node);
    }

    function addAfter() {
        var node = treeGrid.getSelectedNode();
        var pId = 0;
        if (node) {
            pId = node.pid;
            treeGrid.expandPath(node);
        }
        treeGrid.addNode({pid: pId, canUse: "true"}, 'after', node);
    }

    function add() {
        var node = treeGrid.getSelectedNode();
        if (!node) {
            mini.alert("请选择父节点!");
            return;
        }
        var pId = node.technologyId;
        treeGrid.addNode({pid: pId, canUse: "true"}, 'add', node);
    }

    function expandAll() {
        treeGrid.expandAll();
    }

    function editTemplate(TechnologyID, Name) {
        var url = "/Technology/editTemplate?TechnologyID=" + TechnologyID + "&Name=" + Name;
        mini.open({
            url:url,
            width:'60%',
            height:'45%',
            showModal:true,
            ondestroy:function(){
                // window.location.reload();
            }
        });
    }
</script>
</html>
