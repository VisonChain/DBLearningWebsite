package com.vs.service;

import com.vs.dao.AdminDao;
import com.vs.entity.Admin;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class AdminService {

    @Resource
    private AdminDao adminDao;

    public boolean login(String username, String password) {
        Admin user = adminDao.getAdmin(username, password);
        if (user == null) {
            return false;
        }else{
            return true;
        }
    }

}
