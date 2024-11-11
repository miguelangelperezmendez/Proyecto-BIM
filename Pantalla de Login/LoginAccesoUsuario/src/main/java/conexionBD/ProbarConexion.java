package conexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import modelo.LoginModelo;

// Esta clase simplemente se utiliza para comprobar que la conexion se realice correctamente con los datos que proporcionamos en la clase 'ConexionBD'

public class ProbarConexion {
    
    public static LoginModelo obtenerUsuario(Connection connection, String nombreUsuario) { 
        String query = "SELECT * FROM login WHERE nombreUsuario = ?"; 
        try (PreparedStatement statement = connection.prepareStatement(query)) { 
            statement.setString(1, nombreUsuario); 
            ResultSet resultSet = statement.executeQuery(); 
            if (resultSet.next()) { 
                String usuarioBD = resultSet.getString("nombreUsuario"); 
                String contraseñaBD = resultSet.getString("contraseña"); 
                return new LoginModelo(usuarioBD, contraseñaBD); 
            } else { 
                return null; 
            } 
        } catch (SQLException ex) { 
            ex.printStackTrace(); 
            return null; 
        }
    }
    
    // ConexionBD conexion = new ConexionBD();
    
    public static void main(String[] args) {
        ConexionBD conexion = new ConexionBD();
        Connection connection = conexion.getConnection();
        
        // Obtener el usuario y mostrar en consola
        LoginModelo usuario = obtenerUsuario(connection, "AlejandroRamirez");
        
        if (usuario != null) {
            System.out.println("Usuario encontrado:");
            System.out.println("Nombre de usuario: " + usuario.getNombreUsuario());
            System.out.println("Contraseña: " + usuario.getContraseña());
        } else {
            System.out.println("Usuario no encontrado.");
        }
    }
}

