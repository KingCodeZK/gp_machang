$(function () {
    $("a.opts").click(function () {
        let url =$(this).attr("url");
        if(url!=undefined&&url!=null&&url!=''){
            //定义选项卡参数
            let option ={
                "content":'<iframe src="'+contextPath+url+'" height="100%" width="100%" frameborder="0" scrolling="auto"></iframe>',
                "title":$(this).html()
            };
            tabs(option);
        }

    });

});
/*初始化 end*/
//定义tabs函数
function tabs(option) {
    //获取选项卡对象
    let tabs = $("#content");
    //判断选项卡是否存在  返回值是boolean类型
    let exists= $(tabs).tabs("exists",option.title);
    //选项卡存在 选中并更新
    if (exists){
        //选中更新的选项卡
        $(tabs).tabs("select",option.title);
        //获取要更新的选项卡对象
        let tab = $(tabs).tabs("getTab",option.title);
        //更新
        $(tabs).tabs("update",{
            tab:tab,
            options:{
                title:option.title,
                content:option.content,
                //在设置为true的时候，选项卡面板将显示一个关闭按钮，在点击的时候会关闭选项卡面板。
                closable:true
            }
        })

    }else {//选项卡不存在
        $(tabs).tabs("add",{
            title:option.title,
            content:option.content,
            closable:true
        })

    }


}