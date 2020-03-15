package com.qhzh.dao;

import com.qhzh.entity.User;

import java.util.List;

public interface UserMapper {
    List<User> list(String username);
    void add(User user);
    void update(User user);
    void delete(int id);
    User detailById(int id);

    int count(User user);
}
