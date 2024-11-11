package conexionBD;

import java.sql.Connection;
import java.sql.DriverManager;

/*			CONEXION A BASE DE DATOS DE MYSQL
 *   Esta clase realiza la conexion a la base de datos: para ello, proporcionamos los siguientes valores de acuerdo a la base de datos donde se valla
 *   a conectar, en mi caso lo estaé ejecutando de forma local, con el puerto por defecto de la siguiente forma:
 * */

public class ConexionBD {
    
    private Connection connection;
    
    private String usuario = "root";
    private String password = "Astrix12";
    private String servidor = "localhost";
    private String puerto = "3306";
    private String baseDeDatos = "MiBaseDeDatos";
    private String url = "jdbc:mysql://"+servidor+ ":" + puerto + "/" + baseDeDatos + "?serverTimezone=UTC";

    private String driver = "com.mysql.cj.jdbc.Driver";

    public ConexionBD() {
        
        try {
            Class.forName(driver);
            
            connection = DriverManager.getConnection(url, usuario, password);
            
            if (connection != null) {
                System.out.println("Se realizó corretamente la conexion");
            }
        } catch (Exception e) {
            System.out.println("Ocurrio un error durante la conexion");
            System.out.println("Mensaje del error: " + e.getMessage());
            System.out.println("Detalle del error: ");
            e.printStackTrace();
        }
    }
    
    public Connection getConnection() {
        return connection;
    }
}
