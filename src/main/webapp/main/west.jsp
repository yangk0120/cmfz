<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
    $(function () {
        $("#aa").accordion({});
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/menu/getAll",
            success: function (data) {
                $.each(data, function (index, first) {
                    var a = "";
                    $.each(first.list, function (index1, second) {
                        a += "<div style='text-align: center'><a class=\"easyui-linkbutton\" onclick=\"addTabs('" + second.title + "','" + second.iconCls + "','" + second.url + "')\" data-options=\"iconCls:'" + second.iconCls + "',plain:true\">" + second.title + "</a></div>";
                    })
                    $('#aa').accordion('add', {
                        title: first.title,
                        iconCls: first.iconCls,
                        content: a,
                        selected: false
                    });
                })
            },
            dataType: "json"
        });
    });

    function addTabs(title, iconCls, url) {
        var a = $("#tt").tabs("exists", title)
        if (a) {
            $("#tt").tabs("select", title)
        } else {
            $('#tt').tabs('add', {
                title: title,
                iconCls: "icon-save",
                href: "${pageContext.request.contextPath}/datagrid" + url,
                selected: true,
                closable: true
            });
        }
    }
</script>

<div id="aa"></div>

