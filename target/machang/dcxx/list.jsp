<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%@include file="/easyui/include.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/emp/list.js"></script>
</head>
<body>
    <!--员工列表-->
    <table id="emp-list"></table>
    <!--员工列表 工具栏-->
    <div id="emp-list-toolbar">
        <%--<a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="eventObj.add();">新增信息</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="eventObj.remove();">删除选中</a>--%>
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" data-options="plain:true" onclick="eventObj.query();">查询</a>
    </div>

    <%--新增--%>
    <div id="register-dialog"></div>
    <%--修改--%>
    <div id="emp-dialog">
    </div>


</body>
</html>
