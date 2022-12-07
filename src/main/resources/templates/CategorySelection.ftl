<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>选择分类</title>
    <style>
        .topmenu{width: 100%;height: auto;margin-top: -8px;}
        .topmenu .titlelogo{background: rgb(27,98,171);color: #fff;width: 180px;float: left;margin-left: -7px;}
        .rightmenu{float: right;}
        .rightmenu ul li{float: left;padding-left: 10px;list-style: none;}
        .rightmenu ul li a{text-decoration: none;color:rgb(27,98,171);}

        .content{width:98%;height:600px;margin: 0px auto;border: 1px solid rgb(27,98,171);}
        .content .ctytitle{margin-left: 10%;margin-top: 5%;}
        .content .wow{width: 50%;height: 10px;margin: 0px auto;mwargin-top:5% ;}
        .content .wow .leftnr{float: left;width: 40%;display: flex;flex-direction: row;}
        .content .wow .leftnr .bianjilogo{border-radius: 60%;background-color: cornflowerblue;width: 252px;text-align: center;height: 68px;}
        .content .wow .leftnr .bianjilogo img{margin-top: 14px;width: 36px;}
        .content .wow .leftnr .bianjineirong{margin-left: 10px;}
        .content .wow .leftnr .bianjineirong #jishubotton{width: 200px;font-size: 15px;color: #fff;
            background: rgb(27,98,171);border: 1px solid rgb(27,98,171);height: 48px;margin-top: 9px;}


        .content .wow .leftnr .bianjineirong #zhuanlibotton{width: 200px;font-size: 15px;color: #fff;
            background: rgb(27,98,171);border: 1px solid rgb(27,98,171);height: 48px;margin-top: 9px;}
    </style>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>
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
</div><br><br><br><br>

<div class="content">
    <h2 class="ctytitle"> 您需要？</h2>
    <div class="wow">
        <div class="leftnr">
            <div class="bianjilogo">
                <img  src="/img/bj.png"/>
            </div>
            <div class="bianjineirong">
                <input id="jishubotton" type="button" value="技术交底书撰写" onclick="gototruth()"/>
                <p class="miaoshu" style="color:rgb(27,98,171) ;">客户参照模板填写自己的技术方案，自己形成技术交底书，
                    使得专利代理师可以根据技术交底书撰写出合格的专利申请文件。
                </p>
            </div>
        </div>

        <div class="leftnr" style="margin-left: 57px;">
            <div class="bianjilogo" style="width: 78px;">
                <img  src="/img/bj.png"/>
            </div>
            <div class="bianjineirong">
                <input id="zhuanlibotton"  type="button" value="专利申请文件撰写" onclick="gotoassist()"/>
                <p class="miaoshu" style="color:rgb(27,98,171) ;">
                    专利代理师撰写专利申请文件辅助使用
                </p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();

    var JumpPage = "${JumpPage}";
    var Modal = "${Modal}";
    var AlertInfo = "${AlertInfo}"
    function gotoassist() {
        window.location.href = "/grid?JumpPage=" + JumpPage + "&Modal=" + Modal + "&AlertInfo=" + AlertInfo;
    }
    function gototruth() {
        window.location.href = "/Truth/truthgird?JumPage=" + JumpPage + "&Modal=" + Modal + "&AlertInfo=" + AlertInfo;
    }
</script>
</body>
</html>
