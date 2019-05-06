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
          <h5>编辑基本信息</h5>
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
          <form id="xuqiuform" class="form-horizontal" action="${pageContext.request.contextPath}/xuqiu/update" method="post">
            <div class="form-group">
              <label class="col-sm-2 control-label">选择开发类型
                <br/><small class="text-navy">自定义样式</small>
              </label>

              <div class="col-sm-10">
                <div class="radio i-checks">

                  <label><input type="radio" value="a" name="kaifatype" ${xuqiu.kaifatype=="a"?'checked':''}> <i></i>WEB网站</label>
                  <label><input type="radio" value="b" name="kaifatype" ${xuqiu.kaifatype=="b"?'checked':''}> <i></i>APP开发</label>
                  <label><input type="radio" value="c" name="kaifatype" ${xuqiu.kaifatype=="c"?'checked':''}> <i></i>微信公众号</label>
                  <label><input type="radio" value="d" name="kaifatype" ${xuqiu.kaifatype=="d"?'checked':''}> <i></i>小程序</label>
                  <label><input type="radio" value="e" name="kaifatype" ${xuqiu.kaifatype=="e"?'checked':''}> <i></i>HTML5应用</label>
                  <label><input type="radio" value="f" name="kaifatype" ${xuqiu.kaifatype=="f"?'checked':''}> <i></i>其他项目</label>
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
                    <input type="radio" value="0" name="kaifazhetype" ${xuqiu.kaifazhetype=="0"?'checked':''}> <i></i>个人</label>
                  <label>
                    <input type="radio" value="1" name="kaifazhetype" ${xuqiu.kaifazhetype=="1"?'checked':''}> <i></i>团队</label>
                </div>

              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目名称</label>
              <div class="col-sm-10">
                <input type="text" class="form-control" name="name" value="${xuqiu.name}">
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目类型</label>

              <div class="col-sm-10">
                <select class="form-control m-b" name="xiangmutype">
                  <option value="0" ${xuqiu.xiangmutype=="0"?'selected':''}>--请选择--</option>
                  <option value="1" ${xuqiu.xiangmutype=="1"?'selected':''}>电商</option>
                  <option value="2" ${xuqiu.xiangmutype=="2"?'selected':''}>医疗O2O</option>
                  <option value="3" ${xuqiu.xiangmutype=="3"?'selected':''}>旅游O2O</option>
                  <option value="4" ${xuqiu.xiangmutype=="4"?'selected':''}>教育</option>
                </select>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目预算</label>
              <div class="col-sm-10">
                <div class="input-group m-b"><span class="input-group-addon">&yen;</span>
                  <input type="text" class="form-control" name="yusuan" value="${xuqiu.yusuan}"> <span class="input-group-addon">.00</span>
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">期望开发周期</label>
              <div class="col-sm-10">
                <div class="input-group m-b">
                  <input type="text" class="form-control" name="qiwangzq" value="${xuqiu.qiwangzq}"> <span class="input-group-addon">天</span>
                </div>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
            <div class="form-group">
              <label class="col-sm-2 control-label">项目简述</label>
              <div class="col-sm-10">
                <textarea id="ccomment" name="jianshu" class="form-control" required="" aria-required="true">${xuqiu.jianshu}</textarea>
              </div>
            </div>
            <div class="hr-line-dashed"></div>
              <input type="hidden" name="shijizq" value="${xuqiu.shijizq}">
              <input type="hidden" name="attachid" value="${xuqiu.attachid}">
              <input type="hidden" name="status" value="${xuqiu.status}">
              <input type="hidden" name="kafazheid" value="${xuqiu.kafazheid}">
              <input type="hidden" name="xuqiuid" value="${xuqiu.xuqiuid}">
              <input type="hidden" name="id" value="${xuqiu.id}">
              <input type="hidden" name="lianxiname" value="${xuqiu.lianxiname}">
              <input type="hidden" name="youxiang" value="${xuqiu.youxiang}">
              <input type="hidden" name="test1" value="${xuqiu.test1}">
              <input type="hidden" name="test2" value="${xuqiu.test2}">
              <input type="hidden" name="test3" value="${xuqiu.test3}">
              <input type="hidden" name="test4" value="${xuqiu.test4}">
              <input type="hidden" name="test5" value="${xuqiu.test5}">
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