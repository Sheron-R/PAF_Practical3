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

//Delete item----------------------------------
if (request.getParameter("itemID") != null) 
{ 
Item itemObj = new Item(); 
String stsMsg = itemObj.deleteItem(request.getParameter("itemID")); 
session.setAttribute("statusMsg", stsMsg); 
} 


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>

<title>Items Management</title>
</head>
<body>

<div class="container">
 	<div class="row">
 	<div class="col">
		<h1>Items Management</h1>
		<form method="post" action="items.jsp">
		 Item Code: <input name="itemCode" type="text" class="form-control">
		 <br>
		 Item name:<input name="itemName" type="text" class="form-control">
		 <br> 
		 Item price:<input name="itemPrice" type="text" class="form-control">
		 <br>
		 Item description:<input name="itemDesc" type="text" class="form-control">
		 <br> 
  		 <input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
  <br><br><br><br>     	 
</form>
<div class="alert alert-success">
 <% out.print(session.getAttribute("statusMsg"));%>
</div>
<br> 
<%
 Item itemObj = new Item();
 out.print(itemObj.readItems());
%></div></div></div>
</body>
</html>

