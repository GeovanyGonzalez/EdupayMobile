import 'dart:convert';
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
   initState()  {
    super.initState();
   }

  List<Pago> pagosPendientes = [
    Pago(
        // ignore: avoid_dynamic_calls
        titulo: "2024-02-28",
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
