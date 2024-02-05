import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
  child: Column(
    children: <Widget>[
      // Fila superior con icono de usuario y nombre
      Container(
        padding: EdgeInsets.only(top: 10, left: 30, right: 10),
        child: Row(
          children: <Widget>[
            Icon(Icons.person, size: 20),
            Text('  Edupay', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      // Mensaje de bienvenida
      Container(
        padding: EdgeInsets.only(top: 20, left: 30, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hola Edupay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Text('bienvenido a EDUPAY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            Text(' ', style: TextStyle(fontSize: 20)),
            Text('Tu plataforma móvil para un buen ámbito estudiantil', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      // Imagen
      Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        _buildImageTile(
                          imagePath: 'img/pagospendientes.png',
                          text: 'Pagos pendientes',
                          onTap: () => Navigator.pushNamed(context, '/pantalla1'),
                        ),
                        _buildImageTile(
                          imagePath: 'img/calendario.png',
                          text: 'Calendario escolar',
                          onTap: () => Navigator.pushNamed(context, '/pantalla2'),
                        ),
                        _buildImageTile(
                          imagePath: 'img/notifica.png',
                          text: 'Notificaciones',
                          onTap: () => Navigator.pushNamed(context, '/pantalla3'),
                        ),
                        _buildImageTile(
                          imagePath: 'img/factura.png',
                          text: 'Historial  de pagos',
                          onTap: () => Navigator.pushNamed(context, '/pantalla4'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      Container(
        margin: EdgeInsets.only(top: 5),
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
    ],
  ),
),
      ),
      
    );
  }
}
Widget _buildImageTile({
    required String imagePath,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }