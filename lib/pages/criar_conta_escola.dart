import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tela_login.dart';

class CriarContaEscola extends StatefulWidget {
  const CriarContaEscola({super.key});

  @override
  _CriarContaEscolaState createState() => _CriarContaEscolaState();
}

class _CriarContaEscolaState extends State<CriarContaEscola> {
  final TextEditingController _nomeEscolaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _estadoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _bairroController = TextEditingController();

  @override
  void dispose() {
    _nomeEscolaController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _celularController.dispose();
    _estadoController.dispose();
    _cidadeController.dispose();
    _bairroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingHorizontal = screenWidth * 0.1;
    double paddingVertical = screenHeight * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.teal.shade200],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'CRIAR MINHA CONTA',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal.shade800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: screenHeight * 0.02),
              buildTextField('Nome da Escola', _nomeEscolaController),
              buildTextFieldEmail('Email', _emailController),
              buildTextFieldSenha('Senha', _senhaController),
              buildTextFieldNumeric('Celular', _celularController),
              buildTextField('Estado', _estadoController),
              buildTextField('Cidade', _cidadeController),
              buildTextField('Bairro', _bairroController),
              SizedBox(height: screenHeight * 0.03),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                    print("Nome da Escola: ${_nomeEscolaController.text}");
                    print("Email: ${_emailController.text}");
                    print("Senha: ${_senhaController.text}");
                    print("Celular: ${_celularController.text}");
                    print("Estado: ${_estadoController.text}");
                    print("Cidade: ${_cidadeController.text}");
                    print("Bairro: ${_bairroController.text}");
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.teal),
                    foregroundColor: WidgetStateProperty.all(Colors.white),
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
                  ),
                  child: const Text('CRIAR CONTA ESCOLA'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildTextFieldNumeric(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildTextFieldEmail(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildTextFieldSenha(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
