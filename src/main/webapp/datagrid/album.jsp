<%@page pageEncoding="UTF-8" isELIgnored="false" %>
<script type="text/javascript">
    $(function () {
        var albumId;
        //添加章节
        $("#addChapterFormResetBtn").linkbutton({
            text: "撤销",
            onClick: function () {
                $("#addChapterDialog").dialog("close");
            }
        });

        $("#addChapterFormAddBtn").linkbutton({
            text: "提交",
            onClick: function () {
                $("#addBannerFormAlbumId").val(albumId);
                $("#addChapterForm").form("submit", {
                    url: "${pageContext.request.contextPath}/chapter/add",
                    onSubmit: function () {
                        return $("#addChapterForm").form("validate");
                    },
                    success: function () {
                        $.messager.show({
                            title: "提示",
                            msg: "添加成功"
                        });
                        //关闭对话框 刷新数据表单
                        $('#albumDatagrid').treegrid("reload");
                        $("#addChapterDialog").dialog("close");
                    }
                });
            }
        });
        $("#addChapterFormTitle").validatebox({
            required: true
        })
        $("#addChapterFormSize").validatebox({
            required: true
        })

        $("#addBannerFormDuration").validatebox({
            required: true
        });
        $("#addChapterFormTitle").validatebox({
            required: true
        });
        $("#addBannerFormUploadDate").datebox({
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

        $('#albumDatagrid').treegrid({
            url: '${pageContext.request.contextPath}/album/getAll',
            idField: 'id',
            treeField: 'title',
            columns: [[
                {title: '名字', field: 'title', width: 1},
                {title: '大小', field: 'size', width: 1},
                {field: 'duration', title: '时长', width: 1},
                {field: 'url', title: '路径', width: 1},
                {field: 'uploadDate', title: '上传时间', width: 1}
            ]],
            onDblClickRow: function (row) {
                if (row.size != null) {
                    var player = $("#audio")[0];
                    if (player.paused) {
                        player.play();
                        $("#audio").prop("src", "${pageContext.request.contextPath}/video/" + row.url);
                    } else {
                        player.pause();
                    }
                }
            },
            toolbar: "#albumTool",
            fitColumns: true,
            fit: true

        });
        $("#albumAddBtn").linkbutton({
            text: "添加专辑",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                $("#addAlbumDialog").dialog("open");
            }
        });
        $("#chapterAddBtn").linkbutton({
            text: "添加章节",
            iconCls: "icon-add",
            plain: true,
            onClick: function () {
                var row = $('#albumDatagrid').treegrid("getSelected");
                if (row == null) {
                    $.messager.alert("提示", "未选中操作行", "error");
                } else {
                    if (row.duration != null) {
                        $.messager.alert("提示", "未选中专辑", "error");
                    } else {
                        albumId = row.id;
                        $("#addChapterDialog").dialog("open");
                    }
                }
            }
        });
        $("#chapterUpload").linkbutton({
            text: "下载音频",
            iconCls: "icon-remove",
            plain: true,
            onClick: function () {
                var row = $('#albumDatagrid').treegrid("getSelected");
                if (row == null) {
                    $.messager.alert("提示", "未选中操作行", "error");
                } else {
                    if (row.duration == null) {
                        $.messager.alert("提示", "未选中章节", "error");
                    } else {
                        //去下载
                        location.href = "${pageContext.request.contextPath}/chapter/download?url=" + row.url;
                    }
                }
            }
        });
        $("#albumBtn").linkbutton({
            text: "专辑详情",
            iconCls: "icon-save",
            plain: true,
            onClick: function () {
                var row = $('#albumDatagrid').treegrid("getSelected");
                if (row == null) {
                    $.messager.alert("提示", "未选中操作行", "error");
                } else {
                    if (row.duration != null) {
                        $.messager.alert("提示", "未选中专辑", "error");
                    } else {
                        var id = row.id;
                        $("#albumContentDialog").dialog("open");
                        $("#albumContentForm").form("load", "${pageContext.request.contextPath}/album/getOne?id=" + id);
                    }
                }
            }
        });

        //初始化增加专辑对话框
        $("#addAlbumDialog").dialog({
            title: "添加专辑",
            width: 360,
            height: 200,
            cache: false,
            modal: true,
            closed: true,
            href: "${pageContext.request.contextPath}/add/addAlbum.jsp"
        });
        $("#addChapterDialog").dialog({
            title: "添加章节",
            width: 360,
            height: 200,
            cache: false,
            modal: true,
            closed: true
        });
        $("#albumContentDialog").dialog({
            title: "专辑详情页",
            width: 360,
            height: 200,
            cache: false,
            modal: true,
            //href:"${pageContext.request.contextPath}/show/showAlbum.jsp",
            closed: true
        });
    });
</script>

<table id="albumDatagrid">

</table>
<div id="albumTool">
    <a id="albumBtn"></a>
    <a id="albumAddBtn"></a>
    <a id="chapterAddBtn"></a>
    <a id="chapterUpload"></a>
</div>
<!--添加专辑-->
<div id="addAlbumDialog"></div>
<!--添加章节-->
<div id="addChapterDialog">
    <form id="addChapterForm" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td>标题:</td>
                <td><input id="addChapterFormTitle" name="title"/></td>
            </tr>
            <tr>
                <td>大小:</td>
                <td><input id="addChapterFormSize" name="size"/></td>
            </tr>
            <tr>
                <td>时长:</td>
                <td><input id="addBannerFormDuration" name="duration"/>
                </td>
            </tr>
            <tr>
                <td>上传时间:</td>
                <td><input id="addBannerFormUploadDate" name="uploadDate"/></td>
            </tr>
            <input id="addBannerFormAlbumId" hidden name="albumId"/></td>
            <tr>
                <td>上传音频：</td>
                <td><input type="file" name="file"/></td>
            </tr>
        </table>
    </form>
    <a id="addChapterFormAddBtn"></a>
    <a id="addChapterFormResetBtn"></a>
</div>
<div id="albumContentDialog">
    <form id="albumContentForm">
        <table>
            <tr>
                <td>题目：</td>
                <td><input id="albumContentFormTitle" name="title" readonly/></td>
            </tr>
            <tr>
                <td>章节数量：</td>
                <td><input id="albumContentFormCount" name="count" readonly/></td>
            </tr>
            <tr>
                <td>图片路径：</td>
                <td><input id="albumContentFormCoverImg" name="coverImg" readonly/></td>
            </tr>
            <tr>
                <td>评分：</td>
                <td><input id="albumContentFormScore" name="score" readonly/></td>
            </tr>
            <tr>
                <td>作者：</td>
                <td><input id="albumContentFormAuthor" name="author" readonly/></td>
            </tr>
            <tr>
                <td>播音：</td>
                <td><input id="albumContentFormBroadcast" name="broadcast" readonly/></td>
            </tr>
            <tr>
                <td>简介：</td>
                <td><input id="albumContentFormBrief" name="brief" readonly/></td>
            </tr>
            <tr>
                <td>时间：</td>
                <td><input id="albumContentFormPubDate" name="pubDate" readonly/></td>
            </tr>
        </table>
    </form>
</div>
<audio id="audio" autoplay="autoplay" controls="controls"></audio>