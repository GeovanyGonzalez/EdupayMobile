import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de usuario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCabecera(context),
            _buildInformacionUsuario(context),
            _buildHijo(context, 'Hijo 1'),
            _buildHijo(context, 'Hijo 2'),
          ],
        ),
      ),
    );
  }

  Widget _buildCabecera(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/images/usuario.png'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Nombre del usuario',
            style: TextStyle(fontSize: 20.0),
          ),
        ],
      ),
    );
  }

  Widget _buildInformacionUsuario(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        _buildInformacionSeccion(context, 'Escuela', 'Instituto de México'),
        _buildInformacionSeccion(context, 'Email', 'usuario@correo.com'),
        _buildInformacionSeccion(context, 'Teléfono', '555-555-5555'),
        _buildInformacionSeccion(context, 'Ciudad', 'Ciudad de México'),
        _buildInformacionSeccion(context, 'Dirección', 'Calle 123, Colonia 456'),
      ],
    );
  }

  Widget _buildInformacionSeccion(BuildContext context, String seccion, String informacion) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            seccion + ':',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 8.0),
          Text(informacion),
        ],
      ),
    );
  }

  Widget _buildHijo(BuildContext context, String nombreHijo) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage('assets/images/usuario.png'),
          ),
          SizedBox(height: 8.0),
          Text(
            nombreHijo,
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 4.0),
          Text('Grupo: 5°A'),
          SizedBox(height: 4.0),
          Text('Deporte: Fútbol'),
        ],
      ),
    );
  }
}
