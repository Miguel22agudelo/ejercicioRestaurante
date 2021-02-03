<%-- 
    Document   : index
    Created on : 2/02/2021, 12:00:31 p. m.
    Author     : mi_g_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file = "conexion.jsp" %> <%-- incluye un archivo --%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Platos</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
    </head>
    <body>

        <div class ="container">
            <h1>Lista de Platos</h1>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col" colspan="7">
                            <a href="plato.html" title="Crear Plato" class="btn btn-primary"> Agregar Plato</a>
                        </th>
                    <tr>
                        <th scope="col">Nombre</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Activo</th>

                    </tr>
                </thead>
                <tbody>
                    <%                        /*
                        Recordar agregar la librería por Projects - Libraries
                        clic derecho en Libraries y agregar librería de MySql JDBC Driver
                         */
                        request.setCharacterEncoding("UTF-8");//acentos desde mysql
                        try {
                            //Conexión a la base de datos de MySql
                            //Connection cnx = null;
                            Statement st = null;
                            ResultSet rs = null;
                            /*
                            String URL_SERVIDOR_BD = "jdbc:mysql://localhost:3306/bdjsp";
                            final String USUARIO_BD = "root";
                            final String PASSWORD_BD = "";
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cnx = DriverManager.getConnection(URL_SERVIDOR_BD, USUARIO_BD, PASSWORD_BD);
                             */
                            st = cnx.createStatement();
                            rs = st.executeQuery("Select * From platos");
                            while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><%= rs.getString("nombre")%></th>
                        <td><%= rs.getString("precio")%></td>
                        <td><%= rs.getString("activo")%></td>



                        <td><a href="editarplato.jsp?nombre=<%= rs.getString(1)%>&precio=<%= rs.getString(2)%>&activo=<%= rs.getString("activo")%>%>"><i class="fa fa-pencil"></i></a></td>
                        <td><a href="borrarplato.jsp?nombre=<%= rs.getString(1)%>" onClick = "return confirm('¿Está seguro de que desea eliminar este plato?');"><i class="fa fa-trash"></i></a></td>
                    </tr>
                    <%
                            }

                        } catch (Exception e) {
                            out.print("Error al conectar con la base de datos");
                        }
                    %>    

                </tbody>
            </table>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>
</html>

