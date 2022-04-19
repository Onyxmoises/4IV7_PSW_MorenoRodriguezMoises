<%-- 
    Document   : VerReporte
    Created on : 18/04/2022, 02:23:01 PM
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
    <body>
        <form class="tabla">
        <table class="tabla">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Descripcion</th>
                    <th>Equipo</th>
                </tr>
            </thead>
            <tbody>
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
            int id = Integer.parseInt(request.getParameter("id"));
            try{
                String q = "select * from reporte where alu_boleta_rep="+id;
                set = con.createStatement();
                rs = set.executeQuery(q);
                while(rs.next()){
        %>
                <tr>
                    <td><%=rs.getString("rep_fecha")%></td>
                    <td><%=rs.getString("rep_hora")%></td>
                    <td><%=rs.getString("rep_descripcion")%></td>
                    <td><%=rs.getString("equ_id_rep")%></td>
                </tr>
        <%
                }
            }catch(SQLException es){
                System.out.println("Error al ver datos");
                System.out.println(es.getMessage());
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
        }
        %>
            </tbody>
        </table>
         <%
            try{
                int id = Integer.parseInt(request.getParameter("id"));
        %> 
        <br>
        <br>
            <a class="t" href="Inicio.jsp?id=<%=id%>">Regresar</a>
        <%
            }catch(Exception m){

            }
         %>
         </form>
    </body>
</html>
