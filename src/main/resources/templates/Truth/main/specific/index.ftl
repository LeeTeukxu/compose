<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>具体技术方案</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>

    <style>
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .actionbar{border: 1px solid silver;margin-left: -15px;width: 40%;height: 50px;}
        .actionbar button{margin-top: 8px;margin-left: 10px;}
        .keyword{width: 100%;margin-left: -15px;margin-top: 15px;display: flex;flex-direction: row;}
        .keyword .Scheme1 .Schemetitle{color: rgb(27,98,171);}
        .keyword .Scheme1 textarea{border: 1px solid rgb(27,98,171);}
    </style>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>

<div class="col-md-7 co" id="divSpecific">
    <div class="actionbar">
        <button type="button" class="btn btn-primary" onclick="AddSingle()">分条添加关键改进点</button>
        <button type="button" class="btn btn-primary">撰写规范</button>
        <button type="button" class="btn btn-primary">保存</button>
    </div>
    <div class="keyword" id="ProposalKeyword">
        <div class="Scheme1">
            <p class="Schemetitle">1.本技术方案（详细描述本技术方案的内容）</p>
            <textarea class="mini-textarea" cols="70%" rows="5" id="improve" name="improve"></textarea>
        </div>
        <div class="jg" style="visibility: hidden;">1</div>
        <div class="Scheme1">
            <p class="Schemetitle">本技术方案的主要技术目的</p>
            <textarea class="mini-textarea" cols="40%" rows="5" id="target" name="target"></textarea>
            <input class="mini-hidden" id="subId" name="subId">
            <input class="mini-hidden" id="techMainId" name="techMainId">
            <input class="mini-hidden" id="createTime" name="createTime">
            <input class="mini-hidden" id="createMan" name="createMan">
        </div>
    </div>
    <div id="divCenter">
        <input class="mini-hidden" id="tinyId" name="tinyId">
        <input class="mini-hidden" id="mainId" name="mainId">
        <input class="mini-hidden" id="createTime" name="createTime">
        <input class="mini-hidden" id="createMan" name="createMan">
    </div>
    <div class="keyword" id="PrincipleKeyword">
        <div class="Scheme1">
            <p class="Schemetitle">3.本技术方案工作原理（描述本技术方案的运行动作/工作原理/操作方法）</p>
            <textarea class="mini-textarea" cols="70%" rows="5" id="worky" name="worky"></textarea>
        </div>
    </div>

</div>
<script type="text/javascript" src="/js/common/specific.js"></script>
<script type="text/javascript">
    mini.parse();
    var specificNum = ${specificNum};
    var specific = new append();
    var mainData = ${MainData};
    var detailData = ${DetailData};
    var Mode = "${Mode}";

    $(function () {
        if (Mode == "Add") {
            init();
        }else {
            var initcontent = loadhtml();
            specific.init(initcontent);
            if (mainData.createTime != undefined) {
                var form = new mini.Form('#ProposalKeyword');
                mainData.createTime = new Date(mainData.createTime);
                form.setData(mainData);
            }
            mini.get('worky').setValue(mainData.worky);
            loadcontent();
        }
        SetMethod(specificNum);
    })

    function init() {
        var content = specific.getContent(specificNum);
        specific.init(content);
    }

    function AddSingle() {
        specificNum += 1;
        var content = specific.getContent(specificNum);
        specific.addsingle(content, specificNum);
    }

    function save(No) {
        var MainForm = new mini.Form("#ProposalKeyword");
        var DetailForm = new mini.Form("#divCenter");

        var MainData = MainForm.getData();
        var DetailData = DetailForm.getData();

        MainForm.validate();
        DetailForm.validate();
        var arg = {};
        if (MainForm.isValid() && DetailForm.isValid()) {
            arg = {
                MainData: mini.encode(MainData),
                DetailData: mini.encode(DetailData),
                Worky: mini.get('worky').getValue(),
                TechMainID: ${TechMainID},
                SpecificNum: No
            };
            var url = "/Specific/save";
            $.post(url, arg, function (text) {
                var res = mini.decode(text);
                if(res.success) {
                    var data = res.data || {};
                    MainForm.setData(data.main);
                    var detailDatas = data.listDetail;
                    if (detailDatas.length > 0) {
                        for (var i=0;i<detailDatas.length;i++) {
                            var Code = detailDatas[i].code;
                            var Improve = detailDatas[i].improve;
                            var Target = detailDatas[i].target;
                            mini.get('improve&' + Code).setValue(Improve);
                            mini.get('target&' + Code).setValue(Target);
                            mini.get('createTime&' + Code).setValue(new Date(detailDatas[i].createTime));
                            mini.get('createMan&' + Code).setValue(detailDatas[i].createMan);
                            mini.get('tinyId&' + Code).setValue(detailDatas[i].tinyId);
                            mini.get('mainId&' + Code).setValue(detailDatas[i].mainId);
                        }
                    }
                }else mini.alert(res.message);
                // form.unmask();
            })
        }
    }

    function SetMethod() {
        var form = new mini.Form("#divSpecific");
        var alls = form.getFields();
        for (var i=0;i<alls.length;i++) {
            var id = alls[i].id;
            mini.get(id).on('valuechanged', function (e) {
                save(specificNum);
            })
        }
    }

    function loadhtml() {
        var initcontent = "";
        for (var i=1;i<=specificNum;i++) {
            initcontent +='<div class="keyword" id="CenterKeyword' + i + '">' +
                '        <div class="Scheme1">' +
                '            <p class="Schemetitle">2.关键改进点' + i + '（分条描述本技术方案中的关键改进点内容）<a href="#" onclick="removesingle(' + i +')">删除</a></p>' +
                '            <textarea class="mini-textarea" cols="70%" rows="5" id="improve&' + i + '" name="improve&' + i + '"></textarea>' +
                '        </div>' +
                '        <div class="jg" style="visibility: hidden;">1</div>' +
                '        <div class="Scheme1">' +
                '            <p class="Schemetitle">改进点' + i + '的技术目的</p>' +
                '            <textarea class="mini-textarea" cols="40%" rows="5" id="target&' + i + '" name="target&' + i + '"></textarea>' +
                '           <input class="mini-hidden" id="createTime&' + i + '" name="createTime&' + i + '">' +
                '           <input class="mini-hidden" id="createMan&' + i + '" name="createMan&' + i + '">' +
                '           <input class="mini-hidden" id="tinyId&' + i + '" name="tinyId&' + i + '">' +
                '           <input class="mini-hidden" id="mainId&' + i + '" name="mainId&' + i + '">' +
                '        </div>' +
                '    </div>';
        }
        return initcontent;
    }

    function loadcontent() {
        for (var i=0;i<detailData.length;i++) {
            var code = detailData[i].code;
            mini.get('tinyId&' + code).setValue(detailData[i].tinyId);
            mini.get('mainId&' + code).setValue(detailData[i].mainId);
            mini.get('improve&' + code).setValue(detailData[i].improve);
            mini.get('target&' + code).setValue(detailData[i].target);
            mini.get('createTime&' + code).setValue(new Date(detailData[i].createTime));
            mini.get('createMan&' + code).setValue(detailData[i].createMan);
        }
    }
</script>
</body>
</html>