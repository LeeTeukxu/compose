<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <script src="/js/boot.js" type="text/javascript"></script>
    <link href="/js/miniui/themes/default/large-mode.css" rel="stylesheet" type="text/css" />
    <link href="/js/miniui/themes/bootstrap/skin.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="/js/layui/css/layui.css" media="all"/>
    <script type="text/javascript" src="/js/plupload/plupload.full.min.js"></script>

    <script type="text/javascript" src="/js/columnsContextMenu.js"></script>

    <script type="text/javascript" src="/js/common/jquery.fileDownload.js"></script>
</head>
<body style="width:100%;height:100%;overflow-x: hidden">
<div class="mini-toolbar" id="UploadFileToolbar">
    <a class="mini-button" iconcls="icon-add" id="UploadFile" style="margin-left:5px" plain="true">选择上传文件</a>
    <a class="mini-button" iconcls="icon-ok" id="BeginUpload" visible="false" style="margin-left:5px"
       plain="true">开始上传</a>
    <span class="separator"></span>
    <a class="mini-button" iconcls="icon-download" id="DownloadFile" visible="false" style="margin-left:5px"
       plain="true">下载文件</a>
    <a class="mini-button" iconcls="icon-remove" id="RemoveFile" visible="false" style="margin-left:5px"
       plain="true">删除附件</a>
