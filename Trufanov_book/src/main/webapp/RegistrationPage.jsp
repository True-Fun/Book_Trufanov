<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
   <%@include file='MainS.css' %>
</style>

<title>Регистрация</title>
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
  	    	response.sendRedirect("Catalog.jsp");
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
    <br>
    <br>
    <div class="prereg">
<form class="reg" action="RegistrationServlet" method="POST">
	Введите ваш логин <br> <input type="text" id="Login" name="Login"><br>
	Введите ваш пароль <br> <input type="password" id="Password" name="Password"><br>
	Введите вашу фамилию <br><input type="text" id="UserSurname" name="UserSurname"><br>	
	Введите вашe имя  <br><input type="text" id="UserName" name="UserName"><br>
	Введите ваш пол/гендер <br> <input type="text" id="UserSex" name="UserSex"><br>
	Введите ваш телефон <br> <input type="number" id="UserPhone" name="UserPhone"><br>
	Введите ваш email <br> <input type="email" id="UserEmail" name="UserEmail"><br>
	Введите вашу страну  <br><input type="text" id="UserCountry" name="UserCountry"><br>
	Введите ваш город <br> <input type="text" id="UserCity" name="UserCity"><br>
	Введите ваш возраст <br> <input type="number" id="UserAge" name="UserAge"><br><br>
		 <p class="login-text">Чтобы пройти регистрацию, решите пример:<a id="number1">1</a>+<a id="number2">2</a> </p> 
		 <input id="ReturnSum" name="ReturnSum"  maxlength="30">
	<button class="submit" type="submit"  onclick=" return checkReg()"> Завершить регистрацию</button>	
</form>
</div>
</div>
</body>

<script>
let number1=Math.round(Math.random()*50+1);
let number2=Math.round(Math.random()*50+1);
sum=number1+number2;
document.getElementById("number1").innerHTML =number1;
document.getElementById("number2").innerHTML =number2;
  function checkReg()
  {
	  		    if (document.getElementById("ReturnSum").value != sum)
		  {
		    alert ('Капча решена неверно!');
		    return false;
		  }
	  		    
	else if (document.getElementById("Login").value.trim() == '')
  {
    alert ('Заполните поле Login');
    return false;
  }
    else if (document.getElementById("Password").value.trim() == '')
    {
    alert ('Заполните поле пароль');
    return false;
    }
    else if (document.getElementById("UserSurname").value.trim() == '')
    {
    alert ('Заполните поле фамилия');
    }
    else if (document.getElementById("UserName").value.trim() == '')
    {
    alert ('Заполните поле имя');
    return false;
    }
    else if (document.getElementById("UserSex").value.trim() == '')
    {
    alert ('Заполните поле пол');
    return false;
    }
    else if (document.getElementById("UserPhone").value.trim() == '')
    {
    alert ('Заполните поле номер телефона');
    return false;
    }
    else if (document.getElementById("UserEmail").value.trim() == '')
    {
    alert ('Заполните поле Email');
    return false;
    }
    else if (document.getElementById("UserCountry").value.trim() == '')
    {
    alert ('Заполните поле страна');
    return false;
    }
    else if (document.getElementById("UserCity").value.trim() == '')
    {
    alert ('Заполните поле город');
    return false;
    }
    else if (document.getElementById("UserAge").value.trim() == '')
    {
    alert ('Заполните поле возраст');
    return false;
    }
    
}
</script>

</html>