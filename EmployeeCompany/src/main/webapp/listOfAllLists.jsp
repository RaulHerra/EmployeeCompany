<%@page import="com.jacaranda.model.*"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>The mother of Lists</title>
</head>
<body>
<%
	ArrayList<Company> resultCompany = new ArrayList(0);
			try {
		resultCompany = (ArrayList<Company>)DbRepository.findAll(Company.class);
			} catch (Exception e) {
		e.printStackTrace();
			}
	%>
	<div class="container">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Nombre</th>
		      <th scope="col">Nº Empleados</th>
		      <th scope="col">Nº Proyectos</th>
		    </tr>
		  </thead>
		  <tbody>
		  <%
		  for (Company c : resultCompany)  {
		  %>
		    <tr>
		      <td><%= c.getName()%></td>
		      <td><%= c.getEmployeeList().size() %></td>
		      <td><%= c.getCompanyProject().size() %></td>
		    </tr>
		    <tr>
		      <td>Empleados</td>
		    </tr>
		      <% for (Employee e : c.getEmployeeList()){ %>
		      <tr>
		        <td><%= e.getId() %></td>
		        <td><%= e.getFirstName() %></td>
		        <td><%= e.getLastName() %></td>
		      </tr>
		      <%} %>
		    <tr>
		      <td>Proyecto</td>
		    </tr>
	          <% for (CompanyProject p : c.getCompanyProject()){ %>
		      <tr>
		        <td><%= p.getProject().getId() %></td>
		        <td><%= p.getProject().getName() %></td>
		        <td><%= p.getProject().getBudget() %></td>
		      </tr>
		      <%} %>
		    <%} %>
		  </tbody>
		</table>
	</div>
</body>
</html>