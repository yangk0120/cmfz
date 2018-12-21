<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        $('#bannerDatagrid').edatagrid({
            url: "${pageContext.request.contextPath}/banner/getAll",
            fitColumns: true,
            fit: true,
            rownumbers: true,
            columns: [[
                {field: 'title', title: '名称', width: 100},
                {field: 'imgPath', title: '图片路径', width: 100},
                {
                    field: 'status', title: '状态', width: 100, editor: {
                        type: "text",
                        options: {required: true}
                    }
                },
                {field: 'pubDate', title: '上传日期', width: 100},
                {field: 'description', title: '描述', width: 100}
            ]],
            toolbar: "#bannerTool",
            pagination: true,
            pageSize: 3,
            pageList: [3, 5, 7, 9],
            view: detailview,
            singleSelect: true,
            updateUrl: "${pageContext.request.contextPath}/banner/update",
            detailFormatter: function (rowIndex, rowData) {
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}/image' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>描述: ' + rowData.description + '</p>' +
                    '<p>状态: ' + rowData.status + '</p>' +
                    '</td>' +
                    '</tr></table>';
            }

        });
        $("#bannerAddBtn").linkbutton({
            text: "添加",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                $("#bannerDialog").dialog("open");
            }
        });
        $("#bannerEditBtn").linkbutton({
            text: "修改",
            iconCls: "icon-edit",
            plain: true,
            onClick: function () {
                var row = $('#bannerDatagrid').edatagrid("getSelected");
                if (row == null) {
                    $.messager.alert("警告", "未选中操作行", "error");
                } else {
                    var index = $('#bannerDatagrid').edatagrid("getRowIndex", row);
                    $("#bannerDatagrid").edatagrid("editRow", index);
                }
            }
        });
        $("#bannerRemoveBtn").linkbutton({
            text: "删除",
            iconCls: "icon-remove",
            plain: true,
            onClick: function () {
                var row = $('#bannerDatagrid').edatagrid("getSelected");
                if (row == null) {
                    $.messager.alert("警告", "未选中操作行", "error");
                } else {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/banner/drop",
                        data: "id=" + row.id,
                        dateType: "json",
                        success: function (res) {
                            $.messager.show({
                                title: "提示",
                                msg: "删除成功"
                            });
                            $('#bannerDatagrid').edatagrid("reload");
                        }
                    });
                }
            }
        });
        $("#bannerSaveBtn").linkbutton({
            text: "保存",
            iconCls: "icon-save",
            plain: true,
            onClick: function () {
                $('#bannerDatagrid').edatagrid("saveRow");
            }
        });

        //初始化对话框
        $("#bannerDialog").dialog({
            title: "添加轮播图",
            width: 360,
            height: 200,
            cache: false,
            modal: true,
            href: "${pageContext.request.contextPath}/add/addBanner.jsp",
            closed: true
        });
    });
</script>

<table id="bannerDatagrid">
    <%--<thead>
        <th data-options="field:'title',width:'100'">标题</th>
        <th data-options="field:'imgPath',width:'100'">图片路径</th>
        <th data-options="field:'status',width:'100',editor: {
                 type: 'text',
            options: {required:true}
        }">状态</th>
        <th data-options="field:'pubDate',width:'100'">上传日期</th>
        <th data-options="field:'description',width:'100'">描述</th>
    </thead>--%>
</table>
<div id="bannerTool">
    <a id="bannerAddBtn"></a>
    <a id="bannerEditBtn"></a>
    <a id="bannerRemoveBtn"></a>
    <a id="bannerSaveBtn"></a>
</div>
<div id="bannerDialog"></div>