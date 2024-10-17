import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Dio dio = Dio();
  String? token;

  Future<void> registerUser() async {
    try {
      final response = await dio.post(
        'http://localhost:8080/your-project-path/user',
        data: {
          'action': 'register',
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      );
      print(response.data);
    } catch (e) {
      print('Error registering user: $e');
    }
  }

  Future<void> loginUser() async {
    try {
      final response = await dio.post(
        'http://localhost:8080/your-project-path/user',
        data: {
          'action': 'login',
          'username': _usernameController.text,
          'password': _passwordController.text,
        },
      );
      if (response.data['status'] == "Login successful") {
        token = response.data['token'];
        print("Token: $token");
      }
      print(response.data);
    } catch (e) {
      print('Error logging in: $e');
    }
  }

  Future<void> fetchProtectedData() async {
    if (token == null) return;
    try {
      final response = await dio.get(
        'http://localhost:8080/your-project-path/user',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(response.data);
    } catch (e) {
      print('Error fetching protected data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter JWT Example'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          ElevatedButton(
            onPressed: registerUser,
            child: Text('Register'),
          ),
          ElevatedButton(
            onPressed: loginUser,
            child: Text('Login'),
          ),
          ElevatedButton(
            onPressed: fetchProtectedData,
            child: Text('Get Protected Data'),
          ),
        ],
      ),
    );
  }
}
