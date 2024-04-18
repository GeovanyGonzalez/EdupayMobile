import 'dart:convert';
import 'dart:js_util';

import 'package:edupay/Homereal.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Pagotarjeta.dart';

class PagosScreen extends StatefulWidget {
  final Storage = const FlutterSecureStorage();
  @override
  _PagosScreenState createState() => _PagosScreenState();
}

class _PagosScreenState extends State<PagosScreen> {
  @override
  void initState() {
    super.initState();
    getUser();
    notificaciones();
  }
  dynamic data;
  dynamic notificacions;

  Future getUser() async {
    
    final token = await widget.Storage.read(key: 'token');
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
  Future notificaciones() async {
    final response = await http.post(
      Uri.parse('https://edupay-oi22.onrender.com/api/notificaciones'),
      body: {"userid": data["tutorados"][0]["id"]},
    );

    if (response.statusCode == 200) {
      setState(() {
        notificacions = jsonDecode(response.body);
      });
    }
    else {
      throw Exception('Failed to load notificaciones');
    }
  }

  List<Pago> pagosPendientes = [
    Pago(
        // ignore: avoid_dynamic_calls
        titulo: notificacions[0]["title"].toString(),
        descripcion: "Pago de colegiatura de Alondra Vargas"),
    ];

  List<Pago> historialPagos = [
    Pago(
        titulo: "2024-02-28",
        descripcion: "Pago de colegiatura de Roberto Vargas"),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Pagos Pendientes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Pagos pendientes
          Expanded(
            child: ListView.builder(
              itemCount: pagosPendientes.length,
              itemBuilder: (context, index) {
                return PagoPendienteItem(pago: pagosPendientes[index]);
              },
            ),
          ),
          // Historial de pagos
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              "Historial de pagos",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: historialPagos.length,
              itemBuilder: (context, index) {
                return HistorialPagoItem(pago: historialPagos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Pago {
  String titulo;
  String descripcion;


  Pago({required this.titulo, required this.descripcion, });
}

class PagoPendienteItem extends StatelessWidget {
  final Pago pago;

  PagoPendienteItem({required this.pago});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pago.titulo),
        subtitle: Text("Fecha: ${pago.descripcion} }"),
        trailing: ElevatedButton(
          // Use ElevatedButton instead of RaisedButton
          child: Text("Pagar"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PagoTarjetaScreen()),
            );
          },
        ),
      ),
    );
  }
}

class HistorialPagoItem extends StatelessWidget {
  final Pago pago;

  HistorialPagoItem({required this.pago});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pago.titulo),
        subtitle: Text("Fecha: ${pago.descripcion}"),
      ),
    );
  }
}
