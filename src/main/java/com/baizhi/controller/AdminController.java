package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {
    //注入service
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public  String login(Admin admin, HttpSession session){
        boolean login = adminService.login(admin, session);
        if(login){
            return "正确";
        }else{
            return "账户或者密码错误";
        }
    }
}
