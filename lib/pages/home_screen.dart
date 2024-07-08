import 'package:flutter/material.dart';
import 'tela_login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.teal.shade200],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: 
                Image.asset(
                  'assets/images/abare_logo.png',  // Caminho para o asset da imagem
                  width: 200,  // Define a largura da imagem (opcional)
                ),
              ),
              
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.teal),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                  textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 20)),
                ),
                child: const Text('ENTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
