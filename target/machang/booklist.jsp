<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap 101 Template</title>
  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!--查询区域-->
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          条件查询
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        <form class="form-inline" role="form">
          <div class="form-group">
            <label  for="bookname">书名:</label>
            <input type="text" class="form-control"
                   id="bookname" name="bookname"
                   placeholder="请输入书名">
          </div>
          <div class="form-group">
            <label  for="caid">类别:</label>
            <select class="form-control"
                   id="caid" name="caid"></select>
          </div>

          <button type="button" class="btn btn-primary" onclick="queryByTj()">查询</button>
          <button type="button" class="btn btn-success" onclick="export2Excel()">导出到EXCEL</button>
          <button type="button" class="btn btn-danger" onclick="delbat()">删除</button>
        </form>
      </div>
    </div>
  </div>
</div>
<!--查询区域 end-->
<table class="table table-bordered table-responsive table-striped
table-condensed table-hover">
    <thead>
      <tr>
        <th>
          <input type="checkbox" id="checkall" onclick="checkall()" />
          <label for="checkall">全选</label>
        </th>
        <th>序号</th>
        <th>名字</th>
        <th>价格</th>
        <th>作者</th>
        <th>出版日期</th>
        <th>所在类别</th>
        <th>状态</th>
        <th>是否删除</th>
        <th>操作</th>
      </tr>
    </thead>
  <tbody id="data"></tbody>
</table>
<div style="text-align:center">
  <button id="first" type="button" class="btn btn-primary">首页</button>
  <button id="pre" type="button" class="btn btn-success">上一页</button>
  <button id="next" type="button" class="btn btn-info">下一页</button>
  <button id="end" type="button" class="btn btn-danger">尾页</button>
</div>
<!--Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form" action="book" method="POST"
              enctype="multipart/form-data">
          <input type="hidden" name="method" value="addbook" />
          <div class="form-group">
            <label for="name" class="col-sm-2 control-label">名字:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="name"
                     name="name" placeholder="请输入书籍名字">
            </div>
          </div>
          <!--作者-->
          <div class="form-group">
            <label for="author" class="col-sm-2 control-label">作者:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="author"
                     name="author" placeholder="请输入书籍作者">
            </div>
          </div>
          <!--价格-->
          <div class="form-group">
            <label for="price" class="col-sm-2 control-label">价格:</label>
            <div class="col-sm-10">
              <input type="number" class="form-control" id="price"
                     name="price" placeholder="请输入书籍价格">
            </div>
          </div>
          <!--出版日期-->
          <div class="form-group">
            <label for="publishdate" class="col-sm-2 control-label">出版日期:</label>
            <div class="col-sm-10">
              <input type="date" class="form-control" id="publishdate"
                     name="publishdate" >
            </div>
          </div>
          <!--所在类别-->
          <div class="form-group">
            <label for="categoryid" class="col-sm-2 control-label">所在类别:</label>
            <div class="col-sm-10">
              <select class="form-control" id="categoryid"
                      name="categoryid"  >
              </select>
            </div>
          </div>
          <!--状态-->
          <div class="form-group">
            <label for="status" class="col-sm-2 control-label">状态:</label>
            <div class="col-sm-10">
              <select class="form-control" id="status"
                      name="status" >
                <option value="1">==上架==</option>
                <option value="0">==下架==</option>
              </select>
            </div>
          </div>
          <!--图片-->
          <div class="form-group">
            请选择:<input type="file" name="pic" id="pic" />
            <button type="button" class="btn btn-primary"
                    onclick="addpic()">上传图片</button>
            <div class="col-sm-10" id="pics">

            </div>
          </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">更新</button>
      </div>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/ajaxfileupload.js"></script>
