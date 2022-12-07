<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" type="text/css" href="/css/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/bigsmall/css/main.css" />

    <script type="text/javascript">var IMGDIR = '/bigsmall/images/', VERHASH = 'zfhf', JSPATH = '/bigsmall/js/';</script>
    <script src="/bigsmall/js/common.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="/bigsmall/images/style.css" />

    <script id="script" src="/js/Jsequencing.js?v=${version}" iconfont="true"></script>
    <script type="text/javascript" src="/js/boot.js"></script>
    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>
    <script type="text/javascript" src="/bigsmall/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/bigsmall/js/main.js?v=${version}"></script>
    <script charset="utf-8" src="/js/kindeditor-min.js"></script>
    <script charset="utf-8" src="/lang/zh_CN.js"></script>
    <script src="/js/jquery-1.11.0.min.js"></script>
    <title>6.权利要求</title>
    <style>
        html{overflow: hidden;}
        .cwo{background: rgb(239,135,135);color: white}
/*        .highlightTextarea-container{display: none}
        .highlightTextarea-highlighter{display: none}*/
        .Operationgroup{width: 103%;margin-top: -50px;float: left;}
        .clearfix li{list-style: none;}
        .Writingspecification{width: 100%;}

        #ClaimsContent table tbody tr td textarea{width:100%;/*border-radius: 5px;*/border: 1px solid rgb(204,204,204);margin-top: -10px;height: 69px;resize: none;/*overflow-y: hidden;*/overflow-x: hidden;}
        /*#ClaimsContent table tbody tr td textarea::-webkit-scrollbar{width:130px;}*/
        /*#Dq1{margin-top: 22px;}
        #Cq1{margin-top: 10px;}*/
        .kuang{width: 99.5%; margin: -30px auto;margin-top: 67px;}
        .kuang h5{font-weight: initial;} .kuang h5 span{font-weight: 500;}
        .kuang .dqfmmd h5{margin-top: -10px;}
/*      .kuang .dqfmmd .delqy{color: red;padding-left: 10px;}*/
/*      .kuang .dqfmmd .oredby{color:#0066ff;padding-left: 10px;}*/
        .kuang .dqfmmd .DqObjectinvention{margin-top: -15px;}
        .kuang .dqjsfa h5{margin-top: -3px;}
        .kuang .dqjsfa .DqTechnicalsolutions{margin-top: -15px;}
        .kuang .dqyyxg h5{margin-top: 19px;}
        .kuang .dqyyxg .DqBeneficialeffect{margin-top: -15px;}
        .kuang .dqssl h5{margin-top: -1px}
        .kuang .dqssl .DqExamples{margin-top: -15px;}

        .kuang .cqfmmd h5{margin-top: -10px;}
