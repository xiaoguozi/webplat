package com.tjs.wx.controller;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.wx.utils.WXUtils;

@Controller
@RequestMapping(value ="/wx/share")
public class WeixinShareController {

	@RequestMapping("/sign")
	@ResponseBody
    public Map<String, String> sign(HttpServletRequest request, Model model) throws IOException, TimeoutException, InterruptedException {		
		String url = request.getRequestURL().toString();
		Map<String, String> map = WXUtils.sign(url);
		
        return map;
    }
	
}
