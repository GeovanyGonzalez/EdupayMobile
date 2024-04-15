import 'package:flutter/material.dart';
import 'Micuenta.dart';
import 'pantalla1.dart';
import 'pantalla2.dart';
import 'pantalla3.dart';


void main() {
  runApp(MyApp2());
}
  final List<String> notificaciones = ['Ana Ojeda Pago de colegiatura', 'Pago de evento'];
List<TarjetaEstudiante> estudiantes = [
  TarjetaEstudiante(
    imagen: 'img/Adolecente.jpg',
    nombre: 'Juan Ojeda',
    curso: 'Sexto A',
    notificacion: false,
  ),
  TarjetaEstudiante(
    imagen: 'img/niña chica.jpg',
    nombre: 'Ana Ojeda',
    curso: 'Tercero B',
    notificacion: true, 
  ),
  TarjetaEstudiante(
    imagen: 'img/child3.jpg',
    nombre: 'María Ojeda',
    curso: 'Primero C',
    notificacion: false,
  ),
];


class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 246, 242, 253),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Fila superior con icono de usuario y nombre
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
                    Text('Hola Javier Ojeda', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('bienvenido a EDUPAY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('Tu plataforma móvil para un buen ámbito estudiantil', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),


Container(
  margin: EdgeInsets.only(top: 20),
  height: 200, // Adjust height as needed
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: estudiantes.length, // Number of cards
    itemBuilder: (context, index) {
  TarjetaEstudiante estudiante = estudiantes[index];


  return Container(
    width: 200,
    margin: EdgeInsets.symmetric(horizontal: 10),
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
                          onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(     builder: (context) => pantallas[index],
                                      fullscreenDialog: true, // Ensure full-screen navigation

                        ));
                      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(estudiante.imagen),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  estudiante.nombre,
                  style: TextStyle(fontSize: 18),
                ),
                if (estudiante.notificacion)
                  Icon(
                    Icons.notifications_active,
                    color: Colors.red,
                    size: 20,
                  ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              estudiante.curso,
              style: TextStyle(fontSize: 14),
            ),
          ],
          
        ),
      ),
    ),
  ));
},
  ),
),
Container(
        padding: EdgeInsets.all(15),
        child: Text(
          'Nuevas notificaciones',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
Container(//container de centro de notificaciones
  color: Colors.grey[200],
  height:  70.0 * notificaciones.length,
  width: MediaQuery.of(context).size.width,
  child: ListView.builder(
    itemCount: notificaciones.length,
    itemBuilder: (context, index) {
      return Dismissible(
        key: Key(notificaciones[index]),
        onDismissed: (direction) {
          (() {
            notificaciones.removeAt(index);
          });
        },
        child: GestureDetector(
          onTap: () {
            // Acciones al presionar la notificación
          },
          child: Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 192, 245),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              notificaciones[index],
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      );
    },
  ),
),              Container(
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

class TarjetaEstudiante {
  String imagen;
  String nombre;
  String curso;
  bool notificacion;

  TarjetaEstudiante({
    required this.imagen,
    required this.nombre,
    required this.curso,
    required this.notificacion,
  });
}
final List<Widget> pantallas = [
  PerfilHijo1(),
  PerfilHijo2(),
  PerfilHijo3(),
];
