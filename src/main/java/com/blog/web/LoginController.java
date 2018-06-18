package com.blog.web;

import com.blog.entity.Admin;
import com.blog.entity.AdminLoginLog;
import com.blog.service.AdminLoginLogService;
import com.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminLoginLogService adminLoginLogService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public @ResponseBody Object login(HttpServletRequest request, HttpServletResponse response){
//        得到请求的id和密码
        int id = Integer.parseInt(request.getParameter("id"));
        String password = request.getParameter("password");
//        通过id查找用户
        Admin admin = adminService.getAdminById(id);
//        定义一个map封装相关信息
        Map<String,String> result = new HashMap<>();
//        当没有该用户时,设置状态码为0
        if (admin==null) {
            result.put("stateCode","0");
//            当用户密码与请求密码不一致时，将状态码设置为1
        }else if (!admin.getPassword().equals(password)) {
            result.put("stateCode","1");
        }else {
//            当id和密码正确,得到登录地址ip
            String ip = request.getRemoteAddr();
//            创建用户登录日志对象
            AdminLoginLog adminLoginLog = new AdminLoginLog();
//            对日志对象属性赋值
            adminLoginLog.setAdminId(id);
            adminLoginLog.setIp(ip);
            adminLoginLog.setDate(new Date());
//            将记录插入到数据库用户登录日志表中
            int log = adminLoginLogService.insertLoginLog(adminLoginLog);
            Cookie cookie = new Cookie("uerId",""+id);
//            设置cookie过期时间为1天
            cookie.setMaxAge(60*60*24);
//            保存cookie到客户端
            response.addCookie(cookie);
            request.getSession().setAttribute("admin",admin);
//            登录成功，设置状态码为2
            result.put("stateCode","2");
        }
        return result;
    }
}
