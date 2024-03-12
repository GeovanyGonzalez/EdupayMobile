import 'package:edupay/Menulateral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For CVV input formatting
import 'package:loading_animation_widget/loading_animation_widget.dart'; // Added for loading animation

class PagoTarjetaScreen extends StatefulWidget {
  const PagoTarjetaScreen({Key? key}) : super(key: key);

  @override
  State<PagoTarjetaScreen> createState() => _PagoTarjetaScreenState();
}
  bool isLoading = false; // Flag to control loading

class _PagoTarjetaScreenState extends State<PagoTarjetaScreen> {
  final _formKey = GlobalKey<FormState>();

  String _cardholderName = '';
  String _cardNumber = '';
  String _cvv = '';
  int _month = 0;
  int _year = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago con tarjeta'),
      ),
      body: SingleChildScrollView( // Allow content to scroll if necessary
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Cardholder Name
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Titular de la tarjeta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el nombre del titular';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() => _cardholderName = value);
                },
              ),

              const SizedBox(height: 16.0),

              // Card Number
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Número de tarjeta',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
inputFormatters: [
  LengthLimitingTextInputFormatter(9), // Limit to 4 digits
  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el número de la tarjeta';
                  }
                  // Additional validation (optional)
                  return null;
                },
                onChanged: (value) {
                  setState(() => _cardNumber = value);
                },
              ),

              const SizedBox(height: 16.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expiry Month
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Mes',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(2), // Limit to 2 digits
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Ingrese el mes de vencimiento';
                        }
                        final month = int.tryParse(value);
                        if (month == null || month < 1 || month > 12) {
                          return 'Mes inválido';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => _month = int.tryParse(value) ?? 0);
                      },
                    ),
                  ),

                  const SizedBox(width: 16.0), // Spacing between fields

                  // Expiry Year
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Año',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(4), // Limit to 4 digits
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
validator: (value) {
  if (value!.isEmpty) {
    return 'Ingrese el año de vencimiento';
  }

                    final year = int.tryParse(value);
                        if (year == null || year < DateTime.now().year) {
                          return 'Año inválido';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() => _year = int.tryParse(value) ?? 0);
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16.0),

              // CVV
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(3), // Limit to 3 digits
                ],
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el código CVV';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() => _cvv = value);
                },
              ),

              const SizedBox(height: 32.0),

              // Botón de pago
              ElevatedButton(
  onPressed: isLoading ? null : () async {
    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true); // Show loading indicator

      try {
        // Simulate payment processing (replace with your actual payment logic)
        await Future.delayed(const Duration(seconds: 2));

        // Navigate to success screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyApp3(),
          ),
        );

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Pago realizado'),
            content: const Text('Gracias por realizar el pago presione ok para continuar'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          ),
        );
      } finally {
        setState(() => isLoading = false); // Hide loading indicator
      }
    }
  },
  child: isLoading
      ? LoadingAnimationWidget.staggeredDotsWave(color: Colors.deepPurple, size: 50)
      : const Text('Pagar'),
),

            ],
          ),
        ),
      ),
    );
  }
}

