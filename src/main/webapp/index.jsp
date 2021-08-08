<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Lista de contactos</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>

<div class="container">
	<div class="row text-center">
		<h1>Aplicación Java/MySQL</h1>
	</div>
</div>	
<div class="container">
	<div class="row">
			<nav aria-label="breadcrumb">
			  	<ol class="breadcrumb">
			    	<li class="breadcrumb-item"><a href="#">Inicio</a></li>
			    	<li class="breadcrumb-item active" aria-current="page">Contactos</li>
			  	</ol>
			</nav>
			<h2>Lista de contactos:</h2>
			<%
				Class.forName("com.mysql.cj.jdbc.Driver");
				
				try{
					Connection miConexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/contactos?serverTimezone=UTC&useSSL=false", "root", "");
					
					Statement miStatement = miConexion.createStatement();
					
					String instruccionSql = "SELECT * FROM contactos;";
					
					ResultSet miResultado = miStatement.executeQuery(instruccionSql);
					
					
					while(miResultado.next()){
						
						String id = miResultado.getString("id");
						String nombre = miResultado.getString("nombre");
						String apellido = miResultado.getString("apellido");
						String email = miResultado.getString("email");
						String telefono = miResultado.getString("telefono");
						String direccion = miResultado.getString("direccion");
						
					  	out.println("<div class='card'>");
					  	out.println("<div class='card-header'>Contacto</div>");
					  	out.println("<div class='card-body'>");
					  	out.println("<h5 class='card-title'>" + nombre + " " + apellido + "</h5>");
					  	out.println("<p class='card-text'>Email: " + email + "</p>");
					  	out.println("<p class='card-text'>Teléfono: " + telefono + "</p>");
					  	out.println("<p class='card-text'>Dirección: " + direccion + "</p>");
					  	out.println("<a href='mailto:"+email+"' class='btn btn-primary'>Enviar email</a>");
					  	out.println("</div>");
					  	out.println("</div>");
					  	
					  	out.println("<br />");
					  	
					}
					
				}
				catch(Exception e){
					out.print("Ocurrio un error intentando conectar con la base de datos");
					e.printStackTrace();
				}
			%>
		</div>
	</div>
</div>
</body>
</html>