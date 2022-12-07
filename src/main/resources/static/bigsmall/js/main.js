$(document).ready(function(){
   var $simg =  $("#drag .simg");
   var $mov = $("#drag .simg .mov");
   var $bigImg = $("#drag .bigimg");
   var $img = $("#drag .bigimg img");


   $simg.hover(function(){
       $('#imgDiv').focus();
       var bigimgpath = $("#imgSrc").attr("src");
       $('.bimg').attr('src',bigimgpath);
      $mov.show();
      $bigImg.show();
      $simg.mousemove(function(e){
      var x=e.clientX; 
      var y=e.clientY;
      var _x=$simg.offset().left;
      var _y=$simg.offset().top;

      var _left=x -_x - $mov.width()/2;//确定方块相对于图片的left
      var _top=y -_y - $mov.height()/2;//确定方块相对于图片的top
      var simgMovW=$simg.width()-$mov.width();
      var simgMovH=$simg.height()-$mov.height();
      var bimgMovW=$img.width()-$bigImg.width();
      var bimgMovH=$img.height()-$bigImg.height();
      var ratioW=bimgMovW/simgMovW;
      var ratioH=bimgMovH/simgMovH;
      if(_left<0) {_left=0;}
   	  else if(_left>simgMovW)
   		 {_left=simgMovW;}
      if(_top<0) {_top=0;}
   	  else if(_top>simgMovH)
   		 {_top=simgMovH;}

   	  $mov.css({"left":_left,"top":_top + 35});
   	  $img.css({"left":-_left*ratioW,"top":-_top*ratioH});
          // 图片地址
          var img_url = $("#imgSrc").attr("src");

          // 创建对象
          var img = new Image();

          // 改变图片的src
          img.src = img_url;

          // 判断是否有缓存
          if(img.complete){
              // 打印
              var drag = $("#drag");
              var bigimg = document.getElementById("bigimg");
              bigimg.style.height = drag.height() + "px";
          }else{
              // 加载完成执行
              img.onload = function(){
                  // 打印
                  var drag = $("#drag");
                  var bigimg = document.getElementById("bigimg");
                  bigimg.style.height = drag.height() + "px";
              }
          }
   	 })   
   },function(){
      $mov.hide();
      $bigImg.hide();
   });
    $('#imgDiv').on('keydown',function (e) {
        var array = new Array();
        var paths = $(".itemlist").find(".item").length;
        for (var i=0;i<paths;i++){
            array.push($("#img_ul_item"+i).attr("path"));
        }
        if (e.keyCode == 37){
            //上一张
            var curindex;
            var curpic = $("#imgSrc").attr("src");
            curindex = getArrayIndex(array,curpic);
            curindex--;
            if (curindex < 0){
                curindex = array.length - 1;
            }
            $("#imgSrc").attr("src",array[curindex].replace("/Assist/","C:/AssistFtp/Assist/"));


            $('#imgDiv').focus();
            var bigimgpath = $("#imgSrc").attr("src");
            $('.bimg').attr('src',bigimgpath);

            border(curindex);
        }else if (e.keyCode == 39){
            //下一张
            var curindex;
            var curpic = $("#imgSrc").attr("src");
            curindex = getArrayIndex(array,curpic);
            curindex++;
            if (curindex == array.length){
                curindex = 0;
            }
            $("#imgSrc").attr("src",array[curindex].replace("/Assist/","C:/AssistFtp/Assist/"));

            $('#imgDiv').focus();
            var bigimgpath = $("#imgSrc").attr("src");
            $('.bimg').attr('src',bigimgpath);

            border(curindex);
        }
    });

    function getArrayIndex(arr, obj) {
        var i = arr.length;
        while (i--) {
            if (arr[i].replace("/Assist/","C:/AssistFtp/Assist/") === obj) {
                return i;
            }
        }
        return -1;
    }

    function border(item) {
        var chekobj={};
        var length = $(".itemlist").find(".item").length;
        for (var i=0;i<length;i++){
            $("#img_ul_item"+i).removeClass("ClickBorder");
            var profiles = document.getElementById("img_ul_item"+i);
            var checkboxs = profiles.getElementsByTagName("input");
            for (var j=0;j<checkboxs.length;j++){
                checkboxs[j].checked = false;
                chekobj = {}
            }
        }
        var profile = document.getElementById("img_ul_item"+item);
        var checkbox = profile.getElementsByTagName("input");
        for (var i=0;i<checkbox.length;i++){
            if (checkbox[i].type == 'checkbox'){
                checkbox[i].checked = true;
                var id = "img_ul_item"+item;
                var value = item;
                chekobj[id] = value;
            }
        }
        $("#img_ul_item"+item).addClass("ClickBorder");
    }
});