/*        .kuang .cqfmmd .delqy{color: red;padding-left: 10px;}*/
   /*     .kuang .cqfmmd .oredby{color:#0066ff;padding-left: 10px;}*/
        .kuang .cqfmmd .CqObjectinvention{margin-top: -15px;}
        .kuang .cqjsfa h5{margin-top: -3px;}
        .kuang .cqjsfa .CqTechnicalsolutions{margin-top: -15px;}
        .kuang .cqyyxg h5{margin-top: -3px;}
        .kuang .cqyyxg .CqBeneficialeffect{margin-top: -15px;}
        .kuang .cqssl h5{margin-top: -1px;}
        .kuang .cqssl .CqExamples{margin-top: -15px;}

        .kuang .yyzx h5{margin-top: -10px;}
        .kuang .yyzx .Citationwriting{margin-top: -15px;}

         /*功能小按钮*/
        .oredby{/*background: rgba(27, 98, 171, 0.6);*/border: none;
            color: rgb(159,160,160);
            border-radius: 3px;
            text-decoration: none;
            padding: 3px 4px;
            margin-left: 12px;
            font-weight: bolder;}
        .oredby img{vertical-align: middle;margin-top: -1px;width: 12px;}
         /*   .oredby:hover{background:rgb(27,98,171);border:1px solid rgb(27,98,171);color:#fff;}*/
        .delqy{color: rgb(159, 160, 160);border-radius: 3px;padding: 3px 4px;margin-left: 12px;text-decoration: none;font-weight: bolder;color:rgb(239,135,135)}
        .delqy img{vertical-align: middle;margin-top: -1px;width: 12px;}
        .quclaims{color: rgb(51,51,51);border: 1px solid rgb(204,204,204);border-radius: 3px;text-decoration: none;padding: 3px 4px;margin-left: 12px;}
        .quclaims:hover{background:rgb(255,86,13);border:1px solid rgb(255,86,13);color:#fff;}

        .width_auto{width: 80%;}
        /*附图标记框*/
        .shrink{float: right;width: 50px;margin-top: 5px;}
        .PictureDisplay{
            float: right;
            width: 17%;
            height: 885px;
            display: inline;
            margin-top: -15px;
            margin-right: 0px;
            overflow: hidden;
        }
        .Picturetag *{display:inline-block;vertical-align:middle;}
        .PictureDisplay .Picturetag{width: 102%;height: 250px;/*border-bottom: 1px solid #dfe4e6;*/}
        .PictureDisplay .Picturetag h3*{display: inline-block;  vertical-align: middle;  }
        .PictureDisplay .Picturetag h3{margin-left: 8px;font-weight: bold;margin-top: 10px;height: 40px;width: 92.5%;border: none;background: rgb(224,224,224);}
        .PictureDisplay .Picturetag h3 p{margin-top: 8px;color: rgb(127,127,127);font-weight:bold;margin-left: 10px;}
        .PictureDisplay .Illustration{    width: 100%;
            height: 534px;
            margin-top: 5px;
            overflow-x: hidden;
            overflow-y: auto;
            margin-left: 4px;}
        .PictureDisplay .Illustration::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}

        /*#FileNametSave{height: 28px;width: 45px;background: rgb(87,184,236);border: none;border-radius: 5px;color: rgb(255,255,255);margin-top: 6px;margin-left:38px;}*/
        #FileNametSaveReplace{height: 28px;width: 60px;background: rgb(255,255,255);border: none;border-radius: 5px;color: rgb(127,127,127);font-weight: 800;margin-top: 6px;float: right;}
        #ftkuang{border: 1px solid #dfe4e6;width: 95%;margin-left: 8px;height: 624px;}
        /**/

        .width_auto #ClaimsContent{
            width: 100%;
            height: 779px;
            margin-top: -25px;
            overflow-x: hidden;
            overflow-y: auto;
            margin-left: -5px;
        }
        .width_auto #ClaimsContent::-webkit-scrollbar {/*滚动条整体样式*/width: 0px; /*高宽分别对应横竖bai滚动条的尺寸*/height: 0px;scrollbar-arrow-color:gray;}
        .mini-textbox-input{height: 178px;width: 312px;}

        .btn_list li{font-size: 10px}
        .btn_list li a{border-radius:4px;background:rgb(27,98,171);border:1px solid rgb(27,98,171);color:#fff;}
        .Yytext{width: 170px;height: 24px;border: 1px solid #d0d0d0;border-radius: 5px;}
        .ClickBorder {box-shadow: 0 2px 8px 0 rgb(87 184 236);}
        .MenuClick {background: rgb(87,184,236)!important;}


        .btn *{display:inline-block;vertical-align:middle}
        /* drag */
        #drag{position:absolute;top:100px;left:785px;width: 30%;background-color:#0606066b;border:1px solid #444;border-radius:5px;box-shadow:0 1px 3px 2px #666;}
        #drag .title{position:relative;height:27px;margin:5px;}
        #drag .title h2{font-size:14px;height:27px;line-height:24px;border-bottom:1px solid #A1B4B0;}
        #drag .title div{position:absolute;height:19px;top:2px;right:0;}
        #drag .title a,a.open{float:left;width:21px;height:19px;display:block;margin-left:5px;}
        a.open{position:absolute;top:10px;left:50%;margin-left:-10px;background-position:0 0;}
        a.open:hover{background-position:0 -29px;}
        #drag .title a.min{background-position:-29px 0;}
        #drag .title a.min:hover{background-position:-29px -29px;}
        #drag .title a.max{background-position:-60px 0;}
        #drag .title a.max:hover{background-position:-60px -29px;}
        #drag .title a.revert{background-position:-149px 0;display:none;}
        #drag .title a.revert:hover{background-position:-149px -29px;}
        #drag .title a.close{background-position:-89px 0;}
        #drag .title a.close:hover{background-position:-89px -29px;}
        #drag .content{overflow:auto;margin:0 5px;}
        #drag .resizeBR{position:absolute;width:14px;height:14px;right:0;bottom:0;overflow:hidden;cursor:nw-resize;background:url(img/resize.png) no-repeat;}
        #drag .resizeL,#drag .resizeT,#drag .resizeR,#drag .resizeB,#drag .resizeLT,#drag .resizeTR,#drag .resizeLB{position:absolute;background:#000;overflow:hidden;opacity:0;filter:alpha(opacity=0);}
        #drag .resizeL,#drag .resizeR{top:0;width:5px;height:100%;cursor:w-resize;}
        #drag .resizeR{right:0;}
        #drag .resizeT,#drag .resizeB{width:100%;height:5px;cursor:n-resize;}
        #drag .resizeT{top:0;}
        #drag .resizeB{bottom:0;}
        #drag .resizeLT,#drag .resizeTR,#drag .resizeLB{width:8px;height:8px;background:#FF0;}
        #drag .resizeLT{top:0;left:0;cursor:nw-resize;}
        #drag .resizeTR{top:0;right:0;cursor:ne-resize;}
        #drag .resizeLB{left:0;bottom:0;cursor:ne-resize;}

        .btnzu{width: 100%;height: 59px;margin-top: 43px;border-bottom: 1px solid rgb(216,216,216);}

        .btnzu .annone{/*width: 59%;*/display: flex;flex-direction: row;}
        .btnzu .annone .btnc{border: 1px solid rgb(216,216,216);border-radius:5px;text-align: center;color: #878787;}
        .btnzu .annone .btnc img{vertical-align: middle;margin-top: -1px;}


        .btnzu .anntwo{width: 37%;float: right;}
        @media screen and (max-width: 1848px) {
            .btnzu .anntwo{width: 34%;}
        }
        @media screen and (max-width: 1683px) {
            .btnzu .anntwo{width: 30%;}
        }
        @media screen and (max-width: 1520px) {
            .btnzu .anntwo{width: 23%;}
        }
        @media screen and (max-width: 1470px) {
            .yjthtitle{margin-right: 18px;}
        }
        @media screen and (max-width: 1382px) {
            .btnzu .anntwo{width: 18%;}
        }
        .btnzu .anntwo .btnbo{border: none;background: rgb(42,184,254);border-radius: 5px;text-align: center;color: #ffffff;width: 84px;height: 34px;font-size: 15px;line-height: 33px;
            margin-top: 6px;
            float: left;
        }
        .btnzu .anntwo .btnbo img{vertical-align: middle;margin-top: -1px;}
        .btnzu a{cursor:pointer}
        textarea:focus{z-index: 999999;}
        .Tespan{margin-top: -6px;}


    </style>

<#--    错误提示css-->
    <style type="text/css">
        .test {
            padding: 8px 12px;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            border-radius: 5px;
            z-index: 999;
            font-size: 14px;
        }

        .text-center {
            text-align: center;
        }

        .item {
            border-radius: 5px;
            /*background-color: rgb(255 193 193 / 50%);*/
            width: 23px;
            height: 25px;
            margin-top: -39px;
             float: right;
           /* margin-right: 77px;*/
            -moz-transition: all 0.2s;
            -ms-transition: all 0.2s;
            -o-transition: all 0.2s;
            transition: all 0.2s;
        }
        .count{
            border-radius: 5px;
            height: 25px;
            margin-top: -36px;
            float: right;
            margin-right: 26px;
            color: rgb(159,160,160);
        }

        .item.item-success {
            background-color: #5cb85c;
        }

        .item.item-info {
            background-color: #5bc0de;
        }

        .item.item-warning {
            background-color: #f0ad4e;
        }

        .item.item-danger {
            background-color: #d9534f;
        }

        .mTips {
            position: fixed;
            padding: 8px 12px;
            color: #fff;
            border-radius: 5px;
            font-family: "微软雅黑";
            z-index: 999;
            display: inline;
            font-size: 14px;
        }

        .mTips-default {
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
        }

        .mTips-success {
            background-color: rgba(92, 184, 92, 0.8);
            color: #fff;
        }

        .mTips-info {
            background-color: rgba(91, 192, 222, 0.8);
            color: #fff;
        }

        .mTips-warning {
            background-color: rgba(240, 173, 78, 0.8);
            color: #fff;
        }

        .mTips-danger {
            background-color: rgba(217, 83, 79, 0.8);
            color: #fff;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/css/anniu.css?v=${version}" />
</head>
<body id="hbody">
<div id="append_parent" class="append_parent"></div><div id="ajaxwaitid"></div>
<script src="/bigsmall/js/forum_viewthread.js" type="text/javascript"></script>
<script type="text/javascript">
    zoomstatus = parseInt(1);
    var imagemaxwidth = '500';//控制图片初始宽度
    var aimgcount = new Array();
</script>

<div class="PictureDisplay" id="PictureDisplay">
    <div class="Picturetag" id="DigitalForm">
        <h3>
            <p><img src="/img/rightShens.png" id="zktb"  onclick="shrink()"> 填写数字标记</p>
            <div class="yjthtitle" style="float: right;height: 35px;margin-right: 8px;">
                <input id="FileNametSaveReplace" type="button" value="一键替换" onclick="DigitalSignSaveReplace()" />
            </div>
        </h3>
        <br>
        <table>
            <tr>
                <td>
                    <#--id="Numbermark"-->
                    <textarea  id="digitalSign" name="digitalSign" onchange="DigitalSignSave()" rows="12" cols="900" style="border-width: 0px;margin-left: 7px;margin-top: -16px;height: 180px;width: 93%;padding: 0px;overflow: hidden;border: 1px solid rgb(224,224,224);resize: none;" placeholder="请用户必须按照以下格式输入：数字、部件；数字、部件（最后以句号结尾）（举例：1、机架；2、机身。）"   ></textarea>
                </td>
                <div id="NewDigitalForm">
                    <input class="mini-hidden" id="id" name="id">
                    <input class="mini-hidden" id="userId" name="userId">
                    <input class="mini-hidden" id="rowValue" name="rowValue">
                </div>
                <td style="width: 100%;"></td>
            </tr></table>
    </div>
    <div id="ftkuang">
    <div id="anniuzy"  style="height: 46px; margin-top: 10px;text-align: center;">
        <button onClick="imgulp.zhaiyao()" style="height: 40px;width: 44%;border: 1px dashed #bdcbd8;background:rgb(87,184,236);font-size:10px ;font-weight:inherit;color: rgb(255,255,255);" class="btn btn-danger radius">设置摘要附图</button>
        <button onclick="imgulp.dragsort()" style="height: 40px;width: 44%;border: 1px dashed #bdcbd8;background:rgb(5,145,252);font-size:10px ;font-weight:inherit;color: rgb(255,255,255);" class="btn btn-danger radius">批量管理</button>
        <span style="float: left;margin-top: 10px;margin-left: 6px;font-size: 15px;">说明书附图（${PicNum}）</span>
    </div>
    <!--图片展示-->
    <div class="Illustration" id="Illustration">
        <div class="cl imglist" id="img_ul" style="margin-left: 84px;"></div>
    </div>
    </div>
</div>

<div class="width_auto" id="width_auto">
   <#-- <div class="shrink"><img src="/img/shrink.png" id="zktb"  onclick="shrink()"/></div>-->
    <form id="form">
    <div class="Operationgroup" id="Operationgroup">
<div class="btnzu">
    <div class="annone">
       <a class="btnc" style="width: 150px;" onclick="Newdq()">
        <img src="/img/insertdq.png">
        <span>新增无引用权利要求</span>
       </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Numberbracket('dkh')">
           &nbsp; 数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文（数）
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Numberbracket('bdkh')">
            &nbsp; 数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文+数
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Numberbracket('zwz')">
            &nbsp;数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Texttobracketednumber('one')">
            &nbsp;文 <img src="/img/rightZH.svg" style="width:15px;"  /> 文（数）
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Texttobracketednumber('two')">
            &nbsp;文 <img src="/img/rightZH.svg" style="width:15px;"  /> 文+数
        </a>
    </div>
    <div class="annone" style="margin-top: 7px;">
        <a class="btnc" style="width: 150px;" onclick="Newcq()">
            <img src="/img/insertcq.png">
            <span>新增有引用权利要求</span>
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="seldelbrackets()">
            &nbsp;选中去括号
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="seldelnumberbrackets()">
             选中去数字括号
        </a>
        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="seldelnumber()">
            &nbsp;选中去数字
        </a>

        <a class="btnc" style="margin-left: 25px;width: 103px;" onclick="Selandrep()">
            &nbsp;查找与替换
        </a>
        <a class="btnc" style="margin-left: 25px;width: 132px;" onclick="Writingstandard()">
            &nbsp;发明内容撰写规范
      </a>
    </div>
    <div class="anntwo" style="margin-top: -49px;">
    <div class="btnbo" style="" onclick="Save()">
          <img src="/img/saveclai.png"/>保存
    </div>
    <div class="btnbo" style="margin-left: 10px;" onclick="SetIframeSrc('/CompleteFile/index')">
            <img src="/img/yulan.png"/>预览
    </div>
        <div class="btnbo" style="margin-left: 10px;" onclick="Preview()">
            <img src="/img/yulan.png"/>部分预览
        </div>
    </div>
</div>
<#--  <div class="btn_list" id="btn_list" style="margin-left: -76px;width: 106%;height: 114px;">
            <ul class="clearfix" style="margin-left: 19px;margin-top: 43px;">
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 5px;" class="btn btn2" onclick="Newdq()"> <span class="btn-inner">新增无引用权利要求<i class="fa fa-right"></i></span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 0px;" class="btn btn2" onclick="Newcq()"> <span class="btn-inner">新增有引用权利要求<i class="fa fa-right"></i></span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 14px;background: rgb(27,98,171);border: 1px solid rgb(27,98,171);color:#fff;" class="btn btn4" onclick="Save()"> <span class="btn-inner">保存</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 15px;background:rgb(27,98,171);border:1px solid rgb(27,98,171); color:#fff;" class="btn btn7" onclick="SetIframeSrc('/CompleteFile/index')"><span class="btn-inner">预览</span><div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 12px;" class="btn btn3" onclick="Writingstandard()"> <span class="btn-inner">发明内容撰写规范</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 12px;" class="btn btn3" onclick="Selandrep()"> <span class="btn-inner">查找与替换</span> <div class="btnbg-x"></div></a>
                </li>
            </ul>
            <br>
            <ul class="clearfix" id="oplist" style="float: left;margin-left: 20px;height: 10px;margin-top: -30px;">
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 29px;" class="btn btn3" onclick="Numberbracket()"> <span class="btn-inner">数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文（数）</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 34px;" class="btn btn3" onclick="NumberWithoutbrackets()"> <span class="btn-inner">数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文+数</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 49px;" class="btn btn3" onclick="Digitaltotext()"> <span class="btn-inner">数 <img src="/img/rightZH.svg" style="width:15px;"  /> 文</span> <div class="btnbg-x"></div></a>
                </li>

                <li>
                    <a href="javascript:void(0)" style="padding: 3px 34px;" class="btn btn3" onclick="Texttobracketednumber('one')"> <span class="btn-inner">文 <img src="/img/rightZH.svg" style="width:15px;"  /> 文（数）</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 49px;" class="btn btn3" onclick="Texttobracketednumber('two')"> <span class="btn-inner">文 <img src="/img/rightZH.svg" style="width:15px;"  /> 文+数</span> <div class="btnbg-x"></div></a>
                </li>

                <li>
                    <a href="javascript:void(0)" style="padding: 3px 30px;" class="btn btn3" onclick="seldelbrackets()"> <span class="btn-inner">选中去括号</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 12px;" class="btn btn3" onclick="seldelnumberbrackets()"> <span class="btn-inner">选中去数字括号</span> <div class="btnbg-x"></div></a>
                </li>
                <li>
                    <a href="javascript:void(0)" style="padding: 3px 12px;" class="btn btn5" onclick="seldelnumber()"> <span class="btn-inner">选中去数字</span> <div class="btnbg-x"></div></a>
                </li>
            </ul>

&lt;#&ndash;      <div class="zisize">
          <a href="javascript:void(0)" onclick="zimax()">大</a>&nbsp;<a href="javascript:void(0)" onclick="zizhong()">中</a>&nbsp;<a href="javascript:void(0)" onclick="zimin()">小</a>
      </div>&ndash;&gt;


  </div>-->

        <div class="Opendrawings" id="Opendrawings" style="display: inline;float: right;background: rgb(27,98,171);margin-top: -54px;margin-right: 51px;width: 30px;text-align: center;border-radius: 2px;display: none;">
            <img src="/img/leftShens.png" style="margin-top: 5px;" onclick="shrink()">
        </div>
        <br />


        <div id="Writingspecification" class="Writingspecification" style="display: none">
            <textarea id="Writingtextarea" style="border-radius:5px ;resize: none;width:99.5%;margin-top: 20px;margin-left: 3px;" onselect="fun(this);" class="Writingtextarea" rows="27" cols="185" readonly="readonly" onfocus="autoTextarea(this)" placeholder="撰写规范">
发明内容撰写规范
发明目的撰写规范：
指本条权利要求的技术方案可以实现的技术目的，本条权利要求无法实现的技术目的不可写上去，用正面的、尽可能简洁的语言客观而有根据地反映本技术方案要解决的技术问题，也可以进一步说明其技术效果。对所要解决的技术问题的描述不得采用广告式宣传用语。一个技术方案可以解决一个或多个技术问题。
权利要求撰写规范：
1.独立权利要求应当从整体上反映发明或者实用新型的技术方案，记载解决技术问题的必要技术特征。必要技术特征是指，发明或者实用新型为解决其技术问题所不可缺少的技术特征，其总和足以构成发明或者实用新型的技术方案，使之区别于背景技术中所述的其他技术方案。 独立权利要求包含前序部分和特征部分，中间用“其特征在于”隔开；前序部分属于现有技术，但是是构成独立权利要求技术方案的必要特征；特征部分是技术方案的改进特征。
2.从属权利要求是用附加的技术特征对所引用的权利要求作进一步的限定。附加技术特征可以是对所引用的权利要求的技术特征作进一步限定的技术特征，也可以是增加的技术特征。
3.当有两项或者两项以上独立权利要求时，写在最前面的独立权利要求被称为第一独立权利要求，其他独立权利要求称为并列独立权利要求。并列独立权利要求也可以引用在前的独立权利要求，例如，“一种实施权利要求 1 的方法的装置，……”； “一种制造权利要求 1 的产品的方法，……”；“一种包含权利要求 1 的部件的设备，……”；“与权利要求 1 的插座相配合的插头，……”等。
有益效果撰写规范：
1.有益效果是指由构成发明或者实用新型的技术特征直接带来的，或者是由所述的技术特征必然产生的技术效果。有益效果是确定发明是否具有“显著的进步”，实用新型是否具有“进步”的重要依据。
2.有益效果可以通过对发明创造结构特点的分析和理论说明相结合，或者通过列出实验数据的方式予以说明，不得只断言发明或者实用新型具有有益的效果。但是，无论用哪种方式说明有益效果，都应当与现有技术进行比较，指出发明或者实用新型与现有技术的区别。
3.机械、电气领域中的发明或者实用新型的有益效果，在某些情况下，可以结合发明或者实用新型的结构特征和作用方式进行说明。
4.化学领域中的发明需要借助于实验数据来说明。对于目前尚无可取的测量方法而不得不依赖于人的感官判断的，例如味道、气味等，可以采用统计方法表示的实验结果来说明有益效果。在引用实验数据说明有益效果时，应当给出必要的实验条件和方法。
实施例撰写规范：
1.具体实施例是针对发明创造的技术方案进行具体的详细的举例说明，应当对权利要求的技术特征给予详细说明，以支持权利要求。使发明或者实用新型所属技术领域的技术人员能够实现该发明或者实用新型。
2..当一个实施例足以支持权利要求所概括的技术方案时，说明书中可以只给出一个实施例。当权利要求(尤其是独立权利要求)覆盖的保护范围较宽，其概括不能从一个实施例中找到依据时，应当给出至少两个不同实施例，以支持要求保护的范围。当权利要求涉及数值范围时，通常应给出两端值附近(最好是两端值)的实施例，当数值范围较宽时，还应当给出至少一个中间值的实施例。
3.对于产品的发明或者实用新型，实施方式或者实施例应当描述产品的机械构成、电路构成或者化学成分，说明组成产品的各部分之间的相互关系。
4.对于可动作的产品，只描述其构成不能使所属技术领域的技术人员理解和实现发明或者实用新型时，还应当说明其动作过程或者操作步骤。
5.对于方法的发明，应当写明其步骤，包括可以用不同的参数或者参数范围表示的工艺条件。
6.在具体实施方式部分，对区别于现有技术的技术特征以及从属权利要求中的附加技术特征应当足够详细地描述，以所属技术领域的技术人员能够实现该技术方案为准。
7.对于那些就满足专利法第二十六条第三款的要求而言必不可少的内容，不能采用引证其他文件的方式撰写，而应当将其具体内容写入说明书。
8.说明书有附图的，具体实施例应当应当对照附图进行说明。对照附图描述发明或者实用新型的优选的具体实施方式时，使用的附图标记或者符号应当与附图中所示的一致，并放在相应的技术名称的后面，不加括号。例如，对涉及电路连接的说明，可以写成“电阻 3 通过三极管 4 的集电极与电容 5 相连接”，不得写成“3 通过 4 与 5 连接”。
            </textarea>
        </div>

        <!--主界面-->
        <div class="content" id="ClaimsContent">

        </div>

        <div id="ExclusiveWindow"  class="mini-window" title="填写主题名称以及引用的权利要求" style="width:360px;height:180px;top: 180px;" >
            <div id="ExclusiveForm" style="padding:15px;padding-top:10px;">
                <form action="#" method="post" id="myform">
                    <table>
                        <tr>
                            <td style="width:90px;">&nbsp;主题名称:</td>
                            <td>
                                <input id="themename" name="themename" type="text" class="Yytext" required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:90px;">引用权利要求:</td>
                            <td>
                                <input id="Referenceclaims" name="Referenceclaims" type="text" class="Yytext" required="true"  />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;padding-left: 10px">
                                <a  class="mini-button" onclick="cqqd()" style="width:60px;" id="login">确定</a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;">
                                <span style="color:#FF0000;" id="msg"></span>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>

        <#--插入一条独权框-->
        <div id="DqExclusiveWindow"  class="mini-window" title="填写主题名称" style="width:360px;height:150px;" >
            <div id="DqExclusiveForm" style="padding:15px;padding-top:10px;">
                <form action="#" method="post" id="Dqmyform">
                    <table>
                        <tr>
                            <td style="width:90px;">&nbsp;主题名称:</td>
                            <td>
                                <input id="Dqthemename" name="Dqthemename" type="text" class="Yytext" required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;padding-left: 10px">
                                <a  class="mini-button" onclick="dqqd()" style="width:60px;" id="Dqlogin">确定</a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;">
                                <span style="color:#FF0000;" id="msg"></span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <#--插入一条从权框-->
        <div id="ExclusiveWindow1"  class="mini-window" title="填写主题名称以及引用的权利要求" style="width:360px;height:180px;" >
            <div id="ExclusiveForm1" style="padding:15px;padding-top:10px;">
                <form action="#" method="post" id="myform1">
                    <table>
                        <tr>
                            <td style="width:90px;">&nbsp;主题名称:</td>
                            <td>
                                <input id="themename1" name="themename1" type="text"  class="Yytext" required="true" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:90px;">引用权利要求:</td>
                            <td>
                                <input id="Referenceclaims1" name="Referenceclaims1" type="text" class="Yytext" required="true" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;padding-left: 10px">
                                <a  class="mini-button" onclick="cqqd1()" style="width:60px;" id="login">确定</a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;">
                                <span style="color:#FF0000;" id="
"></span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <#--修改附图框-->
        <div id="ExclusiveWindow2"  class="mini-window" title="修改附图说明详情" style="width:360px;height:140px;position: absolute;top: 174px;left: 549px;" >
            <div id="ExForm" style="padding:15px;padding-top:10px;">
                <form action="#" method="post" id="myform1">
                    <table>
                        <tr>
                            <td style="width:90px;">&nbsp;附图说明:</td>
                            <td>
                                <input id="Descriptiondrawings" name="Descriptiondrawings" type="text" class="Yytext" required="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:24px;">
                                <a  class="mini-button" onclick="updatefutu()" style="width:60px;" id="login">确定</a>
                                <a  class="mini-button" onclick="closefutu()" style="width:60px;" id="furguanbi">关闭</a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;">
                                <span style="color:#FF0000;" id="msg"></span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>

        <#--查找替换框-->
        <div id="ExclusiveWindow3"  class="mini-window" title="查找并替换" style="width:360px;height:180px;" >
            <div id="ExclusiveForm3" style="padding:15px;padding-top:10px;">
                <form action="#" method="post" id="myform3">
                    <table>
                        <tr>
                            <td style="width:90px;">查找内容(N):</td>
                            <td>
                                <input id="lookup" name="lookup" type="text"  class="Yytext" required="true" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width:90px;">应替换为(I):</td>
                            <td>
                                <input id="Replacewith" name="Replacewith" type="text" class="Yytext" required="true" />
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;padding-left: 10px">
                                <a  class="mini-button" onclick="Startreplacement()" style="width:90px;" id="thw">开始替换</a>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td style="padding-top:5px;">
                                <span style="color:#FF0000;" id="msg1"></span>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>


    </div>
    </form>
</div>
<div id="drag" class="sop" style="display: none;">
    <div class="title">
        <div style="color: #fff;float: right;" title="关闭附图窗口" onclick="Close()">X</div>
    </div>
    <div id="imgDiv" class="simg" tabIndex="1" style="text-align: center"><img src="" id="imgSrc" class="imgs" /><div class="mov"></div></div>
    <div class="bigimg" id="bigimg" style="box-shadow: 0 1px 3px 2px #666;left: 100%">
        <img class="bimg" src="" width="800" height="800" border="0">
    </div>
    <div class="resizeL"></div>
    <div class="resizeT"></div>
    <div class="resizeR"></div>
    <div class="resizeB"></div>
    <div class="resizeLT"></div>
    <div class="resizeTR"></div>
    <div class="resizeBR"></div>
    <div class="resizeLB"></div>
</div>
<script>
    mini.parse();
    var RowValue = "${RowValue}";
    var DigitalSignForm = ${DigitalSign};
    var AssistName="${AssistName}";
    var Fontsize="${Fontsize}";
    var preValue = "";
    var DigitalSignid="${DigitalSignid}";
    var userid="${userid}";
    var allList = [];
    var contents = [];
    //窗口加载事件
    $(function(){
        var div=document.getElementById("Operationgroup");
        div.style.height=800;
        div.style.overflow="hidden";
        if (RowValue=="0"){
            mini.alert("请先保存专利名称！","系统提示",function (act) {
                if (act == 'ok'){
                    window.location.href="/Product/index?Mode=Add";
                }
            });
        }else{
            cxrowvalue();
            var form = new mini.Form("NewDigitalForm");
            if (DigitalSignForm.id != undefined) {
                document.getElementById("digitalSign").value=DigitalSignForm.digitalSign;
                form.setData(DigitalSignForm);
            }
            //描述文件非空判断
            var Description=$(".Descriptionfigures");
            for(var i=0;i<Description.length;i++){
                if(Description[i].innerHTML==""){
                    Description[i].innerHTML="请填写文件描述";
                }
            }
        }

        $.fn.scrollUnique = function() {
            return $(this).each(function() {
                var eventType = 'mousewheel';
                if (document.mozHidden !== undefined) {
                    eventType = 'DOMMouseScroll';
                }
                $(this).on(eventType, function(event) {
                    // 一些数据
                    var scrollTop = this.scrollTop,
                        scrollHeight = this.scrollHeight,
                        height = this.clientHeight;

                    var delta = (event.originalEvent.wheelDelta) ? event.originalEvent.wheelDelta : -(event.originalEvent.detail || 0);

                    if ((delta > 0 && scrollTop <= delta) || (delta < 0 && scrollHeight - height - scrollTop <= -1 * delta)) {
                        // IE浏览器下滚动会跨越边界直接影响父级滚动，因此，临界时候手动边界滚动定位
                        this.scrollTop = delta > 0? 0: scrollHeight;
                        // 向上滚 || 向下滚
                        event.preventDefault();
                    }
                });
            });
        };
        $('#ClaimsContent').scrollUnique();
        $('#Illustration').scrollUnique();
        $('#DigitalForm').scrollUnique();
        $('#btn_list').scrollUnique();
        $('#oplist').scrollUnique();
        $('#anniuzy').scrollUnique();

    })

    //删除权利要求
    function deleteqlyq(obj,InId,DqNum) {
        if(obj!=1){
        mini.showMessageBox({
            title: "删除提醒",
            iconCls: "mini-messagebox-question",
            buttons: ["是", "否"],
            message: "确认删除此条权利要求?",
            callback: function (action) {
                if(action=="是"){
                    var iid = mini.loading('正在保存数据.....');
                    var form = new mini.Form("#ClaimsContent");
                    var Data = form.getData();
                    form.validate();
                    if (form.isValid()) {
                        var arg = {DqExclusiveorder: obj,InId:InId};
                        var urlsave = "/Claims/deleteqlyq";
                        var sp={DqExclusiveorder: obj};
                        var findurl="/Claims/getDqExorderlq";
                        $.getJSON(urlsave, arg, function (text) {
                            alert("已删除此条权利要求!");
                            var res1 = mini.decode(text);
                            var data = res1.data || {};
                            form.setData(data);
                            form.unmask();
                            mini.hideMessageBox(iid);
                            var ClaimsContent=document.getElementById("ClaimsContent");
                            var table=document.getElementsByClassName('kuang');
                            var nb=[];
                            for (var i=0;i<table.length;i++){
                                 var tableId=table[i].id;
                                 var QcGjz=tableId.slice(2);
                                 if(QcGjz>=obj){
                                     nb.push(tableId);
                                 }
                             }
                            for (var N=0;N<nb.length;N++){
                                var tableform=document.getElementById(nb[N]);
                                ClaimsContent.removeChild(tableform);
                            }
                            $.getJSON(findurl,sp, function (text) {
                                var rows=text.data || [];
                                rows.sort(compare('DqExclusiveorder'));
                                for (var i=0;i<rows.length;i++) {
                                    var row = rows[i];
                                    var ClaimsContent = document.getElementById("ClaimsContent");
                                    if (row["DqNum"] == "1") {
                                        var NewMonopoly = document.createElement("table");
                                        var end = row["DqTechnicalsolutions"];
                                        var ywdh = end.indexOf(",")//英文逗号
                                        var zwdh = end.indexOf("，")//中文逗号
                                        var l = null;
                                        if (ywdh != -1) {
                                            l = end.substring(0, ywdh);
                                        } else {
                                            l = end.substring(0, zwdh);
                                        }
                                        var DqelementId ="Dq"+row["DqExclusiveorder"];
                                        /*NewMonopoly.title = l;*/
                                        var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                        var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                                        var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                        var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                                        var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                        var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                                        var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                        var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                        var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                                        NewMonopoly.innerHTML =
                                            '<tr><br>' +
                                            '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                                            '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                                            '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                                            '</tr>';
                                        NewMonopoly.classList.add('NewMonopoly'); //添加类名
                                        NewMonopoly.classList.add('kuang'); //添加类名
                                        NewMonopoly.setAttribute("id", DqelementId);//添加ID
                                        ClaimsContent.appendChild(NewMonopoly);
                                        selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);

                                        //加载已输入字数
                                        var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                                        document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                        var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                                        document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                        var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                                        document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                    } else {
                                        if ($(this).hasClass("NewMonopoly")) {
                                            var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                                            var ywdh = end.indexOf(",")//英文逗号
                                            var zwdh = end.indexOf("，")//中文逗号
                                            var l = null;
                                            if (ywdh != -1) {
                                                l = end.substring(0, ywdh);
                                            } else {
                                                l = end.substring(0, zwdh);
                                            }
                                            mini.get("themename").setValue(l);
                                            var NewExpedient = document.createElement("table");
                                            var CqelementId = "Cq" + row["DqExclusiveorder"];
                                            var str = row["DqTechnicalsolutions"];
                                            //引用权利要求书
                                            var wz1 = str.indexOf('求');
                                            var wz2 = str.indexOf('所');
                                            var Referenceclaims = str.substring(wz1 + 1, wz2);

                                            //主题名称
                                            var wz3 = str.indexOf('的');
                                            var wz4 = str.indexOf('其');
                                            var themename = str.substring(wz3 + 1, wz4 - 1);
                                            /*NewExpedient.title = themename;*/
                                            var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                            var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                            var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                            var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                            var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                            var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                            var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                            var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                            var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                            NewExpedient.innerHTML =
                                                '<tr><br>' +
                                                '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                                '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                                '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                                '</tr>';
                                            NewExpedient.classList.add('NewExpedient'); //添加类名
                                            NewExpedient.classList.add('kuang'); //添加类名
                                            NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                            ClaimsContent.appendChild(NewExpedient);
                                            selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                            ERRORTIS(row["DqExclusiveorder"]);

                                            //加载已输入字数
                                            var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                            document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                            var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                            document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                            var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                            document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                        } else {
                                            //如果删除权利要求则还是会显示引用权利要求、、
                                            var NewExpedient = document.createElement("table");
                                            var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                            var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                            var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                            var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                            var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                            var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                            var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                            var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                            var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                            NewExpedient.innerHTML =
                                                '<tr><br>' +
                                                '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                                '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                                '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                                '</tr>';
                                            NewExpedient.classList.add('NewExpedient'); //添加类名
                                            NewExpedient.classList.add('kuang'); //添加类名
                                            NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                            ClaimsContent.appendChild(NewExpedient);
                                            selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                            ERRORTIS(row["DqExclusiveorder"]);

                                            //加载已输入字数
                                            var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                            document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                            var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                            document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                            var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                            document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                        }
                                    }
                                }
                                var list = document.getElementsByTagName("table");
                                contents=[];
                                for(var i=0;i<list.length;i++) {
                                    var id = list[i].id;
                                    var idparint=id.replace(/[^0-9]/ig,"");
                                    if (id != "" && idparint>=obj){
                                        $("#" + id + ' tr').each(function (q) {
                                            $(this).children('td').each(function (x) {
                                                var TdCon = $(this)[0].children[0].childNodes;
                                                var cid = "";
                                                var tip = "";
                                                allList = [];
                                                allList.push(id);
                                                for (var j=0;j<TdCon.length;j++){
                                                    if (TdCon[j].tagName == "TEXTAREA"){
                                                        cid = TdCon[j].id;
                                                        allList.push(TdCon[j].id);
                                                    }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1){
                                                        tip = TdCon[j].id;
                                                        allList.push(TdCon[j].id);
                                                    }
                                                    if (cid != "" && tip != ""){
                                                        contents.push(allList);
                                                        break;
                                                    }
                                                }
                                            });
                                        });
                                    }
                                }
                                LoadEx(contents);
                            });
                        });
                    }
                }else {
                    /*window.location.href="/Claims/index";*/
                }
            }
        });
        }else {
            alert("第一条无引用权利要求不可删除!");
        }

    }

    //查询多条实施例 Referenceclaims
    function selssl(IniD,IdDqOrder,DqOrder) {
        var DqExamUrl="/Claims/tbDqExamplescxInid";
        var arg={InId:IniD};
        $.getJSON(DqExamUrl,arg,function (result) {
            var DqExamrows = result.data || [];
            if (IdDqOrder.indexOf("Dq")!=-1){//独权实施例
            for (var p=0;p<DqExamrows.length;p++){
                var exdata=DqExamrows[p];
                var ssltrDqorder='ssltr'+exdata["OrderNum"]+IniD;

                var ExamrowsOrder=IdDqOrder+'Examrows'+exdata["OrderNum"];
                var ssltip="ssltip"+exdata["OrderNum"];
                var sslcount="sslcount"+exdata["OrderNum"];
                if(p==0){
                    $("#"+IdDqOrder+" tbody").append('<tr id='+ssltrDqorder+' class="ssltr"><td colspan="84" class="dqssl"><div style="margin-top: 42px;"><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a> &nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><div class="count">已输入<span id="'+sslcount+'"></span>字</div><div class="item" style="" id="ssltip'+exdata["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')" name="'+exdata["EpId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="DqExamples sizep" rows="2" cols="138"    onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></div></td></tr>');
                    //加载已输入字数
                    var sslwowcount=Count(ExamrowsOrder);
                    document.getElementById("sslcount"+exdata["OrderNum"]).innerHTML=sslwowcount;
                }else{
                    $("#"+IdDqOrder+" tbody").append('<tr id='+ssltrDqorder+' class="ssltr"><td colspan="84" class="dqssl"><div><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a> &nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><div class="count">已输入<span id="'+sslcount+'"></span>字</div><div class="item" style="" id="ssltip'+exdata["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" name="'+exdata["EpId"]+'" oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="DqExamples sizep" rows="2" cols="138"    onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></div></td></tr>');
                    //加载已输入字数
                    var sslwowcount=Count(ExamrowsOrder);
                    document.getElementById("sslcount"+exdata["OrderNum"]).innerHTML=sslwowcount;
                }
            }

                if(DqExamrows.length==0){
                    $("#"+IdDqOrder+" tbody").append('<tr style="height: 41px;"><br></tr>');
                }

            }
            else
            {
                //从权实施例
                /* if(Referenceclaims==undefined){
                    for (v  ar p=0;p<DqExamrows.length;p++){
                        var exdata=DqExamrows[p];
                        var ExamrowsOrder=IdDqOrder+'Examrows'+exdata["OrderNum"];
                        if(p==0){
                            $("#"+IdDqOrder+" tbody").append('<tr class="ssltr"><td colspan="84" class="cqssl"><div style="margin-top: 42px;"><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a>&nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><textarea id="'+ ExamrowsOrder +'" name="'+exdata["EpId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqExamples sizep" rows="2" cols="138"   onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></div></td></tr>');
                        }else {
                            $("#"+IdDqOrder+" tbody").append('<tr class="ssltr"><td colspan="84" class="cqssl"><div><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a>&nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><textarea id="'+ ExamrowsOrder +'" name="'+exdata["EpId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqExamples sizep" rows="2" cols="138"   onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></div></td></tr>');
                        }

                    }
                }else{*/
                    for (var p=0;p<DqExamrows.length;p++){
                        var exdata=DqExamrows[p];
                        var ssltrDqorder="ssltr"+exdata["OrderNum"]+IniD;
                        var ExamrowsOrder=IdDqOrder+'Examrows'+exdata["OrderNum"];
                        var ssltip="ssltip"+exdata["OrderNum"];
                        var sslcount="sslcount"+exdata["OrderNum"];
                        if(p==0){
                            $("#"+IdDqOrder+" tbody").append('<tr id='+ssltrDqorder+' class="ssltr"><td colspan="84" class="cqssl"><div style="margin-top: 42px;"><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a>&nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><div class="count">已输入<span id="'+sslcount+'"></span>字</div><div class="item" style="" id="ssltip'+exdata["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" name="'+exdata["EpId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqExamples sizep" rows="2" cols="138" oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')"   onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></td></div></tr>');
                            //加载已输入字数
                            var sslwowcount=Count(ExamrowsOrder);
                            document.getElementById("sslcount"+exdata["OrderNum"]).innerHTML=sslwowcount;
                        }else {
                            $("#"+IdDqOrder+" tbody").append('<tr id='+ssltrDqorder+' class="ssltr"><td colspan="84" class="cqssl"><div><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+exdata["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+exdata["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a>&nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span><div class="count">已输入<span id="'+sslcount+'"></span>字</div></h5><div class="item" style="" id="ssltip'+exdata["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" name="'+exdata["EpId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqExamples sizep" rows="2" cols="138"  oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')"  onblur="UpdateExamples('+exdata["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + exdata["DqExamples"] + '</textarea></td></div></tr>');
                            //加载已输入字数
                            var sslwowcount=Count(ExamrowsOrder);
                            document.getElementById("sslcount"+exdata["OrderNum"]).innerHTML=sslwowcount;
                        }
                    }
                /*}*/
                 if(DqExamrows.length==0){
                    $("#"+IdDqOrder+" tbody").append('<tr style="height: 41px;"><br></tr>');
                }
            }
            var list = document.getElementsByTagName("table");
            for(var i=0;i<list.length;i++) {
                var id = list[i].id;
                if (id != ""){
                    $("#" + id + ' tr').each(function (q) {
                        $(this).children('td').each(function (x) {
                            var TdCon = $(this)[0].children[0].childNodes;
                            var cid = "";
                            var tip = "";
                            allList = [];
                            allList.push(id);
                            for (var j=0;j<TdCon.length;j++){
                                if (TdCon[j].tagName == "TEXTAREA"){
                                    cid = TdCon[j].id;
                                    allList.push(TdCon[j].id);
                                }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1 || TdCon[j].id.indexOf("ssl") > -1){
                                    tip = TdCon[j].id;
                                    allList.push(TdCon[j].id);
                                }
                                if (cid != "" && tip != ""){
                                    contents.push(allList);
                                    break;
                                }
                            }
                        });
                    });
                }
            }
            LoadEx(contents);
        });
    }

    //实施例引用权利要求内容
    function qeclaims(obj,EpId) {
       var Jiaodian=obj.id; //焦点文本框id
       var str=document.getElementById(Jiaodian).value;//原始字符串
       var Jiaodianweizhi=document.getElementById(Jiaodian).selectionStart;//焦点光标位置
       var record=null;//记录字符串
       var urltemlate = "/Claims/findAllByTemplateId";
       var QuanLiYaoQiuDuQuan=null;//主题名称加，
       var QuanLiYaoQiuCongQuanOne=null;//从权根据权利要求
      var QuanLiYaoQiuCongQuanTwo=null;//从权其特征在于:

        $.getJSON(urltemlate, {}, function (result) {
            var data=result.data || [];
            for(var i=0;i<data.length;i++){
                var Sdata=data[i].field;
                if(Sdata=="QuanLiYaoQiuDuQuan"){
                    QuanLiYaoQiuDuQuan=data[i].fieldContent;
                }
                if(Sdata=="QuanLiYaoQiuCongQuanTwo"){
                    QuanLiYaoQiuCongQuanTwo=data[i].fieldContent;
                }
                if(Sdata=="QuanLiYaoQiuCongQuanOne"){
                    QuanLiYaoQiuCongQuanOne=data[i].fieldContent;
                }
            }

        mini.open({
            url:"/Claims/quoteclaims",
            title: "请选择要引用的权利要求技术方案",
            width: 500,
            height:300,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须
                    data.sort(sortBy('DqExclusiveorder',"desc"));
                    for (var i=0;i<data.length;i++){
                        if(data[i].DqNum==1){
                            var guanjchiregthree=new RegExp(QuanLiYaoQiuDuQuan,"g");
                            var zkh=new RegExp("（","g");
                            var ykh=new RegExp("）","g");

                            var Technicalsolutions=data[i].DqTechnicalsolutions;
                            Technicalsolutions= Technicalsolutions.replace(",","，");
                            Technicalsolutions= Technicalsolutions.replace(guanjchiregthree,"");
                            Technicalsolutions= Technicalsolutions.replace(zkh,"");
                            Technicalsolutions= Technicalsolutions.replace(ykh,"");//改变后的字
                            if (i==0){
                                //str:原始字符串，index,开始位置,end,结束位置 changeStr，改变后的字
                                var up=changeStr(str,Jiaodianweizhi,Jiaodianweizhi,Technicalsolutions);
                                record=up;
                                $("#"+Jiaodian).val("");
                                $("#"+Jiaodian).val(up);
                            }
                            else
                            {
                                var up=changeStr(record,Jiaodianweizhi,Jiaodianweizhi,Technicalsolutions);
                                record=up;
                                $("#"+Jiaodian).val("");
                                $("#"+Jiaodian).val(up);
                            }
                        }else {
                        var guanjchireg=new RegExp(QuanLiYaoQiuCongQuanOne,"g");
                        var guanjchiregtwo=new RegExp("所述的","g");
                        var guanjchiregthree=new RegExp(QuanLiYaoQiuCongQuanTwo,"g");
                        var zkh=new RegExp("（","g");
                        var ykh=new RegExp("）","g");

                        var Technicalsolutions=data[i].DqTechnicalsolutions;
                        Technicalsolutions= Technicalsolutions.replace(",","，");
                        Technicalsolutions= Technicalsolutions.replace(guanjchireg,"");
                        Technicalsolutions= Technicalsolutions.replace(guanjchiregtwo,"");
                        Technicalsolutions= Technicalsolutions.replace(guanjchiregthree,"");
                        Technicalsolutions= Technicalsolutions.replace(zkh,"");
                        Technicalsolutions= Technicalsolutions.replace(ykh,"");//改变后的字
                        var ss=Technicalsolutions.indexOf("，");
                        var onedh= Technicalsolutions.substring(0, ss+1);//干掉第一个逗号前面的主题名称

                        Technicalsolutions= Technicalsolutions.replace(onedh,"");
                        if (i==0){
                        //str:原始字符串，index,开始位置,end,结束位置 changeStr，改变后的字
                        var up=changeStr(str,Jiaodianweizhi,Jiaodianweizhi,Technicalsolutions);
                        record=up;
                        $("#"+Jiaodian).val("");
                        $("#"+Jiaodian).val(up);
                        }
                        else
                        {
                            var up=changeStr(record,Jiaodianweizhi,Jiaodianweizhi,Technicalsolutions);
                            record=up;
                            $("#"+Jiaodian).val("");
                            $("#"+Jiaodian).val(up);
                        }
                    }
                  }
                }
                UpdateExamples(EpId,record);
            }
        })
     })
  }

    //删除单条实施例
    function deletessl(EpId,e) {
            mini.showMessageBox({
                title: "删除提醒",
                iconCls: "mini-messagebox-question",
                buttons: ["是", "否"],
                message: "确认删除此条实施列?",
                callback: function (action) {
                    if (action == "是") {
                        var DqExamUrl = "/Claims/deleteAllByEpId";
                        var arg = {EpId: EpId};
                        $.getJSON(DqExamUrl, arg, function (text) {
                            var tableid=e.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.id;
                            if(document.getElementById(tableid).getElementsByTagName("textarea").length==4){
                                if (document.getElementById(tableid).getElementsByTagName("tr")[1].innerHTML!=""){
                                    $("#"+tableid+" tbody").append('<tr style="height: 41px;"><br></tr>');
                                }
                            }
                            var sb=e.parentNode.parentNode.parentNode.parentNode.id;
                            var ooo= document.getElementById(sb);
                            ooo.remove();
                            /*var res1 = mini.decode(text);*/
                           /*e.parentNode.parentNode.parentNode.removeChild(e.parentNode.parentNode);*/
                            if(document.getElementById(tableid).getElementsByTagName("textarea").length==4){
                              document.getElementById(tableid).getElementsByTagName("tr")[1].getElementsByTagName("div")[0].style.marginTop="42px";
                            }
                        });
                    } else {
                        /*window.location.reload();*/
                       /* window.location.href = "/Claims/index";*/
                    }
                }
            });
    }

    var drag_ = false
    var D = new Function('obj', 'return document.getElementById(obj);')
    var oevent = new Function('e', 'if (!e) e = window.event;return e')
    function Move_obj(obj) {
        var x, y;
        D(obj).onmousedown = function (e) {
            drag_ = true;
            with (this) {
                style.position = "absolute"; var temp1 = offsetLeft; var temp2 = offsetTop;
                x = oevent(e).clientX; y = oevent(e).clientY;
                document.onmousemove = function (e) {
                    if (!drag_) return false;
                    with (this) {
                        style.left = temp1 + oevent(e).clientX - x + "px";
                        style.top = temp2 + oevent(e).clientY - y + "px";
                    }
                }
            }
            document.onmouseup = new Function("drag_=false");
        }
    }

    //实施例实时修改
    function UpdateExamples(EpId,DqExamples,obj) {
/*        selobj=null;
        sel_objid=null;
        sel_Start=null;
        sel_End=null;
        sel_name=null;*/
        obj.style.height="69px";
        obj.parentNode.style.zIndex="0";
        SaveAll();
/*            var arg={
                EpId:EpId,
                DqExamples:DqExamples,
            };
            var urlsave = "/Claims/UpdateExamples";
            $.post(urlsave,arg,function (text) {
                var res1 = mini.decode(text);
                var data=res1.data || {};
                form.setData(data);
                form.unmask();
            });*/

    }

    //添加新实施例并实时保存
    function addExamples(InId,DqNum,DqOrder) {
        var record=null;//记录字符串
        var urltemlate = "/Claims/findAllByTemplateId";
        var QuanLiYaoQiuDuQuan=null;//主题名称加，
        var QuanLiYaoQiuCongQuanOne=null;//从权根据权利要求
        var QuanLiYaoQiuCongQuanTwo=null;//从权其特征在于:
        var ShiShiLiContent=null;//从权实施例内容

        $.getJSON(urltemlate, {}, function (result) {
            var data = result.data || [];
            for (var i = 0; i < data.length; i++) {
                var Sdata = data[i].field;
                if (Sdata == "QuanLiYaoQiuDuQuan") {
                    QuanLiYaoQiuDuQuan = data[i].fieldContent;
                }
                if (Sdata == "QuanLiYaoQiuCongQuanTwo") {
                    QuanLiYaoQiuCongQuanTwo = data[i].fieldContent;
                }
                if (Sdata == "QuanLiYaoQiuCongQuanOne") {
                    QuanLiYaoQiuCongQuanOne = data[i].fieldContent;
                }
                if (Sdata == "ShiShiLiContent") {
                    ShiShiLiContent = data[i].fieldContent;
                }
            }
            mini.open({
                url: "/Claims/quoteclaims",
                title: "请选择要引用的权利要求技术方案",
                width: 500,
                height: 300,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = mini.clone(data);    //必须
                        data.sort(sortBy('DqExclusiveorder', "desc"));
                        if(data!=""){
                        for (var i = 0; i < data.length; i++) {
                            if (data[i].DqNum == 1) {
                                var guanjchiregthree = new RegExp(QuanLiYaoQiuDuQuan, "g");
                                var zkh = new RegExp("（", "g");
                                var ykh = new RegExp("）", "g");

                                var Technicalsolutions = data[i].DqTechnicalsolutions;
                                Technicalsolutions = Technicalsolutions.replace(",", "，");
                                Technicalsolutions = Technicalsolutions.replace(guanjchiregthree, "");
                                Technicalsolutions = Technicalsolutions.replace(zkh, "");
                                Technicalsolutions = Technicalsolutions.replace(ykh, "");//改变后的字
                                if (i == 0) {
                                    //str:原始字符串，index,开始位置,end,结束位置 changeStr，改变后的字
                                    var up = Technicalsolutions;
                                    record = up;
                                } else {
                                    var up = changeStr(record, 0, 0, Technicalsolutions);
                                    record = up;
                                }
                            } else {
                                var guanjchireg = new RegExp(QuanLiYaoQiuCongQuanOne, "g");
                                var guanjchiregtwo = new RegExp("所述的", "g");
                                var guanjchiregthree = new RegExp(QuanLiYaoQiuCongQuanTwo, "g");
                                var zkh = new RegExp("（", "g");
                                var ykh = new RegExp("）", "g");

                                var Technicalsolutions = data[i].DqTechnicalsolutions;
                                Technicalsolutions = Technicalsolutions.replace(",", "，");
                                Technicalsolutions = Technicalsolutions.replace(guanjchireg, "");
                                Technicalsolutions = Technicalsolutions.replace(guanjchiregtwo, "");
                                Technicalsolutions = Technicalsolutions.replace(guanjchiregthree, "");
                                Technicalsolutions = Technicalsolutions.replace(zkh, "");
                                Technicalsolutions = Technicalsolutions.replace(ykh, "");//改变后的字
                                var ss = Technicalsolutions.indexOf("，");
                                var onedh = Technicalsolutions.substring(0, ss + 1);//干掉第一个逗号前面的主题名称

                                Technicalsolutions = Technicalsolutions.replace(onedh, "");
                                if (i == 0) {
                                    //str:原始字符串，index,开始位置,end,结束位置 changeStr，改变后的字
                                    var up = Technicalsolutions;
                                    record = up;
                                } else {
                                    var up = changeStr(record, 0, 0, Technicalsolutions);
                                    record = up;
                                }
                            }
                        }
                         var Clatype=null;
                          if (DqNum==2){
                              record=ShiShiLiContent+record;
                              Clatype="Cq";
                          }else {
                              Clatype="Dq";
                          }
                        var IdDqOrder=Clatype+DqOrder;
                        var arg = {InId: InId, DqExamples: record};
                        var url = "/Claims/AddExamples";
                        var DqExaplesurl="/Claims/findDqexampleszhyt";
                        $.post(url, arg, function (text) {
                            $.getJSON(DqExaplesurl,{},function (result) {
                                var rows = result.data || [];
                                for(var i=0;i<rows.length;i++){
                                    var WOW=rows[i];
                                    var ExamrowsOrder=IdDqOrder+'Examrows'+WOW["OrderNum"];
                                    var ssltip="ssltip"+WOW["OrderNum"];
                                    var ssltrDqorder='ssltr'+WOW["OrderNum"]+InId;
                                    var sslcount="sslcount"+WOW["OrderNum"];
                                    $("#"+IdDqOrder+" tbody").append('<tr class="ssltr" id='+ssltrDqorder+'><td colspan="84" class="dqssl"><div><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+WOW["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+WOW["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a> &nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><div class="count">已输入<span id="'+sslcount+'"></span>字</div><div class="item" style="" id="ssltip'+WOW["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')" name="'+WOW["EpId"]+'" onselect="fun(this);" class="DqExamples sizep" style="font-size:'+Fontsize+'px" rows="2" cols="138"    onblur="UpdateExamples('+WOW["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + WOW["DqExamples"] + '</textarea></td></div></tr>');
                                    //加载已输入字数
                                    var sslwowcount=Count(ExamrowsOrder);
                                    document.getElementById("sslcount"+WOW["OrderNum"]).innerHTML=sslwowcount;
                                }
                                var list = document.getElementsByTagName("table");
                                for(var i=0;i<list.length;i++) {
                                    var id = list[i].id;
                                    if (id != ""){
                                        $("#" + id + ' tr').each(function (q) {
                                            $(this).children('td').each(function (x) {
                                                var TdCon = $(this)[0].children[0].childNodes;
                                                var cid = "";
                                                var tip = "";
                                                allList = [];
                                                allList.push(id);
                                                for (var j=0;j<TdCon.length;j++){
                                                    if (TdCon[j].tagName == "TEXTAREA"){
                                                        cid = TdCon[j].id;
                                                        allList.push(TdCon[j].id);
                                                    }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1 || TdCon[j].id.indexOf("ssl") > -1){
                                                        tip = TdCon[j].id;
                                                        allList.push(TdCon[j].id);
                                                    }
                                                    if (cid != "" && tip != ""){
                                                        contents.push(allList);
                                                        break;
                                                    }
                                                }
                                            });
                                        });
                                    }
                                }
                                LoadEx(contents);
                            })
                        });
                        }else {
                            var Clatype=null;
                            if (DqNum==2){
                                Clatype="Cq";
                            }else {
                                Clatype="Dq";
                            }
                            var arg = {InId: InId, DqExamples: ""};
                            var IdDqOrder=Clatype+DqOrder;
                            var url = "/Claims/AddExamples";
                            var DqExaplesurl="/Claims/findDqexampleszhyt";
                            $.post(url, arg, function (text) {
                                $.getJSON(DqExaplesurl,{},function (result) {
                                    var rows = result.data || [];
                                    for(var i=0;i<rows.length;i++){
                                        var WOW=rows[i];
                                        var ExamrowsOrder=IdDqOrder+'Examrows'+WOW["OrderNum"];
                                        var ssltip="ssltip"+WOW["OrderNum"];
                                        var ssltrDqorder='ssltr'+WOW["OrderNum"]+InId;
                                        var sslcount="sslcount"+WOW["OrderNum"];
                                        $("#"+IdDqOrder+" tbody").append('<tr class="ssltr" id='+ssltrDqorder+'><td colspan="84" class="dqssl"><div><h5>' + DqOrder + '.实施例&nbsp;<a href="javascript:void(0)" class="oredby" onclick="qeclaims('+ExamrowsOrder+','+WOW["EpId"]+')">引入权利要求内容</a>&nbsp;<a href="javascript:void(0)" class="delqy" onclick="deletessl('+WOW["EpId"]+',this)"><img src="/img/delte.png" />&nbsp;删除</a> &nbsp;<span style="color: rgb(229,71,71);">（请自行补充技术原理、运行动作、操作方法、效果等解释说明）</span></h5><div class="count">已输入<span id="'+sslcount+'"></span>字</div><div class="item" style="" id="ssltip'+WOW["OrderNum"]+'" ><img src="/img/errorgt.jpg"></div><textarea id="'+ ExamrowsOrder +'" oninput="InputValue('+ssltip+','+ExamrowsOrder+','+sslcount+')" name="'+WOW["EpId"]+'" onselect="fun(this);" class="DqExamples sizep" style="font-size:'+Fontsize+'px" rows="2" cols="138"    onblur="UpdateExamples('+WOW["EpId"]+',this.value,this)" onfocus="autoTextarea(this)" placeholder="请填写实施例...">' + WOW["DqExamples"] + '</textarea></td></div></tr>');
                                        var sslwowcount=Count(ExamrowsOrder);
                                        document.getElementById("sslcount"+WOW["OrderNum"]).innerHTML=sslwowcount;
                                    }
                                    var list = document.getElementsByTagName("table");
                                    for(var i=0;i<list.length;i++) {
                                        var id = list[i].id;
                                        if (id != ""){
                                            $("#" + id + ' tr').each(function (q) {
                                                $(this).children('td').each(function (x) {
                                                    var TdCon = $(this)[0].children[0].childNodes;
                                                    var cid = "";
                                                    var tip = "";
                                                    allList = [];
                                                    allList.push(id);
                                                    for (var j=0;j<TdCon.length;j++){
                                                        if (TdCon[j].tagName == "TEXTAREA"){
                                                            cid = TdCon[j].id;
                                                            allList.push(TdCon[j].id);
                                                        }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1 || TdCon[j].id.indexOf("ssl") > -1){
                                                            tip = TdCon[j].id;
                                                            allList.push(TdCon[j].id);
                                                        }
                                                        if (cid != "" && tip != ""){
                                                            contents.push(allList);
                                                            break;
                                                        }
                                                    }
                                                });
                                            });
                                        }
                                    }
                                    LoadEx(contents);
                                })
                            });
                        }
                    }
                }
            })
        })
    }

    //查询权利要求数据时的升序排序
    function compare(property){
        return function(a,b){
            var value1 = a[property];
            var value2 = b[property];
            return value1 - value2;
        }
    }

    //定义按字段排序的规则函数
    function sortBy(name,sort){
        console.log('name='+name+',sort='+sort);
        return function(o, p){
            var a, b;
            if (typeof o === "object" && typeof p === "object" && o && p) {
                a = parseInt(o[name]);
                b = parseInt(p[name]);
                if (a === b) {
                    return 0;
                }
                if(sort == 'asc'){
                    if (typeof a === typeof b) {
                        return a < b ? -1 : 1;
                    }
                    return typeof a < typeof b ? -1 : 1;
                }else{
                    if (typeof a === typeof b) {
                        return a > b ? -1 : 1;
                    }
                    return typeof a > typeof b ? -1 : 1;
                }
            }
            else {
                throw ("error");
            }
        }
    }

    //查询数据库所有权利要求
    function cxrowvalue() {
        var url="/Claims/cxrowvalue";
        $.getJSON(url,{},function (result) {
            var rows=result.data || [];
            rows.sort(compare('DqExclusiveorder'));
            for (var i=0;i<rows.length;i++) {
                var row = rows[i];
                var ClaimsContent = document.getElementById("ClaimsContent");
                if (row["DqNum"] == "1") {
                    var NewMonopoly = document.createElement("table");
                    var end = row["DqTechnicalsolutions"];
                    var ywdh = end.indexOf(",")//英文逗号
                    var zwdh = end.indexOf("，")//中文逗号
                    var l = null;
                    if (ywdh != -1) {
                        l = end.substring(0, ywdh);
                        l = end.substring(0, ywdh);
                    } else {
                        l = end.substring(0, zwdh);
                    }
                    var DqelementId = "Dq" + row["DqExclusiveorder"];
                   /* NewMonopoly.title = l;*/
/*                  var isWebKit =  navigator.userAgent.indexOf('Chrome') > -1;
                    if(isWebKit==true){
                        NewMonopoly.innerHTML =
                            '<tr><br>' +
                            '<td colspan="3" class="dqfmmd" style="width: 14%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                            '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 50.2%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                            '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                            '</tr>';
                    }else {*/
                        var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                        var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                        var jsfatip="jsfatip"+row["DqExclusiveorder"];
                        var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                        var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                        var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                        var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                        var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                        var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                        NewMonopoly.innerHTML =
                            '<tr><br>' +
                            '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                            '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                            '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                            '</tr>';
                    /*}*/
                    NewMonopoly.classList.add('NewMonopoly'); //添加类名
                    NewMonopoly.classList.add('kuang'); //添加类名
                    NewMonopoly.setAttribute("id", DqelementId);//添加ID
                    ClaimsContent.appendChild(NewMonopoly);
                    selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);
                    //加载已输入字数
                    var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                    var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                    var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;

                } else {
                    if ($(this).hasClass("NewMonopoly")) {
                        var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                        var ywdh = end.indexOf(",")//英文逗号
                        var zwdh = end.indexOf("，")//中文逗号
                        var l = null;
                        if (ywdh != -1) {
                            l = end.substring(0, ywdh);
                        } else {
                            l = end.substring(0, zwdh);
                        }
                        mini.get("themename").setValue(l);
                        var NewExpedient = document.createElement("table");
                        var CqelementId = "Cq" + row["DqExclusiveorder"];
                        var str = row["DqTechnicalsolutions"];
                        //引用权利要求书
                        var wz1 = str.indexOf('求');
                        var wz2 = str.indexOf('所');
                        var Referenceclaims = str.substring(wz1 + 1, wz2);

                        //主题名称
                        var wz3 = str.indexOf('的');
                        var wz4 = str.indexOf('其');
                        var themename = str.substring(wz3 + 1, wz4 - 1);
/*                        NewExpedient.title = themename;*/
                        var isWebKit =  navigator.userAgent.indexOf('WebKit') > -1;
                      /*  if(isWebKit==true){
                            NewExpedient.innerHTML =
                                '<tr><br>' +
                                '<td colspan="3" class="cqfmmd" style="width: 14%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["Dq Exclusiveorder"] + '.发明目的&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 50.2%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea><br><p class="Tespan" id="Techspan' + row["DqExclusiveorder"] + '" style="color:red;display:none;margin-top: -6px;">错误:此权利要求引用的标号大于自身请修改!</p></div></td>'+
                                '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                '</tr>';
                        }else{*/
                        var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                        var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                        var jsfatip="jsfatip"+row["DqExclusiveorder"];
                        var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                        var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                        var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];

                        var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                        var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                        var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                        NewExpedient.innerHTML =
                            '<tr><br>' +
                            '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                            '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                            '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                            '</tr>';
                  /*      }*/

                        NewExpedient.classList.add('NewExpedient'); //添加类名
                        NewExpedient.classList.add('kuang'); //添加类名
                        NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                        ClaimsContent.appendChild(NewExpedient);
                        selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                        ERRORTIS(row["DqExclusiveorder"]);
                        document.getElementById("CqTechnicalsolutions"+row["DqExclusiveorder"]).style.cssText="font-size:"+Fontsize+"px";
                        //加载已输入字数
                        var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                        document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                        var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                        document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                        var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                        document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;

                    } else {
                        //如果删除权利要求则还是会显示引用权利要求
                        var NewExpedient = document.createElement("table");
                        var isWebKit =  navigator.userAgent.indexOf('WebKit') > -1;
                      /*  if(isWebKit==true){
                            NewExpedient.innerHTML =
                                '<tr><br>' +
                                '<td colspan="3" class="cqfmmd" style="width: 14%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["Dq Exclusiveorder"] + '.发明目的&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 50.2%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea><br><p class="Tespan" id="Techspan' + row["DqExclusiveorder"] + '" style="color:red;display:none;margin-top: -6px;">错误:此权利要求引用的标号大于自身请修改!</p></div></td>'+
                                '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="item" style="" id="app1" data-mtpis="通过属性添加的提示，并带有html代码<h1>Hello Word</h1>"></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                '</tr>';
                        }else{*/
                        var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                        var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                        var jsfatip="jsfatip"+row["DqExclusiveorder"];
                        var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                        var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                        var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                        var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                        var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                        var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                        NewExpedient.innerHTML =
                            '<tr><br>' +
                            '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                            '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                            '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                            '</tr>';
                 /*       }*/
                        NewExpedient.classList.add('NewExpedient'); //添加类名
                        NewExpedient.classList.add('kuang'); //添加类名
                        NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                        ClaimsContent.appendChild(NewExpedient);
                        selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);
                        ERRORTIS(row["DqExclusiveorder"]);
                        document.getElementById("CqTechnicalsolutions"+row["DqExclusiveorder"]).style.cssText="font-size:"+Fontsize+"px";
                        //加载已输入字数
                        var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                        document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                        var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                        document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                        var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                        document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                    }
                }
            }
          var list = document.getElementsByTagName("table");
            for(var i=0;i<list.length;i++) {
                var id = list[i].id;
                if (id != ""){
                    $("#" + id + ' tr').each(function (q) {
                        $(this).children('td').each(function (x) {
                            var TdCon = $(this)[0].children[0].childNodes;
                            var cid = "";
                            var tip = "";
                            allList = [];
                            allList.push(id);
                            for (var j=0;j<TdCon.length;j++){
                                if (TdCon[j].tagName == "TEXTAREA"){
                                        cid = TdCon[j].id;
                                        allList.push(TdCon[j].id);
                                }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1 || TdCon[j].id.indexOf("ssl") > -1){
                                    tip = TdCon[j].id;
                                    allList.push(TdCon[j].id);
                                }
                                if (cid != "" && tip != ""){
                                    contents.push(allList);
                                    break;
                                }
                            }
                        });
                    });
                 }
             }
            LoadEx(contents);
        });
    }

    var rm=null;
    var rpq=null;
    //插入权利要求
    function AddClaims(DqExclusiveorder) {
          var arg={DqExclusiveorder:DqExclusiveorder};
          var url="/Claims/UpClaimsOrder";
              mini.open({
                  url:"/Claims/ClaimsType",
                  title: "请选择要插入的权利要求类型",
                  width: 500,
                  height:300,
                  ondestroy: function (action) {
                      if (action == "ok") {
                          var iframe = this.getIFrameEl();
                          var data = iframe.contentWindow.GetData();
                          data = mini.clone(data);    //必须
                          if(data[0].typeName=="无引用权利要求")
                          {
                              var urltemlate = "/Claims/findAllByTemplateId";
                              var QuanLiYaoQiuDuQuan=null;//主题名称加，
                              var DuQuanFaMingMuDi=null;//独权发明目的
                              var DuQuanYouYiXiaoGuo=null;//有益效果
                              $.getJSON(urltemlate, {}, function (result) {
                                  var data = result.data || [];
                                  for (var i = 0; i < data.length; i++) {
                                      var Sdata = data[i].field;
                                      if (Sdata == "QuanLiYaoQiuDuQuan") {
                                          QuanLiYaoQiuDuQuan = data[i].fieldContent;
                                      }
                                      if(Sdata=="DuQuanFaMingMuDi"){
                                          DuQuanFaMingMuDi=data[i].fieldContent;
                                      }
                                      if(Sdata=="DuQuanYouYiXiaoGuo"){
                                          DuQuanYouYiXiaoGuo=data[i].fieldContent;
                                      }
                                  }
                                  var str = prompt("请填写主题名称：", AssistName);
                                  if (str === null) {
                                      //?用户du按了取消内容zhi。
                                  } else {
                                      $.getJSON(url, arg, function (text) {
                                          var arg1 = {
                                              DqObjectinvention:DuQuanFaMingMuDi,
                                              DqTechnicalsolutions: str+'，'+QuanLiYaoQiuDuQuan,
                                              DqExclusiveorder: DqExclusiveorder + 1,
                                              DqNum: 1,
                                              DqBeneficialeffect:DuQuanYouYiXiaoGuo
                                          };
                                          var url = "/Claims/Claimsinsert";
                                          $.post(url, arg1, function (text) {
                                              var res1 = mini.decode(text);
                                              var data = res1.data || {};
                                              var ClaimsContent=document.getElementById("ClaimsContent");
                                              var table=document.getElementsByClassName('kuang');
                                              var nb=[];
                                              for (var i=0;i<table.length;i++){
                                                  var tableId=table[i].id;
                                                  var QcGjz=tableId.slice(2);
                                                  if(QcGjz>DqExclusiveorder){
                                                      nb.push(tableId);
                                                  }
                                              }
                                              for (var N=0;N<nb.length;N++){
                                                  var tableform=document.getElementById(nb[N]);
                                                  ClaimsContent.removeChild(tableform);
                                              }
                                              var sp={DqExclusiveorder: DqExclusiveorder};
                                              var findurl="/Claims/getDqExorderdy";
                                              $.getJSON(findurl,sp, function (text) {
                                                  var rows=text.data || [];
                                                  rows.sort(sortBy('DqExclusiveorder',"asc"));
                                                  for (var i=0;i<rows.length;i++) {
                                                      var row = rows[i];
                                                      var ClaimsContent = document.getElementById("ClaimsContent");
                                                      if (row["DqNum"] == "1") {
                                                          var NewMonopoly = document.createElement("table");
                                                          var end = row["DqTechnicalsolutions"];
                                                          var ywdh = end.indexOf(",")//英文逗号
                                                          var zwdh = end.indexOf("，")//中文逗号
                                                          var l = null;
                                                          if (ywdh != -1) {
                                                              l = end.substring(0, ywdh);
                                                          } else {
                                                              l = end.substring(0, zwdh);
                                                          }
                                                          var DqelementId ="Dq"+row["DqExclusiveorder"];

                                                          /*NewMonopoly.title = l;*/
                                                          var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                                          var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                                                          var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                                          var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                                                          var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                                          var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                                                          var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                                          var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                                          var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                                                          NewMonopoly.innerHTML =
                                                              '<tr><br>' +
                                                              '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                                                              '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                                                              '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                                                              '</tr>';
                                                          NewMonopoly.classList.add('NewMonopoly'); //添加类名
                                                          NewMonopoly.classList.add('kuang'); //添加类名
                                                          NewMonopoly.setAttribute("id", DqelementId);//添加ID
                                                          ClaimsContent.appendChild(NewMonopoly);
                                                          selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);

                                                          //加载已输入字数
                                                          var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                                                          document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                                          var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                                                          document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                                          var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                                                          document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                                      } else {
                                                          if ($(this).hasClass("NewMonopoly")) {
                                                              var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                                                              var ywdh = end.indexOf(",")//英文逗号
                                                              var zwdh = end.indexOf("，")//中文逗号
                                                              var l = null;
                                                              if (ywdh != -1) {
                                                                  l = end.substring(0, ywdh);
                                                              } else {
                                                                  l = end.substring(0, zwdh);
                                                              }
                                                              mini.get("themename").setValue(l);
                                                              var NewExpedient = document.createElement("table");
                                                              var CqelementId = "Cq" + row["DqExclusiveorder"];
                                                              var str = row["DqTechnicalsolutions"];
                                                              //引用权利要求书
                                                              var wz1 = str.indexOf('求');
                                                              var wz2 = str.indexOf('所');
                                                              var Referenceclaims = str.substring(wz1 + 1, wz2);

                                                              //主题名称
                                                              var wz3 = str.indexOf('的');
                                                              var wz4 = str.indexOf('其');
                                                              var themename = str.substring(wz3 + 1, wz4 - 1);
                                                              /*NewExpedient.title = themename;*/
                                                              var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                                              var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                                              var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                                              var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                                              var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                                              var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                                              var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                                              var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                                              var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                                              NewExpedient.innerHTML =
                                                                  '<tr><br>' +
                                                                  '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                                                  '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                                                  '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                                                  '</tr>';
                                                              NewExpedient.classList.add('NewExpedient'); //添加类名
                                                              NewExpedient.classList.add('kuang'); //添加类名
                                                              NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                                              ClaimsContent.appendChild(NewExpedient);
                                                              selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                                              ERRORTIS(row["DqExclusiveorder"]);
                                                              //加载已输入字数
                                                              var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                                              document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                                              var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                                              document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                                              var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                                              document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                                          } else {
                                                              //如果删除权利要求则还是会显示引用权利要求、、
                                                              var NewExpedient = document.createElement("table");
                                                              var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                                              var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                                              var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                                              var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                                              var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                                              var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                                              var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                                              var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                                              var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                                              NewExpedient.innerHTML =
                                                                  '<tr><br>' +
                                                                  '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                                                  '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                                                  '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                                                  '</tr>';
                                                              NewExpedient.classList.add('NewExpedient'); //添加类名
                                                              NewExpedient.classList.add('kuang'); //添加类名
                                                              NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                                              ClaimsContent.appendChild(NewExpedient);
                                                              selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                                              ERRORTIS(row["DqExclusiveorder"]);
                                                              //加载已输入字数
                                                              var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                                              document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                                              var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                                              document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                                              var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                                              document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                                          }
                                                      }
                                                  }
                                                  var list = document.getElementsByTagName("table");
                                                  contents=[];
                                                  for(var i=0;i<list.length;i++) {
                                                      var id = list[i].id;
                                                      var idparint=id.replace(/[^0-9]/ig,"");
                                                      if (id != "" && idparint>=DqExclusiveorder){
                                                          $("#" + id + ' tr').each(function (q) {
                                                              $(this).children('td').each(function (x) {
                                                                  var TdCon = $(this)[0].children[0].childNodes;
                                                                  var cid = "";
                                                                  var tip = "";
                                                                  allList = [];
                                                                  allList.push(id);
                                                                  for (var j=0;j<TdCon.length;j++){
                                                                      if (TdCon[j].tagName == "TEXTAREA"){
                                                                          cid = TdCon[j].id;
                                                                          allList.push(TdCon[j].id);
                                                                      }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1){
                                                                          tip = TdCon[j].id;
                                                                          allList.push(TdCon[j].id);
                                                                      }
                                                                      if (cid != "" && tip != ""){
                                                                          contents.push(allList);
                                                                          break;
                                                                      }
                                                                  }
                                                              });
                                                          });
                                                      }
                                                  }
                                                  LoadEx(contents);
                                              });
                                             /* window.location.href = "/Claims/index";*/
                                          });
                                      });
                                  }
                              })
                          }
                          else
                          {
                              var NewMonopoly = $(".NewMonopoly").length;
                              var end=$(".kuang")[$(".kuang").length-1].title;
                              if (NewMonopoly != 0) {
                                  rm=DqExclusiveorder+1;
                                  $("#themename1").val(AssistName);
                                  $("#Referenceclaims1").val(1);
                                  rpq=DqExclusiveorder;
                                  var ExclusiveWindow1 = mini.get("ExclusiveWindow1");
                                  ExclusiveWindow1.show();
                              } else {
                                  alert("请先填写无引用权利要求书！");
                              }
                          }
                      }
                  }
              })
    }

    //插入引用权利要求弹出框
    function cqqd1() {
        var arg={DqExclusiveorder:rpq};
        var url="/Claims/UpClaimsOrder";
        var iid = mini.loading('正在保存数据.....');
        var urltemlate = "/Claims/findAllByTemplateId";
        var QuanLiYaoQiuCongQuanOne=null;//主题名称加，
        var CongQuanFaMingMuDi=null;//从权发明目的
        var CongQuanYouYiXiaoGuo=null;//从权有益效果
        var QuanLiYaoQiuCongQuanTwo=null;//从权其特征在于:
        $.getJSON(urltemlate, {}, function (result) {
            var data = result.data || [];
            for (var i = 0; i < data.length; i++) {
                var Sdata = data[i].field;
                if (Sdata == "QuanLiYaoQiuCongQuanOne") {
                    QuanLiYaoQiuCongQuanOne = data[i].fieldContent;
                }
                if (Sdata == "CongQuanFaMingMuDi") {
                    CongQuanFaMingMuDi = data[i].fieldContent;
                }
                if (Sdata == "CongQuanYouYiXiaoGuo") {
                    CongQuanYouYiXiaoGuo = data[i].fieldContent;
                }
                if (Sdata == "QuanLiYaoQiuCongQuanTwo"){
                    if (data[i].fieldContent != ""){
                    QuanLiYaoQiuCongQuanTwo=data[i].fieldContent;
                    }else {
                    QuanLiYaoQiuCongQuanTwo="";
                    }
                }
            }
            $.getJSON(url, arg, function (text) {
                var themename = document.getElementById("themename1").value;
                var Referenceclaims = document.getElementById("Referenceclaims1").value;
                var DqTechnicalsolutions = QuanLiYaoQiuCongQuanOne + Referenceclaims + "所述的" + themename+ "，" + QuanLiYaoQiuCongQuanTwo;
                var arg1 = {DqTechnicalsolutions: DqTechnicalsolutions, DqExclusiveorder: rm, DqNum: 2,DqObjectinvention:CongQuanFaMingMuDi,DqBeneficialeffect:CongQuanYouYiXiaoGuo};
                var url = "/Claims/Claimsinsert";
                $.post(url, arg1, function (text) {
                    var res1 = mini.decode(text);
                    var data = res1.data || {};
                    mini.hideMessageBox(iid);
                    var ClaimsContent=document.getElementById("ClaimsContent");
                    var table=document.getElementsByClassName('kuang');
                    var nb=[];
                    var ord=rm-1;
                    for (var i=0;i<table.length;i++){
                        var tableId=table[i].id;
                        var QcGjz=tableId.slice(2);
                        if(QcGjz>ord){
                            nb.push(tableId);
                        }
                    }
                    for (var N=0;N<nb.length;N++){
                        var tableform=document.getElementById(nb[N]);
                        ClaimsContent.removeChild(tableform);
                    }

                    var sp={DqExclusiveorder: ord};
                    var findurl="/Claims/getDqExorderdy";
                    $.getJSON(findurl,sp, function (text) {
                        var rows=text.data || [];
                        /* rows.sort(compare('DqExclusiveorder'));*/
                        rows.sort(sortBy('DqExclusiveorder',"asc"));
                        for (var i=0;i<rows.length;i++) {
                            var row = rows[i];
                            var ClaimsContent = document.getElementById("ClaimsContent");
                            if (row["DqNum"] == "1") {
                                var NewMonopoly = document.createElement("table");
                                var end = row["DqTechnicalsolutions"];
                                var ywdh = end.indexOf(",")//英文逗号
                                var zwdh = end.indexOf("，")//中文逗号
                                var l = null;
                                if (ywdh != -1) {
                                    l = end.substring(0, ywdh);
                                } else {
                                    l = end.substring(0, zwdh);
                                }
                                var DqelementId ="Dq"+row["DqExclusiveorder"];

                                /*NewMonopoly.title = l;*/
                                var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                                var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                                var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                                var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                                NewMonopoly.innerHTML =
                                    '<tr><br>' +
                                    '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                                    '</tr>';
                                NewMonopoly.classList.add('NewMonopoly'); //添加类名
                                NewMonopoly.classList.add('kuang'); //添加类名
                                NewMonopoly.setAttribute("id", DqelementId);//添加ID
                                ClaimsContent.appendChild(NewMonopoly);
                                selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);

                                //加载已输入字数
                                var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                                document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                                document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                                document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                            } else {
                                if ($(this).hasClass("NewMonopoly")) {
                                    var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                                    var ywdh = end.indexOf(",")//英文逗号
                                    var zwdh = end.indexOf("，")//中文逗号
                                    var l = null;
                                    if (ywdh != -1) {
                                        l = end.substring(0, ywdh);
                                    } else {
                                        l = end.substring(0, zwdh);
                                    }
                                    mini.get("themename").setValue(l);
                                    var NewExpedient = document.createElement("table");
                                    var CqelementId = "Cq" + row["DqExclusiveorder"];
                                    var str = row["DqTechnicalsolutions"];
                                    //引用权利要求书
                                    var wz1 = str.indexOf('求');
                                    var wz2 = str.indexOf('所');
                                    var Referenceclaims = str.substring(wz1 + 1, wz2);

                                    //主题名称
                                    var wz3 = str.indexOf('的');
                                    var wz4 = str.indexOf('其');
                                    var themename = str.substring(wz3 + 1, wz4 - 1);
                                   /* NewExpedient.title = themename;*/
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';
                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                } else {
                                    //如果删除权利要求则还是会显示引用权利要求、、
                                    var NewExpedient = document.createElement("table");
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';
                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                }
                            }
                        }
                        var list = document.getElementsByTagName("table");
                        contents=[];
                        for(var i=0;i<list.length;i++) {
                            var id = list[i].id;
                            var idparint=id.replace(/[^0-9]/ig,"");
                            if (id != "" && idparint>=rm){
                                $("#" + id + ' tr').each(function (q) {
                                    $(this).children('td').each(function (x) {
                                        var TdCon = $(this)[0].children[0].childNodes;
                                        var cid = "";
                                        var tip = "";
                                        allList = [];
                                        allList.push(id);
                                        for (var j=0;j<TdCon.length;j++){
                                            if (TdCon[j].tagName == "TEXTAREA"){
                                                cid = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1){
                                                tip = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }
                                            if (cid != "" && tip != ""){
                                                contents.push(allList);
                                                break;
                                            }
                                        }
                                    });
                                });
                            }
                        }
                        LoadEx(contents);
                    });
                /*    window.location.href = "/Claims/index";*/
                    var ExclusiveWindow1 = mini.get("ExclusiveWindow1");
                    ExclusiveWindow1.hide();
                });
            });
        })
    }

    //加载时技术方案错误提示
    function ERRORTIS(DqExclusiveorder) {
        var CqTelId = document.getElementById('CqTechnicalsolutions' + DqExclusiveorder);
        var CqteSpan = document.getElementById('Techspan' + DqExclusiveorder);
        var s1 = CqTelId.value.replace(/，/ig, ',');
        var ywdhw = s1.indexOf(",")//英文逗号
        var zwdhw = s1.indexOf("，")//中文逗号
        var lw = null;
        if (ywdhw != -1) {
            lw = s1.substring(0, ywdhw);
        } else {
            lw = s1.substring(0, zwdhw);
        }
        //引用权利要求书
        var wz1 = lw.indexOf('求');
        var wz2 = lw.indexOf('所');
        var Referenceclaims = lw.substring(wz1 + 1, wz2);

        var arg = {selobj: Referenceclaims};
        var url = "/Claims/objListItem";
        $.post(url, arg, function (result) {
            var rowsdata = result.data || [];//字符串选中数字数组
            for (var w = 0; w < rowsdata.length; w++) {
                if (rowsdata[w] >= DqExclusiveorder) {
/*                    CqTelId.style.cssText = "color:red;font-size:"+Fontsize+"px";
                    CqteSpan.style.cssText = "dispaly:block;color:red;";*/

                    break;
                } else {
                 /*   CqTelId.style.cssText = "color:black;font-size:"+Fontsize+"px";*/
                }
            }
        });
    }

    //发明内容撰写规范
    function Writingstandard(){
     if(document.getElementById("Writingspecification").style.display=="none"){
         document.getElementById("Writingspecification").style.display="";
         document.getElementById("Writingspecification").style.cssText="margin-top:-63px";
         document.getElementById("ClaimsContent").style.cssText="margin-top:-12px";
     }else {
         document.getElementById("Writingspecification").style.display="none";
         document.getElementById("ClaimsContent").style.cssText="margin-top:-90px";
     }
     /*obj,type*/
     /*   var oBJfyuans=obj.parentElement.parentElement;//获取tr父元素
        var nodeName=oBJfyuans.lastElementChild.nodeName;
        if (nodeName=="TEXTAREA"){
        var CreaP=document.createElement("p");
        CreaP.style.cssText="width:100%;color:rgba(96,129,146,1)";
        if(type==1){
        CreaP.innerHTML=
            "指本条权利要求的技术方案可以实现的技术目的，本条权利要求无法实现的技术目的不可写上去，一般按照下列要求撰写：(i)针对现有技术中存在的缺陷或不足；(ii)用正面的、" +
            "尽可能简洁的语言客观而有根据地反映发明或者实用新型要解决的技术问题，也可以进一步说明其技术效果。对所要解决的技术问题的描述不得采用广告式宣传用语。一个技术方案可以解决一个或多个技术问题。"
        }else if(type==2){
            CreaP.innerHTML="1.权利要求有两种基本类型，产品权利要求和方法权利要求。产品权利要求要求主要指产品、设备，物品、物质、材料、工具、装置；方法权利要求主要指有时间过程要素的活动，有制造方法、使用方法、通讯方法、处理方法以及将产品用于特定用途的方法等。\n" +
                "2.一件专利申请的权利要求书中，应当至少有一项独立权利要求。\n" +
                "3.独立权利要求应当从整体上反映发明或者实用新型的技术方案，记载解决技术问题的必要技术特征。\n" +
                "必要技术特征是指，发明或者实用新型为解决其技术问题所不可缺少的技术特征，其总和足以构成发明或者实用新型的技术方案，使之区别于背景技术中所述的其他技术方案。\n" +
                "独立权利要求包含前序部分和特征部分，中间用“其特征在于”隔开；前序部分属于现有技术，但是是构成独立权利要求技术方案的必要特征；特征部分是技术方案的改进特征。\n" +
                "4.从属权利要求是用附加的技术特征对所引用的权利要求作进一步的限定。附加技术特征可以是对所引用的权利要求的技术特征作进一步限定的技术特征，也可以是增加的技术特征。\n" +
                "5.当有两项或者两项以上独立权利要求时，写在最前面的独立权利要求被称为第一独立权利要求，其他独立权利要求称为并列独立权利要求。\n" +
                "并列独立权利要求也可以引用在前的独立权利要求，例如，“一种实施权利要求 1 的方法的装置，……”； “一种制造权利要求 1 的产品的方法，……”；“一种包含权利要求 1 的部件的设备，……”；“与权利要求 1 的插座相配合的插头，……” 等。";
        }else if(type==3){
            CreaP.innerHTML="1.有益效果是指由构成发明或者实用新型的技术特征直接带来的，或者是由所述的技术特征必然产生的技术效果。有益效果是确定发明是否具有“显著的进步”，实用新型是否具有“进步”的重要依据。\n" +
                "2.有益效果可以由产率、质量、精度和效率的提高，能耗、原材料、工序的节省，加工、操作、控制、使用的简便，环境污染的治理或者根治，以及有用性能的出现等方面反映出来。 \n" +
                "3.有益效果可以通过对发明或者实用新型结构特点的分析和理论说明相结合，或者通过列出实验数据的方式予以说明，不得只断言发明或者实用新型具有有益的效果。但是，无论用哪种方式说明有益效果，都应当与现有技术进行比较，指出发明或者实用新型与现有技术的区别。\n" +
                "4.机械、电气领域中的发明或者实用新型的有益效果，在某些情况下，可以结合发明或者实用新型的结构特征和作用方式进行说明。\n" +
                "5.化学领域中的发明需要借助于实验数据来说明。对于目前尚无可取的测量方法而不得不依赖于人的感官判断的，例如味道、气味等，可以采用统计方法表示的实验结果来说明有益效果。在引用实验数据说明有益效果时，应当给出必要的实验条件和方法。";
        }else if(type==4){
            CreaP.innerHTML="1.具体实施例是针对发明创造的技术方案进行具体的详细的举例说明，应当对权利要求的技术特征给予详细说明，以支持权利要求。使发明或者实用新型所属技术领域的技术人员能够实现该发明或者实用新型。\n" +
                "2.当一个实施例足以支持权利要求所概括的技术方案时，说明书中可以只给出一个实施例。当权利要求(尤其是独立权利要求) 覆盖的保护范围较宽，其概括不能从一个实施例中找到依据时，应当给出至少两个不同实施例，以支持要求保护的范围。当权利要求相对于背景技术的改进涉及数值范围时，通常应给出两端值附近(最好是两端值)的实施例，当数值范围较宽时，还应当给出至少一个中间值的实施例。\n" +
                "3.对于产品的发明或者实用新型，实施方式或者实施例应当描述产品的机械构成、电路构成或者化学成分，说明组成产品的各部分之间的相互关系。\n" +
                "4.对于可动作的产品，只描述其构成不能使所属技术领域的技术人员理解和实现发明或者实用新型时，还应当说明其动作过程或者操作步骤。\n" +
                "5.对于方法的发明，应当写明其步骤，包括可以用不同的参数或者参数范围表示的工艺条件。\n" +
                "6.在具体实施方式部分，对最接近的现有技术或者发明或实用新型与最接近的现有技术共有的技术特征，一般来说可以不作详细的描述，但对发明或者实用新型区别于现有技术的技术特征以及从属权利要求中的附加技术特征应当足够详细地描述，以所属技术领域的技术人员能够实现该技术方案为准。\n" +
                "7.应当注意的是，为了方便专利审查，也为了帮助公众更直接地理解发明或者实用新型，对于那些就满足专利法第二十六条第三款的要求而言必不可少的内容，不能采用引证其他文件的方式撰写，而应当将其具体内容写入说明书。 \n" +
                "8.说明书有附图的，具体实施例应当应当对照附图进行说明。对照附图描述发明或者实用新型的优选的具体实施方式时，使用的附图标记或者符号应当与附图中所示的一致，并放在相应的技术名称的后面，不加括号。例如，对涉及电路连接的说明，可以写成“电阻 3 通过三极管 4 的集电极与电容 5 相连接”，不得写成“3 通过 4 与 5 连接”。";
        }

        }else if (nodeName=="P"){
            var p=oBJfyuans.lastElementChild;
            oBJfyuans.removeChild(p);
        }else if(nodeName=="SPAN"){
            var CreaP=document.createElement("p");
            CreaP.style.cssText="width:100%";
            CreaP.innerHTML="1.权利要求有两种基本类型，产品权利要求和方法权利要求。产品权利要求要求主要指产品、设备，物品、物质、材料、工具、装置；方法权利要求主要指有时间过程要素的活动，有制造方法、使用方法、通讯方法、处理方法以及将产品用于特定用途的方法等。\n" +
                "2.一件专利申请的权利要求书中，应当至少有一项独立权利要求。\n" +
                "3.独立权利要求应当从整体上反映发明或者实用新型的技术方案，记载解决技术问题的必要技术特征。\n" +
                "必要技术特征是指，发明或者实用新型为解决其技术问题所不可缺少的技术特征，其总和足以构成发明或者实用新型的技术方案，使之区别于背景技术中所述的其他技术方案。\n" +
                "独立权利要求包含前序部分和特征部分，中间用“其特征在于”隔开；前序部分属于现有技术，但是是构成独立权利要求技术方案的必要特征；特征部分是技术方案的改进特征。\n" +
                "4.从属权利要求是用附加的技术特征对所引用的权利要求作进一步的限定。附加技术特征可以是对所引用的权利要求的技术特征作进一步限定的技术特征，也可以是增加的技术特征。\n" +
                "5.当有两项或者两项以上独立权利要求时，写在最前面的独立权利要求被称为第一独立权利要求，其他独立权利要求称为并列独立权利要求。\n" +
                "并列独立权利要求也可以引用在前的独立权利要求，例如，“一种实施权利要求 1 的方法的装置，……”； “一种制造权利要求 1 的产品的方法，……”；“一种包含权利要求 1 的部件的设备，……”；“与权利要求 1 的插座相配合的插头，……” 等。";
        }

        oBJfyuans.appendChild(CreaP);*/
    }

    //文本框选中事件
    var selobj;//选中的值
    var sel_objid;//选中的元素ID
    var sel_Start;//选中字符的开始位置
    var sel_End;//选中字符的结束位置
    var sel_name;//选中元素Nmae
    function fun(obj) {
        selobj = document.getSelection();
        sel_objid = obj.id;
        sel_name = obj.name;
        sel_Start = obj.selectionStart;
        sel_End = obj.selectionEnd; //选中字符结束位置
    }

    //为浏览器兼容，所使用的选中文字转换方法
    function getSelectText2(id) {
        var t = document.getElementById(id);
        if (window.getSelection) {
            if (t.selectionStart != undefined && t.selectionEnd != undefined) {
                return t.value.substring(t.selectionStart, t.selectionEnd);
            } else {
                return "";
            }
        } else {
            return document.selection.createRange().text;
        }
    }

    //选中去括号
    function seldelbrackets() {
        var wow = getSelectText2(sel_objid.toString());//选中文字
        var Zwzkh=new RegExp("（","g");//中文左括号
        var Zwykh=new RegExp("）","g");//中文右括号
        wow=wow.replace(Zwzkh,"(");//转换成英文括号
        wow=wow.replace(Zwykh,")");
        var selvalue=document.getElementById(sel_objid).value;
        var zkhg=new RegExp('\\\u0028',"g");
        var ykhg=new RegExp('\\\u0029',"g");
        wow=wow.replace(zkhg,'');
        wow=wow.replace(ykhg,'');
        //记住的，传值的时候，第三个要传字符串
        var lwregzh=changeStr(selvalue,sel_Start,sel_End,wow);
        $("#"+sel_objid).val("");
        $("#"+sel_objid).val(lwregzh);
        SaveAll();
        selobj="";
        sel_objid="";
        sel_Start="";
        sel_End="";
        sel_name="";
    }

    //选中去数字括号
    function seldelnumberbrackets(){
        var wow = getSelectText2(sel_objid.toString());//选中文字
        var Zwzkh=new RegExp("（","g");//中文左括号
        var Zwykh=new RegExp("）","g");//中文右括号
        wow=wow.replace(Zwzkh,"(");//转换成英文括号
        wow=wow.replace(Zwykh,")");
        var selvalue=document.getElementById(sel_objid).value;
        var arg={selobj:wow};
        var url="/Claims/objListItem";
        $.post(url,arg,function (result) {
            var rowsdata = result.data || [];//字符串选中数字数组
            var rows = [];//去除重复数据 升序
            var asc = function (a, b) {
                return a - b;
            }//一个升序排序函数

            for (let i = 0; i < rowsdata.length; i++) {
                if (rows.indexOf(rowsdata[i]) === -1) {
                    rows.push(rowsdata[i]);
                }
            }
            rows.sort(asc);//升序排序
            for (var i=0;i<rows.length;i++){
                var zkhg=new RegExp('\\\u0028'+rows[i]+'\\\u0029',"g");
                wow=wow.replace(zkhg,'');
            }
            //记住的，传值的时候，第三个要传字符串
            var lwregzh=changeStr(selvalue,sel_Start,sel_End,wow);
            $("#"+sel_objid).val("");
            $("#"+sel_objid).val(lwregzh);
            SaveAll();
        })
        /*selobj="";
        sel_objid="";
        sel_Start="";
        sel_End="";
        sel_name="";*/
    }

    //选中去数字
    function seldelnumber() {
        var wow = getSelectText2(sel_objid.toString());//选中文字
        var Zwzkh=new RegExp("（","g");//中文左括号
        var Zwykh=new RegExp("）","g");//中文右括号
        wow=wow.replace(Zwzkh,"(");//转换成英文括号
        wow=wow.replace(Zwykh,")");
        var selvalue=document.getElementById(sel_objid).value;
        var arg={selobj:wow};
        var url="/Claims/objListItem";
        $.post(url,arg,function (result) {
            var rowsdata = result.data || [];//字符串选中数字数组
            var rows = [];//去除重复数据 升序
            var asc = function (a, b) {
                return a - b;
            }//一个升序排序函数

            for (let i = 0; i < rowsdata.length; i++) {
                if (rows.indexOf(rowsdata[i]) === -1) {
                    rows.push(rowsdata[i]);
                }
            }
            rows.sort(asc);//升序排序
            for (var i=0;i<rows.length;i++){
                var zkhg=new RegExp(rows[i],"g");
                var zkhog=new RegExp('0',"g");
                wow=wow.replace(zkhg,'');
                if (rows.length>1){
                 wow=wow.replace(zkhog,'');
                }
            }
            //记住的，传值的时候，第三个要传字符串
            var lwregzh=changeStr(selvalue,sel_Start,sel_End,wow);
            $("#"+sel_objid).val("");
            $("#"+sel_objid).val(lwregzh);
            SaveAll();
        })
/*        selobj="";
        sel_objid="";
        sel_Start="";
        sel_End="";
        sel_name="";*/
    }

    //保存所有权利要求通用方法
    function SaveAll() {
        var textarea=document.getElementsByTagName("textarea");
        for(var i=0;i<textarea.length;i++){
            var textareaId=textarea[i].id;
            var textId=textarea[i].name;
            var textareavalue=textarea[i].value;
            if(textId!="digitalSign"&& textId!=""){
                if (textareaId.indexOf("Examrows")!= -1){
                    var urlsave="/Claims/updssl";
                    var argb={data:textareavalue,EpId:textId};
                    $.post(urlsave,argb,function (text) {
                    });
                }else {
                    var urlsave="/Claims/updtbIndependence";
                    var argb={UpdateField:textareaId,data:textareavalue,InId:textId};
                    $.post(urlsave,argb,function (text) {
                    });
                }
            }
        }
    }

    //str:原始字符串，index,开始位置,end,结束位置 changeStr，改变后的字
    function changeStr(str,index,end,changeStr){
        return str.substr(0, index) + changeStr+ str.substr(end);
    }

    //数字转文字通用方法
    function Numberbracket(obj) {
        var wowone = getSelectText2(sel_objid.toString());//选中文字
        var wow=getSelectText2(sel_objid.toString());//选中文字
        var Zwzkh=new RegExp('\\\u0028',"g");//中文左括号
        var Zwykh=new RegExp('\\\u0029',"g");//中文右括号
        wowone=wowone.replace(Zwzkh,"（");//转换成中文括号
        wowone=wowone.replace(Zwykh,"）");
        var arg={selobj:wowone};
        var url="/Claims/objListItem";
        var strf = document.getElementById("digitalSign").value;//数字标记文本框
        if(strf.charAt(strf.length-1)=="。"){
            if(sel_objid.indexOf("DqTechnicalsolutions")!=-1 || sel_objid.indexOf("CqTechnicalsolutions")!=-1 ) {
            if (wow==document.getElementById(sel_objid).value){
            var str_before = wowone.split("，")[0];
            var strreg=new RegExp(str_before,"g");
            wowone= wowone.replace(strreg,"zifu");
            }
        }
            $.post(url, arg, function (result) {
            var rowsdata = result.data || [];//字符串选中数字数组
            var rows = [];//去除重复数据 升序
            var rowsdesc = [];//去除重复数据 倒序
            var asc = function (a, b) {
                return a - b;
            }//一个升序排序函数
            var desc = function (a, b) {
                return b - a;
            };//一个倒序排序函数
            for (let i = 0; i < rowsdata.length; i++) {
                if (rows.indexOf(rowsdata[i]) === -1 && rowsdata[i] != 0) {
                    rows.push(rowsdata[i]);
                }
            }
            for (let i = 0; i < rowsdata.length; i++) {
                if (rowsdesc.indexOf(rowsdata[i]) === -1 && rowsdata[i] != 0) {
                    rowsdesc.push(rowsdata[i]);
                }
            }
            rows.sort(asc);//升序排序
            rowsdesc.sort(desc);//倒序排序

            for (var i = 0; i < rows.length; i++) {//选中文本数组
                var zwstr = [];
                var stra = document.getElementById("digitalSign").value;//数字标记文本框
                zwstr = stra.split("；");
                for (var j = 0; j < zwstr.length; j++) {//文本标记框数组
                    var bjjq = zwstr[j].indexOf("、");
                    var len = zwstr[j].length;
                    var bjid = zwstr[j].substring(0, bjjq);//文本标记id
                    var xzid = rows[i]; //选中id
                    var xzreo = new RegExp(xzid, "g");
                    var deljh = new RegExp("。", "g");
                    var bjtitle = zwstr[j].substring(bjjq + 1, len).toString();//文本标记主题
                    bjtitle = bjtitle.replace(deljh, "");
                    var regthnr = new RegExp(bjtitle + '（' + bjid + '）', "g");
                    var regthnrbdkh = new RegExp(bjtitle + bjid, "g");
                    if (bjid == xzid) {
                        var thnrdkh = bjtitle + '（' + bjid + '）';//带括号
                        var thnrbdkh = bjtitle + bjid;//不带括号
                        if (xzid < 10) {
                            for (var dw = 0; dw < rowsdesc.length; dw++) {
                                wowone = wowone.replace(regthnr, "aa");
                                wowone = wowone.replace(regthnrbdkh, "bb");
                                if (rowsdesc[dw] >= 10) {
                                    var yzfc = rowsdesc[dw].toString();
                                    var thyzfc = yzfc.replace(xzreo, "w");
                                    var reo2 = new RegExp(yzfc, "g");

                                    wowone = wowone.replace(reo2, thyzfc);
                                }
                            }
                        } else {
                            for (var dw = 0; dw < rows.length; dw++) {
                                wowone = wowone.replace(regthnr, "aa");
                                wowone = wowone.replace(regthnrbdkh, "bb");
                                if (rows[dw] >= 10 && rows[dw] != xzid) {
                                    var yzfc = rows[dw].toString();
                                    var thyzfc = yzfc.replace(xzreo, "w");
                                    var reo2 = new RegExp(yzfc, "g");
                                    wowone = wowone.replace(reo2, thyzfc);
                                }
                            }
                        }


                        if (obj == "dkh") {//数转带括号数字
                            wowone = wowone.replace(xzreo, thnrdkh);
                            //转换回来
                            var wreg = new RegExp("w", "g");
                            var yeskhzureg = new RegExp("aa", "g");
                            var nokhzureg = new RegExp("bb", "g");
                            wowone = wowone.replace(yeskhzureg, thnrdkh);
                            wowone = wowone.replace(nokhzureg, thnrbdkh);
                            wowone = wowone.replace(wreg, xzid);
                        } else if (obj == "bdkh") {//数转不带括号文字
                            wowone = wowone.replace(xzreo, thnrbdkh);
                            //转换回来
                            var wreg = new RegExp("w", "g");
                            var yeskhzureg = new RegExp("aa", "g");
                            var nokhzureg = new RegExp("bb", "g");

                            wowone = wowone.replace(yeskhzureg, thnrdkh);
                            wowone = wowone.replace(nokhzureg, thnrbdkh);
                            wowone = wowone.replace(wreg, xzid);
                        } else if (obj == "zwz") {//数转文字
                            wowone = wowone.replace(xzreo, bjtitle);
                            //转换回来
                            var wreg = new RegExp("w", "g");
                            var yeskhzureg = new RegExp("aa", "g");
                            var nokhzureg = new RegExp("bb", "g");
                            wowone = wowone.replace(yeskhzureg, thnrdkh);
                            wowone = wowone.replace(nokhzureg, thnrbdkh);
                            wowone = wowone.replace(wreg, xzid);
                        }
                    }
                }
            }
            var selvalue = document.getElementById(sel_objid).value;
            if (sel_objid.indexOf("DqTechnicalsolutions") != -1 || sel_objid.indexOf("CqTechnicalsolutions") != -1 ) {
                if (wow == document.getElementById(sel_objid).value){
                var str_before = selvalue.split("，")[0];
                var zifu = new RegExp("zifu", "g");
                wowone = wowone.replace(zifu, str_before);
                }
            }
            //记住的，传值的时候，第三个要传字符串
            var lwregzh = changeStr(selvalue, sel_Start, sel_End, wowone);
            $("#" + sel_objid).val("");
            $("#" + sel_objid).val(lwregzh);
            SaveAll();
            sel_objid="";
        })
        }else {
            alert("数字标记请以句号结尾！");
        }
    }

    //文字转数字通用方法
    function Texttobracketednumber(obj) {
        var wow = getSelectText2(sel_objid.toString());//选中文字
        var zwstr = [];
        var io=[];
        var ao=[];
        var stra = document.getElementById("digitalSign").value;//数字标记文本框
        var stabasc=document.getElementById("digitalSign").value;
        var regss=new RegExp("。","g");
        stabasc=stabasc.replace(regss,"");
        if(stra.charAt(stra.length-1)=="。"){
            zwstr = stra.split("；");
            //字符串数字倒序
            var rtn = zwstr.map(i => ({raw: i, len: i.length}))
                .sort((p, n) => n.len - p.len)
                .map(i => i.raw).toString();
            io = rtn.split(",");
            //字符串数字升序
            var wp=stabasc.split("；");
            var sp=wp.sort(function(a,b){return a.length - b.length}).toString();
            ao = sp.split(",");

            for (var j=0;j<io.length;j++){
                var bjjq = io[j].indexOf("、");
                var len = io[j].length;
                var bjid = io[j].substring(0, bjjq);//文本标记id
                var deljh=new RegExp("。","g");
                var bjtitle = io[j].substring(bjjq + 1, len).toString();//文本标记主题
                bjtitle = bjtitle.replace(deljh,"");

                var thnr = bjtitle + "（" + bjid + "）".toString();//替换字符 带括号
                var threg=new RegExp(thnr,"g");
                wow = wow.replace(threg,"a"+bjid);

                var thnrone = bjtitle + bjid.toString();//不带括号
                var thregone=new RegExp(thnrone,"g");
                wow = wow.replace(thregone,"b"+bjid);

                var thregtwo=new RegExp(bjtitle,"g");//文字
                wow = wow.replace(thregtwo,"c"+bjid);
            }

            for (var j=0;j<ao.length;j++) {
                var bjjq = ao[j].indexOf("、");
                var len = ao[j].length;
                var bjid = ao[j].substring(0, bjjq);//文本标记id
                var deljh = new RegExp("。", "g");
                var bjtitle = ao[j].substring(bjjq + 1, len).toString();//文本标记主题
                bjtitle = bjtitle.replace(deljh, "");
                var thnr = bjtitle + "（" + bjid + "）".toString();//替换字符 带括号
                var thnrone = bjtitle + bjid.toString();//不带括号

                var dkhbiteid=new RegExp("a"+bjid,"g");
                var ddkhbiteid=new RegExp("b"+bjid,"g");
                var biteidc=new RegExp("c"+bjid,"g");

                if(obj=="one"){
                    wow=wow.replace(biteidc,thnr);
                    wow=wow.replace(dkhbiteid,thnr);
                    wow=wow.replace(ddkhbiteid,thnrone);
                }else{
                    wow=wow.replace(biteidc,thnrone);
                    wow=wow.replace(dkhbiteid,thnr);
                    wow=wow.replace(ddkhbiteid,thnrone);
                }
            }

            var selvalue=document.getElementById(sel_objid).value;
            //记住的，传值的时候，第三个要传字符串
            var lwregzh=changeStr(selvalue,sel_Start,sel_End,wow);
            $("#"+sel_objid).val("");
            $("#"+sel_objid).val(lwregzh);
            SaveAll();
            sel_objid="";
        }else {
            alert("数字标记请以句号结尾！");
        }
    }

    //根据位置匹配
    function UO() {
        var wow = getSelectText2(sel_objid.toString());//选中文字
        var wowone = getSelectText2(sel_objid.toString());//选中文字
        var zkhg=new RegExp('\\\u0028',"g");//英文左括号
        var ykhg=new RegExp('\\\u0029',"g");//英文右括号
        wow=wow.replace(zkhg,"（");//转换成中文括号
        wow=wow.replace(ykhg,"）");
        var arg={selobj:wow};
        var url="/Claims/objListItem";
        $.post(url, arg, function (result) {


        })
    }

    //数字引用撰写事件
    function NewCitation(obj) {
        if(sel_objid.indexOf("Technicalsolutions")!=-1){//非技术访问不能用数字撰写功能
          if (obj.value=="数字转带括号文字"){
              Numberbracket();
          }else if(obj.value=="数字转纯文字"){
              Digitaltotext();
          }else if(obj.value=="数字转不带括号文字"){
              NumberWithoutbrackets();
          }
        }
        else
       {
            alert("请选择技术方案中的内容进行数字引用撰写!");
        }
    }

    //新增独权
    function Newdq(){
        $("#Dqthemename").val(AssistName);
        var DqExclusiveWindow = mini.get("DqExclusiveWindow");
        DqExclusiveWindow.show();
    }
    function dqqd(){
        selobj="";
        sel_objid="";
        sel_Start="";
        sel_End="";
        sel_name="";
        var iid = mini.loading('正在保存数据.....');
        var urltemlate = "/Claims/findAllByTemplateId";
        var QuanLiYaoQiuDuQuan=null;//主题名称加，
        var DuQuanFaMingMuDi=null;//独权发明目的
        var DuQuanYouYiXiaoGuo=null;//有益效果
        $.getJSON(urltemlate, {}, function (result) {
            var data=result.data || [];
            for(var i=0;i<data.length;i++){
                var Sdata=data[i].field;
                if(Sdata=="QuanLiYaoQiuDuQuan"){
                    QuanLiYaoQiuDuQuan=data[i].fieldContent;
                }
                if(Sdata=="DuQuanFaMingMuDi"){
                    DuQuanFaMingMuDi=data[i].fieldContent;
                }
                if(Sdata=="DuQuanYouYiXiaoGuo"){
                    DuQuanYouYiXiaoGuo=data[i].fieldContent;
                }
            }
            var New= $(".NewMonopoly").length;
            if (New==0){
                var str=document.getElementById("themename").value;
                if(str===null){
                    //?用户du按了取消内容zhi。
                }
                else
                {
                    var NewMonopoly=document.createElement("table");
                    /*NewMonopoly.title=str;*/
                    var kuang=$('.kuang');
                    var kuangjia=kuang.length+1;
                    /*NewMonopoly.innerHTML=
                        '<tr><td colspan="3" class="dqfmmd"><h5>'+kuangjia+'.发明目的&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span><a href="#" class="delqy" onclick="deleteqlyq('+kuangjia+')">删除</a></h5><textarea id="DqObjectinvention'+kuangjia+'" onselect="fun(this);"  class="DqObjectinvention" rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">'+DuQuanFaMingMuDi+'</textarea></td></tr>'+
                        '<tr><td colspan="3" class="dqjsfa"><h5>'+kuangjia+'.技术方案&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span></h5><textarea id="DqTechnicalsolutions'+kuangjia+'" class="DqTechnicalsolutions" onselect="fun(this);" rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">'+str+"，"+QuanLiYaoQiuDuQuan+'</textarea></td></tr>'+
                        '<tr><td colspan="3" class="dqyyxg"><h5>'+kuangjia+'.有益效果&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span></h5><textarea id="DqBeneficialeffect'+kuangjia+'" class="DqBeneficialeffect" onselect="fun(this);"  rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">'+DuQuanYouYiXiaoGuo+'</textarea><br><br><br></td></tr>';
                    NewMonopoly.classList.add('NewMonopoly'); //添加类名
                    NewMonopoly.classList.add('kuang'); //添加类名
                    NewMonopoly.setAttribute("id","Dq"+kuangjia);//添加ID
                    var ClaimsContent =document.getElementById("ClaimsContent");
                    ClaimsContent.appendChild(NewMonopoly);*/
                }
            }else {
                /*var end=$(".kuang")[$(".kuang").length-1].title;*/
                /*var Dq1title=document.getElementById("Dq1").title;*/
                var str=document.getElementById("themename").value;
                if(str===null){
                    //?用户du按了取消内容zhi。
                }else{
                    var NewMonopoly=document.createElement("table");
                    /*NewMonopoly.title=str;*/
                    var kuang=$('.kuang');
                    var kuangjia=kuang.length+1;
                    /*    NewMonopoly.innerHTML=
                            '<tr><td colspan="3" class="dqfmmd"><h5>'+kuangjia+'.发明目的&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span><a href="#" class="delqy" onclick="deleteqlyq('+kuangjia+')">删除</a></h5><textarea id="DqObjectinvention'+kuangjia+'" onselect="fun(this);"  class="DqObjectinvention" rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">'+DuQuanFaMingMuDi+'</textarea></td></tr>'+
                            '<tr><td colspan="3" class="dqjsfa"><h5>'+kuangjia+'.技术方案&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span></h5><textarea id="DqTechnicalsolutions'+kuangjia+'" onselect="fun(this);" class="DqTechnicalsolutions" onselect="fun(this);" rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">'+str+"，"+QuanLiYaoQiuDuQuan+'</textarea></td></tr>'+
                            '<tr><td colspan="3" class="dqyyxg"><h5>'+kuangjia+'.有益效果&nbsp;<span style="color:#136EAC;font-size:10px">(独权)*</span></h5><textarea id="DqBeneficialeffect'+kuangjia+'" onselect="fun(this);" class="DqBeneficialeffect"  rows="2" cols="138" onblur="dqblursave(this)" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">'+DuQuanYouYiXiaoGuo+'</textarea><br><br><br></td></tr>';
                        NewMonopoly.classList.add('NewMonopoly'); //添加类名
                        NewMonopoly.classList.add('kuang'); //添加类名
                        NewMonopoly.setAttribute("id","Dq"+kuangjia);//添加ID
                        var ClaimsContent =document.getElementById("ClaimsContent");
                        ClaimsContent.appendChild(NewMonopoly);*/
                }
            }

            //新增同时保存
            var form = new mini.Form("#ClaimsContent");
            var Data = form.getData();
            form.validate();
            var dqid=kuangjia;
            /*var Texreas=document.getElementById(NewMonopoly.id).getElementsByTagName("textarea");
             //独权数据
          var DqObjectinvention=Texreas[0].value;
             var DqTechnicalsolutions=Texreas[1].value;
             var DqBeneficialeffect=Texreas[2].value;*/
            var DqExclusiveorder=dqid;
            var Dqthemename = document.getElementById("Dqthemename").value;
            /*    var DqNum=""+dqid;*/
            if (form.isValid()) {
                //form.loading("保存中......");
                var arg={
                    DqObjectinvention:""+DuQuanFaMingMuDi,
                    DqTechnicalsolutions:""+Dqthemename+"，"+QuanLiYaoQiuDuQuan,
                    DqBeneficialeffect:""+DuQuanYouYiXiaoGuo,
                    DqExclusiveorder:""+DqExclusiveorder,
                    OnlyId:""+DqExclusiveorder,
                    DqNum:"1",
                };
                var urlsave = "/Claims/save";
                $.post(urlsave,arg,function (text) {
                    var res1 = mini.decode(text);
                    var data=res1.data || {};
                    //mini.alert('背景技术保存成功','系统提示',function(){
                    form.setData(data);
                    //});
                    form.unmask();
                    var sp={DqExclusiveorder:""+DqExclusiveorder};
                    var findurl="/Claims/getDqExorderlq";
                    $.getJSON(findurl,sp, function (text) {
                        var rows=text.data || [];
                        /* rows.sort(compare('DqExclusiveorder'));*/
                        var DqExclusiveWindow = mini.get("DqExclusiveWindow");
                        DqExclusiveWindow.hide();
                        mini.hideMessageBox(iid);
                        for (var i=0;i<rows.length;i++) {
                            var row = rows[i];
                            var ClaimsContent = document.getElementById("ClaimsContent");
                            if (row["DqNum"] == "1") {
                                var NewMonopoly = document.createElement("table");
                                var end = row["DqTechnicalsolutions"];
                                var ywdh = end.indexOf(",")//英文逗号
                                var zwdh = end.indexOf("，")//中文逗号
                                var l = null;
                                if (ywdh != -1) {
                                    l = end.substring(0, ywdh);
                                } else {
                                    l = end.substring(0, zwdh);
                                }
                                var DqelementId ="Dq"+row["DqExclusiveorder"];

                                /*NewMonopoly.title = l;*/
                                var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                                var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                                var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                                var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                                NewMonopoly.innerHTML =
                                    '<tr><br>' +
                                    '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                                    '</tr>';

                                NewMonopoly.classList.add('NewMonopoly'); //添加类名
                                NewMonopoly.classList.add('kuang'); //添加类名
                                NewMonopoly.setAttribute("id", DqelementId);//添加ID
                                ClaimsContent.appendChild(NewMonopoly);
                                selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);
                                //加载已输入字数
                                var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                                document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                                document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                                document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                            } else {
                                if ($(this).hasClass("NewMonopoly")) {
                                    var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                                    var ywdh = end.indexOf(",")//英文逗号
                                    var zwdh = end.indexOf("，")//中文逗号
                                    var l = null;
                                    if (ywdh != -1) {
                                        l = end.substring(0, ywdh);
                                    } else {
                                        l = end.substring(0, zwdh);
                                    }
                                    mini.get("themename").setValue(l);
                                    var NewExpedient = document.createElement("table");
                                    var CqelementId = "Cq" + row["DqExclusiveorder"];
                                    var str = row["DqTechnicalsolutions"];
                                    //引用权利要求书
                                    var wz1 = str.indexOf('求');
                                    var wz2 = str.indexOf('所');
                                    var Referenceclaims = str.substring(wz1 + 1, wz2);

                                    //主题名称
                                    var wz3 = str.indexOf('的');
                                    var wz4 = str.indexOf('其');
                                    var themename = str.substring(wz3 + 1, wz4 - 1);
                                    /*NewExpedient.title = themename;*/
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';
                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                } else {
                                    //如果删除权利要求则还是会显示引用权利要求、、
                                    var NewExpedient = document.createElement("table");
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';
                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                }
                            }
                        }
                        var list = document.getElementsByTagName("table");
                        contents=[];
                        for(var i=0;i<list.length;i++) {
                            var id = list[i].id;
                            var idparint=id.replace(/[^0-9]/ig,"");
                            if (id != "" && idparint>=DqExclusiveorder){
                                $("#" + id + ' tr').each(function (q) {
                                    $(this).children('td').each(function (x) {
                                        var TdCon = $(this)[0].children[0].childNodes;
                                        var cid = "";
                                        var tip = "";
                                        allList = [];
                                        allList.push(id);
                                        for (var j=0;j<TdCon.length;j++){
                                            if (TdCon[j].tagName == "TEXTAREA"){
                                                cid = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1){
                                                tip = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }
                                            if (cid != "" && tip != ""){
                                                contents.push(allList);
                                                break;
                                            }
                                        }
                                    });
                                });
                            }
                        }
                        LoadEx(contents);
                    })
                })
            }
        })
    }

    //新增从权
    function Newcq(e) {
        var NewMonopoly = $(".NewMonopoly").length;
       /* var end=$(".kuang")[$(".kuang").length-1].title;*/
      /*  var Dq1title=document.getElementById("Dq1").title;*/
        if (NewMonopoly != 0) {
            $("#themename").val(AssistName);
            $("#Referenceclaims").val(1);
            var ExclusiveWindow = mini.get("ExclusiveWindow");
            ExclusiveWindow.show();
        } else {
            alert("请先填写无引用权利要求书！");
        }
    }
    function cqqd() {
        var iid = mini.loading('正在保存数据.....');
        var urltemlate = "/Claims/findAllByTemplateId";
        var CongQuanFaMingMuDi=null;//从权发明目的
        var QuanLiYaoQiuCongQuanOne=null;//主题名称加，
        var CongQuanYouYiXiaoGuo=null;//从权有益效果
        var QuanLiYaoQiuCongQuanTwo=null;//从权其特征在于:
        $.getJSON(urltemlate, {}, function (result) {
            var data = result.data || [];
            for (var i = 0; i < data.length; i++) {
                var Sdata = data[i].field;
                if (Sdata == "QuanLiYaoQiuCongQuanOne") {
                    QuanLiYaoQiuCongQuanOne = data[i].fieldContent;
                }
                if (Sdata == "CongQuanFaMingMuDi") {
                    CongQuanFaMingMuDi = data[i].fieldContent;
                }
                if (Sdata == "CongQuanYouYiXiaoGuo") {
                    CongQuanYouYiXiaoGuo = data[i].fieldContent;
                }
                if (Sdata == "QuanLiYaoQiuCongQuanTwo"){
                    QuanLiYaoQiuCongQuanTwo=data[i].fieldContent;
                }
            }
            var NewMonopoly = $(".NewMonopoly").length;
            var kuang = $('.kuang');
            var kuangjia = kuang.length + 1;
            var themename = document.getElementById("themename").value;
            var Referenceclaims = document.getElementById("Referenceclaims").value;

            /*var NewExpedient = document.createElement("table");
            NewExpedient.innerHTML = '<tr><td  colspan="3" class="cqfmmd" ><h5>' + kuangjia + '.发明目的&nbsp;<span style="color:red;font-size:10px">(从权)*</span><a href="#" class="delqy" onclick="deleteqlyq(' + kuangjia + ')">删除</a></h5><textarea id="CqObjectinvention' + kuangjia + '" onselect="fun(this);" class="CqObjectinvention" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">'+CongQuanFaMingMuDi+'</textarea></td></tr>' +
                '<tr><td  colspan="3" class="cqjsfa" ><h5>' + kuangjia + '.技术方案&nbsp;<span style="color:red;font-size:10px">(从权)*</span></h5><textarea id="CqTechnicalsolutions' + kuangjia + '" class="CqTechnicalsolutions" onselect="fun(this);" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案..."></textarea></td></tr>' +
                '<tr><td  colspan="3" class="cqyyxg" ><h5>' + kuangjia + '.有益效果&nbsp;<span style="color:red;font-size:10px">(从权)*</span></h5><textarea id="CqBeneficialeffect' + kuangjia + '" class="CqBeneficialeffect" onselect="fun(this);" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">'+CongQuanYouYiXiaoGuo+'</textarea><br><br><br></td></tr>';
            NewExpedient.classList.add('NewExpedient'); //添加类名
            NewExpedient.classList.add('kuang'); //添加类名
            NewExpedient.setAttribute("id", "Cq" + kuangjia);//添加ID
            NewExpedient.title = themename;
            var ClaimsContent = document.getElementById("ClaimsContent");
            ClaimsContent.appendChild(NewExpedient);*/

            var CqId = "Cq" + kuangjia;
            /*var Texreas = document.getElementById(CqId).getElementsByTagName("textarea");
            Texreas[1].value = QuanLiYaoQiuCongQuanOne + Referenceclaims + "所述的" + themename+"，"+ QuanLiYaoQiuCongQuanTwo;*/
            //从权新增同时保存
            var form = new mini.Form("#ClaimsContent");
            var Data = form.getData();
            form.validate();
            var cqid = kuangjia;
            //从权数据
            var CqObjectinvention = CongQuanFaMingMuDi;
            var CqTechnicalsolutions =QuanLiYaoQiuCongQuanOne + Referenceclaims + "所述的" + themename+"，"+ QuanLiYaoQiuCongQuanTwo;
            var CqBeneficialeffect = CongQuanYouYiXiaoGuo;
            var Cqexpedientorder = cqid;
            if (form.isValid()) {
                //form.loading("保存中......");
                var argb = {
                    DqObjectinvention: CqObjectinvention,
                    DqTechnicalsolutions: CqTechnicalsolutions,
                    DqBeneficialeffect: CqBeneficialeffect,
                    DqExclusiveorder: "" + Cqexpedientorder,
                    OnlyId: "" + Cqexpedientorder,
                    DqNum: "2",
                };
                var urlsave = "/Claims/save";
                $.post(urlsave, argb, function (text) {
                    var res1 = mini.decode(text);
                    var data = res1.data || {};
                    form.setData(data);
                    form.unmask();
                    var ExclusiveWindow = mini.get("ExclusiveWindow");
                    ExclusiveWindow.hide();
                    mini.hideMessageBox(iid);
                    var sp={DqExclusiveorder:""+Cqexpedientorder};
                    var findurl="/Claims/getDqExorderlq";
                    $.getJSON(findurl,sp, function (text) {
                        var rows=text.data || [];
                         rows.sort(compare('DqExclusiveorder'));

                        for (var i=0;i<rows.length;i++) {
                            var row = rows[i];
                            var ClaimsContent = document.getElementById("ClaimsContent");
                            if (row["DqNum"] == "1") {
                                var NewMonopoly = document.createElement("table");
                                var end = row["DqTechnicalsolutions"];
                                var ywdh = end.indexOf(",")//英文逗号
                                var zwdh = end.indexOf("，")//中文逗号
                                var l = null;
                                if (ywdh != -1) {
                                    l = end.substring(0, ywdh);
                                } else {
                                    l = end.substring(0, zwdh);
                                }
                                var DqelementId ="Dq"+row["DqExclusiveorder"];

                                /*NewMonopoly.title = l;*/
                                var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                var DqObjectinvention="DqObjectinvention"+row["DqExclusiveorder"];
                                var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                var DqTechnicalsolutions="DqTechnicalsolutions"+row["DqExclusiveorder"];
                                var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                var DqBeneficialeffect="DqBeneficialeffect"+row["DqExclusiveorder"];

                                var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];

                                NewMonopoly.innerHTML =
                                    '<tr><br>' +
                                    '<td colspan="3" class="dqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="DqObjectinvention' + row["DqExclusiveorder"] + '" oninput="InputValue('+fmmdtip+','+DqObjectinvention+','+fmmdidcount+')" onselect="fun(this);" class="DqObjectinvention sizep" rows="2" cols="138" onblur="dqblursave(this)" name="' + row["InId"] + '" style="font-size:' + Fontsize + 'px"  onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims(' + row["DqExclusiveorder"] + ')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ',' + row["DqNum"] + ',' + row["DqExclusiveorder"] + ')"><img src="/img/addssl.png" />&nbsp;添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" id="Dqa' + row["DqExclusiveorder"] + '" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqTechnicalsolutions' + row["DqExclusiveorder"] + '" oninput="InputValue('+jsfatip+','+DqTechnicalsolutions+','+jsfaidcount+')" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqTechnicalsolutions sizep" rows="2" cols="138" onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>' +
                                    '<td colspan="3" class="dqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'" ><img src="/img/errorgt.jpg"/></div><textarea id="DqBeneficialeffect' + row["DqExclusiveorder"] + '" style="font-size:' + Fontsize + 'px" onselect="fun(this);" name="' + row["InId"] + '" class="DqBeneficialeffect sizep" rows="2" cols="138" oninput="InputValue('+yyxgtip+','+DqBeneficialeffect+','+yyxgidcount+')"   onblur="dqblursave(this)"  onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>' +
                                    '</tr>';
                                NewMonopoly.classList.add('NewMonopoly'); //添加类名
                                NewMonopoly.classList.add('kuang'); //添加类名
                                NewMonopoly.setAttribute("id", DqelementId);//添加ID
                                ClaimsContent.appendChild(NewMonopoly);
                                selssl(row["InId"], "Dq" + row["DqExclusiveorder"], row["DqExclusiveorder"]);
                                //加载已输入字数
                                var fmmdcount=Count('DqObjectinvention' + row["DqExclusiveorder"] );
                                document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                var jsfacount=Count('DqTechnicalsolutions' + row["DqExclusiveorder"] );
                                document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                var yyxgcount=Count('DqBeneficialeffect' + row["DqExclusiveorder"] );
                                document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                            } else {
                                if ($(this).hasClass("NewMonopoly")) {
                                    var end = $(".NewMonopoly")[$(".NewMonopoly").length - 1].title;
                                    var ywdh = end.indexOf(",")//英文逗号
                                    var zwdh = end.indexOf("，")//中文逗号
                                    var l = null;
                                    if (ywdh != -1) {
                                        l = end.substring(0, ywdh);
                                    } else {
                                        l = end.substring(0, zwdh);
                                    }
                                    mini.get("themename").setValue(l);
                                    var NewExpedient = document.createElement("table");
                                    var CqelementId = "Cq" + row["DqExclusiveorder"];
                                    var str = row["DqTechnicalsolutions"];
                                    //引用权利要求书
                                    var wz1 = str.indexOf('求');
                                    var wz2 = str.indexOf('所');
                                    var Referenceclaims = str.substring(wz1 + 1, wz2);

                                    //主题名称
                                    var wz3 = str.indexOf('的');
                                    var wz4 = str.indexOf('其');
                                    var themename = str.substring(wz3 + 1, wz4 - 1);
                                    /*NewExpedient.title = themename;*/
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';

                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                } else {
                                    //如果删除权利要求则还是会显示引用权利要求、、
                                    var NewExpedient = document.createElement("table");
                                    var fmmdtip="fmmdtip"+row["DqExclusiveorder"];
                                    var CqObjectinvention="CqObjectinvention"+row["DqExclusiveorder"];
                                    var jsfatip="jsfatip"+row["DqExclusiveorder"];
                                    var CqTechnicalsolutions="CqTechnicalsolutions"+row["DqExclusiveorder"];
                                    var yyxgtip="yyxgtip"+row["DqExclusiveorder"];
                                    var CqBeneficialeffect="CqBeneficialeffect"+row["DqExclusiveorder"];
                                    var fmmdidcount="fmmdcount"+row["DqExclusiveorder"];
                                    var jsfaidcount="jsfacount"+row["DqExclusiveorder"];
                                    var yyxgidcount="yyxgcount"+row["DqExclusiveorder"];
                                    NewExpedient.innerHTML =
                                        '<tr><br>' +
                                        '<td colspan="3" class="cqfmmd" style="width: 19%;"><div style="position: absolute;margin-top: -43px;width: 16.6%;"><h5>' + row["DqExclusiveorder"] + '.发明目的&nbsp;</h5><div class="count">已输入<span id="fmmdcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="fmmdtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqObjectinvention' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+fmmdtip+','+CqObjectinvention+','+fmmdidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqObjectinvention sizep" onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写发明目的...">' + row["DqObjectinvention"] + '</textarea></td></div>' +
                                        '<td colspan="3" class="cqjsfa" style="width: 42%;"><div style="position: absolute;margin-top: -44px;width: 48.7%;"><h5 style="margin-top: -9px;">' + row["DqExclusiveorder"] + '.权利要求&nbsp;<a href="javascript:void(0)" class="oredby" onclick="AddClaims('+row["DqExclusiveorder"]+')"><img src="/img/addqlyq.png" />&nbsp;插入权利要求</a><a href="javascript:void(0)" class="oredby" onclick="addExamples(' + row["InId"] + ','+row["DqNum"]+','+row["DqExclusiveorder"]+')"><img src="/img/addssl.png" />&nbsp添加实施例</a><a href="javascript:void(0)" class="oredby" onclick="onCustomDialog(' + row["DqExclusiveorder"] + ',' + row["InId"] + ',' + row["DqNum"] + ')"><img src="/img/paixu.png" />&nbsp;排序</a><a href="javascript:void(0)" class="delqy" onclick="deleteqlyq(' + row["DqExclusiveorder"] + ',' + row["InId"] + ')"><img src="/img/delte.png" />&nbsp;删除</a></h5><div class="count">已输入<span id="jsfacount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="jsfatip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqTechnicalsolutions' + row["DqExclusiveorder"] + '" name="'+row["InId"]+'" oninput="InputValue('+jsfatip+','+CqTechnicalsolutions+','+jsfaidcount+')" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqTechnicalsolutions sizep"  onblur="cqblursave(this)" rows="2" cols="138" onfocus="autoTextarea(this)" placeholder="请填写技术方案...">' + row["DqTechnicalsolutions"] + '</textarea></div></td>'+
                                        '<td colspan="3" class="cqyyxg" style="width: 27%;"><div style="position: absolute;margin-top: -44px;"><h5 style="margin-top: -10px;">' + row["DqExclusiveorder"] + '.有益效果&nbsp;</h5><div class="count">已输入<span id="yyxgcount'+row["DqExclusiveorder"]+'"></span>字</div><div class="item" style="display: none;" id="yyxgtip'+row["DqExclusiveorder"]+'"><img src="/img/errorgt.jpg"/></div><textarea id="CqBeneficialeffect' + row["DqExclusiveorder"] + '"   name="'+row["InId"]+'" style="font-size:'+Fontsize+'px" onselect="fun(this);" class="CqBeneficialeffect sizep" oninput="InputValue('+yyxgtip+','+CqBeneficialeffect+','+yyxgidcount+')"  onblur="cqblursave(this)" rows="2" cols="138" style="width: 130%" onfocus="autoTextarea(this)" placeholder="请填写有益效果...">' + row["DqBeneficialeffect"] + '</textarea></div></td>'+
                                        '</tr>';
                                    NewExpedient.classList.add('NewExpedient'); //添加类名
                                    NewExpedient.classList.add('kuang'); //添加类名
                                    NewExpedient.setAttribute("id", "Cq" + row["DqExclusiveorder"]);//添加ID
                                    ClaimsContent.appendChild(NewExpedient);
                                    selssl(row["InId"], "Cq" + row["DqExclusiveorder"], row["DqExclusiveorder"], Referenceclaims);
                                    ERRORTIS(row["DqExclusiveorder"]);
                                    //加载已输入字数
                                    var fmmdcount=Count('CqObjectinvention' + row["DqExclusiveorder"] );
                                    document.getElementById("fmmdcount"+row["DqExclusiveorder"]).innerHTML=fmmdcount;
                                    var jsfacount=Count('CqTechnicalsolutions' + row["DqExclusiveorder"] );
                                    document.getElementById("jsfacount"+row["DqExclusiveorder"]).innerHTML=jsfacount;
                                    var yyxgcount=Count('CqBeneficialeffect' + row["DqExclusiveorder"] );
                                    document.getElementById("yyxgcount"+row["DqExclusiveorder"]).innerHTML=yyxgcount;
                                }
                            }
                        }
/*                        var list = document.getElementsByTagName("table");
                        contents=[];
                        for(var i=0;i<list.length;i++) {
                            var id = list[i].id;
                            var idparint=id.replace(/[^0-9]/ig,"");
                            if (id != "" && idparint>=Cqexpedientorder){
                                $("#" + id + ' tr').each(function (q) {
                                    $(this).children('td').each(function (x) {
                                        var TdCon = $(this)[0].children[0].childNodes;
                                        var cid = "";
                                        var tip = "";
                                        allList = [];
                                        allList.push(id);
                                        for (var j=0;j<TdCon.length;j++){
                                            if (TdCon[j].tagName == "TEXTAREA"){
                                                cid = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }if (TdCon[j].id.indexOf("fmmd") > -1 || TdCon[j].id.indexOf("jsfa") > -1 || TdCon[j].id.indexOf("yyxg") > -1){
                                                tip = TdCon[j].id;
                                                allList.push(TdCon[j].id);
                                            }
                                            if (cid != "" && tip != ""){
                                                contents.push(allList);
                                                break;
                                            }
                                        }
                                    });
                                });
                            }
                        }
                        LoadEx(contents);*/
                    })
                });
            }
        })
    }
    
    //查找与替换
    function Selandrep(){
        var ExclusiveWindow3 = mini.get("ExclusiveWindow3");
        ExclusiveWindow3.show();
    }
    function Startreplacement(){
        var iid = mini.loading('正在替换内容.....');
        var lookup=document.getElementById("lookup").value;//查找

        var Replacewith=document.getElementById("Replacewith").value;//替换
        var lookreg=new RegExp(lookup,"g");

        var textarea=document.getElementsByTagName("textarea");
        for(var i=0;i<textarea.length;i++){
            var textareaId=textarea[i].id;
            var textId=textarea[i].name;
            var textareavalue=textarea[i].value;
            if(textareaId.indexOf("digitalSign")==-1&& textareaId!="" ) {
            if(lookup.indexOf(".")!=-1){
                    textareavalue = textareavalue.replace(/\./g, Replacewith);
            }else {
                    textareavalue = textareavalue.replace(lookreg, Replacewith);
            }
                document.getElementById(textareaId).value = textareavalue;
            }
            if(textareaId.indexOf("digitalSign")!=-1&& textareaId!="" ) {
                if (textareaId.indexOf("Examrows") != -1) {
                    var urlsave = "/Claims/updssl";
                    var argb = {data: textareavalue, EpId: textId};
                    $.post(urlsave, argb, function (text) {
                    });
                } else {
                    var urlsave = "/Claims/updtbIndependence";
                    var argb = {UpdateField: textareaId, data: textareavalue, InId: textId};
                    $.post(urlsave, argb, function (text) {
                    });
                }
            }
        }
        SaveAll();
        mini.hideMessageBox(iid);
        mini.alert("替换完成！");
        var ExclusiveWindow3 = mini.get("ExclusiveWindow3");
        ExclusiveWindow3.hide();
    }

    //附图框展示关闭
    function shrink(){
        var display = $("#PictureDisplay").css("display");
        if(display=="none"){
            //展开附图框
            document.getElementById("PictureDisplay").style.display="";
            document.getElementById("width_auto").style.width="80%";
/*            document.getElementById("btn_list").style.marginLeft="360px";*/
            document.getElementById("zktb").title ="关闭附图框";
            document.getElementById("Opendrawings").style.display="none";
        }
        else
        {
           //关闭附图框
            document.getElementById("PictureDisplay").style.display="none";
            document.getElementById("width_auto").style.width="100%";
          /*  document.getElementById("btn_list").style.marginLeft="-73px";*/
            document.getElementById("zktb").title ="展开附图框";
            document.getElementById("Opendrawings").style.display="";

        }
    }

    /**
     * 文本框根据输入内容自适应高度 (textarea获取焦点事件)
     * @param                {HTMLElement}        输入框元素
     * @param                {Number}                设置光标与输入框保持的距离(默认0)
     * @param                {Number}                设置最大高度(可选)
     */
    var autoTextarea = function (elem, extra, maxHeight) {
        /*  extra = extra || 0;
        var isFirefox = !!document.getBoxObjectFor || 'mozInnerScreenX' in window,
            isOpera = !!window.opera && !!window.opera.toString().indexOf('Opera'),
            addEvent = function (type, callback) {
                elem.addEventListener ?
                    elem.addEventListener(type, callback, false) :
                    elem.attachEvent('on' + type, callback);
            },
            getStyle = elem.currentStyle ? function (name) {
                var val = elem.currentStyle[name];
                if (name === 'height' && val.search(/px/i) !== 1) {
                    var rect = elem.getBoundingClientRect();
                    return rect.bottom - rect.top -
                        parseFloat(getStyle('paddingTop')) -
                        parseFloat(getStyle('paddingBottom')) + 'px';
                };
                return val;
            } : function (name) {
                return getComputedStyle(elem, null)[name];
            },
            minHeight = parseFloat(getStyle('height'));

        elem.style.resize = 'none';
        var change = function () {
            var scrollTop, height,
                padding = 0,
                style = elem.style;
            if (elem._length === elem.value.length) return;
            elem._length = elem.value.length;
            if (!isFirefox && !isOpera) {
                padding = parseInt(getStyle('paddingTop')) + parseInt(getStyle('paddingBottom'));
            };
            scrollTop = document.body.scrollTop || document.documentElement.scrollTop;
            elem.style.height = minHeight + 'px';
            if (elem.scrollHeight > minHeight) {
                if (maxHeight && elem.scrollHeight > maxHeight) {
                    height = maxHeight;
                    style.overflowY = 'auto';
                } else {
                    height = elem.scrollHeight;
                    style.overflowY = 'hidden';
                };
                style.height = height + extra + 'px';
              scrollTop += parseInt(style.height) - elem.currHeight;
              document.body.scrollTop = scrollTop;
              document.documentElement.scrollTop = scrollTop;
                elem.currHeight = parseInt(style.height);
            };
        };
        addEvent('propertychange', change);
        addEvent('input', change);
        addEvent('focus', change);
        change();*/

        elem.parentNode.style.zIndex="9999";
        elem.style.height="500px";
    }

    //选择排序
    function onCustomDialog(e,InId,DqNum) {
        //e:为选择要更改的权利要求 InId:为选择的权利要求的Id
        mini.open({
            url:"/Claims/choice",
            title: "请选择对象与权利要求"+e+"进行替换顺序",
            width: 500,
            height:300,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = mini.clone(data);    //必须

                    var ReplaceDqExclus=null;//用户选择替换的权利要求
                    var ReplaceDqExclusInId=null;//用户选择替换的权利要求Inid;
                    var ReplaceDqNum=null;//用户选择替换的权利要求类型（独权从权）
                    if (data) {
                        for (var i = 0; i < data.length; i++) {
                            ReplaceDqExclus = data[i].DqExclusiveorder;
                            ReplaceDqExclusInId = data[i].InId;
                            ReplaceDqNum = data[i].DqNum;
                        }
                        var argb = {
                            InId: InId,
                            eDqExclusiveorder: e,
                            ReplaceDqExclusInId: ReplaceDqExclusInId,
                            ReplaceDqExclus: ReplaceDqExclus
                        }

                        if (DqNum == 2 && ReplaceDqNum == 1 && ReplaceDqExclus == 1) {
                            alert('该引用权利要求不能与本专利中第一条独立权利要求进行替换,请重新选择!');
                        }
                        else
                        {
                            if (ReplaceDqNum == 2 && e == 1){
                            alert('选择的引用权利要求不能与本专利中第一条独立权利要求进行替换,请重新选择!');
                            }else {
                            alert('排序发生变化请注意引用关系!');
                            var urlsave = "/Claims/UpdateDqExclusiveorderByUserIDANDInId";
                            $.post(urlsave, argb, function (text) {
                                var res1 = mini.decode(text);
                                var data = res1.data || {};
                                //mini.alert('背景技术保存成功','系统提示',function(){
                                form.setData(data);
                                //});·
                                form.unmask();
                            });
                            }
                        }
                    }
                }
                window.location.href="/Claims/index";
            }
        })
    }

    //独权实时保存
    function dqblursave(obj) {
        obj.style.height="69px";
        obj.parentNode.style.zIndex="0";
        SaveAll();
        /*  /!* selobj="";
        sel_objid="";
        sel_Start="";
        sel_End="";
        sel_name="";*!/
        var form = new mini.Form("#ClaimsContent");
        var Data = form.getData();
        form.validate();
        var dqid=obj.parentNode.parentNode.parentNode.parentNode.parentNode.id;

        var Texreas=document.getElementById(dqid).getElementsByTagName("textarea");
        var arr = dqid.match(/\d+(.\d+)?/g); // arr: ["2.75","3.65"]
        var si=""+arr+"";

        //独权数据
        var DqObjectinvention= Texreas[0].value;
        var DqTechnicalsolutions=Texreas[1].value;
        var DqBeneficialeffect=Texreas[2].value;
        var DqExclusiveorder=si;
        var DqNum=si;
        if (form.isValid()) {
            //form.loading("保存中......");
            var arg={
                DqObjectinvention:DqObjectinvention,
                DqTechnicalsolutions:DqTechnicalsolutions,
                DqBeneficialeffect:DqBeneficialeffect,
                DqExclusiveorder:""+si,
                DqNum:"1",
            };
            var urlsave = "/Claims/save";
            $.post(urlsave,arg,function (text) {
                var res1 = mini.decode(text);
                var data=res1.data || {};
                var dqtitle=obj.parentNode.parentNode.parentNode.parentNode;
                var s=DqTechnicalsolutions.replace(/，/ig,',');
                var ywdh=s.indexOf(",")//英文逗号
                var zwdh=s.indexOf("，")//中文逗号
                var l=null;
                if (ywdh != -1){
                    l = s.substring(0, ywdh);
                }
                else
                {
                    l = s.substring(0, zwdh);
                }
                /!*dqtitle.title=l;*!/
                form.setData(data);
                form.unmask();
            });
        }*/
    }

    //从权实时保存
    function cqblursave(obj) {
        obj.style.height="69px";
        obj.parentNode.style.zIndex="0";
        SaveAll();
        /*selobj=null;
        sel_objid=null;
        sel_Start=null;
        sel_End=null;
        sel_name=null;*/
        /*  var form = new mini.Form("#ClaimsContent");
        var Data = form.getData();
        form.validate();
        var cqid = obj.parentNode.parentNode.parentNode.parentNode.parentNode.id;
        var Texreas = document.getElementById(cqid).getElementsByTagName("textarea");
        var arr = cqid.match(/\d+(.\d+)?/g); // arr: ["2.75","3.65"]
        var si = "" + arr + "";
        //从权数据
        var CqObjectinvention = Texreas[0].value;
        var CqTechnicalsolutions = Texreas[1].value;
        var CqBeneficialeffect = Texreas[2].value;
        var Cqexpedientorder = si;

        var s1=obj.value.replace(/，/ig,',');
        var ywdhw=s1.indexOf(",")//英文逗号
        var zwdhw=s1.indexOf("，")//中文逗号
        var lw=null;
        if (ywdhw != -1){
            lw = s1.substring(0, ywdhw);
        }
        else
        {
            lw = s1.substring(0, zwdhw);
        }
        //引用权利要求书
        var wz1 = lw.indexOf('求');
        var wz2 = lw.indexOf('所');
        var Referenceclaims = lw.substring(wz1 + 1, wz2);
        var objid=obj.id.toString();
        var arg={selobj:Referenceclaims};
        var url="/Claims/objListItem";
        $.post(url,arg,function (result) {
            var rowsdata = result.data || [];//字符串选中数字数组
            for (var ppo=0;ppo<rowsdata.length;ppo++){
                if(objid.indexOf("CqTechnicalsolutions")!=-1){
                if(rowsdata[ppo]>=si){
                    obj.style.cssText="color:red;font-size:"+Fontsize+"px";
                    obj.nextSibling.nextSibling.style.cssText="display:block;color:red;";
                    break;
                }
                else
                {
                    obj.style.cssText="color:black;font-size:"+Fontsize+"px";
                    obj.nextSibling.nextSibling.style.cssText="display:none";
                }
              }
            }
        })

        if (form.isValid()) {
            var argb = {
                DqObjectinvention:CqObjectinvention,
                DqTechnicalsolutions:CqTechnicalsolutions,
                DqBeneficialeffect:CqBeneficialeffect,
                DqExclusiveorder:""+Cqexpedientorder,
                DqNum:"2",
            };
            var urlsave = "/Claims/save";
            $.post(urlsave,argb,function (text) {
                var res1 = mini.decode(text);
                var data=res1.data || {};
                //mini.alert('背景技术保存成功','系统提示',function(){
                form.setData(data);
                //});
                form.unmask();
            });
        }*/
    }

    //保存按钮反馈
    function Save()  {
        var iid = mini.loading('正在替换内容.....');
        var form = new mini.Form("#ClaimsContent");
        var NewMonopoly = $(".NewMonopoly").length;
        if (NewMonopoly != 0) {
            SaveAll();
            mini.hideMessageBox(iid);
            mini.alert('权利要求保存成功', '系统提示');
        }else {
            mini.alert('请填写权利要求','系统提示');
        }
    }

    //右侧图片栏
    var imgulp = new Jsequencing({
        listid:"img_ul",//页面图片列表ID
        thumbherf:"/attImages",//列表图片前缀
        bigherf:"/attImages",//原图前缀[同列表图相同时，省略]
        jsondata:true,
        imgsrcarr:[//图片数据数组
            <#if Pictuers??>
            <#list Pictuers as Pictuer>
            {src:getImageURL('${Pictuer.path}'),des:'${Pictuer.pictureDescription}',cnsort:'${Pictuer.cnSort}',attid:'${Pictuer.attId}',path:'${Pictuer.path}',showPageName:'/TechnicalField/index'},
            </#list>
            </#if>
        ],
    })
    function getImageURL(url){
        return url;
    }

    function DigitalSignSave() {
        var form = new mini.Form("DigitalForm");
        var newform = new mini.Form("NewDigitalForm");
        var Data = form.getData();
        var newData = newform.getData();
        var Digitalsigndata=document.getElementById("digitalSign").value;
        var str = Digitalsigndata.substr(Digitalsigndata.length-1,1);
        if(str != "。"){
            mini.alert("数字标记最后一位必须为。");
            return false;
        }
        if (DigitalSignid=="{}"){
            var jsonp={"digitalSign":Digitalsigndata,"id":'',"userId":'',"rowValue":''};
        }else {
            var jsonp={"digitalSign":Digitalsigndata,"id":DigitalSignid,"userId":userid,"rowValue":RowValue};
        }

        form.validate();
        if (form.isValid()){
            var arg = {
                DigitalSign:Digitalsigndata,
                Data:mini.encode(newData)
            };
            var url = "/DigitalSign/save";
            $.post(url,arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success){
                        var data = res.data || {};
                        mini.alert("保存成功!");
                        form.setData(data);
                    }else {
                        mini.alert(res.message);
                    }
                }
            )
        }
    }
    //数字标记保存
    function DigitalSignSaveReplace() {
        var form = new mini.Form("DigitalForm");
        var newform = new mini.Form("NewDigitalForm");
        var Data = form.getData();
        var newData = newform.getData();
        var Digitalsigndata=document.getElementById("digitalSign").value;
        var str = Digitalsigndata.substr(Digitalsigndata.length-1,1);
        if(str != "。"){
            mini.alert("数字标记最后一位必须为。");
            return false;
        }
        if (DigitalSignid=="{}"){
            var jsonp={"digitalSign":Digitalsigndata,"id":'',"userId":'',"rowValue":''};
        }else {
            var jsonp={"digitalSign":Digitalsigndata,"id":DigitalSignid,"userId":userid,"rowValue":RowValue};
        }

        form.validate();
        if (form.isValid()){
            var arg = {
                DigitalSign:Digitalsigndata,
                Data:mini.encode(newData)
            };
            var url = "/DigitalSign/save";
            $.post(url,arg,
                function (text) {
                    var res = mini.decode(text);
                    if (res.success){
                        var data = res.data || {};
                        form.setData(data);
                        //批量替换数字标记
                        UpField(data);
                    }else {
                        mini.alert(res.message);
                    }
                }
            )
        }
    }
    function UpField(data){
        var tips = new mini.Form("form");
        tips.loading("一键替换中......");
        var afterValue = data.digitalSign;
        var result = diff(preValue, afterValue, '；');
        var df1 = result.diff1;
        var df2 = result.diff2;
        var list = document.getElementsByTagName("textarea");
        var li = [];
        for(var i=0;i<list.length;i++){
            if(list[i].type=="textarea"){
                var id = list[i].id;
                var Identity = list[i].name;
                if (id.indexOf("Technicalsolutions")>-1 || id.indexOf("Objectinvention")>-1 || id.indexOf("Beneficialeffect")>-1 || id.indexOf("Examrows")>-1) {
                    li.push($("#" + id).val()+".&&&"+Identity+"&&&"+id);
                }
            }
        }
        if (li.length > 0){
             var url = "/Claims/taskquart?df1="+df1+"&df2="+df2;
            $.ajax({
                contentType: 'application/json',
                method: 'post',
                url: url,
                data: mini.encode(li),
                success: function (r) {
                    var _body = window.parent;
                    var _iframe1=_body.document.getElementById('frame');
                    _iframe1.contentWindow.location.reload(true);
                    tips.unmask();
                },
                failure: function (error) {

                }
            })
        }
    }
    //预览
    function SetIframeSrc(src){
        window.location.href=src;
    }
    function diff(str1, str2, separator){
        //
        str1 = str1 || "";
        str2 = str2 || "";
        separator = separator || "；";
        // arr中有ele元素
        function hasElement(arr, ele){
            // 内存循环
            var hasItem1 = false;
            for(var i2=0; i2 < arr.length; i2++){
                //
                var item2 = arr[i2] || "";
                if(!item2){
                    continue;
                }
                //
                if(ele == item2){
                    hasItem1 = true;
                    break;
                }
            }
            return hasItem1;
        };
        function inAnotB(a, b){ // 在A中，不在B中
            var res = [];
            for(var i1=0; i1 < a.length; i1++){
                var item1 = a[i1] || "";
                if(!item1){
                    continue;
                }
                var hasItem1 = hasElement(b, item1);
                if(!hasItem1){
                    res.push(item1);
                }
            }
            return res;
        };
        //
        var list1 = str1.split("；");
        var list2 = str2.split("；");
        //
        var diff1 = inAnotB(list1, list2);
        var diff2 = inAnotB(list2, list1);

        // 返回结果
        var result = {
            diff1 : diff1
            ,
            diff2 : diff2
            ,
            separator : separator
            ,
            toString : function(){
                //
                var res = this["diff1"].slice(0);
                res = res.concat(this["diff2"]);
                //
                return res.join(this["separator"]);
            }
        };
        //
        return result;
    }
    //截取最后一个、后面的字符串
    function lastStr(str) {
        var index = str.lastIndexOf("、")
        return str.substring(index + 1, str.length);
    }

    function updatefutu() {
        var PictureDescription=document.getElementById("Descriptiondrawings").value;
        var AttID = wow;
        var url = "/DrawingSpecification/updatepicturedescription";
        var arg = {AttID:AttID,PictureDescription:PictureDescription};
        var iid = mini.loading('正在保存数据.....');
        $.post(url,arg,function (result) {
            if (result.success == false){
                mini.alert(result.message);
            }
            mini.hideMessageBox(iid);
            window.location.href="/Claims/index";
        })
    }
    function closefutu() {
        window.location.href="/Claims/index";
    }

    //字体转中大小
    function zimax() {
     var textarea=document.getElementsByClassName("sizep");
     for (var i=0;i<textarea.length;i++){
         textarea[i].style.cssText="font-size:18px";
     }
     var arg={Fontsize:18};
     var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            mini.alert("修改成功");
        })
    }
    function zizhong() {
        var textarea= document.getElementsByClassName("sizep");
        for (var i=0;i<textarea.length;i++){
            textarea[i].style.cssText="font-size:15px";
        }
        var arg={Fontsize:15};
        var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            mini.alert("修改成功");
        })
    }
    function zimin() {
        var textarea= document.getElementsByClassName("sizep");
        for (var i=0;i<textarea.length;i++){
            textarea[i].style.cssText="font-size:10px";
        }
        var arg={Fontsize:10};
        var url="/Claims/UpdateFontsize";
        $.post(url,arg, function (text) {
            mini.alert("修改成功");
        })
    }

