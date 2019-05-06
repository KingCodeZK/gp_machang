<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>MACHANG- 登录</title>
  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
  <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

  <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
  <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css?v=4.1.0" rel="stylesheet">
  <!--[if lt IE 9]>
  <meta http-equiv="refresh" content="0;ie.html" />
  <![endif]-->
  <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen  animated fadeInDown">
  <div>
    <div>

      <h1 class="logo-name">MC</h1>

    </div>
    <h3>欢迎使用码场</h3>

    <form class="m-t" role="form" id="signupForm" method="post">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="用户名" required name="username" id="username">
      </div>
      <div class="form-group">
        <input type="password" class="form-control" placeholder="密码" required name="password" id="password">
      </div>
      <button type="submit" class="btn btn-primary block full-width m-b" >登 录</button>


      <p class="text-muted text-center"> <a href="register.jsp">注册一个新账号</a>
      </p>

    </form>
  </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<!-- jQuery Validation plugin javascript-->
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>
<script src="js/demo/form-validate-demo.js"></script>
<!-- layer javascript -->
<script src="js/plugins/layer/layer.min.js"></script>


<script>


    $(document).ready(function () {

        $("#signupForm").validate();
        /*$('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });*/
    });
    //表单验证 注册提交
    $.validator.setDefaults({
        submitHandler: function() {
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}/yonghu/login1",       //         &pageNumber=xx &name=xx &caid=xx
                data:$("#signupForm").serialize(),
                dataType:"json",
                success:function(msg){
                    console.log(msg.status);
                    if(msg.status=="success"){
                        window.location.href="index.jsp";
                    }else if(msg.status=="bucunzai"){
                        layer.msg("用户名不存在·~~~~~~~~~~~~~~~~~~~~");
                        return;
                    }else if(msg.status=="fail"){
                        layer.msg("登录密码不正确·~~~~~~~~~~~~~~~~~~~~");
                        return;
                    }else if(msg.status=="beixianzhi"){
                        layer.msg("账户已冻结·~~~~~~~~~~~~~~~~~~~~~~~");
                        return;
                    }
                }

            });

        }
    });


</script>
</body>
</html>
