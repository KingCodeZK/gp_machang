<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/easyui/include.jsp"%>
<html>
<head>
    <title>EMP管理系统</title>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
<%--布局--%>
<div id="cc" class="easyui-layout" data-options="fit:true">
    <%--上--%>
    <div data-options="region:'north',height:100">
        <span>欢迎登陆emp</span>
    </div>
    <%--左--%>
    <div data-options="region:'west',title:'菜单',width:200">
        <%--选项版--%>
            <div id="aa" class="easyui-accordion" data-options="fit:true,selected:1">
                <div title="用户权限">
                    <%--树菜单--%>
                    <ul class="easyui-tree">
                        <li><a class="opts">用户权限</a></li>
                        <li><a class="opts">角色权限</a></li>
                        <li><a class="opts">访问权限</a></li>
                    </ul>
                </div>
                <div title="EMP管理" >
                    <ul class="easyui-tree">
                        <li><a class="opts" url="/emp/list">员工入职</a></li>
                    </ul>
                </div>
                <div title="Title3">
                    content3
                </div>
            </div>


    </div>
    <%--中--%>
    <div data-options="region:'center'">
        <%--定义内容 选项卡中显示--%>
        <div id="content" class="easyui-tabs" data-options="fit:true"></div>


    </div>
</div>

</body>
</html>
