<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">

    <title>MACHANG</title>

    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico"> <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header" id="side-menu-header">
                    <div class="dropdown profile-element">
                        <%--<span><img alt="image" class="img-circle" src="img/profile_small.jpg" /></span>--%>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold">${user.name}</strong></span>
                                <span class="text-muted text-xs block">设置<b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <%--<li><a class="J_menuItem" href="form_avatar.html">修改头像</a>
                            </li>--%>
                            <%--<li><a class="J_menuItem" href="profile.html">个人资料</a>
                            </li>--%>
                            <%--<li class="divider"></li>--%>
                            <li><a href="login.jsp">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">H+
                    </div>
                </li>
                <li></li>
                <li>
                    <a href="#">
                        <i class="fa fa-home"></i>
                        <span class="nav-label">需求者</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="addxuqiu.jsp" data-index="0">发布需求</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="xuqiulist_xq.jsp">需求列表</a>
                        </li>
                    </ul>

                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">开发者</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a class="J_menuItem" href="xuqiulist.jsp">项目列表</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="xuqiulist_kaifa.jsp">参与中项目</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">
                        <i class="fa fa fa-bar-chart-o"></i>
                        <span class="nav-label">管理分析</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a  href="index1.jsp">用户管理</a>
                        </li>
                        <%--<li>
                            <a class="J_menuItem" href="graph_flot.html">项目分析</a>
                        </li>
                        <li>
                            <a class="J_menuItem" href="graph_flot.html">用户分析</a>
                        </li>--%>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row content-tabs">
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                </div>
            </nav>
            <a href="login.jsp" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" id="iframe0" width="100%" height="100%" src="welcome.jsp" frameborder="0" data-id="index_v1.html" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2019-2020 <a href="" target="_blank">king_coding</a>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="js/plugins/layer/layer.min.js"></script>

<!-- 自定义js -->
<script src="js/hplus.js?v=4.1.0"></script>
<script type="text/javascript" src="js/contabs.js"></script>
<!-- 第三方插件 -->
<script src="js/plugins/pace/pace.min.js"></script>
<script>
    $(document).ready(function () {
        var type = ${sessionScope.user.type};
        console.log(type);
        if(type==0){
            $("ul[id='side-menu'] li:nth-child(4)").remove();
            $("ul[id='side-menu'] li:nth-child(4)").remove();
        }else if (type==1){
            $("ul[id='side-menu'] li:nth-child(3)").remove();
            $("ul[id='side-menu'] li:nth-child(4)").remove();
        }
    });
</script>
</body>

</html>
