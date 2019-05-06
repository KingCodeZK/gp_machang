<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>MACHANG</title>
  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
  <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

  <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
  <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


  <div class="row">
    <div class="col-sm-12">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>添加<small>消息</small></h5>
          <div class="ibox-tools">
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>

            <ul class="dropdown-menu dropdown-user">

            </ul>
            <a class="close-link">
              <i class="fa fa-times"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          <form  class="form-horizontal" action="${pageContext.request.contextPath}/xuqiu/addXiaoxi" method="post">


            <div class="form-group">
              <label class="col-sm-2 control-label">消息标题</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="title_xiaoxi" id="title_xiaoxi">
              </div>
            </div>
            <div class="hr-line-dashed"></div>

            <div class="form-group">
              <label class="col-sm-2 control-label">消息简述</label>
              <div class="col-sm-10">
                <textarea id="content_xiaoxi" name="content_xiaoxi" class="form-control" required="" aria-required="true"></textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">开发进度</label>
              <div class="col-sm-10">
                <div class="input-group m-b">
                  <input type="text" class="form-control" name="jindu" id="jindu"> <span class="input-group-addon">%</span>
                </div>
              </div>
            </div>

            <input type="hidden" name="xuqiuid" id="xuqiuid" value="${xuqiu.id}">

            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="submit" >添加</button>
                <button class="btn btn-white" type="reset">取消</button>
              </div>
            </div>
          </form>
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

<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    /*
    function addXx(){
        var title_xiaoxi = $("#title_xiaoxi").val();
        var content_xiaoxi = $("#content_xiaoxi").val();
        var jindu = $("#jindu").val();
        var xuqiuid = $("#xuqiuid").val();
        $.ajax({
            type:"post",
            url:"/xuqiu/addXiaoxi",
            data:"title_xiaoxi="+title_xiaoxi+"&content_xiaoxi="+content_xiaoxi+"&jindu="+jindu+"&xuqiuid="+xuqiuid,
            dataType:"json",
            success:function(msg){//msg----->List<Category>
                console.log(msg);
            }

        });
    }*/
</script>

</body>

</html>