package com.vs.service;

import com.vs.dao.UserDao;
import com.vs.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service
public class UserService {
    @Resource
    private UserDao userDao;

    public boolean login(String username, String password) {
        User user = userDao.getUser(username, password);
        if (user == null) {
            return false;
        }else{
            return true;
        }
    }

    public boolean register(String username, String password,String nickname){
        if(userDao.isUserEmpty(username).isEmpty()){
            userDao.registerUser(username,password,nickname);
            return true;
        }else{
            return false;
        }
    }

    public User getUserById(int id){
        return userDao.getUserById(id);
    }


    public User getUser(String username, String password){
        return userDao.getUser(username,password);
    }

    public void updateUser(User user){
        userDao.updateUser(user);
    }
}
