import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home'); // Substitua '/home' pela rota da sua tela inicial
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/betalent.png'),
      ),
    );
  }
}