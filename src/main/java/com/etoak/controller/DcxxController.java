package com.etoak.controller;

import com.etoak.bean.Dcxx;
import com.etoak.bean.Xuqiu;
import com.etoak.service.DcxxService;
import com.etoak.utils.ResultMsg;
import com.etoak.utils.TreeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by zk on 2018/11/11.
 */
@Controller
@RequestMapping(value ="/dcxx")
public class DcxxController {
    @Autowired
    private DcxxService dcxxService;

    /*根据单车编号查询*/
    @ResponseBody
    @RequestMapping(value="/getDcxx",method=RequestMethod.POST)
    public List<TreeNode> getDept(@RequestParam(value="id",defaultValue="0") Integer id){
        return dcxxService.findDcxxByPid(id);
    }



    /*跳转到列表页面*/
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public String list(){
        return "dcxx/list";
    }
    /*查询所有员工*/
    @ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page,Integer rows,Xuqiu xuqiu){
        return dcxxService.query(page,rows,xuqiu);
    }

    /*添加前判断用户是否存在 不存在跳转到添加页面 存在添加到model中返回信息 供修改时使用*/
    @RequestMapping(value = "/empAddAndUpdate",method = RequestMethod.GET)
    public String empAddAndUpdate(Integer id, Model m){
        //判断id是否存在
        if (id!=null){
            //存在的话 添加 员工信息到model
            Dcxx dcxx = dcxxService.findDcxxByPrimaryKey(id);
            m.addAttribute("d",dcxx);
        }
        //返回addAndUpdate页面
        return "dcxx/addAndUpdate";
    }
    @ResponseBody
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ResultMsg add(Dcxx dcxx){
        try{
            dcxxService.add(dcxx);
            return new ResultMsg(200,"新增车辆"+dcxx.getBxh()+"成功！");
        }catch(Exception ex){
            ex.printStackTrace();
            return new ResultMsg(500,ex.getMessage());
        }
    }

    @ResponseBody
    @RequestMapping(value="/remove",method=RequestMethod.POST)
    public ResultMsg remove(@RequestBody List<String> ids){
        try{
            int result = dcxxService.doRemove(ids);
            return new ResultMsg(null,"删除项目信息"+result+"条！");
        }catch(Exception ex){
            return new ResultMsg(null,ex.getMessage());
        }

    }
    /*修改*/
    @ResponseBody
    @RequestMapping(value="/update",method=RequestMethod.POST)
    public ResultMsg update(Dcxx dcxx){
        try{
            dcxxService.doUpdate(dcxx);
            return new ResultMsg(200,"修改车辆:"+dcxx.getBxh()+"成功");
        }catch(Exception e){
            e.printStackTrace();
            return new ResultMsg(500,e.getMessage());
        }

    }


}
