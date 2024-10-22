// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'home_page.dart';
// import 'register_page.dart'; // Make sure to import the RegisterPage

// class LoginPage extends StatelessWidget {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final storage = FlutterSecureStorage();
//   final dio = Dio();


// Future<void> login(BuildContext context) async {
//   try {
//     final response = await dio.post(
//       'http://192.168.29.171:8080/flutter_php_auth/login.php',
//       data: json.encode({
//         'username': usernameController.text,
//         'password': passwordController.text,
//       }),
//       options: Options(
//         headers: {
//           'Content-Type': 'application/json',
//         },
//       ),
//     );

//     if (response.statusCode == 200) {
//       final data = json.decode(response.data);
//       log("Response: ${data["message"]}");

//       if (data['message'] == 'Login successful') {
//         // Store JWT and navigate to HomePage
//         await storage.write(key: 'jwt', value: data['jwt']);
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } else {
//         log('Server message: ${data['message']}');
//       }
//     } else {
//       print('Login failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error during login: $e');
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration: InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => login(context), // Pass context to login function
//               child: Text('Login'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterPage()),
//                 );
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jwt_tokene_example/register_page.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio = Dio();

  Future<void> login(BuildContext context) async {
    try {
      final response = await dio.post(
        'http://192.168.29.171:8080/flutter_php_auth/login1.php',
        data: {
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.data);
        if (data['jwt'] != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(jwt: data['jwt']),
            ),
          );
        } else {
          print(data['message']);
        }
      } else {
        print('Login failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => login(context),
              child: Text('Login'),
            ),
              TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text('Don\'t have an account? Register here.'),
            ),
          ],
        ),
      ),
    );
  }
}
