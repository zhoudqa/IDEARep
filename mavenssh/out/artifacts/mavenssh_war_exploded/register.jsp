<%--
  Created by IntelliJ IDEA.
  User: zhoudq
  Date: 17-9-15
  Time: 上午11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<% String message;
    if(request.getParameter("msg")==null)
        message="";
    else message=request.getParameter("msg").equals("fail")?"注册失败!":"";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>
</head>
<script type="text/javascript">
    function $(a){
        return document.getElementById(a);
    }
    function check(){
        $("info").innerHTML="";
        var name=$("name").value;
        var email=$("email").value;
        var passwd=$("passwd").value;
        var repasswd=$("repasswd").value;
        var reg1=/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/;
        var reg2=/^[A-Za-z][A-Za-z0-9_]{5,20}$/;
        if(!reg1.test(email)){
            $("emailErr").innerHTML="<font color='red'>格式不正确！</font>";
            $("info").innerHTML="邮箱格式：example@example.example(.example)";
            return false;
        }else $("emailErr").innerHTML="<font color='green'>格式正确</font>";
        if(!reg2.test(passwd)){
            $("info").innerHTML="密码格式：6-21位，以字母开头，且只能包含字母数字和下划线";
            $("passwdErr").innerHTML="<font color='red'>格式不正确！</font>"
            return false;
        }else $("passwdErr").innerHTML="<font color='green'>格式正确</font>";
        if(repasswd!=passwd){
            $("repasswdErr").innerHTML="<font color='red'>两次密码不一致！</font>";
            return false;
        }else $("repasswdErr").innerHTML="<font color='green'>正确</font>";
        return true;
    }
    function sub(){
        if(check())
            $("form").submit();

    }
    //创建XmlHttp对象
    function createXmlHttp(){
        var xmlHttp;
        try{
            xmlHttp= new XMLHttpRequest();
        }catch(e){
            try{
                xmlHttp=new ActiveXObject("Msxm12.XMLHTTP");
            }catch(e){
                try{
                    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){}
            }
        }

        return xmlHttp;
    }



    function checkUserName(){

        var username = document.getElementById("username").value;
        //传统的ajax校验
        //1.创建异步交互对象
        var xhr = createXmlHttp();
        //2设置监听
        xhr.onreadystatechange = function(){

            if(xhr.readyState == 4){
                alert("readyState=4")
                if(xhr.status == 200){
                    var text=xhr.responseText;
                    alert(text)
                    if(text=="true")
                        $("nameErr").innerHTML="<font color='red'>该用户已经被注册</font>";
                    else
                        $("nameErr").innerHTML="<font color='green'>用户名可用</font>";
                }else {
                    alert("请求失败");
                }
            }
        }

        //3打开连接
        xhr.open("GET","checkName.action?username="+username,true);
        //4发送
        xhr.send(null);
    }

</script>

<body>
<center>
    <h1 style="color: blueviolet">用户注册</h1>
    <h3 style="color: red"><%=message %></h3>
    <form id="form" action="register.action">
        昵称：<span id="nameErr" ></span><br />
        <input type="text" id="username" name="user.username" onblur="checkUserName()"><br/>
        邮箱：<span id="emailErr"></span><br/>
        <input type="text" id="email"name="user.email" onchange="check()"><br/>
        密码：<span id="passwdErr"></span><br/>
        <input type="password" id="passwd"name="user.password" onchange="check()"><br/>
        确认密码：<span id="repasswdErr"></span><br/>
        <input type="password" id="repasswd" name="repasswd" onchange="check()"><br/>
        <input type="button" value="注册" style="color:red" onclick="sub()">
        <input type="reset" value="重置"><br/>
        已有帐号？<a  href="index.jsp">直接登录</a>
    </form>
    <span id="info" style="color:blue"></span>
</center>
</body>
</html>
