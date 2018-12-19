package com.baizhi.service;

import com.baizhi.entity.Admin;
import com.baizhi.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public boolean login(Admin admin, HttpSession session) {
        //判断管理员存在
        List<Admin> select = adminMapper.select(admin);
        if(select==null){
            return false;
        }else{
            session.setAttribute("admin",select);
            return  true;
        }
    }
}
