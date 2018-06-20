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
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private AdminLoginLogService adminLoginLogService;

//    用户登录处理器
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
//            将用户信息存入session
            request.getSession().setAttribute("admin",admin);
//            登录成功，设置状态码为2
            result.put("stateCode","2");
        }
        return result;
    }

//    主界面处理器
    @RequestMapping("/main")
    public ModelAndView loginMain(HttpServletRequest request) throws UnknownHostException {
        ModelAndView modelAndView = new ModelAndView("blog/main");
//        从session中得到用户
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        String adminName = admin.getUsername();
//        得到客户端ip
        String clientIp = request.getRemoteAddr();
//        得到主机ip ipv4格式 request.getLocalAddr()方式获得的ip是ipv6格式
        String hostIp = Inet4Address.getLocalHost().getHostAddress();
//        得到主机端口号
        int port = request.getLocalPort();

//        指定日期的格式化
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
        String dates = dateFormat.format(date);

//        InetAddress address = InetAddress.getLocalHost();
//        System.out.println("IP: " + address.getHostAddress());

        AdminLoginLog adminLoginLog = null;
        try{
//                  当该用户登陆记录不为空时
            if (adminLoginLogService.getAllLogin(admin.getId()) != null && adminLoginLogService.getAllLogin(admin.getId()).size() == 2){
//                  得到所有登录记录
                List<AdminLoginLog> adminLoginLogs = adminLoginLogService.getAllLogin(admin.getId());
//                  得到最后一次登录记录
                   adminLoginLog = adminLoginLogs.get(0);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
//            得到登录次数
            int i = adminLoginLogService.getCountByAdminId(admin.getId());
//            将数据放入视图模型中
            modelAndView.addObject("adminName",adminName);
            modelAndView.addObject("clientIp",clientIp);
            modelAndView.addObject("hostIp",hostIp);
            modelAndView.addObject("loginNumber",i);
            modelAndView.addObject("port",port);
            modelAndView.addObject("date",dates);
            if (adminLoginLog != null){
                modelAndView.addObject("adminLoginLog",adminLoginLog);
            }
            return modelAndView;
        }
    }
}
