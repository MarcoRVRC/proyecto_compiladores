/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package umg.edu.proyecto_compiladores;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.mycompany.ejemplojflex.Scanner;
/**
 *
 * @author Lenovo
 */
public class proyectoCompiladoresMain {
   public static void main(String args[]) {
        try {
            Reader archivo = new FileReader("prueba.txt");
            Scanner scan = new Scanner(archivo);
            scan.yylex();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException ex) {
           Logger.getLogger(Scanner.class.getName()).log(Level.SEVERE, null, ex);
       } 

    }
    
}
