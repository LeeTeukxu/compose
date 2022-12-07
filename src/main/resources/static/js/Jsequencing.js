/*
 *图片排序及查看
 *j -- 2017-12-20
*/

var pageName = "";
function Jsequencing(options){
	var defaults={
		listid:"img_ul",//页面图片列表ID
		thumbherf:"",//列表图片前缀
		bigherf:options.thumbherf,//原图前缀
		imgsrcarr:[],//图片数据数组
		jsondata:false,//是否json格式数据
		viewimg:true,//预览/查看图片
		view_toggle:true,//预览切换
		view_zoom:true,//预览缩放
		view_rotate:true,//预览旋转
		showtitle:true,
		showDes:true,
		showAttID:true,
		showPath:true,
		showPageName:true,
	};
	var opts = $.extend(defaults,options);
	if((typeof opts.imgsrcarr[0]=='string')&&opts.imgsrcarr[0].constructor==String){
		opts.jsondata=false;
	}else if((typeof opts.imgsrcarr[0]=='object')&&opts.imgsrcarr[0].constructor==Object){
		opts.jsondata=true;
	}else if(opts.imgsrcarr[0]!==undefined){
		alert("数据格式不正确")
	}
	if(!opts.jsondata) opts.showtitle=false;
	//-//-//-//-//
	var box=this.box = $("#"+opts.listid);
	box.append( "<div class='itemlist' id='itemlist' style='height:100%'></div>"+
		"<div class='ident'></div>"+
		"<div class='morexy'></div>");
	var itemlist = box.find(".itemlist");
	//item内容
	var iCount=0;
	this.itemhtml=function(imgsrc,imgtitle,imgDes,imgAttID){
		var titlebox = opts.showtitle ? '<div class="textbox">'+imgtitle+'</div>' : "";
		return '<input class="checkbox" name="" type="checkbox" value="">'+
			'<div class="picbox"  style="height: 165px;" id="'+imgAttID+'">'+
			'<a class="viewimg" href="'+opts.bigherf+imgsrc+'" title="'+imgtitle+'">'+
			'<img class="listimg" id="aimg_'+imgAttID+'" zoomfile="'+opts.bigherf+imgsrc+'" file="'+opts.bigherf+imgsrc+'" class="zoom" onclick="zoom(this, this.src, 0, 0, 0)" src="'+opts.thumbherf+imgsrc+'" ondragstart="return false;" />'+
			'<div class="Descriptionfigures" id="'+imgAttID+'" onclick = "inputOut.editShow(this)">'+imgDes+'</div>'+
			'<div class="Imgxh" ><h2>'+imgtitle+'</h2><br><a id="'+imgAttID+'" name="'+imgsrc+'" onclick = "inputOut.replaceShow(this)" style="color: #3e9fc3;" >替换</a></div>'+
			'</a>'+
			'</div>';
	};
	//页面dom绘制
	var html='';
	for(var j=0;j<opts.imgsrcarr.length;j++){
		var vimgsrc=opts.showtitle ? opts.imgsrcarr[j].src : opts.imgsrcarr[j];
		var vimgtitle=opts.showtitle ? opts.imgsrcarr[j].cnsort : "";
		var vimgdes=opts.showDes ? opts.imgsrcarr[j].des : "";
		var vimgAttId=opts.showAttID ? opts.imgsrcarr[j].attid : "";
		var vimgpath=opts.showPath? opts.imgsrcarr[j].path : "";
		var titlebox = opts.showtitle ? '<div class="textbox">'+vimgtitle+'</div>' : "";
		pageName = opts.showPageName ? opts.imgsrcarr[j].showPageName : "";
		html+='<div class="item" id="'+opts.listid+'_item'+j+'" item="'+j+'" pathid='+opts.imgsrcarr[j].attid+' path="'+vimgpath+'">'+this.itemhtml(vimgsrc,vimgtitle,vimgdes,vimgAttId)+'</div>';
		iCount++;
	}
	itemlist.html(html);
	var box_w = box.width();//取总宽度
	//页面初始化配置
	var item_w,item_h,col_len,few_len,imgnum,box_h;
	this.info=function(fun){
		if(item_w===undefined || item_w===null){
			item_w = itemlist.find(".item").outerWidth(true);//每个item占的横向位置
			item_h = itemlist.find(".item").outerHeight(true);//每个item占的竖向位置
			box.find(".ident").css({height:item_h+"px"});
			box.find(".morexy").css({width:item_w+"px",height:item_h+"px"});
		};
		imgnum = itemlist.find(".item").length;//item数量
		col_len = Math.floor(box_w/item_w);//共分多少列
		few_len = Math.ceil(imgnum/col_len);//共分多少行
		box_h=item_h*few_len+20;
		box.height(box_h+"px");
		return true;
	}.bind(this)
	//绘制/移动
	var draw=this.draw=function(dom,col,few,slidetime){
		dom.css({
			"transition-duration": slidetime+"ms",
			"transform":"translate("+col+"px,"+few+"px)",
		});
	}
	//计算位置
	this.computat=function(index,domid,slidetime){
		var item = $("#"+domid);
		item.attr({
			"item":index,
		});
		if(chekobj[domid]!==undefined){
			chekobj[domid]=index;
		}
		var col_aliquot=index%col_len;
		var row_aliquot=Math.floor(index/col_len);
		var index_col = item_w*(col_aliquot);
		var index_few = item_h*row_aliquot;
		this.draw(item,index_col,index_few,slidetime);
		item.attr({
			"col":index_col,
			"few":index_few
		})
	}.bind(this)
	//调用绘制
	var redraw=this.redraw=function(strati,ilen,slidetime){
		for(var i=strati;i < strati+ilen;i++){
			this.computat(i,opts.listid+"_item"+itemidarr[i],slidetime)
		}
	}.bind(this)
	//首次绘制
	if(this.info(this)){
		var chekobj={};
		var itemidarr=[];
		this.imgnewarr=[];//新数组
		for(var i=0;i<imgnum;i++){ itemidarr.push(i) };
		this.redraw(0,itemidarr.length,0);
	}
	//浏览器尺寸改变时
	$(window).resize(function(){
		box_w = box.width();//取总宽度
		if(this.info(this)){
			this.redraw(0,itemidarr.length,0);
		}
	}.bind(this));
	//批量删除
	this.datadel=function(){
		var ids = [];
		if(!($.isEmptyObject(chekobj))){
			for(indexi in chekobj){
				var itemi=parseInt(itemlist.find("#"+indexi).attr("item"));
				ids.push(itemi+1);
				var arr2=[];
				for(var i=0;i<itemidarr.length;i++){
					if(i==itemi){
						itemidarr[i]=null;
					}else if(itemidarr[i]!=null){
						arr2.push(itemidarr[i]);
					};
				}
				itemlist.find("#"+indexi).remove();
				delete chekobj.indexi;
			}
			itemidarr=arr2;
			remove(ids);
		}
		this.redraw(0,itemidarr.length,200);
	}.bind(this)
	//摘要附图
	this.zhaiyao=function () {
		var ids = [];
		if (!($.isEmptyObject(chekobj))){
			for (indexi in chekobj){
				var itemi = itemlist.find("#"+indexi).attr("path");
				ids.push(itemi);
			}
		}
		if (ids.length == 0){
			mini.alert("请选择要设置的摘要附图！");
			return false;
		}
		if (ids.length>1){
			mini.alert("一次只能选择一个图片上传到摘要附图！");
			return false;
		}
		zhaiyao(ids);
	}.bind(this);
	//图片批量管理
	this.dragsort=function () {
		var url ="/DrawingSpecification/dragsortindex";
		mini.open({
			url:url,
			width:'60%',
			height:'70%',
			showModal:true,
			ondestroy:function(){
				window.location.reload();
			}
		});
	};
	//清空item
	this.dataempty=function(){
		itemlist.find(".item").remove();
		opts.imgsrcarr.length = 0;
		itemidarr.length = 0;
		chekobj={};
		box_h="20";
		box.height(box_h+"px");
	}.bind(this)
	//添加图片
	this.addimg=function(imgsrc,imgtitle){
		if(opts.jsondata){
			opts.imgsrcarr.push({src:imgsrc,title:imgtitle});
		}else{
			opts.imgsrcarr.push(imgsrc);
		}
		var imgnum=opts.imgsrcarr.length-1;
		itemidarr.push(imgnum);
		var titlebox = opts.showtitle ? '<div class="textbox">'+vimgtitle+'</div>' : "";
		if(imgtitle===undefined) imgtitle="";
		itemlist.append(
			'<div class="item" id="'+opts.listid+'_item'+imgnum+'" item="'+imgnum+'">'+this.itemhtml(imgsrc,imgtitle)+'</div>'
		);
		this.redraw(imgnum,1,0);
		this.info(this);
	}.bind(this)
	//添加图片数组
	this.addimgarr=function(imgobj){
		if(Object.prototype.toString.call(imgobj)=='[object Array]'){
			if(opts.jsondata){
				if(!((typeof imgobj[0]=='object')&&imgobj[0].constructor==Object)){
					alert("数据格式不正确,请传入json格式数据!");
					return;
				}
			}else{
				if(!((typeof imgobj[0]=='string')&&imgobj[0].constructor==String)){
					alert("数据格式不正确,请传入字符串格式数据!");
					return;
				}
			}
			for(var i=0;i<imgobj.length;i++){
				if(opts.jsondata){
					if(imgobj[i].title===undefined) imgobj[i].title="";
					this.addimg(imgobj[i].src,imgobj[i].title);
				}else{
					this.addimg(imgobj[i]);
				}
			}
		}
	}.bind(this)
	//获取最新数组
	this.getnewarr=function(){
		this.imgnewarr.length = 0;
		for(var i=0;i<itemidarr.length;i++){
			this.imgnewarr.push(opts.imgsrcarr[itemidarr[i]])
		}
		console.log(this.imgnewarr);
		return this.imgnewarr;
	}.bind(this)
	//选中input
	itemlist.on("click","input.checkbox",function(){
			var thisid=$(this).parents(".item").attr("id");
			if($(this).prop("checked")){
				var index=parseInt($(this).parents(".item").attr("item"));
				chekobj[thisid]=index;
			}else{
				delete chekobj[thisid];
			}
		}
	)
	//拖动排序
	var stsrtcol,stsrtfew,//初始位置
		mobiexident,mobieyident,//移动标识
		startindex,//当前点击元素的item值
		mulevex,mulevey;//多选框坐标
	var isdrag=false;//是否可以拖动
	var ischange=false;//是否有改动
	var ischek=false;//item是否选中
	var morexy=false;//多选框是否激活
	//图片拖动排序
	// itemlist.on({
	// 	mousedown:function(e){
	// 		e.preventDefault();
	// 		if(e.target.localName=="input"){
	// 			return false;
	// 		}
	// 		startindex=parseInt($(this).attr("item"));
	// 		$(this).css({"opacity":"0.8","z-index":"10"});
	// 		var startx=e.pageX;
	// 		var starty=e.pageY;
	// 		isdrag=true;
	// 		stsrtcol=parseInt($(this).attr("col"));
	// 		stsrtfew=parseInt($(this).attr("few"));
	// 		draw(box.find(".ident"),stsrtcol,stsrtfew,0);
	// 		if($(this).find("input.checkbox").prop("checked")){
	// 			ischek=true;
	// 		}else{
	// 			ischek=false;
	// 		}
	// 		$(this).off("mousemove").off("mouseup").off("mouseleave").on({
	// 			mousemove:function(e){
	// 				if(isdrag){
	// 					var movex=e.pageX;
	// 					var movey=e.pageY;
	// 					var mobiex=stsrtcol+movex-startx;
	// 					var mobiey=stsrtfew+movey-starty;
	// 					if(mobiex>box_w-item_w){
	// 						mobiex=box_w-item_w;
	// 					}else if(mobiex < 0){
	// 						mobiex=0;
	// 					}
	// 					if(mobiey>box_h-item_h){
	// 						mobiey=box_h-item_h;
	// 					}else if(mobiey < 0){
	// 						mobiey=0;
	// 					}
	// 					if(Math.abs(movex-startx)>10||Math.abs(movey-starty)>10){
	// 						ischange=true;
	// 						if(ischek){
	// 							if(!morexy){
	// 								for(arri in chekobj){
	// 									itemlist.find("#"+arri).css({"opacity":"0.25","z-index":"10"});
	// 									draw(itemlist.find("#"+arri),stsrtcol,stsrtfew,300);
	// 								}
	// 								draw(box.find(".morexy"),stsrtcol,stsrtfew,0);
	// 								box.find(".morexy").show();
	// 								mulevex=movex;
	// 								mulevey=movey;
	// 								morexy=true;
	// 							}
	// 						}else{
	// 							draw($(this),mobiex,mobiey,0);
	// 						}
	// 						mobiexident=Math.abs(Math.ceil((mobiex-item_w/2)/item_w));
	// 						mobieyident=Math.abs(Math.ceil((mobiey-item_h/2)/item_h));
	// 						box.find(".ident").show();
	// 						draw(box.find(".ident"),mobiexident*item_w,mobieyident*item_h,0);
	// 					}
	// 				}
	// 			},
	// 			//鼠标松开左键
	// 			mouseup:function(e){
	// 				if(isdrag){
	// 					isdrag=false;
	// 					morexy=false;
	// 					$(this).css({"opacity":"1","z-index":""});
	// 					box.find(".ident").hide();
	// 					draw($(this),stsrtcol,stsrtfew,0);
	// 					if(ischange){
	// 						// ischange=false;
	// 						var toposion = mobieyident*col_len+mobiexident;
	// 						var difference=toposion-startindex;
	// 						if(difference > 1){//往后
	// 							var changesitem=itemidarr.splice(startindex,1)[0];
	// 							itemidarr.splice(toposion-1,0,changesitem);
	// 							redraw(startindex,startindex+difference,200);
	// 						}else if(difference < 0){//往前
	// 							var changesitem=itemidarr.splice(startindex,1)[0];
	// 							itemidarr.splice(toposion,0,changesitem);
	// 							difference=Math.abs(difference)+1;
	// 							redraw(toposion,toposion+difference,200);
	// 						}
	// 					}
	// 				}
	// 				var listAttID = [];
	// 				var listItem = [];
	// 				$(".itemlist").find("div").each(function (index, element) {
	// 					var Item=$(this).attr('item');
	// 					if (Item!=undefined) {
	// 						listItem.push(Item);
	// 					}
	// 					var attId = $(this).attr('pathid');
	// 					if (attId != undefined){
	// 						listAttID.push(attId);
	// 					}
	// 					// $(this).find("div").each(function (thisIndx,thisElement) {
	// 					// 	var attId=$(this).attr('id');
	// 					// 	if (attId!=undefined) {
	// 					// 		listAttID.push(attId);
	// 					// 	}
	// 					// })
	// 				});
	// 				if (ischange == true) {
	// 					var url = "/DrawingSpecification/dragSort";
	// 					var json = {"SortItem": listItem, "SortAttID": listAttID};
	// 					$.ajax({
	// 						contentType: 'application/json',
	// 						method: 'POST',
	// 						url: url,
	// 						data: JSON.stringify(json),
	// 						success: function (res) {
	// 							if (res['success'] == true) {
	// 								window.location.href = "/DrawingSpecification/index";
	// 							}
	// 						},
	// 						error: function (error) {
	//
	// 						}
	// 					})
	// 				}
	// 			},
	// 			//鼠标离开
	// 			mouseleave:function(e){
	// 				if(isdrag){
	// 					isdrag=false;
	// 					if(!ischek){
	// 						$(this).css({"opacity":"1","z-index":""});
	// 					}
	// 					box.find(".ident").hide();
	// 					draw($(this),stsrtcol,stsrtfew,0);
	// 				}
	// 			},
	// 		})
	// 	},
	// },".item")
	//多选拖动框
	box.find(".morexy").on({
		mousemove:function(e){
			if(morexy){
				var startx=mulevex;
				var starty=mulevey;
				var movex=e.pageX;
				var movey=e.pageY;
				var mobiex=stsrtcol+movex-startx;
				var mobiey=stsrtfew+movey-starty;
				if(mobiex>box_w-item_w){
					mobiex=box_w-item_w;
				}else if(mobiex < 0){
					mobiex=0;
				}
				if(mobiey>box_h-item_h){
					mobiey=box_h-item_h;
				}else if(mobiey < 0){
					mobiey=0;
				}
				draw($(this),mobiex,mobiey,0);
				if(Math.abs(movex-startx)>20||Math.abs(movey-starty)>20){
					ischange=true;
					mobiexident=Math.abs(Math.ceil((mobiex-item_w/2)/item_w));
					mobieyident=Math.abs(Math.ceil((mobiey-item_h/2)/item_h));
					box.find(".ident").show();
					draw(box.find(".ident"),mobiexident*item_w,mobieyident*item_h,0);
				}
			}
		},
		mouseup:function(e){
			if(morexy){
				morexy=false;
				$(this).hide();
				box.find(".ident").hide();
				draw($(this),0,0,0);
				if(ischange){
					ischange=false;
					var toposion = mobieyident*col_len+mobiexident;
					var min=0;
					var max=itemidarr.length;
					if(!($.isEmptyObject(chekobj))){
						var transsh=[];
						min = max;
						max = 0;
						for(indexi in chekobj){
							itemlist.find("#"+indexi).css({"opacity":"1","z-index":""});
							for(var i=0;i<itemidarr.length;i++){
								if(i==chekobj[indexi]){
									min = i < min ? i : min;
									max = i+1 > max ? i+1 : max;
									transsh.push(itemidarr[i]);
									itemidarr[i]=null;
								};
							};
						}
						for(var i=0;i<transsh.length;i++){
							itemidarr.splice(toposion+i,0,transsh[i]);
						}
						transsh.length=0;
						for(var i=itemidarr.length-1;i>=0;i--){
							if(itemidarr[i]==null){
								itemidarr.splice(i,1);
							};
						}
						min = toposion < min ? toposion : min;
						max = toposion > max ? toposion : max;
					}
					redraw(min,max-min,200);
				}
			}
		},
		mouseleave:function(e){
			if(morexy){
				morexy=false;
				$(this).hide();
				box.find(".ident").hide();
				draw($(this),0,0,0);
				for(arri in chekobj){
					var elem = 	itemlist.find("#"+arri);
					var elem_col=elem.attr("col");
					var elem_few=elem.attr("few");
					itemlist.find("#"+arri).css({"opacity":"1","z-index":""});
					draw(itemlist.find("#"+arri),elem_col,elem_few,300);
				}
			}
		},
	})


	//预览/查看图片
	var ismove=false;
	var eimgx,eimgy;
	itemlist.on({
		click:function(	e){

			// document.getElementById("drag").style.cssText="diplay";

			// $('#imgSrc').attr('src',$(this).attr("href"));
			// $('.bimg').attr('src',$(this).attr("href"));


			var sp=parseInt($(this).parents(".sop").attr("sop"));
			e.preventDefault();
			if(!ismove){
				var item=parseInt($(this).parents(".item").attr("item"));
				for (var i=0;i<opts.imgsrcarr.length;i++){
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
				chakshow(sp);
				document.getElementById("chakbox").style.cssText="display:none";

			}
		},
		mousedown:function(e){
			eimgx=e.pageX;
			eimgy=e.pageY;
			ismove=false;
		},
		mouseup:function(e){
			eimgx=Math.abs(e.pageX-eimgx);
			eimgy=Math.abs(e.pageY-eimgy);
			ismove=false;
			if(eimgx > 5 || eimgy > 5) ismove=true;
		},
		mouseleave:function(){
			ismove=false;
		},
	},"a");
	//查看图片dom添加
	if(opts.viewimg){
		var chak_btn="";
		if(opts.view_toggle) chak_btn+='<button class="chak_prev">上一个</button><button class="chak_next">下一个</button>';
		if(opts.view_rotate) chak_btn+='<button class="chak_turn_l">向左转</button><button class="chak_turn_r">向右转</button>';
		chak_btn+='<button class="chak_close">关闭</button>';

		box.append(
			'<div class="chak_box" id="chakbox">'+
			'<div class="chak_img">'+
			'<img draggable="false" src="" ondragstart="return false;" />'+
			'<p></p><div style="margin-top:670px;text-align:center;"><table><tr><td> <input type="text" ></td></tr></table></div></div>'+
			'<div class="chak_title"></div>'+
			'<div class="chak_btn">'+chak_btn+'</div>'+
			'</div>'
		);
		var chak_box=box.find(".chak_box");
		chak_box.on({//大窗口拖动
			click:function(event){
				event.stopPropagation();
			},
			mousedown:function(e){
				viewmove=true;
				var marginx=parseInt($(this).css("margin-left"));
				var marginy=parseInt($(this).css("margin-top"));
				var _x=e.pageX-marginx;
				var _y=e.pageY-marginy;
				$(this).off("mousemove").on({
					mousemove:function(e){

						if(viewmove){
							var x=e.pageX-_x;
							var y=e.pageY-_y;
							$(this).css({
								"margin-top":y+"px",
								"margin-left":x+"px"
							});
						}
					}
				});
			},
			mouseup:function(e){
				viewmove=false;
			},
			mouseout:function(e){
				viewmove=false;
			},
		});
		var s=box.find(".chak_close");
		s.on({click:function(e){
				chakhide();
			}});
		chak_box.find(".chak_img > img").on({click:function(e){
				e.stopPropagation();
			}});
		if(opts.view_toggle){//是否可切换图片
			chak_box.find(".chak_prev").on({click:function(e){
					e.stopPropagation();
					var item = parseInt(chak_box.find(".chak_img").attr("item"))-1;
					chakshow(item);
				}});
			chak_box.find(".chak_next").on({click:function(e){
					e.stopPropagation();
					var item = parseInt(chak_box.find(".chak_img").attr("item"))+1;
					chakshow(item);
				}});
		};
		//查看图片
		var isview=false;
		var pisshow=false;
		var chakshow=function(imgitem){
			isview=true;
			var chak_ptog=function(text){
				var chak_p=chak_box.find(".chak_img > p");
				if(!pisshow){
					pisshow=true;
					chak_p.html(text).show();
					setTimeout(function(){
						pisshow=false;
						chak_p.hide();
					},1000);
				}
			}
			if(imgitem<0){
				chak_ptog("已经是第一张图片");
				return;
			}else if(imgitem > itemidarr.length-1){
				chak_ptog("已经是最后一张图片");
				return;
			}else{
				chak_box.find(".chak_img > p").hide()
			}
			var viewimgdom=itemlist.find(".item[item='"+imgitem+"'] .viewimg")
			var imgsrc = viewimgdom.attr("href");
			var imgtitle=viewimgdom.attr("title");
			chak_box.find(".chak_img").attr("item",imgitem);
			chak_box.find(".chak_img > img").attr({"src":imgsrc,"style":""});
			chak_box.find(".chak_title").html(imgtitle);
			$("body").css({"overflow":"hidden"});
			$("body",parent.document).css({"overflow":"hidden"});
			chak_box.show();
		};
		//关闭图片查看
		var chakhide=this.chakhide=function(){
			isview=false;
			chak_box.find(".chak_img").attr("item","");
			chak_box.find(".chak_img > img").attr("src","");
			$("body").css({"overflow":"hidden"});
			chak_box.hide();
		};
		//预览图片缩放
		if(opts.view_zoom){
			var viewimg_zoom=function(solls,zoomval){//缩放
				var imgdom = chak_box.find(".chak_img > img");
				var img = new Image();
				img.src =imgdom.attr("src");
				var imgWidth = img.width; //图片实际宽度
				var ckimg_w=parseInt(imgdom.width());
				imgdom.css({"max-width":imgWidth+"px","max-height":"none"});
				solls>0 ? ckimg_w+=zoomval : ckimg_w-=zoomval;
				imgdom.css({"width":ckimg_w+"px"});
			};
			chak_box.find(".chak_img > img").on({//拖动
				click:function(event){
					event.stopPropagation();
				},
				mousedown:function(e){
					viewmove=true;
					var marginx=parseInt($(this).css("margin-left"));
					var marginy=parseInt($(this).css("margin-top"));
					var _x=e.pageX-marginx;
					var _y=e.pageY-marginy;
					$(this).off("mousemove").on({
						mousemove:function(e){
							if(viewmove){
								var x=e.pageX-_x;
								var y=e.pageY-_y;
								$(this).css({
									"margin-top":y+"px",
									"margin-left":x+"px"
								});
							}
						}
					});
				},
				mouseup:function(e){
					viewmove=false;
				},
				mouseout:function(e){
					viewmove=false;
				},
			});
			//滚轮事件添加
			$(document).on('mousewheel', function(event){
				if(isview){
					var solls=event.originalEvent.wheelDelta;
					viewimg_zoom(solls,50);
				}
			});
			document.addEventListener("DOMMouseScroll", function (event) {//ff
				if(isview){
					var solls=event.detail;
					solls=0-solls;
					viewimg_zoom(solls,50);
				}
			});
		};




		//预览图片旋转
		if(opts.view_rotate){
			//旋转角度
			function getmatrix(a,b,c,d,e,f){
				var aa=Math.round(180*Math.asin(a)/ Math.PI);
				var bb=Math.round(180*Math.acos(b)/ Math.PI);
				var cc=Math.round(180*Math.asin(c)/ Math.PI);
				var dd=Math.round(180*Math.acos(d)/ Math.PI);
				var deg=0;
				if(aa==bb||-aa==bb){
					deg=dd;
				}else if(-aa+bb==180){
					deg=180+cc;
				}else if(aa+bb==180){
					deg=360-cc||360-dd;
				}
				return deg>=360?0:deg;
			}
			var chak_turn=function(dom,step){
				var _img=chak_box.find(".chak_img > img");
				var deg=eval('get'+_img.css('transform'));
				_img.css({'transform':'translate(-50%,-50%) rotate('+(deg+step)%360+'deg)'});
				dom.attr({"disabled":"true"});
				setTimeout(function(){
					dom.removeAttr("disabled");
				},60)
			}
			//向左转
			chak_box.find(".chak_turn_l").on({click:function(e){
					e.stopPropagation();
					chak_turn($(this),-90)
				}});
			//向右转
			chak_box.find(".chak_turn_r").on({click:function(e){
					e.stopPropagation();
					chak_turn($(this),90)
				}});
		}
	}
}

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
var dragMinHeight = 124;
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
/**/
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
/**/

function remove(ids) {
	mini.confirm('确定删除该附图吗?','删除提示',function (act) {
		if (act == 'ok'){
			var url = "/DrawingSpecification/remove";
			$.ajax({
				contentType: 'application/json',
				method: "post",
				url: url,
				data: mini.encode(ids),
				success: function (r) {
					if (r['success']){
						mini.alert("删除成功！",'删除提示',function () {
							window.location.href = "/DrawingSpecification/index";
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
							 window.location.href = "/AbstractAttached/index";
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

var wow=null;
var futuName=null;
(function(w,i){
	w.inputOut = new i();
})(
	window,
	function(){
		var inputOut = function(){
			this.into = function(){
			}
			this.into.apply(this,arguments);
			return this;
		}

		inputOut.prototype.editShow = function(element){

			var self = this;
			this.removeEvent();
			if( this.input ) {
				this.editChange(this.input,this.element);
			}
			var input = document.createElement("a");
			input.style.position = "absolute";
			input.style.textDecoration="underline";
			input.style.zIndex = "100";
			input.title="点击修改附图说明";
			input.style.fontSize = function(){
				var ret;
				if( element.style.fontSize ) ret = element.style.fontSize;
				else{
					if( getComputedStyle )
						ret = window.getComputedStyle(element).fontSize;
					else
						ret = element.currentStyle.fontSize;
				}
				return ret;
			}();
			input.style.width = element.offsetWidth + "px";
			input.style.height = element.offsetHeight + "px";
			input.style.top = element.offsetTop + "px";
			input.style.left = element.offsetLeft + "px";
			input.value = element.innerHTML.replace(/\s/g,"");
			if( element.parentElement ){
				element.parentElement.appendChild(input);
			}

			var ExclusiveWindow = mini.get("ExclusiveWindow2");
			ExclusiveWindow.set({showHeader:false});
			ExclusiveWindow.show();
			wow=element.id;
			document.getElementById("Descriptiondrawings").value=element.innerHTML;
			input.select();

			var bind;

			this.click = function(event){
				self.editHide(event);
			}

			setTimeout(function(){
				if( window.addEventListener ){
					document.addEventListener("click",this.click);
					input.onkeydown = function(e){ if( e.keyCode === 13 ) this.editChange(input,element); }.bind(this)
				}else{
					document.attachEvent("onclick",this.click);
				}

			}.bind(this))
			this.input = input;
			this.element = element;

			return this;

		}
		inputOut.prototype.replaceShow = function(element){
			debugger;
			var imgAttID = element.id;
			var imgsrc = element.name;
			var url ="/DrawingSpecification/PicturereplacementIndex?AttID="+imgAttID+"&accesskey="+imgsrc;
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

		inputOut.prototype.editChange = function(input,element){
			if(!input.value || input.value == "") return;
			element.innerText = input.value;
			input.remove();
			element.onchange && element.onchange.apply(this,arguments);
			this.removeEvent();
		}

		inputOut.prototype.editHide = function(event){

			var input = this.input;
			var element = this.element;
			if( event.target === this.input ) return;

			this.editChange(input,element);

			this.removeEvent();

			this.input.remove();

			var AttID = element.id;
			var PictureDescription = input.value;
			var url = "/DrawingSpecification/updatepicturedescription";
			var arg = {AttID:AttID,PictureDescription:PictureDescription};
			$.post(url,arg,function (result) {
				if (result.success == false){
					mini.alert(result.message);
				}
			})
		}

		inputOut.prototype.removeEvent = function(){
			if( window.addEventListener ){
				document.removeEventListener("click",this.click);
			}else{
				document.detachEvent("onclick",this.click);
			}
		}
		return inputOut;
	}()
)

