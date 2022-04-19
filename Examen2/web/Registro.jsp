<%-- 
    Document   : Registro
    Created on : 16/04/2022, 01:07:56 AM
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
        
        String userName, URL, password, driver;
        
        URL = "jdbc:mysql://localhost/examen2";
        userName = "root";
        password = "n0m3l0";
        driver = "com.mysql.jdbc.Driver";
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(URL, userName, password);
        %>
        <form class="idex" name="registrar" method="post">
            <h4>Registrarse</h4>
            <br>
            <input class="campo" placeholder="Boleta" type="text" name="boleta" onkeypress="return validarn(event)" maxlength="10">
            <br>
            <input class="campo" placeholder="Nombre" type="text" name="nombre" onkeypress="return validarl(event) "maxlength="50">
            <br>
            <input class="campo" placeholder="Apellido Paterno" type="text" name="appat" onkeypress="return validarl(event)" maxlength="50">
            <br>
            <input class="campo" placeholder="Apellido Materno" type="text" name="apmat" onkeypress="return validarl(event)" maxlength="50">
            <br>
            <input class="campo" type="text" name="fecha" placeholder="Fecha de nacimiento" onclick="ocultarError();" onfocus="(this.type='date')" onblur="(this.type='text')">           
            <br>
            <select class="campo" name="sexo">
                <option value="" hidden selected>Sexo</option>
                <option>Femenino</option>
                <option>Masculino</option>
            </select>
            <br>
            <input class="campo" placeholder="Correo" type="email" name="correo" maxlength="50">
            <br>
            <input class="campo" placeholder="Grupo" type="text" name="grupo" maxlength="5">
            <br>
            <select class="campo" name="semestre">
                <option value="" hidden selected>Semestre</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
            </select>
            <br>
            <input class="campo" placeholder="Introdusca una contraseña" type="text" name="contra" maxlength="20" minlength="8">
            <br>
            <input class="boton" type="submit" value="Registrarse">
            <br>
            <input class="boton" type="reset" value="Borrar Datos">
        <%
            try{
                String nom, appat, apmat, fecha, sexo, correo, contra, grupo, sem;
                int bol;
                int b = 0;
                nom = request.getParameter("nombre");
                appat = request.getParameter("appat");
                apmat = request.getParameter("apmat");
                fecha = request.getParameter("fecha");
                sexo = request.getParameter("sexo");
                correo = request.getParameter("correo");
                grupo = request.getParameter("grupo");
                bol = Integer.parseInt(request.getParameter("boleta"));
                contra = request.getParameter("contra");
                sem = request.getParameter("semestre");
                set=con.createStatement();
                String m = "select * from usuario where alu_boleta_usu="+bol;
                rs = set.executeQuery(m);
                while(rs.next()){
                    b = rs.getInt("Alu_boleta_usu"); 
                }
                if(b != bol){
                    String q = "insert into alumno values("+bol+", '"+nom+"', '"+appat+"', '"+apmat+"', '"+sexo+"', '"+fecha+"', '"+grupo+"', '"+correo+"', "+sem+")";
                    String p = "insert into usuario(usu_password, alu_boleta_usu) values('"+contra+"', "+bol+")";            
                    int registro = set.executeUpdate(q);
                    int registro2 = set.executeUpdate(p);
                    %>
                    <h1>Registro Exitoso!!!</h1>
                    <meta http-equiv="Refresh" content="1.5;URL=index.jsp">
                    <%
                }else{
                    %>
                    <h1>Boleta ya registrada</h1>
                    <meta http-equiv="Refresh" content="1;URL=Registro.jsp">
                    <%
                }
            }
            catch(SQLException es){
                System.out.println("Error al obtener datos");
                System.out.println(es.getMessage());
            }
        }
        catch(Exception e){
            System.out.println("Error al conectar BD");
            System.out.println(e.getMessage());
        }
        %>
        <br>
        <a href="index.jsp" >Regresar a Principal</a>
        </form>
        <br>
    </body>
    <script src="js/validar.js"></script>
</html>
