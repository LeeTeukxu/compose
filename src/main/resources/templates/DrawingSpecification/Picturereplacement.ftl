<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit" />
    <meta name="viewport" content="width=device-width, initial-scale=0.5, maximum-scale=1">
    <title>知服帮知识产权管理系统登陆｜专利商标管理软件</title>
    <meta name="keywords" content="知识产权管理系统 , 专利管理软件, 商标管理软件" />
    <meta name="description" content="知服帮知识产权管理系统，专利商标客户拓展、专利商标流程管理、专利商标文件通知费用监控提醒、财务数据汇总统计。"/>
    <link rel="stylesheet" type="text/css" href="/imgreplace/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/imgreplace/css/style.css" />
    <style>
        .width_auto{
            width: 900px;
            margin: 63px auto;
        }
    </style>

    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->

</head>
<body style="height: 478px;">

<div class="width_auto">
    <div id="container">
        <!--头部，相册选择和格式选择-->
        <div id="uploader" >
            <div class="item_container">
                <div id="" class="queueList" >
                    <div id="dndArea" class="placeholder">
                        <div style="color: #ea2929d4"><h3>直接粘贴图片，请用快捷键“Ctrl+V”</h3></div>
                        <div id="filePicker"></div>
                    </div>
                </div>
            </div>
            <div class="statusBar" style="display:none;">
                <div class="progress">
                    <span class="text">0%</span>
                    <span class="percentage"></span>
                </div><div class="info"></div>
                <div class="btns">
                    <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/imgreplace/js/jquery-1.9.min.js"></script>
<script src="/imgreplace/js/webuploader.js?v=${version}"></script>
<script src="/imgreplace/js/jquery.sortable.js"></script>
<script src="/imgreplace/js/upload.js?v=${version}"></script>
<script type="text/javascript">
    mini.parse();
    var AttID = "${AttID}";
    var accesskey = "${accesskey}"
</script>
</body>
</html>
