<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>知服帮知识产权工具网-专利撰写辅助工具-专利文件五书自动生成</title>
    <meta name="keywords" content="知服帮,知服帮知识产权,知服帮专利系统,专利流程管理,专利文件监控,专利CMS,专利业务管理系统,商标管理系统,商标流程管理,信息化管理系统" />
    <meta name="description" content="知服帮知识产权信息化管理系统是一套集专利业务管理、专利流程化协作、专利文件通知书监控、专利务数据管理、商标流程化管理于一体的专业化知识产权管理系统。知服帮以简化流程、提升效率，降低成本为服务目标，为设计出最适合知识产权代理机构的信息化管理系统为前进动力,力争成为行业客户首选知识产权管理工具。"/>
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/website/fonts/elegant-font/style.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.0/css/all.css">

    <link rel="stylesheet" href="/website/styles/bootstrap.css" />
    <link rel="stylesheet" href="/website/styles/main.css" />
    <link href="/js/layui/css/layui.css" rel="stylesheet" />

    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script src="https://www.layuicdn.com/layui/layui.js" type="text/javascript"></script>
    <script src="js/FiveUpload/js/upload.js" type="text/javascript"></script>
    <style>

    </style>
    <script type="text/javascript">
        window.onload = function(){
            // 获取图片列表，即img标签列表
            var imgs = document.querySelectorAll('img');

            // 获取到浏览器顶部的距离
            function getTop(e){
                return e.offsetTop;
            }

            // 懒加载实现
            function lazyload(imgs){
                // 可视区域高度
                var h = window.innerHeight;
                //滚动区域高度
                var s = document.documentElement.scrollTop || document.body.scrollTop;
                for(var i=0;i<imgs.length;i++){
                    //图片距离顶部的距离大于可视区域和滚动区域之和时懒加载
                    if ((h+s)>getTop(imgs[i])) {
                        // 真实情况是页面开始有2秒空白，所以使用setTimeout定时2s
                        (function(i){
                            setTimeout(function(){
                                // 不加立即执行函数i会等于9
                                // 隐形加载图片或其他资源，
                                //创建一个临时图片，这个图片在内存中不会到页面上去。实现隐形加载
                                var temp = new Image();
                                temp.src = imgs[i].getAttribute('data-src');//只会请求一次
                                // onload判断图片加载完毕，真是图片加载完毕，再赋值给dom节点
                                temp.onload = function(){
                                    // 获取自定义属性data-src，用真图片替换假图片
                                    imgs[i].src = imgs[i].getAttribute('data-src')
                                }
                            },1000)
                        })(i)
                    }
                }
            }
            lazyload(imgs);

            // 滚屏函数
            window.onscroll =function(){
                lazyload(imgs);
            }
        }
    </script>
</head>
<body>
<!-- Mobile Menu -->
<div class="mobile-nav-wrapper">
    <div class="mobile-menu-inner">
        <ul class="mobile-menu">
            <li class="scroll-to-section"><a href="#top">Homepage</a></li>
            <li class="scroll-to-section"><a href="#what-i-do">My Services</a></li>
            <li class="scroll-to-section"><a href="#reviews">Reviews</a></li>
            <li class="scroll-to-section"><a href="#experience-eductaion">Experience</a></li>
            <li class="scroll-to-section"><a href="#my-skills">My Skills</a></li>
        </ul>
    </div>
</div>
<div class="mobile-menu-overlay"></div>

<!-- Header -->
<header class="site-header">
    <div class="container expanded">
        <div class="header-wrap">
            <div class="header-logo">
                <img src="/website/images/jiazai.jpg" data-src="/website/images/logo.png" style="max-width: 150px;" alt="">
            </div>
            <div class="header-nav">
                <ul class="main-menu">
                    <li class="scroll-to-section"><a href="#top">首页</a></li>
                    <li class="scroll-to-section"><a href="#what-i-do">专利撰写工具</a></li>
                    <li class="scroll-to-section"><a href="#my-skills">生成专利五书</a></li>
                    <li class="scroll-to-section"><a href="#reviews">评论</a></li>
                </ul>
            </div>
            <div class="header-widgets">
                <ul class="right-menu">
                    <li class="menu-item menu-search">
                        <div class="main-bordered-button chat-wrap" onclick="login()">
                            <span>登录/注册</span>
                        </div>
                    </li>
<#--                    <li class="menu-item menu-search">-->
<#--                        <div class="main-bordered-button chat-wrap">-->
<#--                            <span>用户注册</span>-->
<#--                        </div>-->
<#--                    </li>-->
                    <li class="menu-item menu-mobile-nav">
                        <a href="#" class="menu-bar" id="menu-show-mobile-nav">
                            <span class="hamburger"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- /Header -->

