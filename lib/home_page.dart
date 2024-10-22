import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String jwt;

  HomePage({required this.jwt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Your JWT Token: $jwt'),
      ),
    );
  }
}
