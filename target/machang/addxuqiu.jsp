<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>基本表单</title>
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
          <h5>发布需求<small>编辑需求基本信息</small></h5>
          <div class="ibox-tools">
            <a class="collapse-link">
              <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
              <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
              <li><a href="form_basic.html#">选项1</a>
              </li>
              <li><a href="form_basic.html#">选项2</a>
              </li>
            </ul>
            <a class="close-link">
              <i class="fa fa-times"></i>
            </a>
          </div>
        </div>
        <div class="ibox-content">
          <form id="xuqiuform" class="form-horizontal"
                action="${pageContext.request.contextPath}/xuqiu/add"
                method="post"
                enctype="multipart/form-data">
            <div class="form-group">
              <label class="col-sm-2 control-label">选择开发类型
                <br/><small class="text-navy">自定义样式</small>
              </label>

              <div class="col-sm-10">
                <div class="radio i-checks">

                  <label><input type="radio" value="a" name="kaifatype"> <i></i>WEB网站</label>
                  <label><input type="radio" value="b" name="kaifatype"> <i></i>APP开发</label>
                  <label><input type="radio" value="c" name="kaifatype"> <i></i>微信公众号</label>
                  <label><input type="radio" value="d" name="kaifatype"> <i></i>小程序</label>
                  <label><input type="radio" value="e" name="kaifatype"> <i></i>HTML5应用</label>
                  <label><input type="radio" value="f" name="kaifatype"> <i></i>其他项目</label>
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">选择开发者类型
                <br/><small class="text-navy">自定义样式</small>
              </label>
              <div class="col-sm-10">
                <div class="radio i-checks">
                  <label>
                    <input type="radio" value="0" name="kaifazhetype"> <i></i>个人</label>
                  <label>
                    <input type="radio" value="1" name="kaifazhetype"> <i></i>团队</label>
                </div>

              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目类型</label>

              <div class="col-sm-10">
                <select class="form-control m-b" name="xiangmutype">
                  <option value="0">--请选择--</option>
                  <option value="1">电商</option>
                  <option value="2">医疗O2O</option>
                  <option value="3">旅游O2O</option>
                  <option value="4">教育</option>
                </select>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目预算</label>
              <div class="col-sm-10">
                <div class="input-group m-b"><span class="input-group-addon">&yen;</span>
                  <input type="text" class="form-control" name="yusuan"> <span class="input-group-addon">.00</span>
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">期望开发周期</label>
              <div class="col-sm-10">
                <div class="input-group m-b">
                  <input type="text" class="form-control" name="qiwangzq"> <span class="input-group-addon">天</span>
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目简述</label>
              <div class="col-sm-10">
                <textarea id="ccomment" name="jianshu" class="form-control" required="" aria-required="true"></textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="font-noraml">文件选择</label>
              <input type="file" multiple="multiple" class="form-control" name="files">
            </div>
              <input type="hidden" name="xuqiuid" value="${user.id}">
              <input type="hidden" name="lianxiname" value="${user.name}">
              <input type="hidden" name="youxiang" value="${user.youxiang}">
            <%--单张图片--%>
            <%--
            <div class="ibox-content">
              <div id="file-pretty">
                <div class="form-group">
                  <label class="font-noraml">上传图片</label>
                  <input type="file" class="form-control" name="f">
                </div>
              </div>
            </div>--%>
            <%--上传附件--%>
            <%--<div class="hr-line-dashed"></div>
            <div class="ibox float-e-margins">
              <div class="ibox-title">
                <h5>文件上传 <small></small></h5>
                <div class="ibox-tools">
                  <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                  </a>
                  <a class="dropdown-toggle" data-toggle="dropdown" href="form_advanced.html#">
                    <i class="fa fa-wrench"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-user">
                    <li><a href="form_advanced.html#">选项1</a>
                    </li>
                    <li><a href="form_advanced.html#">选项2</a>
                    </li>
                  </ul>
                  <a class="close-link">
                    <i class="fa fa-times"></i>
                  </a>
                </div>
              </div>
              <div class="ibox-content">
                <div id="file-pretty">
                  <div class="form-group">
                    <label class="font-noraml">文件选择（单选）</label>
                    <input type="file" class="form-control" name="f">
                  </div>
                </div>
              </div>
            </div>--%>

            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <div class="col-sm-4 col-sm-offset-2">
                <button class="btn btn-primary" type="submit" onclick="add();">保存内容</button>
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
</script>

</body>

</html>