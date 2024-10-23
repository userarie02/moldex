import 'package:flutter/material.dart';
import 'package:iotproj/pages/login.dart';
import 'package:iotproj/pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mold Shield',
      theme: ThemeData(
        fontFamily: 'Product Sans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: {
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
