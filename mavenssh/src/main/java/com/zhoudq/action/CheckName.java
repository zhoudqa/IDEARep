package com.zhoudq.action;

import com.zhoudq.service.UserService;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;

@Controller("checkAction")
@Scope("prototype")
public class CheckName extends HttpServlet{
    @Resource
    private UserService userService;

    public String checkName(){
                
        return "";
    }
}
