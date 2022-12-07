<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>申请人基本信息</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <script src="/js/jquery-1.11.0.min.js"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
    <style>
        .row{margin-top: 10px;width: 98%;margin: 10px auto;}
        .anrow{border: 1px solid rgb(27,98,171);height: 50px;}
        .anniu{margin-top: 5px;}
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .zitia,.backhome{float: right;margin-top: 15px;}
        .ckb{border: 1px solid silver;text-align: center;height: 505px;overflow-y: auto;overflow-x: auto;}
        .ckmoban{height: 30px;border-bottom: 1px solid silver;margin-top: 20px;color:rgb(27,98,171);}
        .actionbar button{margin-top: 8px;margin-left: 10px;}
        .keyword .Scheme1 .Schemetitle{color: rgb(27,98,171);}
        .keyword .Scheme1 textarea{border: 1px solid rgb(27,98,171);}
    </style>
</head>
<body>
<div class="row anrow">
    <div class="col-md-8 anniu">
        <ul>
            <#if firsts??>
                <#list firsts as first>
                    <li><a onclick="SetIframeSrc('${first.url}','${first.pageName}')"><button type="button" class="btn btn-primary">${first.title}</button></a></li>
                </#list>
            </#if>
        </ul>
    </div>
    <div class="col-md-4">
        <div class="backhome" >
            <a href="#" onclick="back()">返回首页</a>
        </div>
        <div class="zitia" style="margin-right: 30px;">
            <a href="#">A+</a>&nbsp;&nbsp;
            <a href="#">A-</a>
        </div>
    </div>
</div>

<!--主界面-->
<div class="row">
    <iframe src="/ApplicationInfo/index?Mode=${Mode}&TechMainID=${TechMainID}&TechnologyID=${TechnologyID}" style="width: 83%;height: 700px;border: none;float: left" id="frame"></iframe>
    <div class="col-md-2 ckb" id="template">
        <p class="ckmoban" >参考模板</p>
        <div id="content"></div>
    </div>
<#--    <div class="col-md-3" style="border: 1px solid silver;height: 50px;">-->

<#--    </div>-->
</div>
<script type="text/javascript">
    var TechMainID = ${TechMainID};
    var TechnologyTemplate = ${TechnologyTemplate};

    $(function (){
       $("#template").hide();
    });

    function SetIframeSrc(src,PageName){
        if (PageName == "Subject") {
            $("#template").show();
            $("#content").html(TechnologyTemplate["subjectTemplate"]);
        }else if (PageName == "BackGround") {
            $("#template").show();
            $("#content").html(TechnologyTemplate["backGroundTemplate"]);
        }else if (PageName == "Specific") {
            $("#template").show();
            $("#content").html(TechnologyTemplate["specificTemplate"]);
        }else $("#template").hide();
        document.getElementById("frame").src=src + "&TechMainID=" + TechMainID + "&Mode=" + "${Mode}" + "&TechnologyID=" + "${TechnologyID}";
    }

    function GetChildTechMainID(MainID) {
        TechMainID = MainID;
    }

    function back() {
        window.top.location.href = "/Truth/truthgird";
    }
</script>
</body>
</html>