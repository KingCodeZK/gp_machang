<%--
  Created by IntelliJ IDEA.
  User: zk
  Date: 2018/11/10
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form id="user-form">
        用户名：<input type="text" name="name"/>
        <br/>
        密码：<input type="password" name="pass"/>
        <br/>
        <input type="button" value="新增" onclick="add()"/>
    </form>
<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
<script type="application/javascript">
    function add() {
        $.ajax({
            url:'${pageContext.request.contextPath}/user/add',
            type:'post',
            data:$("#user-form").serialize(),
            dataType:'json',
            success:function (data) {
                if (data.flag==true){
                    alert(data.msg);
                }else {
                    alert(data.msg);
                }
            }
        });

    }


</script>


</body>
</html>
