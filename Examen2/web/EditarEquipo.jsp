<%-- 
    Document   : EditarEquipo
    Created on : 17/04/2022, 03:44:09 AM
    Author     : M3R-00
--%>

<%@page contentType="text/html" language="java" import="java.sql.*, java.util.*, java.text.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examen 2° Parcial</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body oncopy="return false" onpaste="return false">
        <%
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        ResultSet sr = null;
        
        String userName, URL, password, driver;
        
        URL = "jdbc:mysql://localhost/examen2";
        userName = "root";
        password = "n0m3l0";
        driver = "com.mysql.jdbc.Driver";
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
            try{
                int id = Integer.parseInt(request.getParameter("id"));
        %>
        <form class="idex" method="post" action="Editar.jsp?id=<%=id%>">
        <%
            }catch(Exception m){

            }
        %>
            <h4>Registro de equipo</h4>
            <br>
            <input class="campo" placeholder="Etiqueta del equipo" type="text" name="numequ" maxlength="6" onkeypress="return validarnl(event)">
            <br>
            <input class="campo" placeholder="Numero de serie del equipo" type="text" name="serequ" maxlength="20" onkeypress="return validarnl(event)">
            <br>
            <select name="lab" class="campo">
                <option value="" hidden selected>Laboratorio</option>
                <option>LBD</option>
                <option>LDS</option>
                <option>LNT</option>
                <option>4.0</option>
            </select>
            <br>
            <select name="asi" class="campo">
                <option value="" hidden selected>Asignatura</option>
        <%
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                String q = "select * from asignatura inner join alumno on asignatura.sem_num_asi = alumno.sem_num_alu where alu_boleta ="+ id;
                set = con.createStatement();
                rs = set.executeQuery(q);
                while(rs.next()){
                    String k = rs.getString("asi_nombre");
        %>
                <option><%=k%></option>
        <%
                }
        %>
            </select>
        <%
            }catch(SQLException es){
                System.out.println("Error al obtener datos1");
                System.out.println(es.getMessage());
                int id = Integer.parseInt(request.getParameter("id"));
               %>
               <meta http-equiv="Refresh" content="1;URL=EditarEquipo.jsp?id=<%=id%>">
               <%
            }
        %> 
            <br>
            <input class="boton" type="submit" value="Registrar">
            <br>
            <input class="boton" type="reset" value="Borrar Datos">
            <br>
        <%
            try{
                int id = Integer.parseInt(request.getParameter("id"));
        %>      
            <a href="Inicio.jsp?id=<%=id%>">Regresar</a>
        <%
            }catch(Exception m){

            }            
        }catch(Exception e){
            System.out.println("Error al conectar BD0");
            System.out.println(e.getMessage());
        }
        %>
        </form>
        <script src="js/validar.js"></script>
    </body>
</html>
