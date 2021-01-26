package io.renren.modules.app.utils;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.security.*;
import java.security.spec.InvalidParameterSpecException;
import java.util.*;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.codec.binary.Base64;
import org.apache.logging.log4j.util.Base64Util;
import org.bouncycastle.jce.provider.BouncyCastleProvider;


/**
 * description: 微信小程序 --- 获取用户信息解密
 * @version v1.0
 * @author w
 * @date 2020年9月24日下午4:00:15
 * @see
 **/

public class WechatUtils {

    public static final String AES = "AES";
    public static final String AES_CBC_PADDING = "AES/CBC/PKCS7Padding";
    public static final String AppID = "wx2aef946fc12526df";
    public static final String AppSecret = "2129d5aab9ce310a79dfe0f70b94ae9c";
    public static final String URL = "https://api.weixin.qq.com/sns/jscode2session";
    //AppID wx2aef946fc12526df
    //AppSecret 2129d5aab9ce310a79dfe0f70b94ae9c
//https://api.weixin.qq.com/sns/jscode2session?appid=wxcaec597ec4adeb16&secret=8abb205507e5aec64b2f94f8e10347a0&js_code=051DCm000cbX3L1Pzu200h69f03DCm0b&grant_type=authorization_code
    /**
     * 开放数据校验与解密 <br/>
     * 对称解密使用的算法为 AES-128-CBC，数据采用PKCS#7填充<br/>
     * 对称解密的目标密文:encrypted=Base64_Decode(encryptData)<br/>
     * 对称解密秘钥:key = Base64_Decode(session_key),aeskey是16字节<br/>
     * 对称解密算法初始向量:iv = Base64_Decode(iv),同样是16字节<br/>
     *
     * @param encrypted   目标密文
     * @param session_key 会话ID
     * @param iv          加密算法的初始向量
     */
    public static String wxDecrypt(String encrypted, String session_key, String iv) {
        String result = null;
        byte[] encrypted64 = Base64.decodeBase64(encrypted);
        byte[] key64 = Base64.decodeBase64(session_key);
        byte[] iv64 = Base64.decodeBase64(iv);
        try {
            init();
            result = new String(decrypt(encrypted64, key64, generateIV(iv64)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    /**
     * description: 初始化密钥
     *
     * @return void
     * @throws Exception
     * @version v1.0
     * @author w
     * @date 2020年9月9日 下午5:07:04
     */
    public static void init() throws Exception {
        Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
        KeyGenerator.getInstance(AES).init(128);
    }

    /**
     * description: 生成iv
     *
     * @param iv
     * @return AlgorithmParameters
     * @throws Exception
     * @version v1.0
     * @author w
     * @date 2020年9月10日 下午3:50:35
     */
    public static AlgorithmParameters generateIV(byte[] iv) throws Exception {
        // iv 为一个 16 字节的数组，这里采用和 iOS 端一样的构造方法，数据全为0
        // Arrays.fill(iv, (byte) 0x00);
        AlgorithmParameters params = AlgorithmParameters.getInstance(AES);
        params.init(new IvParameterSpec(iv));
        return params;
    }

    /**
     * description: 执行解密操作
     *
     * @param encryptedData 加密后的字符串
     * @param keyBytes      密钥key
     * @param iv            便宜向量iv
     * @return byte[]
     * @throws Exception
     * @version v1.0
     * @author w
     * @date 2020年9月10日 下午3:51:10
     */
    public static byte[] decrypt(byte[] encryptedData, byte[] keyBytes, AlgorithmParameters iv) throws Exception {
        Key key = new SecretKeySpec(keyBytes, AES);
        Cipher cipher = Cipher.getInstance(AES_CBC_PADDING);
        // 设置为解密模式
        cipher.init(Cipher.DECRYPT_MODE, key, iv);
        return cipher.doFinal(encryptedData);
    }
    /**
     * 获取微信小程序 session_key 和 openid
     *
     * @param code 调用微信登陆返回的Code
     * @return
     */
    public static JSONObject getSessionKeyOropenid(String code) {
        Map<String, String> requestUrlParam = new HashMap<String, String>();
        requestUrlParam.put("appid", AppID);  //开发者设置中的appId
        requestUrlParam.put("secret", AppSecret); //开发者设置中的appSecret
        requestUrlParam.put("js_code", code); //小程序调用wx.login返回的code
        requestUrlParam.put("grant_type", "authorization_code");    //默认参数 authorization_code

        //发送post请求读取调用微信 https://api.weixin.qq.com/sns/jscode2session 接口获取openid用户唯一标识
        JSONObject jsonObject = JSON.parseObject(sendPost(URL, requestUrlParam));
        return jsonObject;
    }
    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url 发送请求的 URL
     * @return 所代表远程资源的响应结果
     */
    public static String sendPost(String url, Map<String, ?> paramMap) {
        PrintWriter out = null;
        BufferedReader in = null;
        String result = "";

        String param = "";
        Iterator<String> it = paramMap.keySet().iterator();

        while (it.hasNext()) {
            String key = it.next();
            param += key + "=" + paramMap.get(key) + "&";
        }

        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("Accept-Charset", "utf-8");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(param);
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
//            log.error(e.getMessage(), e);
        }
        //使用finally块来关闭输出流、输入流
        finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }

    /**
     * 解密用户敏感数据获取用户信息
     * @param code
     * @param encrypted
     * @param iv
     * @return
     */
    public static JSONObject getUserInfo(String code,String encrypted, String iv) {
        JSONObject js = getSessionKeyOropenid(code);
        System.out.println(js);
        String result = wxDecrypt(encrypted, js.getString("session_key"), iv);
        System.out.println(result);
        return JSON.parseObject(result);
    }

    public static void main(String[] args) {
        //AppID wxcaec597ec4adeb16
        //AppSecret 8abb205507e5aec64b2f94f8e10347a0

        String appid = "wx4f4bc4dec97d474b";
        String sessionKey = "tiihtNczf5v6AKRyjwEUhQ==";
        String encryptedData = "CiyLU1Aw2KjvrjMdj8YKliAjtP4gsMZM"+
                "QmRzooG2xrDcvSnxIMXFufNstNGTyaGS"+
                "9uT5geRa0W4oTOb1WT7fJlAC+oNPdbB+"+
                "3hVbJSRgv+4lGOETKUQz6OYStslQ142d"+
                "NCuabNPGBzlooOmB231qMM85d2/fV6Ch"+
                "evvXvQP8Hkue1poOFtnEtpyxVLW1zAo6"+
                "/1Xx1COxFvrc2d7UL/lmHInNlxuacJXw"+
                "u0fjpXfz/YqYzBIBzD6WUfTIF9GRHpOn"+
                "/Hz7saL8xz+W//FRAUid1OksQaQx4CMs"+
                "8LOddcQhULW4ucetDf96JcR3g0gfRK4P"+
                "C7E/r7Z6xNrXd2UIeorGj5Ef7b1pJAYB"+
                "6Y5anaHqZ9J6nKEBvB4DnNLIVWSgARns"+
                "/8wR2SiRS7MNACwTyrGvt9ts8p12PKFd"+
                "lqYTopNHR1Vf7XjfhQlVsAJdNiKdYmYV"+
                "oKlaRv85IfVunYzO0IKXsyl7JCUjCpoG"+
                "20f0a04COwfneQAGGwd5oa+T8yO5hzuy"+
                "Db/XcxxmK01EpqOyuxINew==" ;

        String iv = "r7BXXKkLb8qrSNn05n0qiA==";

        JSONObject userInfo = getUserInfo(encryptedData, sessionKey, iv);
        System.out.println(userInfo);
    }

}
