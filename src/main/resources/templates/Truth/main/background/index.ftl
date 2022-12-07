<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>技术背景</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        .row{margin-top: 10px;width: 98%;margin: 10px auto;}
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .miaos{color:rgb(27,98,171) ;}
        .ckb{border: 1px solid silver;text-align: center;height: 505px;overflow-y: auto;overflow-x: auto;}
        .ckmoban{height: 30px;border-bottom: 1px solid silver;margin-top: 20px;color:rgb(27,98,171);}
    </style>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>

<div class="col-md-7" id="BackGroundForm">
    <p class="miaos">描述您需要申请专利的技术当前传统方式或现有方式是什么样的，客观的指出该现有技术中存在的问题和缺点
        （这些缺点应该是你的专利技术能够解决的），说明存在这种问题和缺点的原因以及解决这些问题时曾经遇到
        的困难，无法用文字表达清楚的，可以结合现有技术图纸进行描述。
    </p>
    <p class="miaos">技术背景</p>
    <textarea class="mini-textarea" style="width: 100%;" rows="20" id="techContent" name="techContent"></textarea>
    <input class="mini-hidden" name="techMainId"/>
    <input class="mini-hidden" name="subId"/>
    <input class="mini-hidden" name="createTime"/>
    <input class="mini-hidden" name="createMan"/>
</div>
<script type="text/javascript">
    mini.parse();
    var formData = ${LoadData};
    $(function () {
        mini.get('#techContent').on('valuechanged', function (e){
            save()
        })

        var form = new mini.Form("#BackGroundForm");
        form.setData(formData);
    })

    function save() {
        var form = new mini.Form("#BackGroundForm")
        var Data = form.getData();
        form.validate();
        if (form.isValid()) {
            // form.loading("保存中...");
            var arg = {
                Data: mini.encode(Data),
                TechMainID: ${TechMainID}
            }
            var url = "/BackGround/save";
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