</script>
<script type="text/javascript">
    /*-------------------------- +
      获取id, class, tagName
     +-------------------------- */
    var get = {
        byId: function(id) {
            return typeof id === "string" ? document.getElementById(id) : id
        },
        byClass: function(sClass, oParent) {
            var aClass = [];
            var reClass = new RegExp("(^| )" + sClass + "( |$)");
            var aElem = this.byTagName("*", oParent);
            for (var i = 0; i < aElem.length; i++) reClass.test(aElem[i].className) && aClass.push(aElem[i]);
            return aClass
        },
        byTagName: function(elem, obj) {
            return (obj || document).getElementsByTagName(elem)
        }
    };
    var dragMinWidth = 250;
    var dragMinHeight = 370;
    /*-------------------------- +
      拖拽函数
     +-------------------------- */
    function drag(oDrag, handle)
    {

        var disX = dixY = 0;
        handle = handle || oDrag;
        handle.style.cursor = "move";
        handle.onmousedown = function (event)
        {
            var event = event || window.event;
            disX = event.clientX - oDrag.offsetLeft;
            disY = event.clientY - oDrag.offsetTop;

            document.onmousemove = function (event)
            {
                var event = event || window.event;
                var iL = event.clientX - disX;
                var iT = event.clientY - disY;
                var maxL = document.documentElement.clientWidth - oDrag.offsetWidth;
                var maxT = document.documentElement.clientHeight - oDrag.offsetHeight;

                iL <= 0 && (iL = 0);
                iT <= 0 && (iT = 0);
                iL >= maxL && (iL = maxL);
                iT >= maxT && (iT = maxT);

                oDrag.style.left = iL + "px";
                oDrag.style.top  = iT + "px";

                return false
            };

            document.onmouseup = function ()
            {
                document.onmousemove = null;
                document.onmouseup = null;
                this.releaseCapture && this.releaseCapture()
            };
            this.setCapture && this.setCapture();
            return false
        };
    }
    /*-------------------------- +
      改变大小函数
     +-------------------------- */
    function resize(oParent, handle, isLeft, isTop, lockX, lockY)
    {
        handle.onmousedown = function (event)
        {
            var event = event || window.event;
            var disX = event.clientX - handle.offsetLeft;
            var disY = event.clientY - handle.offsetTop;
            var iParentTop = oParent.offsetTop;
            var iParentLeft = oParent.offsetLeft;
            var iParentWidth = oParent.offsetWidth;
            var iParentHeight = oParent.offsetHeight;

            document.onmousemove = function (event)
            {
                var event = event || window.event;

                var iL = event.clientX - disX;
                var iT = event.clientY - disY;
                var maxW = document.documentElement.clientWidth - oParent.offsetLeft - 2;
                var maxH = document.documentElement.clientHeight - oParent.offsetTop - 2;
                var iW = isLeft ? iParentWidth - iL : handle.offsetWidth + iL;
                var iH = isTop ? iParentHeight - iT : handle.offsetHeight + iT;

                isLeft && (oParent.style.left = iParentLeft + iL + "px");
                isTop && (oParent.style.top = iParentTop + iT + "px");

                iW < dragMinWidth && (iW = dragMinWidth);
                iW > maxW && (iW = maxW);
                lockX || (oParent.style.width = iW + "px");

                iH < dragMinHeight && (iH = dragMinHeight);
                iH > maxH && (iH = maxH);
                lockY || (oParent.style.height = iH + "px");

                if((isLeft && iW == dragMinWidth) || (isTop && iH == dragMinHeight)) document.onmousemove = null;

                return false;
            };
            document.onmouseup = function ()
            {
                document.onmousemove = null;
                document.onmouseup = null;
            };
            return false;
        }
    };
    window.onload = window.onresize = function ()
    {
        var oDrag = document.getElementById("drag");
        var oTitle = get.byClass("title", oDrag)[0];
        var oL = get.byClass("resizeL", oDrag)[0];
        var oT = get.byClass("resizeT", oDrag)[0];
        var oR = get.byClass("resizeR", oDrag)[0];
        var oB = get.byClass("resizeB", oDrag)[0];
        var oLT = get.byClass("resizeLT", oDrag)[0];
        var oTR = get.byClass("resizeTR", oDrag)[0];
        var oBR = get.byClass("resizeBR", oDrag)[0];
        var oLB = get.byClass("resizeLB", oDrag)[0];

        drag(oDrag, oTitle);
        //四角
        resize(oDrag, oLT, true, true, false, false);
        resize(oDrag, oTR, false, true, false, false);
        resize(oDrag, oBR, false, false, false, false);
        resize(oDrag, oLB, true, false, false, false);
        //四边
        resize(oDrag, oL, true, false, false, true);
        resize(oDrag, oT, false, true, true, false);
        resize(oDrag, oR, false, false, false, true);
        resize(oDrag, oB, false, false, true, false);

        oDrag.style.left = (document.documentElement.clientWidth - oDrag.offsetWidth) / 2 + "px";
        oDrag.style.top = (document.documentElement.clientHeight - oDrag.offsetHeight) / 2 + "px";
    }

    function Close() {
        document.getElementById("drag").style.display = "none";
    }

    function Preview() {
        var url = "/Preview/index";
        mini.open({
            url:url,
            width:'80%',
            height:'90%',
            showModal:true,
            ondestroy:function(){

            }
        });
    }
