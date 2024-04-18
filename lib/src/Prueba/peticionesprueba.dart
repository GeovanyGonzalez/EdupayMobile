import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Padre Data',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storage = const FlutterSecureStorage();
  String? data;

  Future<void> fetchData() async {
    // Get token from secure storage
    final token = await storage.read(key: 'token');
    if (token == null) {
      // Handle the case where no token is found
      print('Error: No token found in storage');
      
      return;
    }

    // Prepare the request
    final url = Uri.parse('https://edupay-oi22.onrender.com/api/Padre');
    final headers = {'Authorization': 'Bearer $token'};
    final response = await http.get(url, headers: headers);

    // Check for successful response
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        data = json.encode(responseData);
      });
    } else {
      print('Error: Failed to fetch data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padre Data'),
      ),
      body: Center(
        child: data == null ? CircularProgressIndicator() : Text(data!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchData,
        child: Icon(Icons.download),
      ),
    );
  }
}
