import 'package:flutter/material.dart';

class PerfilHijo2 extends StatelessWidget {
  const PerfilHijo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 242, 253),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 139, 85, 231),
        title: Text('Perfil de Alondra Vargas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              _buildCabecera(context),
              SizedBox(height: 16.0),
              _buildPendientesSection(context),
 // Separación entre el rectángulo del papá y los de los hijos
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
            backgroundImage: AssetImage('img/niña chica.jpg'),
          ),
          SizedBox(height: 16.0),
          Text(
            'Alondra Vargas Grande',
            style: TextStyle(fontSize: 20.0),
          ),
          _buildInformacionSeccion(context, 'Escuela', 'Instituto de México'),
          _buildInformacionSeccion(context, 'Teléfono', 'null'),
          _buildInformacionSeccion(context, 'Email', 'Alondra@edupay.com'),
          _buildInformacionSeccion(context, 'Dirección', 'Unidad Habitacional Morelos'),
        ],
      ),
    );
  }

Widget _buildPendientesSection(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1.0,
          blurRadius: 5.0,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 8.0, // Ajusta el espacio entre filas
      children: <Widget>[
        Text(
          'Pendientes:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.0),
        Align(
          alignment: Alignment.center,
          child: _buildPendienteBox(context, 'Pago de la colegiatura de Alondra Vargas'),
        ),
        SizedBox(height: 8.0),
        Align(
          alignment: Alignment.center,
          child: _buildPendienteBox(context, 'Pago de recursamiento de matematicas'),
        ),
      ],
    ),
  );
}


  Widget _buildPendienteBox(BuildContext context, String pendiente) {
    return Container( // Container for each pendiente
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Add background color
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(
        pendiente,
        style: TextStyle(
          fontSize: 16.0,
        ),
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
