/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.ServletConfig;
/**
 *
 * @author M3R-00
 */
public class ConsultarAlumnos extends HttpServlet {

    /*Para conectar co la BD es necesario un constructor
    Se necesitan 3 tipos de objetos para poder establecer la conexion
    
    Connection: establece la conexion con el servidor BD
    Statement: sirve para poder definir las sentencias de manipulacion y definicion de datos (create, update, insert, delete)
    ResultSet: sirve para poder crear querry*/
    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    //Definir el constructor de la clase
    public void init(ServletConfig cfg) throws ServletException{
        //Aqui es donde se define como se conecta a la BD
        String URL = "jdbc:mysql:3306//localhost/alumnos";
        //Tipo de conector:manejadorBD:pueto//IP/NombreBD
        String userName = "root";
        String password = "53524043beserker";
        
        try{
            //Primero conectarnos
            Class.forName("com.mysql.jdbc.Driver");
            URL = "jdbc:mysql://localhost/alumnos";
            con = DriverManager.getConnection(URL, userName, password);
            set = con.createStatement();
            
            System.out.println("Se conecto a la BD :) ");
        }   
        catch(Exception e){
            System.out.println("No se conecto a la BD :( ");
            System.out.print(e.getMessage());
            System.out.print(e.getStackTrace());
        }
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Lista de alumnos</title>");
            out.println("<link rel='stylesheet' href='css/style.css'>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div>");
            out.println("<h1>Lista de alumnos</h1>" 
                    + "<table border = 2>"
                        + "<tr>"
                            + "<th>Boleta</th>"
                            + "<th>Nombre</th>"
                            + "<th>Telefono</th>"
                        + "</tr>");
            try{
                int boleta;
                String nombre, appat, apmat, tel;
                
                //Establecer la querry
                String q = "select * from alumnobatiz";
                set = con.createStatement();
                rs = set.executeQuery(q);
                
                //Recorrer la tabla
                while(rs.next()){
                    boleta = rs.getInt("boleta");
                    nombre = rs.getString("nombre");
                    appat = rs.getString("appat");
                    apmat = rs.getString("apmat");
                    tel = rs.getString("telefono");
                    
                    out.print("<tr>" 
                                + "<td>" + boleta + "</td>"
                                + "<td>" + nombre + " " + appat + " " + apmat + "</td>"
                                + "<td>" + tel + "</td>"
                            + "</tr>");
                }
                //Cerrar conecciones
                rs.close();
                set.close();
            }
            catch(Exception e){
                System.out.print("Error al conectar a la tabla");
                System.out.print(e.getMessage());
                System.out.print(e.getStackTrace());
            }
            out.println("</table>");
            out.println("<a href = index.html>regresar</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    //Creamos el destructor
    public void destroy(){
        try{
            con.close();
        }
        catch(Exception e){
            super.destroy();
        }
    }
}