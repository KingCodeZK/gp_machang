$(function () {
   //初始化列表
    $("#tj-list").datagrid({
       //工具栏
        toolbar:'#zuche-list-toolbar',
        url:contextPath+"/tj/query",
        //默认post
        method:'post',
        striped:true,
        loadMsg:'正在玩命加载，骚等...',
        //显示分页工具栏
        pagination:true,
        //显示行号
        rownumbers:true
        //行样式
        /*rowStyler: function(index,row){
            if (true){
                return 'background-color:#FFFFE0;color:red  ;'
            }
        }*/,
        //当前页
        pageNumber:1,
        //每页记录数
        pageSize:5,
        //每页记录数列表  pagesize中需要在列表中存在
        pageList:[5,10,50],
        //自适应
        fit:true,
        //接收后台响应的信息
        fitColumns:true,
        //列的字段名称
        columns:[[
            {title:"用户类型",field:"type",align:'center',width:200,formatter:function(value,row,index){
                if(value==1){
                    return "开发者";
                }else {
                    return "需求者";
                }
            }},
            {title:"是否被限制",field:"test2",align:'center',width:200,formatter:function(value,row,index){
                if(value=="1"){
                    return "是";
                }else {
                    return "否";
                }
            }},
            {title:"数量",field:"count",align:'center',width:200}
            ]]
    });
});

var eventObj={
    //条件查询
    query:function () {
        $("#zuche-dialog").dialog({
            title: '员工查询',
            width: 400,
            height: 280,
            closed: false,
            cache: false,
            href: contextPath+'/pages/zuche/query.jsp',
            modal: true,
            buttons:[
                {
                    text:'查询',
                    iconCls:'icon-search',
                    handler:function(){
                        //重新发送Url属性和method属性
                        $("#emp-list").datagrid("load",{
                            bxh:$("#bxh").textbox("getValue")
                    });
                        $("#emp-dialog").dialog("close");
                        $("#emp-dialog").dialog("clear");
                    }
                }


            ]
        });
            },//新增

    add:function () {
        $("#zucheregister-dialog").dialog({
                title: '新增',
                width: 550,
                height: 400,
                closed: false,
                cache: false,
                href: contextPath+'/zuche/empAddAndUpdate',
                modal: true,
                buttons:[{
                    text:'新增',
                    iconCls:'icon-ok',
                    handler:function(){
                        $("#zuche-form").form("submit",{
                            url:contextPath+'/zuche/add',
                            onSubmit:function(p){
                                p.etoak='et1807';
                                //验证emp-form 表单下的表单项是否为非null
                                return $("#emp-form").form('validate');
                            },
                            success:function(result){
                                var data=$.parseJSON(result);
                                //== 只比较内容不比较类型
                                //=== 先比较类型 是否一致  再比较内容   当都一直到的时候返回true
                                if(data.code==200){
                                    $("#zucheregister-dialog").dialog("close");
                                    $("#zucheregister-dialog").dialog("clear");
                                    $("#zuche-list").datagrid("load",{

                                    });
                                }
                                $.messager.show({
                                    title:'提示',
                                    msg:data.msg,
                                    timeout:5000,
                                    showType:'slide'
                                });
                            }
                        });
                    }
                    /*button end*/
        }]
      });

    },//修改
    update:function () {
        var rows = $("#zuche-list").datagrid("getSelections");
        if(rows.length!=1){
            $.messager.show({
                title:'提示',
                msg:'请选择一条数据',
                timeout:5000,
                showType:'slide'
            });
            return;
        }
        var row =rows[0];
        $("#emp-dialog").dialog({
            title: '员工修改',
            width: 400,
            height: 280,
            closed: false,
            cache: false,
            href: contextPath+'/dcxx/empAddAndUpdate?id='+row.id,
            modal: true,
            buttons:[{
                text:'修改',
                iconCls:'icon-edit',
                handler:function(){
                    $("#emp-form").form("submit",{
                        url:contextPath+"/dcxx/update",
                        onSubmit:function(){
                            return $(this).form("validate");

                        },
                        success:function(result){
                            var data = $.parseJSON(result);
                            if(data.code==200){
                                //关闭窗口
                                $("#emp-dialog").dialog("close");
                                $("#emp-dialog").dialog("clear");
                                $("#emp-list").datagrid("reload");
                            }
                            $.messager.show({
                                title:'提示',
                                msg:data.msg,
                                timeout:5000,
                                showType:'slide'
                            });
                        }
                    });
                }

            }]

        });

    },//删除
    remove : function(){
        var rows = $("#zuche-list").datagrid("getSelections");
        if(rows.length==0){
            $.messager.show({
                title:'提示',
                msg:'请至少选择一条数据',
                timeout:5000,
                showType:'slide'
            });
            return;
        }

        $.messager.confirm('确认','您确认想要归还单车吗？',function(r){
            if (r){

                var ids =$.map(rows,function(row){
                    return row.id;
                }) ;
                $.ajax({
                    url:contextPath+'/zuche/remove',
                    contentType:'application/json',
                    data:JSON.stringify(ids),
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        $.messager.show({
                            title:'提示',
                            msg:data.msg,
                            timeout:5000,
                            showType:'slide'
                        });
                        $("#zuche-list").datagrid("reload");
                    }
                });
            }
            $("#zuche-list").datagrid("reload");
        });

    }
};











