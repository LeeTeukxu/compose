!function(e,t){var n=/[<>&\r\n"']/gm,r={"<":"lt;",">":"gt;","&":"amp;","\r":"#13;","\n":"#10;",'"':"quot;","'":"apos;"};e.extend({fileDownload:function(i,o){function a(){if(-1!=document.cookie.indexOf(d.cookieName+"="+d.cookieValue))return v.onSuccess(i),document.cookie=d.cookieName+"=; expires="+new Date(1e3).toUTCString()+"; path="+d.cookiePath,void u(!1);if(x||b)try{var t=x?x.document:s(b);if(t&&null!=t.body&&t.body.innerHTML.length){var n=!0;if(T&&T.length){var r=e(t.body).contents().first();r.length&&r[0]===T[0]&&(n=!1)}if(n)return v.onFail(t.body.innerHTML,i),void u(!0)}}catch(o){return v.onFail("",i),void u(!0)}setTimeout(a,d.checkInterval)}function s(e){var t=e[0].contentWindow||e[0].contentDocument;return t.document&&(t=t.document),t}function u(e){setTimeout(function(){x&&(f&&x.close(),c&&x.focus&&(x.focus(),e&&x.close()))},0)}function l(e){return e.replace(n,function(e){return"&"+r[e]})}var c,f,p,d=e.extend({preparingMessageHtml:null,failMessageHtml:null,androidPostUnsupportedMessageHtml:"Unfortunately your Android browser doesn't support this type of file download. Please try again with a different browser.",dialogOptions:{modal:!0},prepareCallback:function(e){},successCallback:function(e){},failCallback:function(e,t){},httpMethod:"GET",data:null,checkInterval:100,cookieName:"fileDownload",cookieValue:"true",cookiePath:"/",popupWindowTitle:"Initiating file download...",encodeHTMLEntities:!0},o),h=new e.Deferred,m=(navigator.userAgent||navigator.vendor||t.opera).toLowerCase();/ip(ad|hone|od)/.test(m)?c=!0:-1!==m.indexOf("android")?f=!0:p=/avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|playbook|silk|iemobile|iris|kindle|lge |maemo|midp|mmp|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino/i.test(m)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|e\-|e\/|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\-|2|g)|yas\-|your|zeto|zte\-/i.test(m.substr(0,4));var g=d.httpMethod.toUpperCase();if(f&&"GET"!==g)return e().dialog?e("<div>").html(d.androidPostUnsupportedMessageHtml).dialog(d.dialogOptions):alert(d.androidPostUnsupportedMessageHtml),h.reject();var y=null,v={onPrepare:function(t){d.preparingMessageHtml?y=e("<div>").html(d.preparingMessageHtml).dialog(d.dialogOptions):d.prepareCallback&&d.prepareCallback(t)},onSuccess:function(e){y&&y.dialog("close"),d.successCallback(e),h.resolve(e)},onFail:function(t,n){y&&y.dialog("close"),d.failMessageHtml&&e("<div>").html(d.failMessageHtml).dialog(d.dialogOptions),d.failCallback(t,n),h.reject(t,n)}};v.onPrepare(i),null!==d.data&&"string"!=typeof d.data&&(d.data=e.param(d.data));var b,x,w,T;if("GET"===g){if(null!==d.data){var N=i.indexOf("?");-1!==N?"&"!==i.substring(i.length-1)&&(i+="&"):i+="?",i+=d.data}c||f?(x=t.open(i),x.document.title=d.popupWindowTitle,t.focus()):p?t.location(i):b=e("<iframe>").hide().prop("src",i).appendTo("body")}else{var C="";null!==d.data&&e.each(d.data.replace(/\+/g," ").split("&"),function(){var e=this.split("="),t=d.encodeHTMLEntities?l(decodeURIComponent(e[0])):decodeURIComponent(e[0]);if(t){var n=d.encodeHTMLEntities?l(decodeURIComponent(e[1])):decodeURIComponent(e[1]);C+='<input type="hidden" name="'+t+'" value="'+n+'" />'}}),p?(T=e("<form>").appendTo("body"),T.hide().prop("method",d.httpMethod).prop("action",i).html(C)):(c?(x=t.open("about:blank"),x.document.title=d.popupWindowTitle,w=x.document,t.focus()):(b=e("<iframe style='display: none' src='about:blank'></iframe>").appendTo("body"),w=s(b)),w.write("<html><head></head><body><form method='"+d.httpMethod+"' action='"+i+"'>"+C+"</form>"+d.popupWindowTitle+"</body></html>"),T=e(w).find("form")),T.submit()}return setTimeout(a,d.checkInterval),h.promise()}})}(jQuery,this);