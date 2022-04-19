<%-- 
    Document   : Editar
    Created on : 17/04/2022, 03:27:35 PM
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
                int id = Integer.parseInt(request.getParameter("id"));
                String  serequ, lab, asi, numequ;                        
                lab = request.getParameter("lab");                
                asi = request.getParameter("asi");
                numequ = request.getParameter("numequ");
                serequ = request.getParameter("serequ");                
                String p = "Select * from equipor where equ_asig ='"+asi+"'";
                set=con.createStatement();
                rs = set.executeQuery(p);
                String k = "";
                while(rs.next()){
                    k = rs.getString("equ_asig");                   
                }
                if(k.equalsIgnoreCase(asi)){
                    String q = "update equipor set equ_serie='"+serequ+"', equ_numEti='"+numequ+"', equ_lab='"+lab+"' where equ_asig='"+asi+"'";
                    int registro = set.executeUpdate(q);
                }else{
                    String q = "insert into equipor(equ_serie,equ_numEti,equ_lab,equ_asig,alu_boleta_equ) values('"+serequ+"', '"+numequ+"', '"+lab+"', '"+asi+"', "+id+")";
                    int registro = set.executeUpdate(q);
                }          
                %>
                <h1>Registro exito</h1>
                <meta http-equiv="Refresh" content="1;URL=Inicio.jsp?id=<%=id%>">
                <%
            }catch(SQLException es){
                System.out.println("Error al obtener datos2");
                System.out.println(es.getMessage());
                %>
                <h1>Error datos</h1>
                <%
            }
        }catch(Exception e){
            System.out.println("Error al conectar BD0");
            System.out.println(e.getMessage());
            %>
            <h1>Error BD</h1>
            <%
        }
        %>
    </body>
</html>
