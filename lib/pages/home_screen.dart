import 'package:flutter/material.dart';
import 'criar_conta_escola.dart';

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
                child: Text(
                  'abaré',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade800,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('CRIAR CONTA RESPONSÁVEL'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
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
                onPressed: () {},
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
