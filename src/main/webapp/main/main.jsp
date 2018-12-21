<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>持名法州主页</title>

    <link rel="stylesheet" type="text/css" href="../themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../themes/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.edatagrid.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">

    </script>

</head>
<body class="easyui-layout">
<div data-options="region:'north',split:true,href:'${pageContext.request.contextPath}/main/north.jsp'"
     style="height:60px;background-color:  #5C160C"></div>
<div data-options="region:'south',split:true,href:'${pageContext.request.contextPath}/main/south.jsp'"
     style="height: 40px;background: #5C160C"></div>
<div data-options="region:'west',title:'导航菜单',split:true,href:'${pageContext.request.contextPath}/main/west.jsp'"
     style="width:220px;">

</div>
<div data-options="region:'center',href:'${pageContext.request.contextPath}/main/center.jsp'"></div>
</body>
</html>