package com.fdh.controller;

import com.fdh.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/4/20 0020.
 */
@Controller
public class UserController {
    @RequestMapping("register")
    public String register(User user){

    }
}
