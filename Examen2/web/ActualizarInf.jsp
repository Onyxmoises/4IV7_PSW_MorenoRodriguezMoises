<%-- 
    Document   : ActualizarInf
    Created on : 18/04/2022, 12:50:34 AM
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
        <%
        Connection con = null;
        Statement set = null;
        ResultSet rs = null;
        
        String userName, URL, password, driver;
        
        URL = "jdbc:mysql://localhost/examen2";
        userName = "root";
        password = "n0m3l0";
        driver = "com.mysql.jdbc.Driver";
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
             try{
                String nom, appat, apmat, fecha, sexo, correo, grupo;
                int semes, id;
                id = Integer.parseInt(request.getParameter("boleta"));
                nom = request.getParameter("nombre");
                appat = request.getParameter("appat");
                apmat = request.getParameter("apmat");
                fecha = request.getParameter("fecha");
                sexo = request.getParameter("sexo");
                correo = request.getParameter("correo");
                grupo = request.getParameter("grupo");
                semes = Integer.parseInt(request.getParameter("semestre"));
                set = con.createStatement();
                String q = "update alumno set alu_nombre='"+nom+"',alu_appat='"+appat+"',alu_apmat='"+apmat+"',alu_sexo='"+sexo+"',alu_fechaN='"+fecha+"',alu_grupo='"+grupo+"',alu_correo='"+correo+"',sem_num_alu="+semes+" where alu_boleta="+id;
                int registro = set.executeUpdate(q);
                %>
                <h1>Datos guardados correctamente</h1>
                <meta http-equiv="Refresh" content="1;URL=Inicio.jsp?id=<%=id%>">
                <%
                
            }catch(SQLException es){
               System.out.println("Error al registrar en la tabla");
                System.out.println(es.getMessage());
                %>
                <h1>Error en los datos</h1>
                <%     
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
            %>
            <h1>Error al conectar</h1>
            <%
        }
            %>
    </body>
</html>