<script>
  function delbat(){
      var books = $("input[name='et1807']:checked");
      if(books.size()<1){
          alert("请至少选择一条记录！！");
          return;
      }
      var ids="";
      $.each(books,function(i,book){
          ids+=book.value+",";
      });
      //update book set del=1 where id in (????????)


  }
  //下载
  function export2Excel(){
      window.location.href="book?method=download";
  }
  function addpic(){
      if($("#pic").val()==null || $("#pic").val()==""){
          alert("请选择图片!");
          return ;
      }

      $.ajaxFileUpload({
          type:"POST",
          url:"pic",
          fileElementId:"pic",//上传文件的id
          data:{
              "bookid":bookid
          },
          dataType:"json",
          success:function(msg){
              console.log(msg);
              if(msg.flag=="success"){
                  showBookInfo(bookid)
              }
          }
      })
  }
  //组装条件
  function queryByTj(){
      tj="";
      let name = $("#bookname").val();
      let caid = $("#caid").val();
      if(name!=null && name!=""){
          tj+="&name="+name;
      }
      if(caid!=null &&caid!="" && caid!="-1"){
          tj+="&caid="+caid;
      }
      //alert(tj);
      queryData(1,tj);
  }
  function checkall(){

      $("input[name='et1807']").
      prop("checked",$("#checkall").prop("checked"));
  }

  let pre,next,pageCount;
  let tj="";
  $(function(){
      //初始化下拉菜单
      queryAllCas();
      //xxx
      queryData(1,tj);
      //~~~~~~~~~~~~~~注册点击事件
      $("#first").on("click",function(msg){
          queryData(1,tj);
      });
      $("#pre").on("click",function(msg){
          queryData(pre,tj);
      });
      $("#next").on("click",function(msg){
          queryData(next,tj);
      });
      $("#end").on("click",function(msg){
          queryData(pageCount,tj);
      });

  });
  function queryData(pn,c){
      $.ajax({
          type:"POST",
          url:"book",       //         &pageNumber=xx &name=xx &caid=xx
          data:"method=querySome&pageNumber="+pn+c,
          dataType:"json",
          success:function(msg){
              $("#checkall").prop("checked",false);
              console.log(msg);
              pre = msg.pre;
              next = msg.next;
              pageCount = msg.pageCount;
              var tr="";
              $.each(msg.rows,function(i,book){
                 tr+="<tr><td><input type='checkbox' name='et1807' value='"+book.id+"'></td>"+
                     "<td>"+(msg.start+i+1)+"</td><td>"+book.name
                     +"</td><td>"+book.price+"</td><td>"+book.author
                     +"</td><td>"+book.pdate+"</td><td>"
                     +book.ca.name+"</td><td>"+(book.status==1?"上架":"下架")
                     +"</td><td>"+(book.del==1?"已删除":"未删除")
                 +"</td><td><button type='button' class='btn btn-primary' onclick=\"showBookInfo('"+book.id+"')\">详情</button></td></tr>";

              });
              $("#data").html(tr);
          }

      });
  }
  let bookid = "";
  function showBookInfo(bid){
      bookid=bid;
      $.post("book",//url
          "method=queryBookById&id="+bid, //data
          function(msg){   //success:[] {}
              var y = msg.publishdate.year+1900;
              var m = (msg.publishdate.month+1)<10?("0"+(msg.publishdate.month+1)):msg.publishdate.month+1;
            var date  = (msg.publishdate.date<10)?("0"+(msg.publishdate.date)):msg.publishdate.date;
          var res = y+"-"+m+"-"+date;

              $("#name").val(msg.name);
              $("#author").val(msg.author);
              $("#price").val(msg.price);
              $("#publishdate").val(res);
              $("#categoryid").val(msg.categoryid);
              $("#status").val(msg.status);
              var pics="";
              $.each(msg.bps,function(i,bp){
                   pics+="<div class='col-sm-6 col-md-4'>"+
                       "<div class='thumbnail'>"+
                      "<img src='"+bp.savepath+"'>"+
                      "<div class='caption'>"+
                      "<button type='button' class='btn btn-primary' >设置封面</button>"+
                      "<button type='button' class='btn btn-danger' onclick=\"delpic('"+bp.id+"')\" >删除</button>"+
                      "</div>"+
                      "</div>"+
                      "</div>";
              });
              $("#pics").html(pics);

              $("#myModal").modal("show");


      },"json");//dataType


  }
  function queryAllCas(){
      $.ajax({
          type:"post",
          url:"book",
          data:"method=queryAllCas",
          dataType:"json",
          success:function(msg){//msg----->List<Category>
              console.log(msg);
              var ops="<option value='-1'>==请选择==</option>";
              $.each(msg,function(i,ca){
                  ops+="<option value='"+ca.id+"'>"+ca.name+"</option>";
              });
              //查询的下拉菜单
              $("#caid").html(ops);
              //模态框的下拉菜单
          $("#categoryid").html(ops);
    }

      });
  }
  function delpic(bpid){
      $.post("book",
              "method=delpic&bpid="+bpid,
              function(msg){
                if(msg.flag=="success"){
                    //重新根据书籍id查询书籍详情
                    showBookInfo(bookid);
                }
               },
              "json");
  }
</script>

</body>
</html>
