import 'package:flutter/material.dart';

class PerfilUsuario extends StatelessWidget {
  const PerfilUsuario({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 242, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 85, 231),
        title: Text('Perfil de usuario'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildCabecera(context),
              SizedBox(height: 16.0), // Separación entre el rectángulo del papá y los de los hijos
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCabecera(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 205, 205, 205),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('img/Papa.jpg'),//aqui se mostrara el Profile_Photo que se proporciona con el token
          ),
          SizedBox(height: 16.0),
          Text(
            'Vlad Axel Vargas Medina',
            style: TextStyle(fontSize: 20.0),
          ),
          _buildInformacionSeccion(context, 'Nombre: ', 'Vlad Axel'),//aqui se mostrara el Nombre que se proporciona con el token
          _buildInformacionSeccion(context, 'Email: ', 'Vladi@edupay.com'),//aqui se mostrara el email que se proporciona con el token
          _buildInformacionSeccion(context, 'Password: ', '123'),//aqui se mostrara el Lastname que se proporciona con el token
          _buildInformacionSeccion(context, 'Rol: ', 'FATHER'),//aqui se mostrara el Rol que se proporciona con el token
          _buildInformacionSeccion(context, 'Ocupación: ', 'Desarrollo de software'),//aqui se mostrara el Lastname que se proporciona con el token
          _buildInformacionSeccion(context, 'Dirección: ', 'Unidad Habitacional Morelos'),//aqui se mostrara el Lastname que se proporciona con el token
          _buildInformacionSeccion(context, 'Tel: ', '9993868762'),//aqui se mostrara el Lastname que se proporciona con el token
          _buildInformacionSeccion(context, 'Apellidos: ', 'Vargas Medina'),//aqui se mostrara el Lastname que se proporciona con el token

        ],
      ),
    );
  }

  Widget _buildInformacionUsuario(BuildContext context) {
    return Container(); // Se elimina el ListView ya que la información se movió al rectángulo del papá
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

  }
