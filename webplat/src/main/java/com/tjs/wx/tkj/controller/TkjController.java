package com.tjs.wx.tkj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value ="/wx/tkj")
public class TkjController {

	@RequestMapping("/index")
    public String index(Model model) {
		
		return "wx/tkj/tkjindex";
	}
	
	@RequestMapping("/apply")
    public String apply(Model model) {
		
		return "wx/tkj/tkjapply";
	}
	
	@RequestMapping("/borrow")
    public String borrow(Model model) {
		
		return "wx/tkj/tkjborrow";
	}
	
	
	@RequestMapping("/check")
    public String check(Model model) {
		
		return "wx/tkj/tkjcheck";
	}
	
	@RequestMapping("/fenqi")
    public String fenqi(Model model) {
		
		return "wx/tkj/tkjfenqi";
	}
	
	@RequestMapping("/success")
    public String success(Model model) {
		
		return "wx/tkj/tkjsuccess";
	}
	
}
