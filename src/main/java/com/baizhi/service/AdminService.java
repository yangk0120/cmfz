package com.baizhi.service;

import com.baizhi.entity.Admin;

import javax.servlet.http.HttpSession;

public interface AdminService {
    public boolean login(Admin admin, HttpSession session);

    public void quit(HttpSession session);
}
