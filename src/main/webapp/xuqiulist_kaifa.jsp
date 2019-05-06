<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>H+ 后台主题UI框架 - 项目</title>
  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
  <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

  <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
  <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInUp">
  <div class="row">
    <div class="col-sm-12">

      <div class="ibox">
        <div class="ibox-title">
          <h5>所有项目</h5>
          <div class="ibox-tools">
            <a href="projects.html" class="btn btn-primary btn-xs">创建新项目</a>
          </div>
        </div>
        <div class="ibox-content">
          <div class="row m-b-sm m-t-sm">
            <div class="col-md-1">
              <button type="button" id="loading-example-btn" class="btn btn-white btn-sm"><i class="fa fa-refresh"></i> 刷新</button>
            </div>
            <div class="col-md-11">
              <div class="input-group">
                <input type="text" placeholder="请输入项目名称" class="input-sm form-control" id="xuqiuname"><span class="input-group-btn">
                                        <button type="button" class="btn btn-sm btn-primary" onclick="queryByTj()"> 搜索</button> </span>
              </div>
            </div>
          </div>

          <div class="project-list">

            <table class="table table-hover">
              <tbody id="data">
                <input type="hidden" name="xuqiuid" value="${user.id}" id="xuqiuid">
              </tbody>
            </table>
            <div style="text-align:center">
              <button id="first" type="button" class="btn btn-primary">首页</button>
              <button id="pre" type="button" class="btn btn-success">上一页</button>
              <button id="next" type="button" class="btn btn-info">下一页</button>
              <button id="end" type="button" class="btn btn-danger">尾页</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>


<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<!-- layer javascript -->
<script src="js/plugins/layer/layer.min.js"></script>


<script>
    var page,pre,next,end;
    var rows=5;
    var name="";
    var xuqiuid=$("#xuqiuid").val();
    $(document).ready(function(){
        //加载页面
        query(1,rows,name);
        //分页点击
        //~~~~~~~~~~~~~~注册点击事件
        $("#first").on("click",function(msg){
            query(1,rows,name);
        });
        $("#pre").on("click",function(msg){
            if(pre>=1){
                query(pre,rows,name);
            }
        });
        $("#next").on("click",function(msg){
            if(next<=end){
                query(next,rows,name);
            }

        });
        $("#end").on("click",function(msg){
            query(end,rows,name);
        });
        //列表刷新
        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)

            // Ajax example
//                $.ajax().always(function () {
//                    simpleLoad($(this), false)
//                });
            $("#xuqiuname").val("");
            query(1,rows,"");
            simpleLoad(btn, false)
        });
    });
    //列表刷新函数
    function simpleLoad(btn, state) {
        //debugger;
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
            }, 500);
        }
    }
    //列表查询,page=定义当前页数，rows=每页记录数

    function query(page,rows,name){
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/xuqiu/query_kf",       //         &pageNumber=xx &name=xx &caid=xx
            data:"page="+page+"&rows="+rows+"&name="+name+"&xuqiuid="+xuqiuid,
            dataType:"json",
            success:function(msg){
                //$("#checkall").prop("checked",false);
                console.log(msg);
                pre = msg.pre;
                next = msg.next;
                end = msg.end;
                var tr="";
                $.each(msg.rows,function(i,xuqiu){
                    tr+="<tr> <td class='project-status'> <span class='label label-primary'>"+
                        (xuqiu.status==0?"招募中":"进行中")
                        +"</td><td class='project-title'><a href='project_detail.html'>"+xuqiu.name+"</a> <br/> <small>创建于"+xuqiu.time
                        +"</small> </td> <td class='project-completion'> <small>当前进度："+xuqiu.test1+"%</small> <div class='progress progress-mini'> <div style='width: 28%;' class='progress-bar'></div> </div> </td><td><div></div></td><td><div></div></td><td class='project-status'><span class='label label-primary'>期望周期"+xuqiu.qiwangzq+"天</td><td class='project-actions'><button type='button' class='btn btn-white btn-sm' onclick=\"showXuqiuInfo('"+xuqiu.id+"')\"><i class='fa fa-folder'></i> 查看 </button><button type='button' class='btn btn-white btn-sm'  onclick=\"updateXuqiuInfo('"+xuqiu.id+"')\"><i class='fa fa-pencil'></i>开发进度</button><button type='button' class='btn btn-white btn-sm'  onclick=\"addXiaoxi('"+xuqiu.id+"')\"><i class='fa fa-pencil'></i>添加进度</button></td></tr>";
                });
                $("#data").html(tr);
            }

        });
    }

    //条件查询
    function queryByTj(){
        //debugger;
        var xuqiuname = $("#xuqiuname").val();
        if(xuqiuname!=null && xuqiuname!=""){
            name=xuqiuname;
            query(1,rows,name);
        }else {
            name="";
            query(pre+1,rows,name);
        }
        //alert(name);


    }
    //查看详情
    function showXuqiuInfo(pa) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/xuqiu/queryInfo",       //         &pageNumber=xx &name=xx &caid=xx
            data:"id="+pa,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                if(msg.status=='success'){
                    layer.open({
                        type: 2,
                        title: '项目详情',
                        maxmin: true,
                        shadeClose: true, //点击遮罩关闭层
                        area : ['1000px' , '500px'],
                        content: 'project_detail.jsp'
                    });

                }
            }

        });
    }
    //编辑项目
    function updateXuqiuInfo(pa) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/xuqiu/queryInfo",       //         &pageNumber=xx &name=xx &caid=xx
            data:"id="+pa,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                if(msg.status=='success'){
                    layer.open({
                        type: 2,
                        title: '项目详情',
                        maxmin: true,
                        shadeClose: true, //点击遮罩关闭层
                        area : ['1000px' , '600px'],
                        content: 'timeline.jsp'
                    });

                }
            }

        });
    }
    //添加进度
    function addXiaoxi(pa) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/xuqiu/queryInfo",       //         &pageNumber=xx &name=xx &caid=xx
            data:"id="+pa,
            dataType:"json",
            success:function(msg){
                console.log(msg);
                if(msg.status=='success'){
                    layer.open({
                        type: 2,
                        title: '项目详情',
                        maxmin: true,
                        shadeClose: true, //点击遮罩关闭层
                        area : ['1000px' , '600px'],
                        content: 'addXiaoxi.jsp'
                    });

                }
            }

        });
    }
</script>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script><!--统计代码，可删除-->

</body>
</html>