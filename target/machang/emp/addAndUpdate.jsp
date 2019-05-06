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
        <input type="hidden" name="id" value="${e.id}"/>
        <table style="margin:10px auto;" cellpadding="2px" cellspacing="5px" >
            <tr>
                <td>员工姓名：</td>
                <td>
                    <input name="ename" class="easyui-textbox" data-options="required:true,width:180" value="${e.ename}"/>
                </td>
            </tr>
            <tr>
                <td>员工编号：</td>
                <td>
                    <c:choose>
                        <c:when test="${empty e}">
                            <input name="eno" class="easyui-textbox" data-options="width:180" value="${e.eno}"/>
                        </c:when>
                        <c:otherwise>
                            <input name="eno" class="easyui-textbox" data-options="required:true,width:180,editable:false" value="${e.eno}" />
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <c:if test="${empty e}">
                <tr>
                    <td>密码：</td>
                    <td>
                        <input name="password" class="easyui-textbox" data-options="required:true,width:180,type:'password'"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>员工职位：</td>
                <td>
                    <input name="job" class="easyui-combobox" value="${e.job}" data-options="required:true,width:180,
							valueField: 'label',
							textField: 'value',
							data: [{
								  label: 'gcs',
								  value: '工程师'
								 },{
								  label: 'xzzl',
			    				  value: '行政助理'
								}]"/>
                </td>
            </tr>
            <tr>
                <td>员工薪资：</td>
                <td>
                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="add();"></a>
                    <c:choose>
                        <c:when test="${empty e}">
                            <input id="salary" name="salary" class="easyui-numberbox" data-options="required:true,width:120" value="5000"/>
                        </c:when>
                        <c:otherwise>
                            <input id="salary" name="salary" class="easyui-numberbox" data-options="required:true,width:120,editable:false" value="${e.salary}"/>
                        </c:otherwise>
                    </c:choose>

                    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="remove();"></a>
                </td>
            </tr>
            <tr>
                <td>员工部门：</td>
                <td>
                    <input id="cc" name="did"  class="easyui-combotree" data-options="required:true,width:180,
						   url:'${pageContext.request.contextPath}/dept/getDept',
						   method:'post',
						   animate:true,
						   lines:true,
						   onLoadSuccess:function(node,data){
						   		$('#cc').combotree('setValue',${e.did});
						   		$('#cc').combotree('setText','${e.dname}');
						   }"/>
                </td>
            </tr>



        </table>


    </form>

</body>
</html>
