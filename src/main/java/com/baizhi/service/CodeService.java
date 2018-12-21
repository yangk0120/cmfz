package com.baizhi.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CodeService {
    public void getCode(HttpSession session, HttpServletResponse response) throws Exception;

    public boolean checkCode(HttpSession session, String enCode);
}
