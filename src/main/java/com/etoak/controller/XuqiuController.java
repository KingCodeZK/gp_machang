package com.etoak.controller;

import com.etoak.bean.Files;
import com.etoak.bean.Xiaoxi;
import com.etoak.bean.Xuqiu;
import com.etoak.bean.Yonghu;
import com.etoak.service.FilesService;
import com.etoak.service.XuqiuService;
import com.etoak.service.YonghuService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by zk on 2018/11/10.
 */
@Controller
@RequestMapping(value = "/xuqiu")
public class XuqiuController {
    @Autowired
    public XuqiuService service;
    @Autowired
    public FilesService filesService;
    @Autowired
    public YonghuService yonghuService;
    /**
     *  MultipartFile
     *  	springmvc提供一个上传类型 接收上传信息
     */
    @ResponseBody
    @RequestMapping(value="/add",method = RequestMethod.POST)
    public ModelAndView add(@RequestParam(value="files") MultipartFile f, HttpSession session, Xuqiu xuqiu) {
        Map<String,Object> result = new HashMap<>();
        System.out.println("上传文件请求参数名称：" + f.getName());
        System.out.println("上传文件类型：" + f.getContentType());
        System.out.println("上传文件大小：" + f.getSize());
        System.out.println("上传文件名称：" + f.getOriginalFilename());
        //true为空  false不为空
        System.out.println("上传文件是否为空：" + f.isEmpty());
        //获取上传路径
        ServletContext sc = session.getServletContext();
        String path = sc.getRealPath("/files");
        //判断上传路径是否存在
        File file = new File(path);
        //不存在创建新的路径
        if(!file.exists()) {
            file.mkdirs();
        }

        //设置随机文件名称
        String uuid = UUID.randomUUID().toString();
        //获取上传文件后缀名称   1.txt txt
        String suffix = FilenameUtils.getExtension(f.getOriginalFilename());
        //组装文件名称
        String fileName = uuid + "." + suffix;

        //上传文件并保存到指定路径信息
        try {
            f.transferTo(new File(path,fileName));
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //生成需求主键
        String xuqiuuuid = UUID.randomUUID().toString().replaceAll("-","");
        xuqiu.setId(xuqiuuuid);
        //生成文件保存
        Files isFile = new Files();
        isFile.setFilename(fileName);
        isFile.setPath("/files/"+fileName);
        isFile.setXiangmuid(xuqiuuuid);
        isFile.setType(0);
        try{
            filesService.add(isFile);
            xuqiu.setAttachid(fileName);
            xuqiu.setStatus(0);
            xuqiu.setTime(new Date());
            //当前进度
            xuqiu.setTest1(10+"");

            service.add(xuqiu);
            result.put("flag","success");
            result.put("msg","新增需求"+xuqiu.getName()+"成功！");
        }catch(Exception ex){
            ex.printStackTrace();
            result.put("flag","error");
            result.put("msg", ex.getMessage());
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("success");
        return mv;
    }
    @ResponseBody
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page,Integer rows,String name,String type){
        Xuqiu xuqiu = new Xuqiu();
        if (name!="" && name !=null){
            xuqiu.setName(name);
        }
        if(type!="z"&&type!=null&&type!=""){
            xuqiu.setKaifatype(type);
        }
        return service.query(page,rows,xuqiu);
    }
    @ResponseBody
    @RequestMapping(value = "/query_xq",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query(Integer page,Integer rows,String name,String xuqiuid,String type){
        Xuqiu xuqiu = new Xuqiu();
        if (name!="" &&name !=null){
            xuqiu.setName(name);
        }
        if(type!="z"&&type!=null){
            xuqiu.setKaifatype(type);
        }
        if (xuqiuid!=""&&xuqiuid!=null){
            xuqiu.setXuqiuid(xuqiuid);
        }
        return service.query(page,rows,xuqiu);
    }
    @ResponseBody
    @RequestMapping(value = "/queryInfo",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> queryInfo(String id,HttpSession session){
        Map<String,Object> result = new HashMap<>();
        Xuqiu xuqiu = new Xuqiu();
        if (id!="" &&id !=null){
            xuqiu.setId(id);
            Xuqiu info = service.queryInfoById(xuqiu);
            session.setAttribute("xuqiu",info);
            result.put("status","success");
        }else {
            session.invalidate();
            result.put("xuqiu","fail");
        }
        return result;

    }
    @ResponseBody
    @RequestMapping(value = "/updateInfo",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> update(String id,HttpSession session){
        Map<String,Object> result = new HashMap<>();
        Xuqiu xuqiu = new Xuqiu();
        if (id!="" &&id !=null){
            xuqiu.setId(id);
            Xuqiu info = service.queryInfoById(xuqiu);
            session.setAttribute("xuqiu_up",info);
            result.put("status","success");
        }else {
            session.invalidate();
            result.put("xuqiu","fail");
        }
        return result;

    }
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public ModelAndView update(HttpSession session, Xuqiu xuqiu) {
        Map<String,Object> result = new HashMap<>();
        try{
            //xuqiu.setAttachid(fileName);
            //xuqiu.setStatus(0);
            xuqiu.setTime(new Date());
            //当前进度
            //xuqiu.setTest1(10+"");
            xuqiu.setKafazheid(0);
            service.update(xuqiu);
            result.put("flag","success");
            result.put("msg","编辑需求"+xuqiu.getName()+"成功！");
        }catch(Exception ex){
            ex.printStackTrace();
            result.put("flag","error");
            result.put("msg", ex.getMessage());
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("success_update");
        return mv;
    }

    @ResponseBody
    @RequestMapping(value = "/queryAllType",method = RequestMethod.POST)
    public Map<String,Object> queryAllType(){
        return service.queryAllType();
    }
    @ResponseBody
    @RequestMapping(value = "/canyu",method = RequestMethod.POST)
    public Map<String,Object> canyu(String xuqiuid,String userid){
        Map<String,Object> result = new HashMap<>();
        Xuqiu xuqiu = new Xuqiu();
        xuqiu.setId(xuqiuid);
        xuqiu.setStatus(1);
        xuqiu.setTest1(20+"");
        xuqiu.setTest2(userid);
        Yonghu yonghu = new Yonghu();
        yonghu.setId(userid);
        yonghu.setTest1(xuqiuid+",");
        try{
            service.updateCanyu(xuqiu);
            yonghuService.updateCanyu(yonghu);
        }catch (Exception ex){
            ex.getMessage();
            result.put("status","fail");
        }
        result.put("status","success");
        return result;
    }
    @ResponseBody
    @RequestMapping(value = "/query_kf",method = RequestMethod.POST)
    /*前端穿过来的参数 当前页面 和 每页记录数 变量名称固定为 page  rows!!!*/
    public Map<String,Object> query_kf(Integer page,Integer rows,String name,String xuqiuid){
        Xuqiu xuqiu = new Xuqiu();
        if (name!="" &&name !=null){
            xuqiu.setName(name);
        }
        if (xuqiuid!=""&&xuqiuid!=null){
            xuqiu.setTest2(xuqiuid);
        }
        return service.query(page,rows,xuqiu);
    }

    @ResponseBody
    @RequestMapping(value = "/queryXiaoxi",method = RequestMethod.POST)
    /*查询消息~~~~~*/
    public Map<String,Object> queryXiaoxi(String xuqiuid){
        Xiaoxi xiaoxi = new Xiaoxi();
        xiaoxi.setXuqiuid(xuqiuid);
        return service.queryXiaoxi(xiaoxi);
    }

    @ResponseBody
    @RequestMapping(value="/addXiaoxi",method = RequestMethod.POST)
    public ModelAndView addXiaoxi(String title_xiaoxi,String content_xiaoxi,String jindu,String xuqiuid) {
        Map<String,Object> result = new HashMap<>();
        Xiaoxi xiaoxi = new Xiaoxi();
        xiaoxi.setXuqiuid(xuqiuid);
        xiaoxi.setTitle(title_xiaoxi);
        xiaoxi.setContent(content_xiaoxi);
        xiaoxi.setTime(new Date());

        Xuqiu xuqiu = new Xuqiu();
        xuqiu.setId(xuqiuid);
        xuqiu.setTest1(jindu);
        service.addXiaoxi(xiaoxi);
        service.updateXuqiu(xuqiu);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("successXx");
        return mv;
    }



}
