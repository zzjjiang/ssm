package com.qhzh.service;



import com.qhzh.entity.User;

import java.util.List;

public interface UserService {
    void add(User user);
    void update(User user);
    void delete(int id);
    User detail(int id);
    List<User> list(String username);

    int count(User user);
}
