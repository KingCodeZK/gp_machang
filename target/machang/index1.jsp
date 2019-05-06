<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/easyui/include.jsp"%>
<html>
<head>
    <title>MACHANG管理系统</title>
    <script type="application/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
</head>
<body>
<%--布局--%>
<div id="cc" class="easyui-layout" data-options="fit:true">
    <%--上--%>
    <div data-options="region:'north',height:100">
        <span>MACHANG管理系统</span>
    </div>
    <%--左--%>
    <div data-options="region:'west',title:'菜单',width:200">
        <%--选项版--%>
        <div id="aa" class="easyui-accordion" data-options="fit:true,selected:1">
            <div title="MACHANG管理系统" >
                <ul class="easyui-tree">
                    <li><a class="opts" url="/dcxx/list">项目信息管理</a></li>
                    <li><a class="opts" url="/zuche/list">用户信息管理</a></li>
                    <li><a class="opts" url="/tj/list">用户信息统计</a></li>
                </ul>
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