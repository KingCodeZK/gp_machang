<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
		<table style="margin:10px auto;" cellpadding="2px" cellspacing="5px" >
			<tr>
				<td>员工姓名：</td>
				<td>
					<input id ="ename" name="ename" class="easyui-textbox" data-options="width:180"/>
				</td>
			</tr>
			<tr>
				<td>员工部门：</td>
				<td>
					<input id="did" name="did" class="easyui-combotree" data-options="width:180,
						   url:'${pageContext.request.contextPath}/dept/getDept',
						   method:'post',
						   animate:true,
						   lines:true"/>
				</td>
			</tr>
			<tr>
				<td>开始时间：</td>
				<td>
					<input id ="startTime" name="startTime" class="easyui-datebox" data-options="width:180"/>
				</td>
			</tr>
			<tr>
				<td>结束时间：</td>
				<td>
					<input id ="endTime" name="endTime" class="easyui-datebox" data-options="width:180"/>
				</td>
			</tr>
			
			
		</table>
</body>