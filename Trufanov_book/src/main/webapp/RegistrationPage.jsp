<%@ page language="java" contentType="text/html; charset=Cp1251"
    pageEncoding="Cp1251" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="Cp1251">
<style>
   <%@include file='MainS.css' %>
</style>

<title>�����������</title>
</head>
<body>
<div class="first">
      <div class="menu">
         <ul class = "ul">
     <li><a href="Main.jsp">�������</a></li>
      <li><a href="Catalog.jsp">�������</a></li>
      <li><a href="RegistrationPage.jsp">�����������</a></li>  
      <li><a href="LoginPage.jsp">�����������</a></li>
      <li><a href="RulesOfUsing.jsp">������� �����������</a></li>
      <li><a href="Feedback.jsp">�������� �����	</a></li>
      <li class="user"><% String name=(String)session.getAttribute("LoginDB");
       if(session.getAttribute("LoginDB")==null)
       {
    	   out.print("�� ����� ���: ���������������� ������������");     	   
       }
       else{
       out.print("�� ����� ���: "+name); 
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
        <INPUT TYPE="BUTTON" VALUE="�����" ONCLICK="button1()">
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
	������� ��� ����� <br> <input type="text" id="Login" name="Login"><br>
	������� ��� ������ <br> <input type="password" id="Password" name="Password"><br>
	������� ���� ������� <br><input type="text" id="UserSurname" name="UserSurname"><br>	
	������� ���e ���  <br><input type="text" id="UserName" name="UserName"><br>
	������� ��� ���/������ <br> <input type="text" id="UserSex" name="UserSex"><br>
	������� ��� ������� <br> <input type="number" id="UserPhone" name="UserPhone"><br>
	������� ��� email <br> <input type="email" id="UserEmail" name="UserEmail"><br>
	������� ���� ������  <br><input type="text" id="UserCountry" name="UserCountry"><br>
	������� ��� ����� <br> <input type="text" id="UserCity" name="UserCity"><br>
	������� ��� ������� <br> <input type="number" id="UserAge" name="UserAge"><br><br>
		 <p class="login-text">����� ������ �����������, ������ ������:<a id="number1">1</a>+<a id="number2">2</a> </p> 
		 <input id="ReturnSum" name="ReturnSum"  maxlength="30">
	<button class="submit" type="submit"  onclick=" return checkReg()"> ��������� �����������</button>	
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
		    alert ('����� ������ �������!');
		    return false;
		  }
	  		    
	else if (document.getElementById("Login").value.trim() == '')
  {
    alert ('��������� ���� Login');
    return false;
  }
    else if (document.getElementById("Password").value.trim() == '')
    {
    alert ('��������� ���� ������');
    return false;
    }
    else if (document.getElementById("UserSurname").value.trim() == '')
    {
    alert ('��������� ���� �������');
    }
    else if (document.getElementById("UserName").value.trim() == '')
    {
    alert ('��������� ���� ���');
    return false;
    }
    else if (document.getElementById("UserSex").value.trim() == '')
    {
    alert ('��������� ���� ���');
    return false;
    }
    else if (document.getElementById("UserPhone").value.trim() == '')
    {
    alert ('��������� ���� ����� ��������');
    return false;
    }
    else if (document.getElementById("UserEmail").value.trim() == '')
    {
    alert ('��������� ���� Email');
    return false;
    }
    else if (document.getElementById("UserCountry").value.trim() == '')
    {
    alert ('��������� ���� ������');
    return false;
    }
    else if (document.getElementById("UserCity").value.trim() == '')
    {
    alert ('��������� ���� �����');
    return false;
    }
    else if (document.getElementById("UserAge").value.trim() == '')
    {
    alert ('��������� ���� �������');
    return false;
    }
    
}
</script>

</html>