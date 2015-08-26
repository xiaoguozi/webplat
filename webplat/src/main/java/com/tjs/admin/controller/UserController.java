package com.tjs.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjs.admin.model.User;
import com.tjs.admin.security.PermissionSign;
import com.tjs.admin.security.RoleSign;
import com.tjs.admin.service.UserService;

/**
 * 用户控制器
 * 
 * @author StarZou
 * @since 2014年5月28日 下午3:54:00
 **/
@Controller
@RequestMapping(value = "/admin/user")
public class UserController {

    @Resource
    private UserService userService;

    /**
     * 用户登录
     * 
     * @param user
     * @param result
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@Valid User user, BindingResult result, Model model, HttpServletRequest request) {
        try {
            Subject subject = SecurityUtils.getSubject();
            // 已登陆则 跳到首页
            if (subject.isAuthenticated()) {
                return "redirect:/";
            }
            if (result.hasErrors()) {
                model.addAttribute("error", "参数错误！");
                return "admin/user/login";
            }
            // 身份验证
            subject.login(new UsernamePasswordToken(user.getUsername(), user.getPassword()));
            // 验证成功在Session中保存用户信息
            final User authUserInfo = userService.selectByUsername(user.getUsername());
            request.getSession().setAttribute("userInfo", authUserInfo);
        } catch (AuthenticationException e) {
            // 身份验证失败
            model.addAttribute("error", "用户名或密码错误 ！");
            return "admin/user/login";
        }
        return "redirect:/";
    }

    /**
     * 用户登出
     * 
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("userInfo");
        // 登出操作
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "admin/user/login";
    }
    
    @RequestMapping("/index")
    public String index() {
        return "admin/user/index";
    }
    
    @RequestMapping("/statistics")
    public String statistics() {
        return "admin/user/statistics/index";
    }
    
    
    @RequestMapping("/listDataCount")
    @ResponseBody
    public Map<String, Integer> listDataCount(UserCtrlModel userCtrlModel, Model model) {
    	Map<String, Integer> result = new HashMap<String, Integer>();
    	
    	Integer total = userService.selectListCount(userCtrlModel);
    	
    	result.put("total", total);
    	
        return result;
    }

    
    @RequestMapping("/listData")
    public String listData(UserCtrlModel userCtrlModel, Model model) {
    	List<User> showData = new ArrayList<User>();
    	showData = userService.selectUserList(userCtrlModel);
    	
    	model.addAttribute("showData", showData);
		model.addAttribute("ctrlData", userCtrlModel);
    	
        return "admin/user/listData";
    }
    
    @RequestMapping("/insert")
    public String insert(User user, UserCtrlModel userCtrlModel, Model model) {
    	user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", userCtrlModel);
        return "admin/user/insert";
    }
  

    @RequestMapping("/insertData")
    @ResponseBody
    public Map<String, Object> insertData(User user, UserCtrlModel userCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	int id = userService.insert(user);
    	result.put("code", "0");
    	result.put("bizData", user);   	
        return result;
    }


    @RequestMapping("/update")
    public String update(User user, UserCtrlModel userCtrlModel, Model model) {
    	//user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", userCtrlModel);
        return "admin/user/update";
    }
  

    @RequestMapping("/updateData")
    @ResponseBody
    public Map<String, Object> updateData(User user, UserCtrlModel userCtrlModel, Model model) {
    	Map<String, Object> result = new HashMap<String, Object>();
    	//int id = userService.insert(user);
    	result.put("code", "0");
    	result.put("bizData", user);
    	
        return result;
    }


    @RequestMapping("/view")
    public String view(User user, UserCtrlModel userCtrlModel, Model model) {
    	//user.setUsername("myname");
    	model.addAttribute(user);
    	model.addAttribute("ctrlData", userCtrlModel);
        return "admin/user/view";
    }
  

    /**
     * 基于角色 标识的权限控制案例
     */
    @RequestMapping(value = "/admin")
    @ResponseBody
    @RequiresRoles(value = RoleSign.ADMIN)
    public String admin() {
        return "拥有admin角色,能访问";
    }

    /**
     * 基于权限标识的权限控制案例
     */
    @RequestMapping(value = "/create")
    @ResponseBody
    @RequiresPermissions(value = PermissionSign.USER_CREATE)
    public String create() {
        return "拥有user:create权限,能访问";
    }
}
