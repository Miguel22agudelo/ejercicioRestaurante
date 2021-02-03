<%-- 
    Document   : agregarplato
    Created on : 2/02/2021, 1:36:53 p. m.
    Author     : mi_g_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Plato</title>
    </head>
    <body>
        <%
            
            try {
                //Conexión a la base de datos de MySql
                //Connection cnx = null;
                String codigo = request.getParameter("codigo");
                String nombre = request.getParameter("nombre");
                String precio = request.getParameter("precio");
                String activo = request.getParameter("activo");
                Statement st = null;
                //ResultSet rs = null;
                st = cnx.createStatement();
                st.executeUpdate("insert into platos (nombre, precio, activo,codigo)"
                        + "values ('"+nombre+"','"+precio+"','"+activo+"','"+codigo+"');");
                //redireccionarl al archivo index.html
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>

