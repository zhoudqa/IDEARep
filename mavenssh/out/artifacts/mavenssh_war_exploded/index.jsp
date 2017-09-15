<%--
  Created by IntelliJ IDEA.
  User: zhoudq
  Date: 17-9-14
  Time: 下午10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<center>
    <h1 style="color: darkslateblue">用户登录</h1>
<form action="login.action" method="post">
    用户名：<br/><input type="text" name="user.username" placeholder="输入用户名" />
    <br/>
    密码：<br/><input type="password" name="user.password" placeholder="输入密码" />
    <br />
    <input type="submit" value="登录">
    <input type="reset" value="重置"><br/>
    没有帐号？<a href="register.jsp">现在注册</a><br />

</form>
</center>
</body>
</html>
