<%@ page import="com.Item"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%
//Insert item---------------------------------- 
if (request.getParameter("itemCode") != null) 
{ 
Item itemObj = new Item(); 
String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
request.getParameter("itemName"), 
request.getParameter("itemPrice"), 
request.getParameter("itemDesc")); 
session.setAttribute("statusMsg", stsMsg); 
} 


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
<form method="post" action="items.jsp">
 Item code: <input name="itemCode" type="text"><br> <br>
 Item name: <input name="itemName" type="text"><br> <br>
 Item price:<input name="itemPrice" type="text"><br><br>
 Item description: <input name="itemDesc" type="text"><br> <br>
 <input name="btnSubmit" type="submit" value="Save"> <br> <br>
</form>

<br> 
<%
 out.print(session.getAttribute("statusMsg")); 
%>
<br>
<%
 Item itemObj = new Item(); 
 out.print(itemObj.readItems()); 
%>



</body>
</html>