<div class="contact-popup">
    <div class="chat-wrap">
        <div class="contact-icon">
            <div><span>Contact Me</span></div>
        </div>
    </div>

    <span class="overlay"></span>
    <section class="contactme">
        <div id="fancy-inputs">
            <form action="#" method="POST">
                <h4>Contact Me Here</h4>
                <label class="input">
                    <input class="inputs" type="text" name="nom" required="">
                    <span><span>Your name</span></span>
                </label>

                <label class="input">
                    <input class="inputs" type="email" name="mail" required="">
                    <span><span>Your email</span></span>
                </label>

                <label class="input textarea">
                    <textarea class="inputs" required=""></textarea>
                    <span><span>Your message</span></span>
                </label>

                <input type="submit" value="Send Message" class="btn cta">
            </form>
        </div>
    </section>
</div>

<div class="main-banner" id="top">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-6">
                <div class="banner-caption">
                    <h6> 快 速 <em>专 利 撰 写</em></h6>
                    <h4>高 质 量 专 利 标 准</h4>
                    <p>深度理解专利实际“解决技术问题采用的技术方案”，以专利法、实施细则、审查指南为准则，确保每一条权利要求具有发明目的、有益效果。</p>
                </div>
            </div>
<#--            <div class="social-icons">
                <ul>
                    <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="https://www.linkedin.com/" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="https://www.behance.com/" target="_blank"><i class="fa fa-behance"></i></a></li>
                </ul>
            </div>-->
        </div>
    </div>
</div>

<section class="first-services" id="what-i-do">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading">
                    <h2> 能 做 什 么 <em>?</em></h2>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="service-item">
                    <div class="icon">
                        <img src="/website/images/jiazai.jpg" data-src="/website/images/service-icon-01.png" alt="">
                    </div>
                    <div class="content">
                        <h4>高 效 率 撰 写</h4>
                        <p>新人填空写专利，每个环节具有撰写规范，新人训练15天即可上手正式工作；资深代理师能够提高工作效率30%以上；节省专利撰写及新人培养成本30%以上。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="service-item">
                    <div class="icon">
                        <img src="/website/images/jiazai.jpg" data-src="/website/images/service-icon-02.png" alt="">
                    </div>
                    <div class="content">
                        <h4>随 时 随 地 写 专 利</h4>
                        <p>阿里云提供数据加密以及安全服务，随时随地撰写专利文件，随心所欲下载专利文件，专利文件自动检查错误，一键下载专利五书。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="service-item">
                    <div class="icon">
                        <img src="/website/images/jiazai.jpg" data-src="/website/images/service-icon-03.png" alt="">
                    </div>
                    <div class="content">
                        <h4>模 板 预 设</h4>
                        <p>根据专利类型，系统预设了专利撰写模板，用户根据专利撰写习惯自行添加新模板。设置模板操作简单，如同设置浏览器一样简单。</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="service-item">
                    <div class="icon">
                        <img src="/website/images/jiazai.jpg" data-src="/website/images/service-icon-04.png" alt="">
                    </div>
                    <div class="content">
                        <h4>数 字 引 用 撰 写</h4>
                        <p>结构连接关系，通过数字连接关系写成（如1连接2，自动翻译成部件A（1）连接部件B（2）），大大节省撰写效率，发明内容与权利要求、实施例相互转化。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="my-skills" id="my-skills">
    <div class="container" id="divDown">
        <div class="row">
            <div class="col-lg-6 offset-lg-3">
                <div class="icon">
                    <h2>Word 文 档 转 五 书 </h2>
                </div>
                <h2>请 上 传 专 利 申 请 文 件</h2>
