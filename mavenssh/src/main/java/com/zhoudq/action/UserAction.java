package com.zhoudq.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zhoudq.entity.User;
import com.zhoudq.service.UserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.Servlet;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;


@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport {
    @Resource
    private UserService userService;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String login() {
        if(userService.login(user)) {
            System.out.println("login successful");
            Map session = ActionContext.getContext().getSession();
            session.put("user", user);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }

    public String register(){
        String res="error";
        try{

            userService.register(user);
            System.out.println("register successful");
            res="success";
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            return res;
        }
    }
    public void validateName() throws IOException{
        System.out.println("validate fuc");
        String username=ServletActionContext.getRequest().getParameter("username");
        System.out.println("username:"+username);
        boolean exist=userService.getUserByName(username);
        HttpServletResponse response= ServletActionContext.getResponse();
        System.out.println("exist:"+exist);
        response.getWriter().print(exist);
    }



}