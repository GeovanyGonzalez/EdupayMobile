import 'package:flutter/material.dart';
import 'Micuenta.dart';

void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatefulWidget {
  @override
  _MyApp4State createState() => _MyApp4State();
}
  String contenidoNotificacion1 = '''
Estimados Padres de Familia:

Por medio del presente, les notificamos que el pago de la colegiatura correspondiente al mes de marzo de 2024 para la alumna Ana Ojeda, del grado Tercero grupo B, se encuentra vencido.

Fecha límite de pago: 17/04/2024
Monto a pagar: 1500
''';
String contenidoNotificacion2 = '''
Estimados Padres de Familia:

Por medio del presente, les informamos que se ha organizado un evento para todos los niños de la escuela primaria privada Instituto de Mexico. El evento se llevará a cabo el 19/03/2024 a las 9 am en nuestra institucion.

El costo del evento es de 200 por niño e incluye:

Boletos para las atracciones y almuerzo
''';
class _MyApp4State extends State<MyApp4> {
  final List<Notificacion> _notificaciones = [
    Notificacion('Ana Ojeda Pago', contenidoNotificacion1, 'imagen1.png'),
    Notificacion('Pago de evento', contenidoNotificacion2, 'imagen2.png'),
    Notificacion('Notificacion de prueba', 'Esta es una notificacion de prueba', 'imagen3.png'),
  ];
  final Map<int, bool> _isExpanded = {0: false, 1: false, 2: false};

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
                      Text('Notificaciones', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    ],
                  ),
                ),

                // Contenedor rectangular vertical con bordes circulares y contenido
                for (var i = 0; i < _notificaciones.length; i++) ...[
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                    padding: EdgeInsets.all(20),
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _notificaciones[i].nombre,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isExpanded[i] != null && _isExpanded[i]! ? Icons.expand_less : Icons.expand_more,
                              ),
                              onPressed: () {
                                setState(() {
                                  for (var j = 0; j < _isExpanded.length; j++) {
                                    _isExpanded[j] = (i == j);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        if (_isExpanded[i] != null && _isExpanded[i]!)
                          Column(
                            children: [
                              Text(
                                _notificaciones[i].contenido,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Notificacion {
  final String nombre;
  final String contenido;
  final String imagen;

  Notificacion(this.nombre, this.contenido, this.imagen);
}
