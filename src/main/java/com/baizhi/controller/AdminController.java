package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    //注入service
    @Autowired
    private AdminService adminService;

    @RequestMapping("/login")
    public String login(Admin admin, HttpSession session) {
        System.out.println(admin);
        boolean login = adminService.login(admin, session);
        if (login) {
            return "redirect:/main/main.jsp";
        } else {
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("/quit")
    public String quit(HttpSession session) {
        adminService.quit(session);
        return "redirect:/login.jsp";
    }
}