</div>
<div class="mini-fit" id="ConFit">
    <div id="AttachmentList" class="mini-datagrid" style="width: 100%; height:100%"
         autoload="false" allowresize="false" multiselect="false" showPager="false" allowCellSelect="true"
         multiSelect="false" ondrawCell="drawCell" allowCellEdit="true" allowCellValid="true"
         url="/Exper/getZipAttachedByTechMainIDAndType" onrowclick="rowCheckChange">
        <div property="columns">
            <div type="checkcolumn"></div>
            <div width="60" field="STATUS" headeralign="center">状态</div>
            <div field="FILENAME" width="200" headeralign="center" align="center">文件名称</div>
            <div field="FILESIZE" width="100" headeralign="center" align="center">文件大小</div>
            <div field="PROGRESS" name="PROGRESS" width="120" headeralign="center" visible="false"
                 align="center">上传进度
            </div>
            <div align="center" field="UPLOADTIME" width="120" dataType="date" dateFormat="yyyy-MM-dd HH:mm:ss"
                 headeralign="center">上传时间
            </div>
            <div field="UPLOADMAN" width="100" headeralign="center" align="center">上传人员</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var att = null;
    var mode = '${Mode}';
    var ImgFileLength = ${ImgFileLength};
    var num = 0;
    mini.parse();
    var xGrid = null;
    var xManager = null;
    var TechMainID = "${TechMainID}";
    var loadNum=0;
    var fileGrid = mini.get('#AttachmentList'), addButton = mini.get('UploadFile'),
        downButton = mini.get('DownloadFile'),
        removeButton = mini.get('RemoveFile'), uploadButton = mini.get('BeginUpload');
    var uploader = null;
    var eventFun = {
        eachFileUploaded: function (data) {
        },
        eachFileRemoved: function (data) {
        },
        uploadError: function (data) {
        }
    };
    var settings = {
        mode: '${Mode}',
        configName: 'Default',
        ///上传地址
        uploadUrl: '/Exper/imgfileupload',
        ///下载地址下载地址
        downloadUrl: '/Exper/download',
        ///删除文件地址
        removeUrl: '/Exper/deleteById',
        getFileUrl: '/Exper/getAttachmentByIDS',
        browseId: 'UploadFile',
        Filters: {
            mime_type: [
                // {title: 'rar files', extensions: 'zip,rar,7z'}
                // {title: 'Office文档', extensions: 'doc,docx,xls,xlsx'},
                // {title: 'pdf文档', extensions: 'pdf'},
                {title: '图片', extensions: 'jpg,bmp,gif,png'}
            ]
        },
        multipart_params: {},
        ///是否显示设置附件类型
        showConfig: false,
        afterAddFile: null,
        afterLoad: null,
        afterInit: null,
        eachFileUpload: null,
    };
    $(function () {
        if (mode == "Edit" || mode == "Add") initDocument();
        bindEventByMode('${Mode}');
        if (TechMainID) {
            fileGrid.load({TechMainID: TechMainID, Type: "Img"});
            fileGrid.sortBy('Sort', 'asc');
        }
    });

    function initDocument() {
        var filters = settings['Filters'] || "{}";
        var maxLength = settings['MaxLength'] || "100M";
        if (filters) {
            if (typeof (filters) == "string") filters = mini.decode(filters);
        }
        uploader = new plupload.Uploader({
            browse_button: settings.browseId,
            url: settings.uploadUrl,
            flash_swf_url: '/js/plupload/Moxie.swf',
            silverlight_xap_url: '/js/plupload/Moxie.xap',
            filters: filters,
            multipart: true,
            multi_selection: ${ManyFile},
            multiple_queues: ${ManyFile},
            max_file_size: maxLength,
            prevent_duplicates: true,
            init: {
                Error: function (a, b) {
                    var errorCode = parseInt(b.code);
                    var file = b.file;
                    if (errorCode == -600) {
                        mini.alert(file.name + '太大，不能上传。');
                    } else if (errorCode == -601) {
                        mini.alert('服务器不允许上传此文件。');
                    } else if (errorCode == -602) {
                        mini.alert(file.name + '已在待传列表，请勿重复选择。');
                    }
                },
                FilesAdded: function (up, files) {
                    var fileNames = [];
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        ImgFileLength++;
                        var k = {FILENAME: file.name, FILESIZE: file.size, FILEID: file.id, PROGRESS: 0, FTYPE: 1};
                        fileGrid.addRow(k);
                        fileGrid.validateRow(k);
                        fileNames.push(file.name + "-&" + ImgFileLength);
                    };
                    uploader.setOption("multipart_params", {
                        fileNames: fileNames,
                        TechMainID: '${TechMainID}'
                    });
                    var column = fileGrid.getColumn('PROGRESS');
                    if (column) fileGrid.showColumn(column);
                    if (uploadButton) uploadButton.show();
                },
                UploadProgress: function (up, file) {
                    var files = fileGrid.getData();
                    for (var i = 0; i < files.length; i++) {
                        var f = files[i];
                        var fId = f['FILEID'];
                        if (fId == file.id) {
                            fileGrid.updateRow(f, {PROGRESS: file.percent});
                        }
                    }
                },
                UploadComplete: function (up, file) {
                    if (uploadButton) uploadButton.hide();
                    var selRow = fileGrid.getSelected();
                    // if (selRow) {
                    //     if (configButton) configButton.hide();
                    // }
                    eventFun.eachFileUploaded("{}", mini, window);
                },
                FileUploaded: function (up, file, res) {
                    var files = fileGrid.getData();
                    var result = mini.decode(res.response);
                    var data = result.data || {};
                    var sName = data["attached"] || data['attached'] || "";
                    if (!sName) data = result;
                    if (result['success']) {
                        var name = data["attached"] || data['attached'];
                        for (var i = 0; i < files.length; i++) {
                            var f = files[i];
                            var fName = f['FILENAME'] || "";
                            if (fName.toString().indexOf(name) > -1) {
                                fileGrid.updateRow(f, {
                                    ATTID: data['attId'],
                                    UPLOADTIME: data['createTime'],
                                    UPLOADMAN: data["createMan"]
                                    // FTYPE: 1
                                });
                                if (settings.eachFileUpload) {
                                    settings.eachFileUpload(fileGrid, data, f);
                                }
                                // eventFun.eachFileUploaded(data, mini, window);
                            }
                        }
                    } else eventFun.uploadError(result, mini, window);
                }
            }
        });
        uploader.init();
    }

    function rowCheckChange() {
        var rows = fileGrid.getSelecteds() || [];
        if (rows.length > 0) {
            var row = rows[0];
            var attId = row['ATTID'];
            var state = parseInt(row["STATE"] || 0);
            if (attId) {
                if (downButton) downButton.show();
                if (removeButton) {
                    if (state <= 2) {
                        removeButton.show();
                    } else removeButton.hide();
                }
            } else {
                if (downButton) downButton.hide();
            }
        } else {
            if (removeButton) removeButton.hide();
            if (downButton) downButton.hide();
        }
        mini.get('#ConFit').doLayout();
    }

    function drawCell(e) {
        var field = e.field;
        var record = e.record;
        if (field == 'STATUS') {
            var AttID = record['ATTID'];
            var attType = parseInt(record['ATTTYPE']);
            if (AttID) e.cellHtml = '已上传'; else e.cellHtml = '未上传';
        } else if (field == 'FILESIZE') {
            var size = parseInt(record['FILESIZE']);
            var sizeLength = ['K', 'M', 'T'];
            var ss = [1024, 1024 * 1024, 1024 * 1024 * 1024];
            if (size < 1024) e.cellHtml = size + "字节";
            else {
                var ddd = 0;
                var vvv = '';
                for (var i = 0; i < ss.length; i++) {
                    var dx = size / ss[i];
                    if (dx < 1024) {
                        ddd = dx.toFixed(2);
                        vvv = sizeLength[i];
                        break;
                    }
                }
                e.cellHtml = ddd + vvv;
            }
        } else if (field == "PROGRESS") {
            var value = e.value;
            if (record['ATTID']) value = 100;
            e.cellHtml = '<div class="progressbar">'
                + '<div class="progressbar-percent" style="width:' + value + '%;"></div>'
                + '<div class="progressbar-label">' + value + '%</div>'
                + '</div>';
        }
    }

    function bindEventByMode(mode) {
        function bindToolbar() {
            if (mode == "Add" || mode == "Edit") {
                uploadButton.on('click', function () {
                    fileGrid.validate();
                    if (fileGrid.isValid() == true) {
                        uploader.start();
                    } else {
                        mini.alert('信息填写不完整，不能上传文件!');
                    }
                });
            }
            downButton.on('click', function () {
                var rows = fileGrid.getSelecteds();
                if (rows.length > 0) {
                    var ids = [];
                    for (var i = 0; i < rows.length; i++) {
                        var attId = rows[i]['ATTID'];
                        if (attId) ids.push(attId);
                    }
                    if (ids.length > 0) {
                        var url = settings.downloadUrl + '?AttID=' + ids.join(',');
                        $.fileDownload(url, {
                            httpMethod: 'POST',
                            successCallback: function (xurl) {

                            },
                            failCallback: function (html, xurl) {
                                mini.alert('下载错误:' + html, '系统提示');
                            }
                        });

                        // var form = createDownloadForm(ids, settings.downloadUrl);
                        // if (form.length > 0) {
                        //     form[0].submit();
                        //     form.remove();
                        // }
                    } else {
                        mini.alert('导入附件还未处理，现在无法下载。提交审核后可进行操作。');
                    }
                }
            });
            removeButton.on('click', function () {
                var rows = fileGrid.getSelecteds();
                if (rows.length > 0) {
                    var row = rows[0];
                    var attId = row['ATTID'];
                    var Path = row['Path'];
                    if (attId) {
                        var fileName = row["FILENAME"];
                        mini.confirm('确认要删除选择文件【' + fileName + '】?', '系统提示', function (btn) {
                            if (btn == 'ok') {
                                $.post(settings.removeUrl, {AttID: attId,TechMainID: TechMainID,Type: "Img",Path: Path}, function (r, c) {
                                    var res = mini.decode(r);
                                    if (res['success']) {
                                        function g() {
                                            var fileId = row['FILEID'];
                                            if (fileId) uploader.removeFile(fileId);
                                            fileGrid.removeRow(row);
                                            if (downButton) downButton.hide();
                                            if (removeButton) removeButton.hide();
                                            eventFun.eachFileRemoved(mini.clone(row));
                                        }

                                        g();
                                        ImgFileLength--;
                                        mini.alert('文件【' + fileName + '】已删除!', '系统提示');
                                    }
                                });
                            }
                        });
                    } else {
                        var fileId = row['FILEID'];
                        uploader.removeFile(fileId);
                        fileGrid.removeRow(row);
                    }
                } else {
                    mini.alert('请选择要删除的文件。');
                }
            });
        }

        bindToolbar();
        if (mode == "Browse") {
            uploadButton.destroy();
            removeButton.destroy();
            addButton.destroy();
        }
    }

    function createDownloadForm(ids, downloadUrl) {
        var text = '<form id="DownloadFileForm" style="display:none" method="POST" action="' + downloadUrl + '" >' +
            '<input type="hidden" name="AttID" id="FileIDS"/>' +
            '</form>';
        $('body').append(text);
        $('#FileIDS').val(ids);
        return $('#DownloadFileForm');
    }

    function addEvent(event, fun) {
        if (eventFun[event]) {
            eventFun[event] = fun;
        }
    }

    window.addEvent = addEvent;
    var commitUrl = '';
</script>
</body>
</html>