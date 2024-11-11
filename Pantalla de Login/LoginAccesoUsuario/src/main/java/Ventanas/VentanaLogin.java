package Ventanas;

import javax.swing.*;

/*			VENTANA DE LOGIN:
 * 		Esta clase esta creada solo con la libreria 'Swing' y contiene toda la logica e implementacion de la ventana principal 'login': 
 * 		En esta ventana, el usuario puede agregar su nombre de usuario y contraseña, en seguida  el sistema procederá a validar la informacion 
 * 		ingresada y verificar si coincide con algun registro de la base de datos, en caso de coincidir, se muestra el mensaje de: 'ACCESO CONCEDIDO', 
 * 		y en caso de ser incorrecto muestra el mensaje: 'ACCESO DENEGADO'
 * 
 * */

import conexionBD.ConexionBD;
import modelo.LoginModelo;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;

public class VentanaLogin {

    public static void main(String[] args) {
        ventana();
    }
    
    private static void ventana() {
        JFrame marco = new JFrame("  INICIO DE SESIÓN");
        marco.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        marco.setSize(600, 500);
        marco.setLayout(new GridBagLayout());
        marco.getContentPane().setBackground(Color.LIGHT_GRAY);
        
        // Contener de componentes
        JPanel panel = new JPanel();
        panel.setLayout(new GridBagLayout());
        panel.setBackground(Color.lightGray);
        
        
        // Colocación de componentes
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.insets = new Insets(5, 5, 5, 5); 

        //  Imagen principal
        ImageIcon icon = new ImageIcon(VentanaLogin.class.getResource("/LogoFacebook.png"));
        JLabel imagenLabel = new JLabel(icon);
        
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.gridwidth = 2; 
        panel.add(imagenLabel, gbc);

        // Cuadros de loggin
        JLabel usuario = new JLabel("Nombre de usuario:");
        JTextField textoUsuario = new JTextField(15); 

        JLabel contrasena = new JLabel("Contraseña:");
        JPasswordField textoContrasena = new JPasswordField(15);

        JButton botonLogin = new JButton("Iniciar Sesión");

        // Añadir componentes al panel
        gbc.gridwidth = 1; 
        gbc.gridx = 0;
        gbc.gridy = 1;
        gbc.anchor = GridBagConstraints.EAST;
        panel.add(usuario, gbc);

        gbc.gridx = 1;
        gbc.gridy = 1;
        gbc.anchor = GridBagConstraints.WEST;
        panel.add(textoUsuario, gbc);

        gbc.gridx = 0;
        gbc.gridy = 2;
        gbc.anchor = GridBagConstraints.EAST;
        panel.add(contrasena, gbc);

        gbc.gridx = 1;
        gbc.gridy = 2;
        gbc.anchor = GridBagConstraints.WEST;
        panel.add(textoContrasena, gbc);

        gbc.gridx = 1;
        gbc.gridy = 3;
        gbc.anchor = GridBagConstraints.CENTER;
        panel.add(botonLogin, gbc);

        // Añadir el panel al marco
        marco.add(panel);

        // Hacer visible la ventana
        marco.setVisible(true);

        // Acción del botón de inicio de sesión
        botonLogin.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String nombreUsuario = textoUsuario.getText();
                String contraseña = new String(textoContrasena.getPassword());

                // Crear el objeto LoginModelo
                LoginModelo loginModelo = new LoginModelo(nombreUsuario, contraseña);

                // Obtener la conexión a la base de datos
                ConexionBD conexionBD = new ConexionBD();
                Connection connection = conexionBD.getConnection();

                if (connection != null && loginModelo.autenticar(connection)) {
                    JOptionPane.showMessageDialog(null, "Acceso concedido");
                } else {
                    JOptionPane.showMessageDialog(null, "Acceso denegado");
                }
            }
        });
    }
}
