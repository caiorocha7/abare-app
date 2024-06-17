import 'package:flutter/material.dart';
import 'criar_conta_escola.dart';
import 'tela_login.dart';

class HomeScreen extends StatelessWidget {
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CriarContaEscola()));
                },
                child: Text('CRIAR CONTA ESCOLA'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text('ENTRAR'),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Colors.teal)),
                  foregroundColor: MaterialStateProperty.all(Colors.teal),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
