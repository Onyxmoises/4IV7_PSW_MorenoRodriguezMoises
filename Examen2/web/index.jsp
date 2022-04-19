<%-- 
    Document   : index
    Created on : 16/04/2022, 06:08:43 PM
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
            Connection con=null;
            Statement set=null;
            ResultSet rs=null;
            
            String user, URL, password,driver;
            URL="jdbc:mysql://localhost/examen2";
            user="root";
            password="n0m3l0";
            driver="com.mysql.jdbc.Driver";
            try{
                Class.forName(driver);
                con=DriverManager.getConnection(URL, user, password);
        %>
        <form class="idex">
            <h4>Inicio de Sesion</h4>
            <br> 
            <input class="campo" placeholder="Usuario" type="text" name="usuario" maxlength="10" onkeypress="return validarn(event)"> 
            <br>
            <input class="campo" placeholder="Contraseña" type="password" name="cont" maxlength="20" minlength="8" >
            <br>
            <input class="boton" value="Iniciar Sesion" type="submit">
            <%
                try{
                    
                    int d = 0;                    
                    String b = "";                    
                    int id = Integer.parseInt(request.getParameter("usuario"));
                    String ib = request.getParameter("cont");
                    set=con.createStatement();
                    String q = "select * from usuario where alu_boleta_usu="+id;
                    rs = set.executeQuery(q);
                    while(rs.next()){
                        d = rs.getInt("alu_boleta_usu");
                        b = rs.getString("usu_password");
                    }
                    if(id == d){
                        if(ib.equalsIgnoreCase(b)){
                            response.sendRedirect("Inicio.jsp?id="+d); 
                        }else{
                            %>
                            <script>alert("La contraseña es incorrecta");</script>
                            <%
                        }   
                    }else{
                        %>
                        <script>alert("El usuario no existe");</script>
                        <%
                    }
                }catch(SQLException es){
                    System.out.println("Error al obtener datos");
                    System.out.println(es.getMessage());
                }
            }catch(Exception e){
                System.out.println("Error al conectar con la BD");
                System.out.println(e.getMessage());
                String o = e.getMessage();
                if(o.equals("For input string: \"\"")){
                    %>
                    <script>alert("El ningun campo puede estar vacio");</script>
                    <%
                }
            }
        %>
        <br>
        <a href="Registro.jsp">Registrar nuevo usuario</a>
        </form>
        <br>
        <script src="js/validar.js"></script>
    </body>    
</html>
