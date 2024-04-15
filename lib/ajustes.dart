import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'Micuenta.dart';

class PantallaCerrarSesion extends StatelessWidget {
  const PantallaCerrarSesion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10, left: 3, right: 10),
                child: Row(
                  children: <Widget>[
                    // GestureDetector for both image and text
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PerfilUsuario()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20, // Adjust size as needed
                        backgroundImage: AssetImage('img/Padrevlad.jpeg'),
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PerfilUsuario()),
                        );
                      },
                      child: Text('Javier Ojeda', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
            // Mensaje de bienvenida
            Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Ajustes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Botón de cerrar sesión (rectángulo horizontal)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    Text('Cerrar Sesión', style: TextStyle(fontSize: 18, color: Colors.white)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 0),
            // Texto "¿Tienes alguna duda?"
            Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Text('¿Tienes alguna duda?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('Contacta a nuestro equipo de soporte aquí', style: TextStyle(fontSize: 14)),
          ],
        ),
      ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

// El resto del código (PantallaDestino) permanece igual.


class PantallaDestino extends StatelessWidget {
  const PantallaDestino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerrar sesion'),
      ),
      body: const Center(
        child: Text('¡Has cerrado sesión correctamente!'),
      ),
    );
  }
}