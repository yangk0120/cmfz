package com.baizhi.service;

import com.baizhi.util.CreateValidateCode;
import org.springframework.stereotype.Service;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Service
public class CodeServiceImpl implements CodeService {

    @Override
    public void getCode(HttpSession session, HttpServletResponse response) throws Exception {
        CreateValidateCode createValidateCode = new CreateValidateCode();
        //获取验证码
        String code = createValidateCode.getCode();
        session.setAttribute("code", code);
        ServletOutputStream outputStream = response.getOutputStream();
        createValidateCode.write(outputStream);
    }

    @Override
    public boolean checkCode(HttpSession session, String enCode) {
        String code = (String) session.getAttribute("code");
        if (code.equalsIgnoreCase(enCode)) {
            return true;
        } else {
            return false;
        }
    }
}
