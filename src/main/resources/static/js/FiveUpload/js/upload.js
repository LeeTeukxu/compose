$(function() {
	layui.use([ 'layer', 'element', 'form', 'upload' ], function() {
		let layer = layui.layer,
			element = layui.element,
			form = layui.form,
			upload = layui.upload;

		var files;
		let uploadInst = upload.render({
			elem : '#upload',
			url : 'api/upload',
			data : {},
			accept : 'file',
			size : 1024 * 2,
			auto : false,
			bindAction : ".all-upload",
			multiple : true,
			choose : function(obj) {
				sendwushu();
			},
			allDone : function(obj) { //当文件全部被提交后，才触发
				console.log(obj.total); //得到总文件数
				console.log(obj.successful); //请求成功的文件数
				console.log(obj.aborted); //请求失败的文件数
			},
			done : function(res, index, upload) { //上传后的回调

			},
			error : function(index, upload) {

			}
		})
	})
})