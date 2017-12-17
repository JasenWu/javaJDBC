<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>用户列表</title>
</head>
<body>
<!--
JDBC 驱动名及数据库 URL 
数据库的用户名与密码，需要根据自己的设置
useUnicode=true&characterEncoding=utf-8 防止中文乱码
 -->
 
 <form method="GET">
 <table>
 	<tbody>
 	<tr>
 		<td>姓名</td>
 		<td><input name="name" type="text" /></td>
 	</tr>
 	<tr>
 		<td>姓别</td>
 		<td>
 			男<input name="sex" type="radio" value="1" />
 			女<input name="sex" type="radio" value="2"  />
 		</td>
 	</tr>
 	<tr>
 		<td>年龄</td>
 		<td><input name="age" type="text" /></td>
 	</tr>
 	<tr>
 		<td> </td>
 		<td><input   type="submit" /></td>
 	</tr>
 		
 	</tbody>
 </table>
 </form>
 
 <%
  	 String name = request.getParameter("name");
 	 String sex = request.getParameter("sex");
 	 
 	if(sex == "1"){
 		sex ="男";
 	}else{
 		sex ="女";
 	}
	String age = request.getParameter("age");
	out.println(age+sex+name);
 	 
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/renjie?useUnicode=true&characterEncoding=utf-8"
     user="root"  password=""/>
     
 <sql:update dataSource="${page}" var="page">
 	INSERT INTO users VALUES (null,page.name,page.sex,page.age);
</sql:update>
<h1>插入成功</h1>

 
 
</body>
</html>