<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
    <%@ page import="javax.servlet.http.Cookie,java.sql.SQLException,connectionDB.sqliteConnection, java.io.PrintWriter, java.sql.Connection, java.sql.ResultSet, java.sql.Statement, java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
 <%@include file="MainS.css" %>
</style>
<title>Обратная связь</title>
</head>
<body>
<div class="first">
      <div class="menu">
        <ul class = "ul">
  <li><a href="Main.jsp">Главная</a></li>
      <li><a href="Catalog.jsp">Каталог</a></li>
      <li><a href="RegistrationPage.jsp">Регистрация</a></li>  
      <li><a href="LoginPage.jsp">Авторизация</a></li>
      <li><a href="RulesOfUsing.jsp">Правила пользования</a></li>
      <li><a href="Feedback.jsp">Обратная связь	</a></li>
      <li class="user"><% String name=(String)session.getAttribute("LoginDB");
       if(session.getAttribute("LoginDB")==null)
       {
    	   out.print("Вы вошли как: Неавторизованный пользователь");     	   
       }
       else{
       out.print("Вы вошли как: "+name); 
       }
       %>
													</li>
     <li>   <% 
        if(request.getParameter("buttonName") != null) 
        {
        	session.invalidate();
  	    	response.sendRedirect(request.getContextPath() + "/Catalog.jsp");
  	    }
   		%>
    <FORM NAME="logOut" METHOD="POST">
        <INPUT TYPE="HIDDEN" NAME="buttonName">
        <INPUT TYPE="BUTTON" VALUE="Выйти" ONCLICK="button1()">
    </FORM>
	       <SCRIPT >        
		        function button1()
		        {
		            document.logOut.buttonName.value = "yes";
		            logOut.submit();
		        }      
		    </SCRIPT>
		           									</li>
        </ul> 
    </div>    
     <div class="prereg">
	<form class="reg"action="Feedback" method="POST"><br><br>
		
		 <% 
		if(name!=null)
		{ %> Вы оставите вопрос под таким логином:
			<%out.print(name);%>   
			<br><br>
			Ваш вопрос  <br><input type="text"  id= "QuestionSite" name="QuestionSite"><br><br>
		 <p class="login-text">Что бы отправить вопрос, решите пример:<a id="number1">1</a>+<a id="number2">2</a> </p> 
		 <input id="ReturnSum" name="ReturnSum"  maxlength="30">
		  <input type="submit" value="Отправить" onclick=" return checkForm()">
			
		<%} 
		 
		else
		{
			out.print("Неавторизированные пользователи не могут оставлять вопросы");%><br><br><%
			out.print("Если нет аккаунта, то пройдите регистрацию  ");%><a href="RegistrationPage.jsp">Регистрация</a><br>			
		  <%out.print("Если есть аккаунт, то авторизируйтесь  ");%><a href="LoginPage.jsp">Авторизация</a><br>
		  <%	
		}
		%>
	</form>
	<% String message = (String)request.getAttribute("alertMsg");%>
</div>
</div>
</body>
 
<!-- Проверка из nodeJS -->
<script>
let number1=Math.round(Math.random()*50+1);
let number2=Math.round(Math.random()*50+1);
sum=number1+number2;
document.getElementById("number1").innerHTML =number1;
document.getElementById("number2").innerHTML =number2;
  function checkForm()
  {
    if (document.getElementById("ReturnSum").value != sum)
  {
    alert ('Капча решена неверно!');
    return false;
  }
    else if(document.getElementById("QuestionSite").value.trim() == '')
    {
        alert ('Напишите вопрос');
        return false;
        }
}
</script>
</html>