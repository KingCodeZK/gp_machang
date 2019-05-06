<%--
  Created by IntelliJ IDEA.
  User: zk
  Date: 2018/11/13
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%--定义增和修改操作的表格--%>
    <form id="zuche-form" method="post">
        <%--定义一个隐藏框 传id--%>
        <input type="hidden" name="id" value="${d.id}"/>
        <table style="margin:10px auto;" cellpadding="2px" cellspacing="5px" >
            <tr>
                <td>单车型号：</td>
                <td>
                    <input id="ccc" name="dbno"  class="easyui-combotree" data-options="required:true,width:180,
						   url:'${pageContext.request.contextPath}/dcxx/getDcxx',
						   method:'post',
						   animate:true,
						   lines:true,
						   onLoadSuccess:function(node,data){
						   		$('#cc').combotree('setValue',${z.bno});
						   		$('#cc').combotree('setText','${z.bxh}');
						   }"/>

                </td>
            </tr>
            <tr>
                <td>租赁人：</td>
                <td>
                    <input name="zlname" class="easyui-textbox" data-options="required:true,width:180" value="${z.zlname}"/>
                </td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td>
                    <input name="phone" class="easyui-textbox" data-options="required:true,width:180" value="${z.phone}"/>
                </td>
            </tr>
            <tr>
                <td>租赁时间：</td>
                <td>
                    <input id ="startTime" name="startTime" class="easyui-datebox" data-options="width:180"/>
                </td>
            </tr>




        </table>


    </form>
</body>
</html>
