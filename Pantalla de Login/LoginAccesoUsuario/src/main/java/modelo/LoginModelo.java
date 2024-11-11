package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/* 			MODELO:
 * 		Esta clase representa la tabla 'LOGIN' creada en el archivo sql de esta carpeta, contiene el mapeo de las columnas de dicha tabla,
 * 		asi como los metodos constructores, getters y setters que se utilizan al momento de instanciar esta clase, en la parte final de esta clase
 * 		contiene un metodo adicional que sirve para autenticar el usuario y la contraseña ingresadas:
 * */
public class LoginModelo {
    
    private String nombreUsuario;
    private String Contraseña;
    
    public LoginModelo() {
    }

    public LoginModelo(String nombreUsuario, String contraseña) {
        this.nombreUsuario = nombreUsuario;
        Contraseña = contraseña;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String contraseña) {
        Contraseña = contraseña;
    }

    // Este metodo sirve para autenticar si los datos de usuario y contraseña coinciden con algun registro de nuestra base de datos: 
    public boolean autenticar(Connection connection) {
        String query = "SELECT * FROM usuarios WHERE nombre_usuario = ? AND contraseña = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, nombreUsuario);
            statement.setString(2, Contraseña);
            ResultSet resultSet = statement.executeQuery();
            return resultSet.next();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}

