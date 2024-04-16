import 'package:flutter/material.dart';
import 'Pagotarjeta.dart';

class PagosScreen extends StatefulWidget {
  @override
  _PagosScreenState createState() => _PagosScreenState();
}

class _PagosScreenState extends State<PagosScreen> {
  List<Pago> pagosPendientes = [
    Pago(fecha: "2024-09-06", monto: 1500, descripcion: "Pago de colegiatura de Alondra Vargas"),
    Pago(fecha: "2024-10-07", monto: 200, descripcion: "Pago de evento escolar"),
  ];

  List<Pago> historialPagos = [
    Pago(fecha: "2024-02-28", monto: 1500, descripcion: "Pago de colegiatura de Roberto Vargas"),
    Pago(fecha: "2024-03-01", monto: 1500, descripcion: "Pago de colegiatura de Yui Vargas"),
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
  String fecha;
  double monto;
  String descripcion;

  Pago({required this.fecha, required this.monto, required this.descripcion});
}

class PagoPendienteItem extends StatelessWidget {
  final Pago pago;

  PagoPendienteItem({required this.pago});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(pago.descripcion),
        subtitle: Text("Fecha: ${pago.fecha} - Monto: \$ ${pago.monto}"),
        trailing: ElevatedButton( // Use ElevatedButton instead of RaisedButton
          child: Text("Pagar"),
          onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PagoTarjetaScreen()),
              );          },
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
        title: Text(pago.descripcion),
        subtitle: Text("Fecha: ${pago.fecha} - Monto: \$ ${pago.monto}"),
      ),
    );
  }
}
