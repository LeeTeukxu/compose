<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>专利主题名称</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        .row{margin-top: 10px;width: 98%;margin: 10px auto;}
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .con{border: 1px solid silver; }
        .xxp{color: rgb(27,98,171);}
        .ckb{border: 1px solid silver;text-align: center;height: 505px;overflow-y: auto;overflow-x: auto;}
        .ckmoban{height: 30px;border-bottom: 1px solid silver;margin-top: 20px;color:rgb(27,98,171);}
    </style>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>
<div class="row">
    <div class="col-md-8 con">
        <div class="row" id="TechSubjectForm">
            <div class="col-md-9" style="margin-top: 20px;">
                <p class="xxp" style="margin-left: 10%;">根据要申请专利的技术方案，给您的专利起个初步名称，比如：xx设备，装置，方法，工艺。电路等；</p>
                <p class="xxp">专利名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="mini-textbox" id="name" name="name" style="width: 80%;" /></p>
                <input class="mini-hidden" name="techMainId"/>
                <input class="mini-hidden" name="subId"/>
                <input class="mini-hidden" name="createTime"/>
                <input class="mini-hidden" name="createMan"/>
            </div>
        </div>

        <div class="row" id="TruthFieldForm">
            <div class="col-md-9" style="margin-top: 20px;">
                <p class="xxp" style="margin-left: 10%;">描述您的技术方案所属的具体技术领域，比如：属于反应釜技术领域，属于茶叶生产技术领域等；</p>
                <p class="xxp">具体技术领域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="mini-textbox" id="technicalField" name="technicalField" style="width: 80%;" /></p>
                <input class="mini-hidden" name="id"/>
                <input class="mini-hidden" name="userId"/>
                <input class="mini-hidden" name="rowValue"/>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    mini.parse();
    var formData = ${LoadData};
    var techData = ${TechData};
    $(function () {
        mini.get('#name').on('valuechanged', function (e){
            save()
        });
        mini.get('#technicalField').on('valuechanged', function (e) {
            saveTruthField();
        });

        var form = new mini.Form("#TechSubjectForm");
        form.setData(formData);
        var techform = new mini.Form("#TruthFieldForm")
        techform.setData(techData);
    })

    function save() {
        var form = new mini.Form("#TechSubjectForm")
        var Data = form.getData();
        form.validate();
        if (form.isValid()) {
            // form.loading("保存中...");
            var arg = {
                Data: mini.encode(Data),
                TechMainID: ${TechMainID}
            }
            var url = "/Subject/save";
            $.post(url, arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success) {
                        var data = res.data || {};
                        // mini.alert('专利主题名称保存成功！','系统提示',function(){
                        //     form.setData(data);
                        // })
                        form.setData(data);
                    }else mini.alert(res.message);
                    form.unmask();
                }
            )
        }
    }

    function saveTruthField() {
        var form = new mini.Form("#TruthFieldForm");
        var Data = form.getData();
        form.validate();
        if (form.isValid()) {
            // form.loading("保存中...");
            var arg = {
                Data: mini.encode(Data),
                TechMainID: ${TechMainID}
            }
            var url = "/TechnicalField/saveTruthField";
            $.post(url, arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success) {
                        var data = res.data || {};
                        // mini.alert('专利主题名称保存成功！','系统提示',function(){
                        //     form.setData(data);
                        // })
                        form.setData(data);
                    }else mini.alert(res.message);
                    form.unmask();
                }
            )
        }
    }
</script>
</body>
</html>