</script>
<script type="text/javascript" reload="1">
    var ListPic = ${ListPic};
    var arr = [];
    for (var i=0;i<ListPic.length;i++){
        arr.push(ListPic[i].attId);
    }
    aimgcount[1000] = arr;
    attachimggroup(1000);
    attachimgshow(1000);
    var aimgfid = 0;
</script>
<!--错误提示悬浮窗-->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>

<script type="text/javascript">
    //====================================
    $('#app0').on('mouseenter', function(e) {
        //显示提示

        mTips.s('通过js控制的提示,并带有回调函数', function() {
            $('.item').css('height', '70px');
        });
    });

    $('#app0').on('mouseleave', function(e) {
        //移除提示
        mTips.h(function() {
            $('.item').css('height', '50px');
        });
    });

    //====================================
    //js设置样式
    $('.item-success').on('mouseenter', function(e) {
        //显示提示
        mTips.c.x = 30;
        mTips.c.y = 30;
        mTips.s('<p>通过js设置样式，并设置了配置项，这个提示比较远<p><p>并且带有html代码</p><h1>Hello Word</h1>', 'success');
    });

    $('.item-success').on('mouseleave', function(e) {
        mTips.h();
        mTips.c.x = 10;
        mTips.c.y = 10;
    });

    //====================================
    //js设置样式
    $('.item-warning').on('mouseenter', function(e) {
        //显示提示
        mTips.s('通过js设置样式，并带有回调函数', 'warning', function() {
            $('.item').css('width', '200px');
        });
    });

    $('.item-warning').on('mouseleave', function(e) {
        //移除提示
        mTips.h(function() {
            $('.item').css('width', '50px');
        });
    });

    //====================================
    //js设置样式
    $('.item-danger').on('mouseenter', function(e) {
        //显示提示
        mTips.s('通过js设置样式 ', 'danger ', function() {
            $('.item').css('border-radius', '50%');

        });
    });

    $('.item-danger').on('mouseleave', function(e) {
        //移除提示
        mTips.h(function() {
            $('.item').css('border-radius', '5px');
        });
    });

    //函数库调用结束
    //====================================
    //自定义样式项，与函数库无关
    $(document).on('mousemove', function(e) {
        var h = parseInt(50 + (e.pageY / 100));

        //				$('.item').css('height', h + 'px');

    });


    var mTips = {
        c: {
            //配置项
            x: 10, //x偏移量,相对于鼠标
            y: 10, //y偏移量,相对于鼠标

            style: {
                'position': 'fixed',
                'padding': '8px 12px',
                'color': '#fff',
                'border-radius': '5px',
                'font-family': "微软雅黑",
                'z-index': '999',
                'display': 'inline',
                'font-size': '14px',
                'background-color': 'rgba(0, 0, 0, 0.5)',
                'color': '#fff'

            }
        },
        //show方法，用于显示提示

        s: function(text, a, b) {
            var style;
            var fun;

            if(typeof(a) == 'string') {
                style = a;
                fun = b;
            } else if(typeof(a) == 'function') {
                style = b;
                fun = a;
            }

            if(style == 'undefined' || style == null) {
                style = 'default';
            }

            var doc = $('<div></div>').addClass('mTips mTips-' + style).html(text).appendTo('body');
            if(doc.css('z-index') !== '999') {
                doc.css(this.c.style);
            }

            $(document).on('mousemove', function(e) {
                $(".mTips").offset({
                    top: e.pageY + mTips.c.x,
                    left: e.pageX + mTips.c.y
                })
            });

            if(fun != null && typeof(fun) != 'undefined') {
                fun();
            }

        },

        //hide方法，用于隐藏和删除提示
        h: function(fun) {
            $('.mTips').remove();
            if(fun != 'undefined' && fun != null) {
                fun();
            }

        },

        //用于给相关属性添加提示功能
        m: function() {
            $(document).on('mouseenter', '[data-mtpis]', function(e) {
                mTips.s($(this).attr('data-mtpis'), $(this).attr('data-mtpis-style'));
            });
            $(document).on('mouseleave', '[data-mtpis]', function(e) {
                mTips.h();
            });

        }

    }
    mTips.m(); //通过此函数激活所有的
