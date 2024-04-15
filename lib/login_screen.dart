import 'dart:convert';
import 'package:edupay/Menulateral.dart';
import 'package:edupay/constants.dart';
import 'package:edupay/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String email;
  String password;

  Welcome({
    required this.email,
    required this.password,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        email: json["email"].toString(),
        password: json["password"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// Servicio de Autenticación
class AuthService {
  static Future<Welcome> login(String email, String password) async {
    // Reemplazar 'URL_API' con la URL real de tu API
    final response = await http.post(
      Uri.parse('https://edupay-oi22.onrender.com/api/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;

            // Extraer el token de la respuesta (asumiendo que está en un campo llamado "token")
            final String token = data['token'] as String;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            // Usar el token para recuperar la información del usuario (explicado en el paso 2)
            return Welcome.fromJson(data); // O devolver null si hay un problema
    } else {
      throw Exception('Error al iniciar sesión');
    }
    
  }
  
}

// Pantalla de Inicio de Sesión
class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  const LoginScreen({super.key});

  Duration get loginTime => Duration();

  Future<String?> _loginUser(LoginData data, BuildContext context) async {
    try {
      final response = await http.post(
      Uri.parse('https://edupay-oi22.onrender.com/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': data.name,
        'password': data.password,
      }),
    );
    print('Request URL: ${response.request!.url}');
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body) as Map<String, dynamic>;
            final welcome = Welcome.fromJson(data);

            // Extraer el token de la respuesta (asumiendo que está en un campo llamado "token")
            final String token = data['token'] as String;
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            // Usar el token para recuperar la información del usuario (explicado en el paso 2)
      } else {
      // Show error message
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión')),
      );
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => MyApp(),
  ),
);
    }
        if (response.statusCode == 401) { // Assuming 401 for invalid credentials
  // Show a specific error message indicating invalid account
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Cuenta no encontrada o contraseña incorrecta')),
  );
  // Don't proceed with parsing or navigating
Navigator.of(context).pushReplacement(
  MaterialPageRoute(
    builder: (context) => MyApp(),
  ),
);
}
    } on Exception catch (e) {
    // Show error message
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(
      SnackBar(content: Text(e.toString())),
    );
  }
  }


  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      logo: const AssetImage('img/Edupaycircular.png'),
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      navigateBackAfterRecovery: true,
      loginAfterSignUp: false,
      termsOfService: [
        TermOfService(
          id: 'newsletter',
          mandatory: false,
          text: 'Newsletter subscription',
        ),
        TermOfService(
          id: 'general-term',
          mandatory: true,
          text: 'Term of services',
          linkUrl: 'https://github.com/YosefPalma/flutter_login.git',
        ),
      ],
      additionalSignupFields: [
        const UserFormField(
          keyName: 'Username',
          icon: Icon(FontAwesomeIcons.userLarge),
        ),
        const UserFormField(keyName: 'Name'),
        const UserFormField(keyName: 'Surname'),
        UserFormField(
          keyName: 'phone_number',
          displayName: 'Phone Number',
          userType: LoginUserType.phone,
          fieldValidator: (value) {
            final phoneRegExp = RegExp(
              '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$',
                        );
            if (value != null &&
                value.length < 7 &&
                !phoneRegExp.hasMatch(value)) {
              return "This isn't a valid phone number";
            }
            return null;
          },
        ),
      ],
      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        debugPrint('Login info');
        debugPrint('Name: ${loginData.name}');
        debugPrint('Password: ${loginData.password}');
        return _loginUser(loginData, context);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(
          FadePageRoute(
            builder: (context) => MyApp3(),
          ),
        );
      },

      headerWidget: const IntroWidget(), onRecoverPassword: (String ) {  },
    );
  }
}

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Inicia sesion"),
            ),
            Expanded(child: Divider()),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}
