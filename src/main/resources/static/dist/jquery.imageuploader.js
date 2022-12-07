/* 全局jQuery FormData文件读取器 */
(function ($) {
    $.fn.uploader = function (options, testMode) {
        return this.each(function (index) {
            options = $.extend({
                submitButtonCopy: '上传选定的文件',
                instructionsCopy: '支持拖放',
                furtherInstructionsCopy: '你也可以删除文件',
                selectButtonCopy: '选择文件',
                secondarySelectButtonCopy: '选择多个文件',
                dropZone: $(this),
                fileTypeWhiteList: ['jpg', 'png', 'jpeg', 'gif', 'pdf'],
                badFileTypeMessage: '对不起，我们不能接受这种类型的文件。',
                ajaxUrl: '/ajax/upload',
                testMode: false
            }, options);

            var state = {
                fileBatch: [],
                isUploading: false,
                isOverLimit: false,
                listIndex: 0
            };

            // 创建DOM元素
            var dom = {
                uploaderBox: $(this),
                submitButton: $('<button class="js-uploader__submit-button uploader__submit-button uploader__hide">' +
                    options.submitButtonCopy + '<i class="js-uploader__icon fa fa-upload uploader__icon"></i></button>'),
                instructions: $('<p class="js-uploader__instructions uploader__instructions">' +
                    options.instructionsCopy + '</p>'),
                selectButton: $('<input style="height: 0; width: 0;" id="fileinput' + index + '" type="file" multiple class="js-uploader__file-input uploader__file-input">' +
                    '<label for="fileinput' + index + '" style="cursor: pointer;" class="js-uploader__file-label uploader__file-label">' +
                    options.selectButtonCopy + '</label>'),
                secondarySelectButton: $('<input style="height: 0; width: 0;" id="secondaryfileinput' + index + '" type="file"' +
                    ' multiple class="js-uploader__file-input uploader__file-input">' +
                    '<label for="secondaryfileinput' + index + '" style="cursor: pointer;" class="js-uploader__file-label uploader__file-label uploader__file-label--secondary">' +
                    options.secondarySelectButtonCopy + '</label>'),
                fileList: $('<ul class="js-uploader__file-list uploader__file-list"></ul>'),
                contentsContainer: $('<div class="js-uploader__contents uploader__contents"></div>'),
                furtherInstructions: $('<p class="js-uploader__further-instructions uploader__further-instructions uploader__hide">' + options.furtherInstructionsCopy + '</p>')
            };

            // 把里面的东西都清空
            dom.uploaderBox.empty();

            // 创建和附加UI元素
            setupDOM(dom);

            // 设置事件处理
            bindUIEvents();

            function setupDOM (dom) {
                dom.contentsContainer
                    .append(dom.instructions)
                    .append(dom.selectButton);
                dom.furtherInstructions
                    .append(dom.secondarySelectButton);
                dom.uploaderBox
                    .append(dom.fileList)
                    .append(dom.contentsContainer)
                    .append(dom.submitButton)
                    .after(dom.furtherInstructions);
            }

            function bindUIEvents () {
                // 处理拖放
                options.dropZone.on('dragover dragleave', function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                });
                $.event.props.push('dataTransfer'); // jquery错误破解
                options.dropZone.on('drop', selectFilesHandler);

                // 黑客可以选择同一个文件名两次
                dom.selectButton.on('click', function () { this.value = null; });
                dom.selectButton.on('change', selectFilesHandler);
                dom.secondarySelectButton.on('click', function () { this.value = null; });
                dom.secondarySelectButton.on('change', selectFilesHandler);

                // 处理提交点击
                dom.submitButton.on('click', uploadSubmitHandler);

                // 删除链接处理程序
                dom.uploaderBox.on('click', '.js-upload-remove-button', removeItemHandler);

                // 公开用于测试的处理程序
                if (options.testMode) {
                    options.dropZone.on('uploaderTestEvent', function (e) {
                        switch (e.functionName) {
                            case 'selectFilesHandler':
                                selectFilesHandler(e);
                                break;
                            case 'uploadSubmitHandler':
                                uploadSubmitHandler(e);
                                break;
                            default:
                                break;
                        }
                    });
                }
            }

            /*增加列表项*/
            function addItem (file) {
                var fileName = cleanName(file.name);
                var fileSize = file.size;
                var id = state.listIndex;
                var sizeWrapper;
                var fileNameWrapper = $('<span class="uploader__file-list__text"><table><tr><td><textarea rows="1" cols="40" placeholder="请对图片进行描述" style="margin-left:5px;"></textarea></td></tr></table></span>');

                state.listIndex++;

                var listItem = $('<li class="uploader__file-list__item" data-index="' + id + '"></li>');
                var thumbnailContainer = $('<div style="border:1px solid gray;width:120px;height:100px"><span class="uploader__file-list__thumbnail"></span></div>');
                var thumbnail = $('<img class="thumbnail" style="width:100px"><i class="fa fa-spinner fa-spin uploader__icon--spinner"></i>');
                var removeLink = $('<span class="uploader__file-list__button"><button class="uploader__icon-button js-upload-remove-button fa fa-times" data-index="' + id + '"></button></span>');

                // 验证文件
                if (options.fileTypeWhiteList.indexOf(getExtension(file.name).toLowerCase()) !== -1) {
                    // 文件正常，添加到批处理中
                    state.fileBatch.push({file: file, id: id, fileName: fileName, fileSize: fileSize});
                    sizeWrapper = $('<span style="padding-left:40px;" class="uploader__file-list__size">图一</span>');
                } else {
                    // 文件不正常，请将其添加到dom中
                    sizeWrapper = $('<span class="uploader__file-list__size"><span class="uploader__error">' + options.badFileTypeMessage + '</span></span>');
                }

                // 如果可以，请创建缩略图
                if (window.FileReader && file.type.indexOf('image') !== -1) {
                    var reader = new FileReader();
                    reader.onloadend = function () {
                        thumbnail.attr('src', reader.result);
                        thumbnail.parent().find('i').remove();
                    };
                    reader.onerror = function () {
                        thumbnail.remove();
                    };
                    reader.readAsDataURL(file);
                } else if (file.type.indexOf('image') === -1) {
                    thumbnail = $('<i class="fa fa-file-o uploader__icon">');
                }

                thumbnailContainer.append(thumbnail);
                listItem.append(thumbnailContainer);

                listItem
                    .append(sizeWrapper)
                    .append(fileNameWrapper)

                    .append(removeLink);

                dom.fileList.append(listItem);
            }

            function getExtension (path) {
                var basename = path.split(/[\\/]/).pop();
                var pos = basename.lastIndexOf('.');

                if (basename === '' || pos < 1) {
                    return '';
                }
                return basename.slice(pos + 1);
            }

            function formatBytes (bytes, decimals) {
                if (bytes === 0) return '0 Bytes';
                var k = 1024;
                var dm = decimals + 1 || 3;
                var sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
                var i = Math.floor(Math.log(bytes) / Math.log(k));
                return (bytes / Math.pow(k, i)).toPrecision(dm) + ' ' + sizes[i];
            }

            function cleanName (name) {
                name = name.replace(/\s+/gi, '-'); // Replace white space with dash
                return name.replace(/[^a-zA-Z0-9.\-]/gi, ''); // Strip any special characters
            }

            function uploadSubmitHandler () {
                if (state.fileBatch.length !== 0) {
                    var data = new FormData();
                    for (var i = 0; i < state.fileBatch.length; i++) {
                        data.append('files[]', state.fileBatch[i].file, state.fileBatch[i].fileName);
                    }
                    $.ajax({
                        type: 'POST',
                        url: options.ajaxUrl,
                        data: data,
                        cache: false,
                        contentType: false,
                        processData: false
                    });
                }
            }

            function selectFilesHandler (e) {
                e.preventDefault();
                e.stopPropagation();

                if (!state.isUploading) {
                    // 文件来自输入或删除
                    var files = e.target.files || e.dataTransfer.files || e.dataTransfer.getData;

                    // 处理每个传入文件
                    for (var i = 0; i < files.length; i++) {
                        addItem(files[i]);
                    }
                }
                renderControls();
            }

            function renderControls () {
                if (dom.fileList.children().size() !== 0) {
                    dom.submitButton.removeClass('uploader__hide');
                    dom.furtherInstructions.removeClass('uploader__hide');
                    dom.contentsContainer.addClass('uploader__hide');
                } else {
                    dom.submitButton.addClass('uploader__hide');
                    dom.furtherInstructions.addClass('uploader__hide');
                    dom.contentsContainer.removeClass('uploader__hide');
                }
            }

            function removeItemHandler (e) {
                e.preventDefault();

                if (!state.isUploading) {
                    var removeIndex = $(e.target).data('index');
                    removeItem(removeIndex);
                    $(e.target).parent().remove();
                }

                renderControls();
            }

            function removeItem (id) {
                // 从批处理中删除
                for (var i = 0; i < state.fileBatch.length; i++) {
                    if (state.fileBatch[i].id === parseInt(id)) {
                        state.fileBatch.splice(i, 1);
                        break;
                    }
                }
                // 从DOM中删除
                dom.fileList.find('li[data-index="' + id + '"]').remove();
            }
        });
    };
}(jQuery));