package com.qhzh.service.impl;


import com.qhzh.dao.UserMapper;
import com.qhzh.entity.User;
import com.qhzh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public void add(User user) {
        userMapper.add(user);
    }

    @Override
    public void update(User user) {
        userMapper.update(user);
    }

    @Override
    public void delete(int id) {
         userMapper.delete(id);
    }

    @Override
    public User detail(int id) {
        return userMapper.detailById(id);
    }

    @Override
    public List<User> list(String username) {
        return userMapper.list(username);
    }

    @Override
    public int count(User user) {
        return userMapper.count(user);
    }

}
