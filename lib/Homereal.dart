import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'Micuenta.dart';
import 'pantalla1.dart';
import 'pantalla2.dart';
import 'pantalla3.dart';

void main() {
  runApp(MyApp2());
}

final List<String> notificaciones = [
  'Alondra Vargas Pago de colegiatura',
  'Pago de evento'
];
List<TarjetaEstudiante> estudiantes = [
  TarjetaEstudiante(
    imagen: 'img/Adolecente.jpg',
    nombre: 'Roberto Vargas',
    curso: 'Sexto A',
    notificacion: false,
  ),
  TarjetaEstudiante(
    imagen: 'img/niña chica.jpg',
    nombre: 'Alondra Vargas',
    curso: 'Tercero B',
    notificacion: true,
  ),
  TarjetaEstudiante(
    imagen: 'img/child3.jpg',
    nombre: 'Yui Vargas',
    curso: 'Primero C',
    notificacion: false,
  ),
];

class MyApp2 extends StatefulWidget {
  final storage = const FlutterSecureStorage();

  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  @override
   initState() {
    super.initState();
     getUser();
  }
  dynamic data;

  Future getUser() async {
    final token = await widget.storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('https://edupay-oi22.onrender.com/api/Padre'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        return jsonDecode(response.statusCode.toString());
      });
      
    } else {
      throw Exception('Failed to load user');
    }
  }

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
                          MaterialPageRoute(
                              builder: (context) => PerfilUsuario()),
                        );
                      },
                      child: CircleAvatar(
                        radius: 20, // Adjust size as needed
                        backgroundImage: NetworkImage(
                          data['profilePhoto'].toString(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Add spacing
                    GestureDetector(
                      
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerfilUsuario()),
                        );
                      },
                      child:
                      
                       Text(data['name'].toString(),
                          style: const TextStyle(fontSize: 20)),
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
                    Text('Hola ${data['name'].toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('bienvenido a EDUPAY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('Tu plataforma móvil para un buen ámbito estudiantil',
                        style: TextStyle(fontSize: 20)),
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
                                  MaterialPageRoute(
                                    builder: (context) => pantallas[index],
                                    fullscreenDialog:
                                        true, // Ensure full-screen navigation
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage:
                                        AssetImage(estudiante.imagen),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
              Container(
                //container de centro de notificaciones
                color: Colors.grey[200],
                height: 70.0 * notificaciones.length,
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
                    Text('¿Tienes alguna duda?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('Contacta a nuestro equipo de soporte aquí',
                        style: TextStyle(fontSize: 14)),
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
