package com.etoak;

import com.etoak.service.YonghuService;
import com.etoak.service.impl.YonghuServiceImpl;

/**
 * Created by 18053 on 2019/4/20.
 */
public class Test {
    public static void main(String[] args) {
        YonghuService yonghuService =new YonghuServiceImpl();
        try{
            System.out.print(yonghuService.checkByName("oo"));
        }catch (Exception e){
            e.getMessage();
        }
    }
}
