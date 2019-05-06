<%--
  Created by IntelliJ IDEA.
  User: zk
  Date: 2018/11/11
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--引入jquery核心-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<!--jquerycookie核心-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<!--引入jqueryEasyui核心-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-1.5/jquery.easyui.min.js"></script>
<!--引入国际化 默认是英文-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
<!--验证码-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/verify-master/js/verify.min.js"></script>

<!--引入jquery easyui布局样式-->
<link type="text/css"  rel="stylesheet"  href="${pageContext.request.contextPath}/js/easyui-1.5/themes/default/easyui.css"/>
<%--jq easyUI 图标样式--%>
<link type="text/css"  rel="stylesheet"  href="${pageContext.request.contextPath}/js/easyui-1.5/themes/icon.css"/>
<!--引入验证码样式-->
<link type="text/css"  rel="stylesheet"  href="${pageContext.request.contextPath}/js/verify-master/css/verify.css"/>
<script type="text/javascript">
    let contextPath ='${pageContext.request.contextPath}';
</script>
