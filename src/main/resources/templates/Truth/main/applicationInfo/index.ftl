<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>申请人基本信息</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <style>
        .row{margin-top: 10px;width: 98%;margin: 10px auto;}
        .anniu ul{margin-left: -59px;}
        .anniu ul li{list-style: none;float: left;margin-left: 15px;}
        .con{border: 1px solid silver; }
        .leftmenu{border-right: 1px solid silver;}
        .leftmenu ul{margin-left: -33px;margin-top: 20px;}
        .leftmenu ul li{list-style: none;padding-bottom: 35px;}
        .righttext ul{margin-left: -33px;margin-top: 15px;}
        .righttext ul li{list-style: none;color:rgb(27,98,171) ;}
        .righttext ul li input[type=text]{height: 30px; border: 1px solid rgb(27,98,171);}

        .checkli li{list-style: none;float: left;padding-right: 30px;}

    </style>
    <#--    miniui开始-->
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <#--    miniui结束-->
</head>
<body>

<div class="row">
    <div class="col-md-8 con" >
        <div class="row">
            <div class="col-md-2 leftmenu">
                <ul>
                    <li><a href="#">申请人名称*</a></li>
                    <li><a href="#">材料撰写人*</a></li>
                    <li><a href="#">专利技术状态</a></li>
                    <li><a href="#">申请专利目的</a></li>
                    <li><a href="#">申请类型</a></li>
                    <li><a href="#">其他要求</a></li>
                </ul>
            </div>
            <div class="col-md-10 righttext" id="ApplicationInfoForm">
                <ul>
                    <li><input class="mini-textbox" id="shenqingrxm" name="shenqingrxm" style="width: 100%;" required="true"/></li>
                    <li>
                        <input class="mini-textbox" id="writer" name="writer" style="width: 30%;margin-top: 24px;"/>
                        &nbsp;联系电话*&nbsp;&nbsp;<input class="mini-textbox" id="linkPhone" name="linkPhone" />&nbsp;
                        &nbsp;联系邮箱&nbsp;&nbsp;<input class="mini-textbox" id="linkMail" name="linkMail" style="width: 25%;" />
                        <input class="mini-hidden" name="createMan"/>
                        <input class="mini-hidden" name="createTime"/>
                        <input class="mini-hidden" name="id">
                    </li>
                    <li style="margin-top: 32px;">
                        <div name="techStatus" class="mini-radiobuttonlist" repeatDirection="vertical" style="width:100%"
                             textField="text" valueField="id" value="0" data="[{id: 1, text: '构想阶段'}, {id: 2, text: '验证阶段'}, {id: 3, text: '量试阶段'}, {id: 4, text: '即将销售'}, {id: 5, text: '客户试用'}, {id:6, text: '已公开销售'}]"
                             enabled="true"></div>
                    </li>
                    <li style="margin-top: 30px;">
                        <div name="applyTarget" class="mini-radiobuttonlist" repeatDirection="vertical" style="width:100%"
                             textField="text" valueField="id" value="0" data="[{id: 1, text: '自己实施'}, {id: 2, text: '限制他人实施'}, {id: 3, text: '高薪企业认定'}, {id: 4, text: '其他'}]"
                             enabled="true"></div>
                    </li>
                    <li style="margin-top: 30px;">
                        <div name="applyType" class="mini-radiobuttonlist" repeatDirection="vertical" style="width:100%"
                             textField="text" valueField="id" value="0" data="[{id: 1, text: '发明'}, {id: 2, text: '实用'}, {id: 3, text: '发明与实用同时申请'}, {id: 4, text: '外观设计'}, {id: 5, text: '暂未确定'}]"
                             enabled="true"></div>
                    <li style="margin-top: 25px;"><input class="mini-textbox" id="others" name="others" style="width: 100%;" /></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    mini.parse();
    var formData = ${LoadData};
    var TechnologyID = '${TechnologyID}';
    $(function () {
        var form = new mini.Form("#ApplicationInfoForm");
        var alls = form.getFields();
        for (var i=0;i<alls.length;i++ ) {
            var id = alls[i].id;
            // if (id == "shenqingrxm" || id == "others" || id == "writer" || id == "linkPhone" || id == "linkMail") {
            //     mini.get(id).on('valuechanged', function (e) {
            //         save();
            //     })
            // }else {
            //     mini.get(id).on('valuechanged', function (e) {
            //         save();
            //     })
            // }
            mini.get(id).on('valuechanged', function (e) {
                    save();
            })
        }

        form.setData(formData);
    });

    function save() {
        var form = new mini.Form("#ApplicationInfoForm");
        var Data = form.getData();
        form.validate();
        if (form.isValid()) {
            // form.loading("保存中...");
            var arg = {
                Data: mini.encode(Data),
                TechnologyID: TechnologyID
            };
            var url = "/ApplicationInfo/save";
            $.post(url, arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success) {
                        var data = res.data || {};
                        // mini.alert('申请人基本信息保存成功！','系统提示',function(){
                        //     form.setData(data);
                        // });
                        mini.alert(data.id);
                        form.setData(data);
                        parent.GetChildTechMainID(data.id);
                    }else mini.alert(res.message);
                    form.unmask();
                }
            )
        }
    }
</script>
</body>
</html>