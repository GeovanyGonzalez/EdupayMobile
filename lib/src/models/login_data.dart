import 'package:http/http.dart' as http;

class LoginData {
  final String password;
  final String email;

  LoginData({required this.password, required this.email});
}
const loginUrl = 'https://edupay-oi22.onrender.com/login';

Future<http.Response> login(LoginData data) async {
  final params = {'email': data.email, 'contraseña': data.password};
  final response = await http.post(Uri.parse(loginUrl), body: params);
  return response;
}

Future<void> handleLogin(String usuario, String password )async {
  final data = LoginData(email: usuario, password: password);
  final response = await login(data);

  if (response.statusCode == 200) {
    // Parsear respuesta, almacenar ID de usuario de forma segura (si aplica)
    print('¡Inicio de sesión exitoso!');
    // Proceder con operaciones autorizadas
  } else {
    // Manejar error basado en código de respuesta y documentación de la API
    print('Inicio de sesión fallido: ${response.statusCode} - ${response.body}');
    // Mostrar mensaje de error al usuario y ofrecer soluciones
  }
}
