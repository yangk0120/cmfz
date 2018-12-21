package com.baizhi.service;

import com.baizhi.entity.Admin;
import com.baizhi.mapper.AdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public boolean login(Admin admin, HttpSession session) {
        List<Admin> list = adminMapper.select(admin);
        if (list.size() == 0) {
            return false;
        }else{
            session.setAttribute("admin", list.get(0));
            return true;
        }
    }

    @Override
    public void quit(HttpSession session) {
        session.invalidate();
    }
}
