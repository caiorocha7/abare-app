import 'dart:convert';
import 'package:flutter/material.dart';
import 'home_escola.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _responseMessage = '';

  // Mocked user credentials
  final String _mockEmail = "abare@abare.com";
  final String _mockPassword = "12345678";

  // Function to simulate login
  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == _mockEmail && password == _mockPassword) {
      setState(() {
        _responseMessage = 'Login bem-sucedido!';
      });

      // Simulando o direcionamento para a tela "TurmaScreen" após login bem-sucedido.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TurmaScreen()),
      );
    } else {
      setState(() {
        _responseMessage = 'Falha no login. Verifique suas credenciais.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.teal.shade200],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/abare_logo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 60),
            Text(
              'ENTRAR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade800,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _login,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
              child: const Text('ENTRAR'),
            ),
            const SizedBox(height: 20),
            Text(
              _responseMessage,
              style: TextStyle(
                color: _responseMessage.contains('bem-sucedido')
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
