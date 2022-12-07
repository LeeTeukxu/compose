<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE>选择技术领域</TITLE>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <!-- <link rel="stylesheet" href="css/demo.css" type="text/css"> -->
    <link rel="stylesheet" href="/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="/css/zTreeStyle/animate.css" type="text/css">
    <script type="text/javascript" src="/js/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="/js/jquery.ztree.excheck.js"></script>
    <SCRIPT type="text/javascript">
        var ids = [];
        var setting = {
            treeObj : null,
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true,
                    idKey: "id",
                    pIdKey: "pId",
                    rootPId: 0
                }
            },
            callback: {
                onCheck: zTreeOnCheck
            },
            view: {
                showLine: false,
                showIcon: false,
                showTitle: false,
                // fontCss : {color:"red"}
            }

        };

        // var zNodes =
        //     [{"id":"1","pId":"0","corpCode":"","PERMITID":"","name":"选择技术方案所属技术领域","PROJECTNAME":"","corpId":""},
        //         {"id":"2","pId":"1","corpCode":"","PERMITID":"","name":"机械结构","PROJECTNAME":"","corpId":""},
        //         {"id":"3","pId":"1","corpCode":"","PERMITID":"","name":"电子电路","PROJECTNAME":"","corpId":""},
        //         {"id":"4","pId":"1","corpCode":"","PERMITID":"","name":"化工及材料","PROJECTNAME":"","corpId":""},
        //         {"id":"5","pId":"1","corpCode":"","PERMITID":"","name":"网络通信","PROJECTNAME":"","corpId":""},
        //         {"id":"6","pId":"1","corpCode":"","PERMITID":"","name":"医药","PROJECTNAME":"","corpId":""},
        //         {"id":"7","pId":"1","corpCode":"","PERMITID":"","name":"食品配方","PROJECTNAME":"","corpId":""},
        //
        //         {"id":"11","pId":"3","corpCode":"","PERMITID":"","name":"硬件","PROJECTNAME":"","corpId":""},
        //         {"id":"132","pId":"11","corpCode":"","PERMITID":"","name":"电路/电子元器件/集成电路","PROJECTNAME":"","corpId":""},
        //         {"id":"133","pId":"11","corpCode":"","PERMITID":"","name":"存储介质/电机/传感器","PROJECTNAME":"","corpId":""},
        //         {"id":"134","pId":"11","corpCode":"","PERMITID":"","name":"电子产品/装置/设备","PROJECTNAME":"","corpId":""},
        //
        //         {"id":"12","pId":"3","corpCode":"","PERMITID":"","name":"工艺/控制方法","PROJECTNAME":"","corpId":""},
        //         {"id":"13","pId":"3","corpCode":"","PERMITID":"","name":"电子信息系统","PROJECTNAME":"","corpId":""},]

        var zNodes = ${DataTree};

        var code;

        function setCheck() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                type = {Y: "ps", N: "ps"}
            zTree.setting.check.chkboxType = type;
            zTree.expandAll(true); //全部展开
            showCode('setting.check.chkboxType = { "Y" : "' + type.Y + '", "N" : "' + type.N + '" };');
            minejs();
        }
        function showCode(str) {
            if (!code) code = $("#code");
            code.empty();
            code.append("<li>"+str+"</li>");
        }

        function zTreeOnCheck(event, treeId, treeNode) {
            if (treeNode.level == 1 && treeNode.checked == true) {
                ids.push(treeNode.TechnologyID);
            }else if (treeNode.level == 1 && treeNode.checked == false) {
                ids.remove(treeNode.TechnologyID);
            }
            getSelectedNodes();
            //当前被选中对象携带参数
            // console.log(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
        };


        function getSelectedNodes(){
            // var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            // var selectedNode = zTree.getCheckedNodes();

            // 获取当前被勾选的节点集合
            var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = treeObj.getCheckedNodes(true);
        }

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
            setCheck();
            $("#py").bind("change", setCheck);
            $("#sy").bind("change", setCheck);
            $("#pn").bind("change", setCheck);
            $("#sn").bind("change", setCheck);
            $('.ztree li span.button.switch').click(function(){
                minejs();
            })
        });
        function minejs(){

        }
    </SCRIPT>
</HEAD>
<style>
    .tabbox{width:900px; margin:10% auto; padding: 15px; height:600px; background: white;display: none}
    .tabbox li,.tabbox ul{list-style-type: none}
    .tabbox ul{margin: 0; padding: 0}
    .tabbox .tabnav,.tabbox .tabcon{width: 98%;display: block;float: left;}
    .tabbox .tabnav{border-bottom: 1px solid #ddd}
    .tabbox .tabnav li{ position: relative; cursor: pointer; float: left; border-top-left-radius:5px;border-top-right-radius:5px; margin:0px;padding: 8px 26px; color: #337ab7;border:1px solid #fff; }
    .tabnav li.active{border:1px solid #ddd; border-bottom:none; color: #555;}
    .tabnav li.active:before{content:''; width: 100%; height: 1px; bottom: -2px; left: 0; position: absolute;background: white; }
    .tabbox .tabcon li{ display: none; padding: 10px; width: 100%; height: 540px; overflow: auto;}
    .tabbox .tabcon li:first-child{display: block}
    .mask{position: fixed; top: 0; left: 0; width:100%; height: 100%; background: rgb(212, 212, 212); display: none}

    .topmenu{width: 100%;height: auto;margin-top: -8px;}
    .topmenu .titlelogo{background: rgb(27,98,171);color: #fff;width: 180px;float: left;margin-left: -7px;}
    .rightmenu{float: right;}
    .rightmenu ul li{float: left;padding-left: 10px;list-style: none;}
    .rightmenu ul li a{text-decoration: none;color:rgb(27,98,171);}
</style>
<BODY>

<div class="topmenu"><!---->
    <div class="titlelogo">
        <p>知服帮专利申请辅助工具</p>
    </div>


    <div class="rightmenu">
        <ul>
            <li><a href="javascrit:void(0)">修改密码</a></li>
            <li><a href="javascrit:void(0)">帮助中心</a></li>
            <li><a href="javascrit:void(0)">退出</a></li>
        </ul>
    </div>
</div><br/><br/><br/>

<div class="content_wrap">
    <div class="zTreeDemoBackground left">
        <ul id="treeDemo" class="ztree"></ul>
        <!-- <ul id="selectObj"></ul> -->
    </div>
    <div class="mask">
        <div class="tabbox">
            <ul class="tabnav">
                <li class="active"></li>
                <li></li>
                <li></li>
            </ul>
            <ul class="tabcon">
                <li>
                    <br>
                </li>
                <li>

                </li>
                <li>

                </li>
            </ul>
        </div>
    </div>
    <input type="button" id="btnCommit" value="确定">
</div>
</BODY>
<script>
    $(function(){
        $('.tabnav li').click(function(){
            $('.tabnav li').removeClass('active')
            $(this).addClass('active');
            var pd = $(this).index();
            $('.tabcon li').hide()
            $('.tabcon li').eq(pd).show();
        })

        $("#btnCommit").click(function (){
            if (ids.length == 0) {
                mini.alert("请选择一个技术领域！");
                return;
            }else if (ids.length > 1) {
                mini.alert("一次只能选择一个技术领域！");
                return;
            }
            window.location.href = '/Truth/truthtemplateindex?Mode=Add&TechnologyID=' + ids[0];
        })
    })
</script>
</HTML>