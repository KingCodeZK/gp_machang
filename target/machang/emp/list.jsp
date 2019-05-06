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
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="eventObj.add();">新增</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="eventObj.update();">修改</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="eventObj.remove();">删除</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="eventObj.query();">查询</a>
        Date From: <input class="easyui-datebox" style="width:80px">
        To: <input class="easyui-datebox" style="width:80px">
        Language:
        <input id="cc" name="dept" value="aa">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search">Search</a>
    </div>

    <%--新增--%>
    <div id="register-dialog"></div>


</body>
</html>
