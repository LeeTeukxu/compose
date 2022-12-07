package com.zhide.assist.common;

import org.springframework.util.DigestUtils;

/**
 * MD5加密，加上公司标识，使每个公司生成的密码都是不一样的。
 */
public class MD5Util {
    String mySeed;

    public MD5Util(String seed) {
        mySeed = "$(1)$" + seed + "\\^(2)??^";
    }

    public static String EnCode(String Content) {
        return DigestUtils.md5DigestAsHex(Content.getBytes());
    }

    public static String encryptAndDencrypt(String value)
    {
        byte[] bt=value.getBytes(); //将需要加密的内容转换为字节数组
        for(int i=0;i<bt.length;i++)
        {
            bt[i]=(byte)(bt[i]^(int)8); //通过异或运算进行加密
        }
        String newresult=new String(bt,0,bt.length); //将加密后的字符串保存到 newresult 变量中
        return newresult;
    }
}
