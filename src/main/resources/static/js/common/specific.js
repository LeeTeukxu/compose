function append() {
    this.init = function (content) {
        $("#divCenter").append(content);
        mini.parse();
    }

    this.addsingle = function (content, specificNum) {
        $("#divCenter").append(content);
        mini.parse();
        setMethod(specificNum);
    }

    this.getContent = function (No) {
        var initcontent ='<div class="keyword" id="CenterKeyword' + No + '">' +
            '        <div class="Scheme1">' +
            '            <p class="Schemetitle">2.关键改进点' + No + '（分条描述本技术方案中的关键改进点内容）<a href="#" onclick="removesingle(' + No +')">删除</a></p>' +
            '            <textarea class="mini-textarea" cols="70%" rows="5" id="improve&' + No + '" name="improve&' + No + '"></textarea>' +
            '        </div>' +
            '        <div class="jg" style="visibility: hidden;">1</div>' +
            '        <div class="Scheme1">' +
            '            <p class="Schemetitle">改进点' + No + '的技术目的</p>' +
            '            <textarea class="mini-textarea" cols="40%" rows="5" id="target&' + No + '" name="target&' + No + '"></textarea>' +
            '           <input class="mini-hidden" id="createTime&' + No + '" name="createTime&' + No + '">' +
            '           <input class="mini-hidden" id="createMan&' + No + '" name="createMan&' + No + '">' +
            '           <input class="mini-hidden" id="tinyId&' + No + '" name="tinyId&' + No + '">' +
            '           <input class="mini-hidden" id="mainId&' + No + '" name="mainId&' + No + '">' +
            '        </div>' +
            '    </div>'
        return initcontent;
    }

    function setMethod(specificNum) {
        mini.get('improve&' + specificNum).on('blur',function (e) {
            save(specificNum);
        });
        mini.get('target&' + specificNum).on('blur',function (e) {
            save(specificNum);
        })
    }
}

function removesingle(id){
    specificNum--;
    // $("#CenterKeyword" + id).remove();
    var initcontent = loadhtml();
    $("#divCenter").html(initcontent);
    mini.parse();
    delLoadcontent(id,specificNum);
}

function delLoadcontent(id,specificNum) {
    id--;
    detailData.splice(id,1);
    for (var i=0;i<detailData.length;i++) {
        var code = i + 1;
        mini.get('tinyId&' + code).setValue(detailData[i].tinyId);
        mini.get('mainId&' + code).setValue(detailData[i].mainId);
        mini.get('improve&' + code).setValue(detailData[i].improve);
        mini.get('target&' + code).setValue(detailData[i].target);
        mini.get('createTime&' + code).setValue(new Date(detailData[i].createTime));
        mini.get('createMan&' + code).setValue(detailData[i].createMan);
    }
}