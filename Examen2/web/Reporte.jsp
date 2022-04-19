<%-- 
    Document   : Reporte
    Created on : 18/04/2022, 12:14:13 PM
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
        <form class="idex" method="post" oncopy="return false" onpaste="return false">
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
        %>
            <h4>Reporte de fallo</h4>
            <br>
            <input class="campo" placeholder="Etiqueta del equipo" type="text" name="eti" maxlength="6" onkeypress="return validarnl(event)">
            <br>
            <input class="campo" type="text" name="fecha" placeholder="Fecha" onclick="ocultarError();" onfocus="(this.type='date')" onblur="(this.type='text')">
            <br>
            <input class="campo" type="text" name="hora" placeholder="Hora" onclick="ocultarError();" onfocus="(this.type='time')" onblur="(this.type='text')"> 
            <br>
            <textarea class="campo" placeholder="Descripcion del problema" name="descri" maxlength="100"></textarea>
            <br>
            <input class="boton" type="submit" value="Registrarse">
            <br>
            <input class="boton" type="reset" value="Borrar Datos">
            <br>
        <%
            try{
                String eti, fecha, descri, hora;
                eti = request.getParameter("eti");
                fecha = request.getParameter("fecha");
                descri = request.getParameter("descri");
                hora = request.getParameter("hora");
                String q ="select * from equipor where equ_numEti ='"+eti+"'";
                set=con.createStatement();
                rs = set.executeQuery(q);
                String eti2 ="";
                int idequ= 0;
                while(rs.next()){
                    eti2 = rs.getString("equ_numEti");
                    idequ = rs.getInt("equ_id");
                }
                if(eti.equalsIgnoreCase(eti2)){
                    String p = "insert into reporte(rep_fecha,rep_hora,rep_descripcion,alu_boleta_rep,equ_id_rep) values('"+fecha+"','"+hora+"','"+descri+"',"+id+","+idequ+")";
                    int registro = set.executeUpdate(p);
                    %>
                    <h1>Reporte enviado</h1>
                    <meta http-equiv="Refresh" content="1;URL=Inicio.jsp?id=<%=id%>">
                    <%
                }else{
                    %>
                    <h1>El equipo no esta registrado</h1>
                    <%
                }
            }catch(Exception es){
                System.out.println("Error en lso datos");
                System.out.println(es.getMessage());
            }
        %>
            <a href="Inicio.jsp?id=<%=id%>">Regresar</a>    
        <%
        }catch(Exception e){
            System.out.println("Error al conectar BD0");
            System.out.println(e.getMessage());
        }
        %>
        </form>
    </body>
</html>
