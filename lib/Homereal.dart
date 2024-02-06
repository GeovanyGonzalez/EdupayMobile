import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 242, 197, 250), //  Aquí se establece el color de fondo
      ),
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
                    Text('Hola Edupay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    Text('bienvenido a EDUPAY                                ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                    Text(' ', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              // Imagen
              Container(
                padding: EdgeInsets.only(top: 10, left: 80, right: 80),
                child: Column(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        _buildImageTile(
                          imagePath: 'img/pagospendientes.png',
                          text: 'Pagos pendientes',
                          onTap: () => Navigator.pushNamed(context, '/pantalla1'),
                        ),
                        _buildImageTile(
                          imagePath: 'img/calendarioremaster.png',
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
                          text: 'Historial  de pagos',
                          onTap: () => Navigator.pushNamed(context, '/pantalla4'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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

Widget _buildImageTile({
  required String imagePath,
  required String text,
  required VoidCallback onTap,
}) {
  return ElevatedButton(
    onPressed: onTap,
    child: SizedBox(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    ),
    style: ElevatedButton.styleFrom(
      primary: Color.fromARGB(255, 255, 255, 255),
      onPrimary: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      shadowColor: Colors.grey,
    ),
  );
}
