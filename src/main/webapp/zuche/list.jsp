<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%@include file="/easyui/include.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zuche/list.js"></script>
</head>
<body>
    <!--员工列表-->
    <table id="zuche-list"></table>
    <!--员工列表 工具栏-->
    <%--<div id="zuche-list-toolbar">
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="eventObj.add();">租赁单车</a>
    </div>--%>

    <%--新增--%>
    <div id="zucheregister-dialog"></div>
    <%--修改--%>
    <div id="zuche-dialog">
    </div>


</body>
</html>
