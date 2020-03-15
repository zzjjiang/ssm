package com.qhzh.controller;

import com.qhzh.controller.vo.UserVO;
import com.qhzh.entity.User;
import com.qhzh.service.UserService;
import com.qhzh.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("login")
    @ResponseBody
    public Result login(UserVO userVO){
        User user = new User();
        user.setUsername(userVO.getUsername());
        user.setPassword(userVO.getPassword());
        int count = userService.count(user);
        if (count > 0){
            return new Result("ok","登录成功");
        }
        return new Result("fail","登录失败");
    }

    @RequestMapping("register")
    @ResponseBody
    public Result register(UserVO userVO){
        User user = new User();
        user.setUsername(userVO.getUsername());
        user.setPassword(userVO.getPassword());
        userService.add(user);
        return new Result("ok","注册成功");
    }

    @RequestMapping("main")
    public String main(){
        return "main";
    }

    @RequestMapping("list")
    @ResponseBody
    public List<User> list(String username){
        return userService.list(username);
    }

    @RequestMapping("del")
    public Result del(int id){
      userService.delete(id);
      return new Result("ok","删除成功");
    }
}
