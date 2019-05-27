<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Multiplication Table</title>
</head>
<body>
    Multiplication Table!
     
    <% System.out.println(); %>
     
    <%
        int number = 1;
    %>
    <form method = POST action=homePage.jsp>
    	Enter a number between 1 and 50 <input type="number" name="multiplier" size="2">
    <input type="submit" value="Multiply!">
    </form>
	<% 
    String input = request.getParameter("multiplier");
    if(input == null) input = "5";
    int multiplier = 0;
    try {
    	multiplier = Integer.parseInt(input);
    } catch (NumberFormatException e){ %>
		Not an integer.
 <% } %>
    <TABLE border=1 cellpadding=1 cellspacing=0>
	<% if (multiplier >= 1 && multiplier <= 50) {	
    	for(int row=1; row <= multiplier; row++) { %>
    		<TR>
		<%      for(int col=1; col<=multiplier; col++) { %>
    	    	<TD> <%=row*col%>
    	    	</TD>
   		   	<% } %>
    		</TR>
		<% } %>
	<% } else { %>
		Make sure your value is an integer between 1 and 50, inclusive.
	<% } %>	
</TABLE>
</body>
</html>