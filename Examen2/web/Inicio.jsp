<%-- 
    Document   : Inicio
    Created on : 16/04/2022, 04:04:08 PM
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
        <div class="tabla">
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
                String q = "select * from alumno where alu_boleta="+ id;
                set = con.createStatement();
                rs = set.executeQuery(q);
                while(rs.next()){
        %>
                    <table class="tabla">
                        <tr>
                            <th>Nombre: </th>
                            <td><%=rs.getString("alu_nombre")%> <%=rs.getString("alu_appat")%> <%=rs.getString("alu_apmat")%></td>
                            <th>Boleta: </th>
                            <td><%=rs.getInt("alu_boleta")%></td>
                            <th>Grupo: </th>
                            <td><%=rs.getString("alu_grupo")%></td>
                            <td width="70px"></td>
                            <td class="bu"><a href="EditarInf.jsp?id=<%=id%>">EDITAR INFORMACION</a></td>
                        </tr>
                        <tr> 
                            <th>Correo: </th>
                            <td><%=rs.getString("alu_correo")%></td>
                            <th>Fecha de Nacimiento: </th>
                            <td><%=rs.getString("alu_fechaN")%></td>
                            <th>Sexo: </th>
                            <td><%=rs.getString("alu_sexo")%></td>
                            <td width="70px"></td>
                            <td class="bu"><a href="index.jsp">CERRAR SESION</a></td>
                        </tr>
                    </table>
                    <%
                }
            }catch(SQLException es){
                System.out.println("Error al obtener datos");
                System.out.println(es.getMessage());
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
        }
        %>
        </div>
        <div class="tabla">
        <%
            try{
                int id = Integer.parseInt(request.getParameter("id"));
                String h = "select * from equipor where alu_boleta_equ ="+id;
                set = con.createStatement();
                sr = set.executeQuery(h);
            %>
                <table class="tabla">
                <tr>
                    <th>Asignatura</th>
                    <th>LBD</th>
                    <th>LDS</th>
                    <th>LNT</th>
                    <th>4.0</th>
                </tr>
            <%
                String z = "";
            %>
                <tr>
            <%
                while(sr.next()){
                    z = sr.getString("equ_lab");
            %>      
                    <td><%=sr.getString("equ_asig")%></td>
                    <%if(z.equalsIgnoreCase("LBD")){%>
                    <td><%=sr.getString("equ_numEti")%></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <%}%>
                    <%if(z.equalsIgnoreCase("LDS")){%>
                    <td></td>
                    <td><%=sr.getString("equ_numEti")%></td>
                    <td></td>
                    <td></td>
                    <%}%>
                    <%if(z.equalsIgnoreCase("LNT")){%>
                    <td></td>
                    <td></td>
                    <td><%=sr.getString("equ_numEti")%></td>
                    <td></td>
                    <%}%>
                    <%if(z.equalsIgnoreCase("4.0")){%>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><%=sr.getString("equ_numEti")%></td>   
                    <%}%>
                </tr>
            <% 
                }
            %>
            </table>
            <br>
            <br>
            <form>
                <a class="t" href="EditarEquipo.jsp?id=<%=id%>">EDITAR EQUIPO</a>
                <a class="t" href="Reporte.jsp?id=<%=id%>">REPORTAR FALLO</a>
                <a class="t" href="VerReporte.jsp?id=<%=id%>">VER REPORTES</a>
            </form>
            <%
            }catch(Exception e){
                System.out.println("Error al conectar BD");
                System.out.println(e.getMessage());
            }
            %>
        </div>
    </body>
</html>
