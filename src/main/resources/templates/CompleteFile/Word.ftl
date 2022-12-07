<!DOCTYPE html>
<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <title>完整文件预览</title>
    <script type="text/javascript">
        function Save() {
            document.getElementById("PageOfficeCtrl1").WebSave();
        }
    </script>
</head>
<body>
<div style="width:1000px;height:700px;" th:utext="${pageoffice}"></div>
</body>
<script type="text/javascript">
    // function Save() {
    //     document.getElementById("PageOfficeCtrl1").WebSave();
    // }
</script>
</html>