</script>
<#--HighLight-->
<script type="text/javascript" src="/js/HighLight/highlights.js?v=${version}"></script>
<script type="text/javascript">
    function LoadEx(contents) {
        var highlight = new HighLight({
            lists:contents,
            typodata:${TypoData},
        });
    }
    //计算文本框字符长度
    function Count(cid) {
        var reg = /[0-9]+/g;
        //替换回车
        var Content = $("#" + cid).val().replace(/[\r\n]/g, "");
        var Count = GetCount(Content);
        Content = Content.replace(reg,"");
        var TotalCount = (parseInt(Content.length) + parseInt(Count));
        return TotalCount;
    }

    function GetCount(Content) {
        if (Content != "") {
            var re = /(\d{1,3})+(?:\.\d+)?/g;
            var arr = Content.match(re);
            if (arr != null) {
                return arr.length;
            }else return 0;
        }else return 0;
    }
    //当文本框的值改变时重新加载错别字数组和修改建议信息
    function InputValue(tip,textareaid,countid) {
        InputValueChange(tip,textareaid,${TypoData});
        var txtid=textareaid.id;
        var cid=countid.id;
        var Co=Count(txtid);
        document.getElementById(cid).innerHTML="";
        document.getElementById(cid).innerHTML=Co;
    }
</script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<link href="/js/HighLight/jquery.highlighttextarea.css" rel="stylesheet">
</body>
</html>
