<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>预览</title>
    <link rel="stylesheet" href="/Preview/jquery.treeview.css" />
    <link rel="stylesheet" href="/Preview/screen.css" />
<#--    <script src="/Preview/lib/jquery.js" type="text/javascript"></script>-->
<#--    <script src="/Preview/lib/jquery.cookie.js" type="text/javascript"></script>-->
<#--    <script src="/Preview/jquery.treeview.js" type="text/javascript"></script>-->
<#--    <script type="text/javascript" src="/Preview/demo.js"></script>-->

    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->

    <style type="text/css">

        .u-clms-num p {
            display: inline-block;
            height: 35px;
            line-height: 35px;
            background-color: #E7E7E7;
            padding: 0 15px;
            margin-right: 10px;
        }
        #div1{margin-top: 30px;}
        .u-clms-num p em {
            color: #1976D2;
            font-style: normal;
            font-weight: 500;
        }
        .u-clm-tab {
            margin: 10px 0;
        }
        button, p, label, div, span, input, a {
            font-family: '微软雅黑 Regular', '微软雅黑';
        }
        .u-clm-tab a.current, .u-clm-tab a:hover {
            color: #1976D2;
            font-weight: bold;
        }
        .u-clm-tab a {
            cursor: pointer;
        }
        .contenttext {
            position: relative;
        }
        .abstract {
            line-height: 26px;
            padding-left: 10px;
        }
        .fn-clear {
            zoom: 1;
        }
        .u-subtab {
            padding-top: 20px;
        }
        .u-subtab a {
            display: block;
            float: left;
            line-height: 33px;
            background-color: #D9DEE4;
            margin-right: 15px;
            padding: 0 15px;
            cursor: pointer;
        }
        .u-subtab a.ui-switchable-active {
            background-color: #546478;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="u-subtab fn-clear ui-switchable-nav">
    <a class="Js_patent_view_subtab ui-switchable-trigger ui-switchable-active" id="qlyq" data-suptype="detail" onclick="QLYQ()">权利要求</a>
    <a class="Js_patent_view_subtab ui-switchable-trigger" data-suptype="detail" id="sms" onclick="SMS()">说明书</a>
</div>
<div class="u-clms-num" id="div1">
    <p style="margin-left: -174px;">权利要求数量(<em>${IndeAllNum}</em>)</p>
    <p>独立权利要求数量(<em>${AllDqNum}</em>)</p>
</div>
<div class="u-clm-tab" id="div2">
    <a class="current Js_clmTab" id="level" onclick="level()">层级视图</a> | <a class="Js_clmTab" id="txt" onclick="txt()">文本视图</a>
</div>
<ul id="leftTree" onload="afterload" style="width:100%;height:100%;display: block" expandonload="true"
    class="mini-tree" idField="InId"
    parentfield="Pid" textField="DqTechnicalsolutions" url="/Preview/getTree" resultAsTree="false" showTreeIcon="false">
</ul>
<div class="abstract contenttext" id="TxtContent" style="display: none">
    <div class="fn-hide sub" id="sub">

    </div>
</div>
<div id="manual" style="display: none;margin-top: 40px;">
    【技术领域】<br />
    ${TcOne}${TechnicalField}${TcTwo}<br />
    【背景技术】<br />
    ${Bgtechnology}<br />
    【发明内容】<br />
    ${FaMingContent}<br />
    【具体实施方式】<br />
    ${KaiTou}<br />${AllShiShiLi}${JieWei}
</div>

<script type="text/javascript">

    mini.parse();
    function afterload(e) {
        var tree = mini.get('#leftTree');
        var i = 1;
        var TxtContent = "";
        var nodes = tree.findNodes(function (node) {
            var DqTechnicalsolutions = node.DqTechnicalsolutions;
            tree.updateNode(node, {DqTechnicalsolutions: i + "." + DqTechnicalsolutions});
            TxtContent += i + "." + DqTechnicalsolutions + "<br />";
            i++;
        });
        $("#sub").html("<p>" + TxtContent + "</p>");
    }

    function QLYQ() {
        $("#div1").css('display','block');
        $("#div2").css('display','block');
        $("#leftTree").css('display','block');
        $("#TxtContent").css('display','block');
        $("#manual").css('display','none');
        $("#qlyq").addClass("ui-switchable-active");
        $('#sms').removeClass('ui-switchable-active');
    }

    function SMS() {
        $("#div1").css('display','none');
        $("#div2").css('display','none');
        $("#leftTree").css('display','none');
        $("#TxtContent").css('display','none');
        $("#manual").css('display','block');
        $('#sms').addClass('ui-switchable-active');
        $("#qlyq").removeClass("ui-switchable-active");
    }

    function level() {
        $("#leftTree").css('display','block');
        $("#TxtContent").css('display','none');
        $("#level").addClass("current");
        $("#txt").removeClass("current");
    }

    function txt() {
        $("#TxtContent").css('display','block');
        $("#leftTree").css('display','none');
        $("#txt").addClass("current");
        $("#level").removeClass("current");
    }
</script>

</body>
</html>
