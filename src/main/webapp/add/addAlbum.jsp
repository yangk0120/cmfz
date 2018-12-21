<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $("#addAlbumFormResetBtn").linkbutton({
            text: "撤销",
            onClick: function () {
                $("#addAlbumDialog").dialog("close");
            }
        });
        $("#addAlbumFormAddBtn").linkbutton({
            text: "提交",
            onClick: function () {
                $("#addAlbumForm").form("submit", {
                    url: "${pageContext.request.contextPath}/album/add",
                    onSubmit: function () {
                        return $("#addAlbumForm").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "提示",
                            msg: "添加成功"
                        });
                        //关闭对话框 刷新数据表单
                        $('#albumDatagrid').treegrid("reload");
                        $("#addAlbumDialog").dialog("close");
                    }
                });
            }
        });
        $("#addAlbumFormScore").validatebox({
            required: true
        })
        $("#addBannerFormBrief").validatebox({
            required: true
        })

        $("#addBannerFormAuthor").validatebox({
            required: true
        });
        $("#addAlbumFormTitle").validatebox({
            required: true
        });
        $("#addBannerFormPushDate").datebox({
            required: true,
            editable: false,
            formatter: function (date) {
                var y = date.getFullYear();
                var m = date.getMonth() + 1;
                var d = date.getDate();
                return y + '-' + m + '-' + d;

            },
            parser: function (s) {
                var t = Date.parse(s);
                if (!isNaN(t)) {
                    return new Date(t);
                } else {
                    return new Date();
                }
            }
        });
    });
</script>

<form id="addAlbumForm" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>专辑标题:</td>
            <td><input id="addAlbumFormTitle" name="title"/></td>
        </tr>

        <input hidden name="count" value="0"/>
        <tr>
            <td>评分:</td>
            <td><input id="addAlbumFormScore" name="score"/></td>
        </tr>
        <tr>
            <td>作者:</td>
            <td><input id="addBannerFormAuthor" name="author"/>
            </td>
        </tr>
        <tr>
            <td>播音:</td>
            <td><input id="addBannerFormBroadcast" name="broadcast"/></td>
        </tr>
        <tr>
            <td>上传时间:</td>
            <td><input id="addBannerFormPushDate" name="pubDate"/></td>
        </tr>


        <tr>
            <td>内容：</td>
            <td><input id="addBannerFormBrief" name="brief"/></td>
        </tr>
        <tr>
            <td>上传头像：</td>
            <td><input type="file" name="file"/></td>
        </tr>
    </table>
</form>
<a id="addAlbumFormAddBtn"></a>
<a id="addAlbumFormResetBtn"></a>