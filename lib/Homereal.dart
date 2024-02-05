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
        margin: EdgeInsets.only(top: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'img/Institutodemexico.png',
            height: 200,
          ),
        ),
      ),
      // Texto informativo
      Container(
        padding: EdgeInsets.only(top: 20, left: 30, right: 50),
        child: Text(
          'El Instituto de México promueve la educación y le inculca valores a los jóvenes para ser el futuro de México',
          textAlign: TextAlign.justify,
        ),
      ),
      // Cuadro gris con pregunta y contacto
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
    ],
  ),
),
      ),
    );
  }
}
