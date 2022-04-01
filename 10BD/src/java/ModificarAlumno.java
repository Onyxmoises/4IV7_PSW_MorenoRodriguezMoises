/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author M3R-00
 */
public class ModificarAlumno extends HttpServlet {
    
    private Connection con;
    private Statement set;
    private ResultSet rs;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        processRequest(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ModificarAlumno</title>");            
            out.println("</head>");
            out.println("<body>");
            try{
                int bol;
                String nom, appat, apmat, tel, mbol;
                String q = "";
                
                nom = request.getParameter("modnombre");
                appat = request.getParameter("modappat");
                apmat = request.getParameter("modapmat");
                tel = request.getParameter("modtel");
                bol = Integer.parseInt(request.getParameter("nboleta"));
                mbol = request.getParameter("modboleta");
               
                if(nom != ""){
                    q = "update alumnobatiz set nombre='"+ nom +"' where boleta="+ bol;
                    set.executeUpdate(q);
                }
                if(appat != ""){
                    q = "update alumnobatiz set appat='"+ appat +"' where boleta="+ bol;
                    set.executeUpdate(q);
                }
                if(apmat != ""){
                    q = "update alumnobatiz set apmat='"+ apmat +"' where boleta="+ bol;
                    set.executeUpdate(q);
                }
                if(tel != ""){
                    q = "update alumnobatiz set telefono='"+ tel +"' where boleta="+ bol;
                    set.executeUpdate(q);
                }
                if(mbol != ""){
                    q = "update alumnobatiz set boleta="+ mbol +" where boleta="+ bol;
                    set.executeUpdate(q);
                }
                
                out.println("<h1>Modificacion Exitosa</h1>");
                System.out.println("Se modifico el alumno");
            }
            catch(Exception e){
                System.out.println("Error al modificar");
                out.println("<h1>Modificacion No Exitosa</h1>");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
            out.println("<a href = 'ConsultarAlumnos'>Consultar</a>");
            out.println("</body>");
            out.println("</html>");
        }
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
    
    public void destroy(){
        try{
            con.close();
        }
        catch(Exception e){
            super.destroy();
        }
    }

}
