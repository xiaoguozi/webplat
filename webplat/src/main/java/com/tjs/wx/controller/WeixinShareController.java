package com.tjs.wx.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeoutException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.tjs.admin.wx.model.WxTick;
import com.tjs.admin.wx.service.IWxTick;

@Controller
@RequestMapping(value ="/wx/share")
public class WeixinShareController {
	
	@Resource
	private IWxTick iWxTickService;
	private static String appId = "wx01ee38587db99c1a";
	private static String appSecret = "10e2ffa71705f160c3199bd4873526b0";

	@RequestMapping("/sign")
	@ResponseBody
    public Map<String, String> sign(HttpServletRequest request, Model model) throws IOException, TimeoutException, InterruptedException {		
		String url = request.getParameter("url");
		Map<String, String> map = sign(url);
		
        return map;
    }
	
	public final Map<String, String> sign(String url) throws IOException, TimeoutException, InterruptedException {
        Map<String, String> ret = new HashMap<String, String>();
        String jsapi_ticket = getWeiXinTicket();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";
 
        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        System.out.println(string1);
 
        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }
 
        //ret.put("url", url);
        ret.put("jsapi_ticket", jsapi_ticket);
        ret.put("nonceStr", nonce_str);
        ret.put("timestamp", timestamp);
        ret.put("signature", signature);
        ret.put("appId", appId);
 
        return ret;
    }
 
    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }
 
    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }
 
    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }
    
	public final String getWeiXinTicket() throws IOException, TimeoutException,
			InterruptedException {
		String access_token = "";
		String ticket = "";
		// 判断是否过期
		if(iWxTickService.isExpire()){
			URL url = new URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="
							+ appId + "&secret=" + appSecret);
			JSONObject json = getConnection(url);
			access_token = (String) json.getString("access_token");
			//获取ticket
			URL url1 = new URL(
					"https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=" + access_token + "&type=jsapi");
			JSONObject json1 = getConnection(url1);
			ticket = (String) json1.get("ticket");
			
			//TODO 更新数据库
			WxTick wxTick = iWxTickService.selectWxTick().get(0);
			wxTick.setTickName(ticket);
			wxTick.setTickDate(System.currentTimeMillis()/1000);
			iWxTickService.updateWxTick(wxTick);
		}else{
			//TODO 读取ticket
			WxTick wxTick = iWxTickService.selectWxTick().get(0);
			ticket = wxTick.getTickName();
		}

		return ticket;

	}

	private final JSONObject getConnection(URL url) throws IOException {

		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setDoOutput(true);
		connection.setDoInput(true);
		connection.setRequestMethod("GET");
		connection.setUseCaches(false);
		connection.setInstanceFollowRedirects(true);
		connection.setRequestProperty("Content-Type",
				"application/x-www-form-urlencoded");

		connection.connect();
		JSONObject jsonObject = JSONObject.parseObject(readString(connection
				.getInputStream()));
		connection.disconnect();
		return jsonObject;
	}

	private final String readString(InputStream is) throws IOException {
		BufferedReader in = new BufferedReader(new InputStreamReader(is));
		StringBuffer buffer = new StringBuffer();
		String line = "";
		while ((line = in.readLine()) != null) {
			buffer.append(line);
		}
		return buffer.toString();
	}
	
}
