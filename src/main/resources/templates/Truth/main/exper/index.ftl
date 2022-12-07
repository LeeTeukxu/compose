<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>附图及实验数据</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
<#--        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>-->


    <link href="/js/miniui/themes/default/large-mode.css" rel="stylesheet" type="text/css" />
    <link href="/js/miniui/themes/bootstrap/skin.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="/js/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="/js/plupload/plupload.full.min.js"></script>

    <script src="/js/boot.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <style>
        .row{margin-top: 10px;width: 98%;margin: 10px auto;}
        .rightrow{margin-top: 10px;width: 98%;margin: 10px auto;}
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .contentft{width: 100%; border: 1px solid silver;margin-left: -14px;height: 600px;overflow-y: auto;overflow-x: auto;}
        .contentft .zhu{margin-top: 20px;}
        .contentft .zhu .pzhulft{float: left;color:rgb(27,98,171) ;}
        .contentft .zhu .Operationbutton{float: right;margin-right: 10px;color:rgb(27,98,171) ;}
        .contentright{border: 1px solid silver;height: 600px;overflow-y: hidden;overflow-x: scroll;display: flex;flex-direction: row; white-space: nowrap;}
        .Attacheddrawing{text-align: center;width: 400px;}
        .Attacheddrawing .Attacheimg{width: 400px;}
        .Attacheddrawing .tit{width: 100%;text-align: center;border: 1px solid rgb(27,98,171);color: rgb(27,98,171);}
    </style>



    <script src="/js/dragSort.js?v=${version}"></script>
    <script src="/js/jquery-1.9.min.js"></script>
    <style media="screen">
        #drag-div { display: block; margin: auto; width: 1218px;height:600px;overflow-x: hidden;overflow-y: auto;}
        #drag-div::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}
        .drag-item { display: block; position: relative; float: left;width: 313px;height: 260px; border: 1px solid #CCC; margin: 10px;    margin-top: 30px; }
        .close { border: 1px solid red; position: absolute; right: 0; width: 17px; height: 17px; z-index: 1; text-align: center; line-height: 17px; }
        .drag-pic { width: 100%; height: 100%; position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;z-index: -1;}
        .itemtext{width: 100%;}
        .anniuzu{display: block; margin: 10px auto; width: 1000px;text-align: center;}
        .anniuzu .bt{margin-top: 32px;margin-left: 12px;width: 75px;height: 30px;border-radius: 4px;}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .NU{display: block;
            position: relative;
            float: left;
            width: 313px;
            /* height: 157px; */
            /* border: 1px solid #CCC; */
            /* margin: 10px; */
            margin-top: 289px;
            margin-left: -323px;}
    </style>
    <script type="text/javascript" src="/js/common/jquery.fileDownload.js"></script>
</head>
<body>
<div class="row">
    <div class="col-md-2"><button type="button" style="margin-left: -14px;" onclick="addZipFile()">上传图片附件</button></div>
    <div class="col-md-10"><button type="button" onclick="addImgFile()" >上传技术方案图纸/照片</button></div>
</div>
<div class="row">
    <div class="col-md-2">
        <div class="contentft" id="divZipFile">
<#--            <#if ZipData??>-->
<#--                <#list ZipData as Zip>-->
<#--                    <div class="zhu">-->
<#--                        <p class="pzhulft">${Zip.sort}.${Zip.attached}</p>-->
<#--                        <p class="Operationbutton"><a href="#" onclick="downloadZip('${Zip.attId}')">下载</a><a href="#" onclick="deleteZip('${Zip.attId}')">删除</a></p>-->
<#--                    </div>-->
<#--                </#list>-->
<#--            </#if>-->

            <ul class="mini-tree" id="ZipFileTree" url="/Exper/getAllAttachedByRowValueAndType?TechMainID=${TechMainID}&Type=Zip" required="true"
                showCheckBox="false" resultAsTree="false" multiSelect="false" ShowExpandButtons="false" ShowTreeIcon="false" onload="afterload"
                textField="Attached" idField="FID" parentField="PID" expandOnload="true" style="width:100%;height: 100%"></ul>
        </div>

    </div>
<#--    <div class="col-md-10 contentright" id="divImgList">-->
<#--        <#if ListImg??>-->
<#--            <#list ListImg as Img>-->
<#--                <div class="Attacheddrawing" id="Attacheddrawing">-->
<#--                    <img src="/attImages${Img.path}" class="Attacheimg"/>-->
<#--                    <p>${Img.cnSort}&nbsp;<span><a href="#" id="btnUpdate" onclick="replace('${Img.attId}')">替换</a></span></p><br>-->
<#--                    <div class="tit"><input class="mini-textbox" style="width:100%" name="pictureDescription" id="${Img.attId}" value="${Img.pictureDescription}" onblur="updatePicDes(this, '${Img.attId}')"/></div>-->
<#--                </div>-->
<#--            </#list>-->
<#--        </#if>-->
<#--    </div>-->
    <div class="col-md-10 contentright" id="drag-div">
        <div class="anniuzu">
            <button class="bt" onclick="SelectAll()" style="background: rgba(255, 91, 91, 0.77);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 全选 </button>
            <button class="bt" onclick="RemoveSelectAll()" style="background: rgb(171, 78, 255);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 取消全选 </button>
            <button class="bt" onclick="remove()" style="background: rgb(32, 159, 220);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 删除 </button>
            <button class="bt" id="btnUpdate" onclick="repalceimg()" style="background: rgb(226 96 174);border: 1px solid rgb(226 96 174);color: rgb(255, 255, 255);">替换</button>
        </div>
        <#if ListImg??>
            <#list ListImg as Img>

                <div class="drag-item" draggable="true" id=${Img.attId} onclick="ClickBorder(this)">

                    <div style="height: 20px;z-index: 999;background: #00000096;margin-top: 238px;">
                        <input type="checkbox" id="${Img.attId}" accessKey="${Img.path}" name="checkId" style="z-index: 999;width: 100%;margin-left: -148px;" onclick="InputClickBorder(this)" />
                        <p style="text-align: center;margin-top: -22px;color: #fff">${Img.cnSort}</p>
                    </div>
                    <img src="/attImages${Img.path}" class="drag-pic" draggable="false" id="${Img.path}" >

                </div>
                <div class="NU"><input class="itemtext" type="text" id="${Img.attId}" value="${Img.pictureDescription}" onchange="updatePicDes(this,'${Img.attId}')" /></div>

            </#list>
        </#if>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var TechMainID = '${TechMainID}';
    var uploader = null;
    var AttIDS = "";
    $(function () {
        // initDocuments();
    });

    function addZipFile() {
        var idex = mini.open({
            url: '/Exper/addzipfileindex?Mode=Add&TechMainID=' + TechMainID + '&UploadUrl=/Exper/upload',
            width: 800,
            height: 400,
            title: "上传图片附件",
            onload: function () {
                var iframe = this.getIFrameEl();
                iframe.contentWindow.addEvent('eachFileUploaded', function (data, xmini, xwindow) {
                    xmini.alert('图片附件上传成功', '系统提示', function () {
                        xwindow.CloseOwnerWindow('yes');
                    });
                });
                iframe.contentWindow.addEvent('uploadError', function (result, xmini, xwindow) {
                    xmini.alert(packageLine(result.message), '图片附件上传失败', function () {
                        xwindow.CloseOwnerWindow('ok');
                    });
                });
            },
            ondestroy: function () {
                // grid.reload();
                var tree = mini.get('#ZipFileTree');
                tree.reload();
            }
        });
    }

    function addImgFile() {
        var idex = mini.open({
            url: '/Exper/addimgfileindex?Mode=Add&TechMainID=' + TechMainID + '&UploadUrl=/Exper/upload',
            width: 800,
            height: 400,
            title: "上传技术方案图纸/照片",
            onload: function () {
                var iframe = this.getIFrameEl();
                iframe.contentWindow.addEvent('eachFileUploaded', function (data, xmini, xwindow) {
                    xmini.alert('技术方案图纸/照片上传成功', '系统提示', function () {
                        getImageList();
                        xwindow.CloseOwnerWindow('yes');
                    });
                });
                iframe.contentWindow.addEvent('uploadError', function (result, xmini, xwindow) {
                    xmini.alert(packageLine(result.message), '技术方案图纸/照片上传失败', function () {
                        xwindow.CloseOwnerWindow('ok');
                    });
                });
            },
            ondestroy: function () {
                // grid.reload();
                getImageList();
            }
        });
    }

    function  packageLine(msg){
        if(!msg) return "";
        var all=[];
        var single=[];
        var ms=msg.split(',');
        if(ms<=6) return msg;
        for(var i=0;i<ms.length;i++){
            var m=ms[i];
            single.push(m);
            if(single.length==3){
                all.push(single.join(','));
                single=[];
            }
        }
        if(single.length>0){
            all.push(single.join(','));
        }
        return all.join('<br/>');
    }

    function downloadZip(AttID) {
        var url = "/Exper/download?AttID="+AttID;
        $.fileDownload(url, {
            httpMethod: 'POST',
            successCallback: function (xurl) {

            },
            failCallback: function (html, xurl) {
                mini.alert('下载错误:' + html, '系统提示');
            }
        });
    }

    function deleteZip(AttID, Path) {
        mini.confirm("确认删除此图片附件？","系统提示",function (act) {
            if (act == 'ok') {
                var url = "/Exper/deleteById";
                $.post(url, {AttID: AttID, TechMainID: TechMainID, Type: "Zip", Path: Path}, function (r, c) {
                    var res = mini.decode(r);
                    if (res['success']) {
                        function g() {
                            var tree = mini.get('#ZipFileTree');
                            tree.reload();
                        }

                        g();
                        mini.alert('图片附件已删除!', '系统提示');
                    }
                });
            }
        })
    }

    function afterload(e) {
        var tree = mini.get('#ZipFileTree');
        function updateNodeName() {
            return tree.findNodes(function (node) {
                var Sort = node["Sort"];
                var AttID = node["AttID"];
                var Path = node["path"];
                var DelMet = "deleteZip('" + AttID + "','" + Path + "')";
                var DowMet = "downloadZip('" + AttID + "')";
                var Delete = '<a href="#" onclick="' + DelMet + '">删除</a>';
                var Download = '<a href="#" onclick="'+ DowMet + '">下载</a>';
                tree.updateNode(node, {Attached:Sort + "." + showEllipsis(node["Attached"]) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + Delete + "&nbsp;&nbsp;&nbsp;&nbsp;" + Download});
            });
        }
        updateNodeName();
    }
    
    function showEllipsis(txt) {
        var last = 0;
        var all = txt.length;
        var first = txt.substring(0,6);
        last = all - 5;
        txt = first + "..." + txt.substring(last, all);
        return txt;
    }

    function getImageList() {
        var url = "/Exper/getImageList";
        var arg = {TechMainID: TechMainID, Type: "Img"};
        var con = "";
        $.post(url, arg, function (res) {
            if (res.success) {
                var data = res.data;
                con += "<div class=\"anniuzu\">" +
                    "            <button class=\"bt\" onclick=\"SelectAll()\" style=\"background: rgba(255, 91, 91, 0.77);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);\"> 全选 </button>" +
                    "            <button class=\"bt\" onclick=\"RemoveSelectAll()\" style=\"background: rgb(171, 78, 255);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);\"> 取消全选 </button>" +
                    "            <button class=\"bt\" onclick=\"remove()\" style=\"background: rgb(32, 159, 220);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);\"> 删除 </button>" +
                    "            <button class=\"bt\" id=\"btnUpdate\" onclick=\"repalceimg()\" style=\"background: rgb(226 96 174);border: 1px solid rgb(226 96 174);color: rgb(255, 255, 255);\">替换</button>" +
                    "        </div>"
                for (var i=0;i<data.length;i++) {
                    var path = data[i].path;
                    var cnsort = data[i].cnSort;
                    var attached = data[i].attached;
                    var attId = data[i].attId;
                    var pictureDescription = data[i].pictureDescription;
                    con += "<div class=\"drag-item\" draggable=\"true\" id=" + attId + " onclick='ClickBorder(this)'>" +
                        "                    <div style=\"height: 20px;z-index: 999;background: #00000096;margin-top: 238px;\">" +
                        "                        <input type=\"checkbox\" id=" + attId + " accessKey=" + path + " name=\"checkId\" style=\"z-index: 999;width: 100%;margin-left: -148px;\" onclick='InputClickBorder(this)' />" +
                        "                        <p style=\"text-align: center;margin-top: -22px;color: #fff\">" + cnsort + "</p>\n" +
                        "                    </div>" +
                        "                    <img src=\"/attImages" + path + "\" class=\"drag-pic\" draggable=\"false\" id=\"" + path + "\" >" +
                        "                </div>" +
                        "                <div class=\"NU\"><input class=\"itemtext\" type=\"text\" id=\"" + attId + "\" value=\"" + pictureDescription + "\" onchange='updatePicDes(this,\"" + attId + "\")' /></div>"
                }
                $("#drag-div").html(con);
            }
        })
    }

    var settings = {
        mode: '${Mode}',
        configName: 'Default',
        ///上传地址
        uploadUrl: '/Exper/replaceatt',
        browseId: 'btnUpdate',
        Filters: {
            mime_type: [
                // {title: 'rar files', extensions: 'zip,rar,7z'}
                // {title: 'Office文档', extensions: 'doc,docx,xls,xlsx'},
                // {title: 'pdf文档', extensions: 'pdf'},
                {title: '图片', extensions: 'jpg,bmp,gif,png'}
            ]
        },
        multipart_params: {},
        ///是否显示设置附件类型
        showConfig: false,
        afterAddFile: null,
        afterLoad: null,
        afterInit: null,
        eachFileUpload: null,
    };
    function repalceimg() {
        var checkId=$("input[name='checkId']:checked");
        if(checkId.length == 0){
            mini.alert("请选择需要替换的技术方案图纸/照片!");
            return;
        }else if (checkId.length > 1){
            mini.alert("一次只能替换一张技术方案图纸/照片!");
            return;
        }
        else {
            for (var i=0;i<checkId.length;i++) {
                AttIDS = checkId[i].id;//获取勾选的值 也就是 input的value
            }
        }
    }

    function addEvent(event, fun) {
        if (eventFun[event]) {
            eventFun[event] = fun;
        }
    }

    window.addEvent = addEvent;
    var commitUrl = '';

    function initDocuments() {
        var filters = settings['Filters'] || "{}";
        var maxLength = settings['MaxLength'] || "100M";
        if (filters) {
            if (typeof (filters) == "string") filters = mini.decode(filters);
        }
        uploader = new plupload.Uploader({
            browse_button: settings.browseId,
            url: settings.uploadUrl,
            flash_swf_url: '/js/plupload/Moxie.swf',
            silverlight_xap_url: '/js/plupload/Moxie.xap',
            filters: filters,
            multipart: true,
            multi_selection: false,
            multiple_queues: false,
            max_file_size: maxLength,
            prevent_duplicates: true,
            init: {
                Error: function (a, b) {
                    var errorCode = parseInt(b.code);
                    var file = b.file;
                    if (errorCode == -600) {
                        mini.alert(file.name + '太大，不能上传。');
                    } else if (errorCode == -601) {
                        mini.alert('服务器不允许上传此文件。');
                    } else if (errorCode == -602) {
                        mini.alert(file.name + '已在待传列表，请勿重复选择。');
                    }
                },
                FilesAdded: function (up, files) {
                    up.setOption("multipart_params", {
                        AttID: AttIDS
                    });
                    up.start()
                },
                UploadProgress: function (up, file) {

                },
                UploadComplete: function (up, file) {
                    getImageList();
                },
                FileUploaded: function (up, file, res) {

                }
            }
        });
        uploader.init();
    }

    function updatePicDes(obj, AttID) {
        var value = obj.value;
        var url = "/Exper/updatePicDes";
        var arg = {Value: value, AttID: AttID};
        $.post(url, arg, function (res) {
            if (res.success) {
                var data = res.data;
                getImageList();
            }
        });
    }

    function ClickBorder(obj){
        $(".drag-item").removeClass("ClickBorder");
        $("#" + obj.id).addClass("ClickBorder");

        var chk = document.getElementsByTagName("input");
        for (var i = 0; i < chk.length; i++) {
            if (chk[i].type == 'checkbox') {
                chk[i].checked = false;
            }
        }
        var checkbox = $("#" + obj.id).find("input");
        checkbox[0].checked = true;
        initDocuments();
    }
    function InputClickBorder(obj){
        $(".drag-item").click = "";
        event.stopPropagation();
        var checkbox = $("#"+obj.id).find("input");
        if (checkbox[0].checked == true) {
            $("#" + obj.id).addClass("ClickBorder");
            checkbox[0].checked = true;
        }else {
            $("#" + obj.id).removeClass("ClickBorder");
            checkbox[0].checked = false;
        }
        initDocuments();
    }
    var dragSort = new dragSort({
        id : 'drag-div', // 拖动父级div框的ID
        drag: 'drag-item', //拖动元素
        atttype: 'Img',
        rowvalue: TechMainID,
        times: '1000', // 动画时长（默认一秒钟）
    })
    function SelectAll() {
        var chk = document.getElementsByTagName("input");
        for (var i=0;i<chk.length;i++){
            if (chk[i].type == 'checkbox'){
                chk[i].checked = true;
            }
        }
        $(".drag-item").addClass("ClickBorder");
    }
    function RemoveSelectAll() {
        var chk = document.getElementsByTagName("input");
        for (var i=0;i<chk.length;i++){
            if (chk[i].type == 'checkbox'){
                chk[i].checked = false;
            }
        }
        $(".drag-item").removeClass("ClickBorder");
    }
    function remove() {
        var ids = [];
        var paths = [];
        var checkId=$("input[name='checkId']:checked");
        if(checkId.length == 0){
            mini.alert("请选择需要删除的技术方案图片/照片!");
            return;
        }else {
            for (var i=0;i<checkId.length;i++) {
                ids.push(checkId[i].id);//获取勾选的值 也就是 input的value
                paths.push(checkId[i].accessKey);
            }
        }
        mini.confirm('确定删除所选择的技术方案图片/照片吗?','删除提示',function (act) {
            if (act == 'ok'){
                var url = "/Exper/batchDeleteById";
                $.post(url, {AttID: mini.encode(ids),Paths: mini.encode(paths), TechMainID: TechMainID,Type: "Img"}, function (r, c) {
                    var res = mini.decode(r);
                    if (res['success']) {
                        function g() {
                            getImageList()
                        }
                        g();
                        mini.alert('技术方案图片/照片已删除!', '系统提示');
                    }
                });
            }
        });
    }
</script>
</body>
</html>