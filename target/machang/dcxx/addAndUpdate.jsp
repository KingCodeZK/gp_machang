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
    <form id="emp-form" method="post">
        <%--定义一个隐藏框 传id--%>
        <input type="hidden" name="id" value="${d.id}"/>
        <table style="margin:10px auto;" cellpadding="2px" cellspacing="5px" >
            <tr>
                <td>单车型号：</td>
                <td>
                    <c:choose>
                        <c:when test="${empty d}">
                            <input name="bxh" class="easyui-textbox" data-options="required:true,width:180" value="${d.bxh}"/>
                        </c:when>
                        <c:otherwise>
                            <input name="bxh" class="easyui-textbox" data-options="required:true,width:180,editable:false" value="${d.bxh}"/>
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
            <tr>
                <td>供应商：</td>
                <td>
                    <input name="gys" class="easyui-textbox" data-options="required:true,width:180" value="${d.gys}"/>
                </td>
            </tr>
            <tr>
                <td>单车类型：</td>
                <td>
                    <input name="blb" class="easyui-combobox" value="${d.blb}" data-options="required:true,width:180,
							valueField: 'label',
							textField: 'value',
							data: [{
								  label: 'gl',
								  value: '公路自行车'
								 },{
								  label: 'sd',
			    				  value: '山地自行车'
								},{
								  label: 'zd',
			    				  value: '折叠自行车'
								},{
								  label: 'lx',
			    				  value: '旅行自行车'
								}]"/>
                </td>
            </tr>
            <tr>
                <td>剩余数量：</td>
                <td>
                    <c:choose>
                        <c:when test="${empty e}">
                            <input id="sysl" name="sysl" class="easyui-numberbox" data-options="required:true,width:120" value="20" />
                        </c:when>
                        <c:otherwise>
                            <input id="sysl" name="sysl" class="easyui-numberbox" data-options="required:true,width:120,editable:false" value="${d.sysl}"/>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>



        </table>


    </form>

</body>
</html>
