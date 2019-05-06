<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">


  <title>项目详情</title>
  <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
  <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

  <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
  <link href="css/font-awesome.css?v=4.4.0" rel="stylesheet">

  <link href="css/animate.css" rel="stylesheet">
  <link href="css/style.css?v=4.1.0" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="row">
  <div class="col-sm-9">
    <div class="wrapper wrapper-content animated fadeInUp">
      <div class="ibox">
        <div class="ibox-content">
          <div class="row">
            <div class="col-sm-12">
              <div class="m-b-md">
                <%--<a href="project_detail.html#" class="btn btn-white btn-xs pull-right">编辑项目</a>--%>
                <h2>${xuqiu.name}</h2>
              </div>
              <dl class="dl-horizontal">
                <dt>状态：</dt>
                <dd><span class="label label-primary">${xuqiu.status==0?"招募中":"进行中"}</span>
                </dd>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-5">
              <dl class="dl-horizontal">

                <dt>联系人：</dt>
                <dd>${xuqiu.lianxiname}</dd>
                <dt>邮箱：</dt>
                <dd>${xuqiu.youxiang}</dd>
                <%--<dt>联系电话：</dt>
                <dd>${user.shoujihao}</dd>--%>
                <dt>开发类型：</dt>
                <dd>
                  <c:choose>
                    <c:when test="${xuqiu.kaifatype=='a'}">
                      "WEB网站"
                    </c:when>
                    <c:when test="${xuqiu.kaifatype=='b'}">
                      "APP开发"
                    </c:when>
                    <c:when test="${xuqiu.kaifatype=='c'}">
                      "微信公众号"
                    </c:when>
                    <c:when test="${xuqiu.kaifatype=='d'}">
                      "小程序"
                    </c:when>
                    <c:when test="${xuqiu.kaifatype=='e'}">
                      "HTML5应用"
                    </c:when>
                    <c:when test="${xuqiu.kaifatype=='f'}">
                      "其他项目"
                    </c:when>
                  </c:choose>
                </dd>
                <dt>开发者类型：</dt>
                <dd>
                  <c:choose>
                    <c:when test="${xuqiu.kaifazhetype==0}">
                      "个人"
                    </c:when>
                    <c:when test="${xuqiu.kaifazhetype==1}">
                      "团队"
                    </c:when>
                  </c:choose>
                </dd>

              </dl>
            </div>
            <div class="col-sm-7" id="cluster_info">
              <dl class="dl-horizontal">

                <dt>创建于：</dt>
                <dd><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${xuqiu.time}"></fmt:formatDate>  </dd>
                <dt>期望周期：</dt>
                <dd>${xuqiu.qiwangzq}天</dd>
                <dt>预算：</dt>
                <dd>${xuqiu.yusuan}元</dd>
                <dt>项目类型：</dt>
                <dd>
                  <c:choose>
                    <c:when test="${xuqiu.xiangmutype==1}">
                      "电商"
                    </c:when>
                    <c:when test="${xuqiu.xiangmutype==2}">
                      "医疗O2O"
                    </c:when>
                    <c:when test="${xuqiu.xiangmutype==3}">
                      "旅游O2O"
                    </c:when>
                    <c:when test="${xuqiu.xiangmutype==4}">
                      "教育"
                    </c:when>
                  </c:choose>
                </dd>
                <%--<dt>团队成员：</dt>
                <dd class="project-people">
                  <a href="project_detail.html">
                    <img alt="image" class="img-circle" src="img/a3.jpg">
                  </a>
                  <a href="project_detail.html">
                    <img alt="image" class="img-circle" src="img/a1.jpg">
                  </a>
                  <a href="project_detail.html">
                    <img alt="image" class="img-circle" src="img/a2.jpg">
                  </a>
                  <a href="project_detail.html">
                    <img alt="image" class="img-circle" src="img/a4.jpg">
                  </a>
                  <a href="project_detail.html">
                    <img alt="image" class="img-circle" src="img/a5.jpg">
                  </a>
                </dd>--%>
              </dl>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-12">
              <dl class="dl-horizontal">
                <dt>当前进度</dt>
                <dd>
                  <div class="progress progress-striped active m-b-sm">
                    <div style="width: ${xuqiu.test1}%;" class="progress-bar"></div>
                  </div>
                  <small>当前已完成项目总进度的 <strong>${xuqiu.test1}%</strong></small>
                </dd>
              </dl>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-3">
    <div class="wrapper wrapper-content project-manager">
      <h4>项目描述</h4>
      <img src="files/${xuqiu.attachid}" class="img-responsive">
      <p class="small">
        <br>${xuqiu.jianshu}
      </p>
    </div>
  </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>



<!-- 自定义js -->
<script src="js/content.js?v=1.0.0"></script>


<script>
    $(document).ready(function () {

        $('#loading-example-btn').click(function () {
            btn = $(this);
            simpleLoad(btn, true)

            // Ajax example
            //                $.ajax().always(function () {
            //                    simpleLoad($(this), false)
            //                });

            simpleLoad(btn, false)
        });
    });

    function simpleLoad(btn, state) {
        if (state) {
            btn.children().addClass('fa-spin');
            btn.contents().last().replaceWith(" Loading");
        } else {
            setTimeout(function () {
                btn.children().removeClass('fa-spin');
                btn.contents().last().replaceWith(" Refresh");
            }, 2000);
        }
    }
</script>


</body>

</html>

