// import 'dart:convert';
// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';

// import 'package:jwt_tokene_example/login_page.dart';

// class RegisterPage extends StatelessWidget {
//   final TextEditingController contactNumberController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final dio = Dio();


// Future<void> register(BuildContext context) async {
//   try {
//     final response = await dio.post(
//       'http://192.168.29.171:8080/flutter_php_auth/register.php',
//       data: {
//         'contact_number': contactNumberController.text,
//         'username': usernameController.text,
//         'password': passwordController.text,
//       },
//     );

//     log("Response status: ${response.statusCode}");
//     log("Response data: ${response.data}");

//     // Check if the response status is OK
//     if (response.statusCode == 200) {
//       // final data = response.data; // Get the response data

//  Map<String, dynamic> data;

//       // If response.data is not already a Map, decode it
      
//         data = json.decode(response.data);
//          log("inside ----- "+data["message"].toString());
//       // Ensure data is a Map and check the message
      // if (data['message'] == 'User registered successfully') {
      //   log('Navigating to LoginPage...');
      //   Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(builder: (context) => LoginPage()),
      //   );
      // } else {
      //   log('Server message: ${data['message']}'); // Log any other message from the server
      // }
//     } else {
//       log('Registration failed with status: ${response.statusCode}');
//     }
//   } catch (e) {
//     log('Error during registration: $e');
//   }
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: contactNumberController,
//               decoration: InputDecoration(labelText: 'Contact Number'),
//             ),
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
//               onPressed:() {
//                register(context) ;
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
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jwt_tokene_example/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final dio = Dio();

  Future<void> register(BuildContext context) async {
    try {
      final response = await dio.post(
        'http://192.168.29.171:8080/flutter_php_auth/register1.php',
        data: {
          'contact_number': contactNumberController.text,
          'username': usernameController.text,
          'password': passwordController.text,
        },
      );

      if (response.statusCode == 200) {
         Map<String, dynamic> data;
        data = json.decode(response.data);
//          log("inside ----- "+data["message"].toString());
        print("message====="+data['message']);     
         if (data['message'] == 'User registered successfully.') {
        log('Navigating to LoginPage...');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        log('Server message: ${data['message']}'); // Log any other message from the server
      }

      } else {
        print('Registration failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during registration: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: contactNumberController,
              decoration: InputDecoration(labelText: 'Contact Number'),
            ),
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
              onPressed: () => register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
