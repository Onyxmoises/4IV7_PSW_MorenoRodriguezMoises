<%-- 
    Document   : EditarInf
    Created on : 17/04/2022, 10:05:16 PM
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
        <form class="idex" method="post" action="ActualizarInf.jsp">
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
                int id=Integer.parseInt(request.getParameter("id"));
                String q = "select * from alumno where alu_boleta="+ id;
                set = con.createStatement();
                rs = set.executeQuery(q);
                while(rs.next()){
       %>   
            <input type="hidden" name="boleta" value="<%=rs.getString("alu_boleta")%>">
            <h4>Editar informacion</h4>
            <br>
            <label>Nombre</label>
            <br>
            <input class="campo" type="text" name="nombre" value="<%=rs.getString("alu_nombre")%>" onkeypress="return validarl(event) "maxlength="50">
            <br>
            <label>Apellido Paterno</label>
            <br>
            <input class="campo" type="text" name="appat" value="<%=rs.getString("alu_appat")%>" onkeypress="return validarl(event) "maxlength="50">
            <br>
            <label>Apellido Materno</label>
            <br>
            <input class="campo" type="text" name="apmat" value="<%=rs.getString("alu_apmat")%>" onkeypress="return validarl(event) "maxlength="50">
            <br>
            <label>Fecha de nacimiento</label>
            <br>
            <input class="campo" type="date" name="fecha" value="<%=rs.getString("alu_fechaN")%>">
            <br>
            <label>Sexo</label>
            <br>
            <select class="campo" name="sexo">
                <option>Femenino</option>
                <option>Masculino</option>
            </select>
            <br>
            <label>Correo</label>
            <br>
            <input class="campo" type="email" name="correo" value="<%=rs.getString("alu_correo")%>" maxlength="50">
            <br>
            <label>Grupo</label>
            <br>
            <input class="campo" type="text" name="grupo" value="<%=rs.getString("alu_grupo")%>" maxlength="5">
            <br>
            <label>Semestre</label>
            <br>
            <input class="campo" type="text" name="semestre" value="<%=rs.getString("sem_num_alu")%>" onkeypress="return validars(event)" maxlength="1"> 
        <%      }
            }catch(SQLException es){
                System.out.println("Error en los datos");
                System.out.println(es.getMessage()); 
            }    
        }catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
        }
            %>
            <br>
            <input class="boton" type="submit" value="Actualizar Datos">
        <br>
        <%try{int id=Integer.parseInt(request.getParameter("id"));%>
        <a href="Inicio.jsp?id=<%=id%>" >Regresar a Principal</a>
        <%}catch(Exception e){} %>
        </form>
        <script src="js/validar.js"></script>
    </body>
</html>
