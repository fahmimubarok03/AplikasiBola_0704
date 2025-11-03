import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const AplikasiBola());
}

class AplikasiBola extends StatelessWidget {
  const AplikasiBola({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Bola',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const LoginPage(),
    );
  }
}
