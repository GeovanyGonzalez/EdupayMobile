import 'package:flutter/material.dart';

void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // Fila superior con icono de usuario y nombre
                Container(
                  padding: EdgeInsets.only(top: 10, left: 30, right: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person, size: 20),
                      Text('  Edupay', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),

                // Mensaje de bienvenida
                Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Notificaciones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    ],
                  ),
                ),

                // Contenedor rectangular vertical con bordes circulares y contenido
                Container(
                  margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                  padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      // Cada notificación independiente
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 1'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 2'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 3'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 4'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 5'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 6'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 7'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: double.infinity,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                        children: <Widget>[
                          // Agregar el icono de notificación
                          Row(
                            children: <Widget>[
                              Icon(Icons.notifications, size: 20),
                              SizedBox(width: 10),
                              // Agregar el texto de la notificación
                              Text('Notificacion 8'),
                            ],
                          ),
                          // Posicionar un widget "Nuevo" en la esquina superior derecha
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 244, 238, 54),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text('New', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                      // ... (agrega más notificaciones según sea necesario)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
