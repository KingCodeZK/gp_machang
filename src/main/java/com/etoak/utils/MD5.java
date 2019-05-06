package com.etoak.utils;

import org.springframework.util.DigestUtils;

/**
 * Created by 18053 on 2019/4/20.
 */
public class MD5 {
    private static final String slat = "&%5123***&&%%$$#@";
    public static String getMD5(String str) {
        String base = str +"/"+slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }
}
