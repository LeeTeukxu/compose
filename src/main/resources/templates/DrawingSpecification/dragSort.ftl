<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <title>文件拖动排序</title>
    <script src="/js/dragSort.js?v=${version}"></script>
    <script src="/js/jquery-1.9.min.js"></script>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>


    <#--    miniui结束-->
    <style media="screen">
        #drag-div { display: block; margin: 10px auto; width: 1000px;height:800px;overflow-x: hidden;overflow-y: auto;}
        #drag-div::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}
        .drag-item { display: block; position: relative; float: left;width: 171px;height: 157px; border: 1px solid #CCC; margin: 10px;    margin-top: 30px; }
        .close { border: 1px solid red; position: absolute; right: 0; width: 17px; height: 17px; z-index: 1; text-align: center; line-height: 17px; }
        .drag-pic { width: 100%; height: 100%; position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;z-index: -1;}
        .itemtext{width: 100%;}
        .anniuzu{display: block; margin: 10px auto; width: 1000px;text-align: center;}
        .anniuzu .bt{margin-top: 32px;margin-left: 12px;width: 75px;height: 30px;border-radius: 4px;}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .NU{display: block;
            position: relative;
            float: left;
            width: 171px;
            /* height: 157px; */
            /* border: 1px solid #CCC; */
            /* margin: 10px; */
            margin-top: 186px;
            margin-left: -181px;}
    </style>

</head>
<body>
<div class="anniuzu">
    <button class="bt" onclick="SelectAll()" style="background: rgba(255, 91, 91, 0.77);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 全选 </button>
    <button class="bt" onclick="RemoveSelectAll()" style="background: rgb(171, 78, 255);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 取消全选 </button>
    <button class="bt" onclick="remove()" style="background: rgb(32, 159, 220);border: 1px solid rgb(32, 159, 220);color: rgb(255, 255, 255);"> 删除 </button>
    <button class="bt" onclick="repalceimg()" style="background: rgb(226 96 174);border: 1px solid rgb(226 96 174);color: rgb(255, 255, 255);">替换</button>
    <button class="bt" onclick="zhaiyofutu()" style="background: rgb(255, 173, 51);border: 1px solid rgb(255, 173, 51);color: rgb(255, 255, 255);width: 101px;"> 设置摘要附图 </button>
    <button class="bt" onclick="CloseWindow('ok')" style="background: rgba(107, 191, 145, 0.77);border: 1px solid rgba(107, 191, 145, 0.77);color: rgb(255, 255, 255);"> 关闭</button>
</div>
<div id="drag-div">
    <#if lists??>
        <#list lists as list>

            <div class="drag-item" draggable="true" id=${list.attId} onclick="ClickBorder(this)">

                <div style="height: 20px;z-index: 999;background: #00000096;">
                    <input type="checkbox" id="${list.attId}" accessKey="${list.path}" name="checkId" style="z-index: 999;width: 100%;margin-left: -75px;" onclick="InputClickBorder(this)" />
                    <p style="text-align: center;margin-top: -22px;color: #fff">${list.cnSort}</p>
                </div>
                <img src="/attImages/${list.path}" class="drag-pic" draggable="false" id="${list.path}" >

            </div>
            <div class="NU"><input class="itemtext" type="text" id="${list.attId}" value="${list.pictureDescription}" onblur="editContent(this)" /></div>

        </#list>
    </#if>
</div>
</body>
<script type="text/javascript">
    mini.parse();
    var RowValue = '${RowValue}';

    function editContent(obj) {
        var url = "/DrawingSpecification/updatepicturedescription";
        var arg = {AttID:obj.id,PictureDescription:obj.value};
        var iid = mini.loading('正在保存数据.....');
        $.post(url,arg,function (result) {
            if (result.success == false){
                mini.alert(result.message);
                window.location.reload();
            }
            mini.hideMessageBox(iid);
        })
    }

    function repalceimg() {
        var attid = "";
        var accesskey = ""
        var checkId=$("input[name='checkId']:checked");
        if(checkId.length == 0){
            mini.alert("请选择需要替换的说明书附图!");
            return;
        }else if (checkId.length > 1){
            mini.alert("一次只能替换一张说明书附图!");
            return;
        }else {
            for (var i=0;i<checkId.length;i++) {
                attid = checkId[i].id;//获取勾选的值 也就是 input的value
                accesskey = checkId[i].accessKey;
            }
        }
        var url ="/DrawingSpecification/PicturereplacementIndex?AttID="+attid+"&accesskey="+accesskey;
        mini.open({
            url:url,
            width:'60%',
            height:'70%',
            showModal:true,
            ondestroy:function(){
                window.location.reload();
            }
        });
    }

    function remove() {
        var ids = [];
        var checkId=$("input[name='checkId']:checked");
        if(checkId.length == 0){
            mini.alert("请选择需要删除的说明书附图!");
            return;
        }else {
            for (var i=0;i<checkId.length;i++) {
                ids.push(checkId[i].accessKey);//获取勾选的值 也就是 input的value
            }
        }
        mini.confirm('确定删除所选择的附图吗?','删除提示',function (act) {
            if (act == 'ok'){
                var url = "/DrawingSpecification/newremove";
                $.ajax({
                    contentType: 'application/json',
                    method: "post",
                    url: url,
                    data: mini.encode(ids),
                    success: function (r) {
                        if (r['success']){
                            mini.alert("删除成功！",'删除提示',function () {
                                window.location.reload();
                            });
                        }else mini.alert("删除失败！");
                    },
                    failure:function (error) {
                        mini.alert(error);
                    }
                });
            }
        });
    }
    function zhaiyofutu() {
        var ids = [];
        var checkId=$("input[name='checkId']:checked");
        if(checkId.length == 0){
            mini.alert("请选择要上传的摘要附图!");
            return;
        }else if (checkId.length > 1){
            mini.alert("一次只能上传一张摘要附图!");
            return;
        }else {
            ids.push(checkId[0].accessKey);
            zhaiyao(ids);
        }

    }
    function zhaiyao(ids) {
        mini.confirm('确认将该图片作为摘要附图?','系统提示',function (act) {
            if (act == 'ok'){
                var url = "/AbstractAttached/zhaiyao";
                $.ajax({
                    contentType: 'application/json',
                    method: "post",
                    url: url,
                    data: mini.encode(ids),
                    success: function (r) {
                        if (r['success']){
                            mini.alert("上传成功！","系统提示",function () {

                            });
                        }else mini.alert("上传失败！");
                    },
                    failure:function (error) {
                        mini.alert(error);
                    }
                });
            }
        });
    }
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
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
    }
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
    var dragSort = new dragSort({
        id : 'drag-div', // 拖动父级div框的ID
        drag: 'drag-item', //拖动元素
        atttype: '',
        rowvalue: RowValue,
        times: '1000', // 动画时长（默认一秒钟）
    })
</script>
</html>