<#--                <form id="addform" class="form-horizontal" method="post" action="/Tool/sendwushu" enctype="multipart/form-data" target="rfFrame">-->
<#--                    <input type="file"  name="file" id="file">-->
<#--                </form>-->
<#--                <iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>-->
                <form id="addform" class="layui-form" method="post" action="/Tool/sendwushu" action="javascript:;">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <div class="layui-upload-drag" id="upload">
                                <i class="layui-icon" style="font-size: 50px;color: #ffffff;"></i>
                                <p style="color:#fff;font-weight: bold;font-size: 18px;">点击上传，或将文件拖拽到此处</p>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<section class="first-testimonials" id="reviews">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-heading">
                    <h2>用 户 评 论<em>.</em></h2>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg" data-src="/website/images/testimonial-author-01.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <p>“专利撰写从未如此简单，撰写专利就像问答填空一样，过去理解委托人的技术方案后需花费大量时间完成格式工作，现在全部由知服帮完成”</p>
                            <h4>张敏</h4>
                            <span class="job">专利代理师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg" data-src="/website/images/testimonial-author-02.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-right"></i>
                            </div>
                            <p>“从开始学习撰写专利，接触知服帮专利撰写辅助系统，专利老师指导一个星期后能够独立完成高质量专利撰写，从未出现专利补正”</p>
                            <h4>朱卫东</h4>
                            <span class="job">专利工程师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg" data-src="/website/images/testimonial-author-03.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <p>“专利撰写过程中，通过数字写专利太有趣味了，结构关系通过数字写好后，通过数字转文字的方式，一键生成专利技术文件”</p>
                            <h4>冯晓欣</h4>
                            <span class="job">专利代理师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg" data-src="/website/images/testimonial-author-04.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-right"></i>
                            </div>
                            <p>“自从用来知服帮专利撰写辅助工具，专利撰写效率提高了30%以上，收入也随着增长，开发者对专利的理解非常深入、用心！”</p>
                            <h4>范甲英</h4>
                            <span class="job">专利工程师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg" data-src="/website/images/testimonial-author-05.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-left"></i>
                            </div>
                            <p>“专利撰写效率是专利工程师重点考虑的内容，过去专利撰写完之后生成专利五书比较麻烦，现在专利撰写完后一键下载专利五书”</p>
                            <h4>林 艳</h4>
                            <span class="job">专利工程师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial-item">
                            <img src="/website/images/jiazai.jpg
" data-src="/website/images/testimonial-author-06.jpg" alt="">
                            <div class="quote-icon">
                                <i class="fa fa-quote-right"></i>
                            </div>
                            <p>“专利文件逻辑结构变得更加紧密,审核新人专利文件也比较简单;通过知服帮将基础资料写好之后，一键生成说明书摘要、说明书文件”</p>
                            <h4>黄 宇</h4>
                            <span class="job">专利代理师</span>
                            <ul class="reviews">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="sub-footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright All Rights Reserved. 2021 Button Creative Agency</p>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/boot.js"></script>
<script type="text/javascript" src="/js/columnsContextMenu.js"></script>

<script src="/website/scripts/vendors/jquery-3.6.0.min.js"></script>
<script src="/website/scripts/vendors/jquery.hoverIntent.min.js"></script>
<script src="/website/scripts/vendors/perfect-scrollbar.min.js"></script>
<script src="/website/scripts/vendors/jquery.easing.min.js"></script>
<script src="/website/scripts/vendors/wow.min.js"></script>
<script src="/website/scripts/vendors/owl-carousel.js"></script>
<script src="/website/scripts/main.js"></script>
<script src="/js/layui/layui.js" type="text/javascript" ></script>
<script src="/js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery.fileDownload.js"></script>


<script type="text/javascript">
    mini.parse();
    $(function () {
        if(window!=top){
            top.location.href=window.href;
        }
        var input =  $("#upload");
        var form = $("#addform");
        // ①为input设定change事件
        input.change(function () {
            //    ②如果value不为空，调用文件加载方法
            if($(this).val() != ""){
                sendwushu();
            }
        })
    });
    function sendwushu() {
        var form = new mini.Form("addform");
        form.loading("正在生成五书中,请稍候......");
        var results = [];
        var options  = {
            url:'/Tool/sendwushu',   //同action
            type:'post',
            beforeSend:function(xhr){//请求之前
            },
            success:function(result)
            {
                results = result.split(";");
                var FileName = results[1];
                var ExtName = results[2];
                var RanCode = results[3];
                var FilePath = results[4];
                if (results[0] == "suceess"){
                    if (ExtName != "doc" && ExtName != "docx"){
                        alert("请上传正确的WORD文档!");
                    }else {
                        var url = "/Tool/download?FilePath=" + encodeURIComponent(FilePath) + "&FileName=" + FileName + "&RanCode=" + RanCode;
                        $.fileDownload(url, {
                            httpMethod: 'POST',
                            successCallback: function (url) {
                                // alert("下载成功");
                                form.unmask();
                            },
                            failCallback: function (html, url) {
                                alert('下载错误:' + html, '系统提示');
                            }
                        });
                    }
                }else {
                    alert("上传文档失败,请重新上传!");
                }
            },

            complete:function(xhr){//请求完成

            },
            error: function(xhr,status,msg){
                //alert("状态码"+status+"; "+msg)
                alert("错误");
            }
        };
        $("#addform").ajaxSubmit(options);
    }
    function login() {
        window.location.href = "/nl";
    }
</script>
</body>
</html>
