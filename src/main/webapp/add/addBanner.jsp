<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $("#addBannerFormReset").linkbutton({
            text: "撤销",
            onClick: function () {
                $("#bannerDialog").dialog("close");
            }
        });
        $("#addBannerFormSubmit").linkbutton({
            text: "提交",
            onClick: function () {
                $("#addBannerForm").form("submit", {
                    url: "${pageContext.request.contextPath}/banner/add",
                    onSubmit: function () {
                        return $("#addBannerForm").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "提示",
                            msg: "添加成功"
                        });
                        //关闭对话框 刷新数据表单
                        $('#bannerDatagrid').edatagrid("reload");
                        $("#bannerDialog").dialog("close");
                    }
                });
            }
        });
        $("#addBannerFormtitle").validatebox({
            required: true
        });
        $("#addBannerFormdescription").validatebox({
            required: true
        });
        $("#addBannerFormpushDate").datebox({
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

<form id="addBannerForm" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>标题:</td>
            <td><input id="addBannerFormtitle" name="title"/></td>
        </tr>
        <tr>
            <td>描述:</td>
            <td><input id="addBannerFormdescription" name="description"/></td>
        </tr>
        <tr>
            <td>状态:</td>
            <td><input type="radio" name="status" value="N" checked/>不显示
                <input type="radio" name="status" value="Y"/>显示
            </td>
        </tr>
        <tr>
            <td>时间:</td>
            <td><input id="addBannerFormpushDate" name="pubDate"/>
            </td>
        </tr>
        <tr>
            <td>图片:</td>
            <td><input type="file" name="file"/></td>
        </tr>

        <tr>
            <td><a id="addBannerFormSubmit"/></td>
            <td><a id="addBannerFormReset"/></td>
        </tr>


    </table>
</form>