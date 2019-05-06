<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MACHANG-注册</title>
  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
  <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">
  <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
  <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">
  <link href="css/plugins/iCheck/custom.css" rel="stylesheet">
  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css?v=4.1.0" rel="stylesheet">
  <script>if(window.top !== window.self){ window.top.location = window.location;}</script>

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown">
  <div>
    <div>
      <h1 class="logo-name">MC</h1>
    </div>
    <h3>欢迎注册</h3>
    <form class="m-t" role="form"  id="signupForm" method="post">
      <div class="form-group">
          <input id="username" name="username" class="form-control" type="text" aria-required="true" aria-invalid="true" class="error" placeholder="请输入用户名">
      </div>

      <div class="form-group">
        <%--<input id="email" name="youxiang" class="form-control" type="email" placeholder="请输入EMAIL" required>--%>
        <input id="email" name="email" class="form-control" type="email" placeholder="请输入EMAIL">
      </div>
      <div class="form-group">
          <input id="password" name="password" class="form-control" type="password" placeholder="请输入密码">
      </div>
      <div class="form-group">
          <input id="confirm_password" name="confirm_password" class="form-control" type="password" placeholder="请再次输入密码">
      </div>
      <div class="radio i-checks">
        <label>
          <input type="radio" value="0" name="type" checked> <i></i> 需求者</label>
          <input type="radio"  value="1" name="type"> <i></i>开发者</label>
      </div>
      <div class="form-group text-left">
        <div class="checkbox i-checks">
          <label class="no-padding">
            <input type="checkbox" class="checkbox" id="agree" name="agree"><i></i> 我同意注册协议</label>
        </div>
      </div>
      <button type="submit" class="btn btn-primary block full-width m-b">注 册</button>
      <p class="text-muted text-center"><small>已经有账户了？</small><a href="login.jsp">点此登录</a>
      </p>
    </form>
  </div>
</div>
<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<!-- iCheck -->
<script src="js/plugins/iCheck/icheck.min.js"></script>
<!-- jQuery Validation plugin javascript-->
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>
<script src="js/demo/form-validate-demo.js"></script>
<!-- layer javascript -->
<script src="js/plugins/layer/layer.min.js"></script>
<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>
<script src="js/demo/layer-demo.js"></script>
<script>
    $(document).ready(function () {

        $("#signupForm").validate();
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });
    //验证手机号
    /*function isShoujihao() {
        var partten = /^1[3,5,8]\d{9}$/;
        var inputString=$("#shoujihao").val();
        if(partten.test(inputString))
        {
            flag=true;
        }
        else
        {
            $("#shoujihao").removeClass("form-control");
            $("#shoujihao").addClass("form-control help-block m-b-none");
        }

    }*/

    //表单验证 注册提交
    $.validator.setDefaults({
        submitHandler: function() {
                //alert("提交事件!");
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/yonghu/register",
                data:$("#signupForm").serialize(),
                dataType:"json",
                success:function(msg){//msg----->List<Category>
                    console.log(msg);
                    if(msg.status=="success"){
                        //提示层
                        //
                        //跳转到登录页面
                        var ii = layer.msg('注册成功，即将跳转到登录页面！');
                        //此处用setTimeout演示ajax的回调
                        setTimeout(function(){
                            layer.close(ii);
                            window.location.href="login.jsp";
                        }, 1000);
                    }else if(msg.status=="fail"){
                            layer.msg("用户名已存在·~~~~~~~~~~~~~~~~~~~~");
                            return;
                    }
                }
            });
        }
    });

</script>

</body>

</html>

