import 'package:flutter/material.dart';
import 'chat.dart';
import 'home_escola.dart';
import 'tela_login.dart'; // Adicione o import correto para a tela de login.

class PerfilScreen extends StatefulWidget {
  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  int _selectedIndex = 2; // Perfil será a terceira aba

  final TextEditingController _nomeController = TextEditingController(text: 'Caio');
  final TextEditingController _telefoneController = TextEditingController(text: '(88) 88888-8888');
  final TextEditingController _emailController = TextEditingController(text: 'abare@abare.com');
  final TextEditingController _cpfController = TextEditingController(text: '888********');

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => TurmaScreen()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
          break;
        case 2:
          break;
      }
    }
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double paddingHorizontal = screenWidth * 0.05;
    double paddingVertical = screenHeight * 0.05;
    double avatarRadius = screenWidth * 0.15;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Colors.teal.shade800,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TurmaScreen()),
            );
          },
        ),
      ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: avatarRadius * 0.3,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.camera_alt, size: avatarRadius * 0.3, color: Colors.teal.shade800),
                  ),
                ),
              ),
              SizedBox(height: paddingVertical * 0.5),
              _buildProfileInfoRow('Nome', _nomeController.text, screenWidth),
              _buildProfileInfoRow('Telefone', _telefoneController.text, screenWidth),
              _buildProfileInfoRow('Email', _emailController.text, screenWidth),
              _buildProfileInfoRow('CPF', _cpfController.text, screenWidth),
              SizedBox(height: paddingVertical),
              ElevatedButton(
                onPressed: _logout,
                child: Text('Sair da conta', style: TextStyle(fontSize: screenWidth * 0.04)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red.shade300,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2, vertical: screenHeight * 0.02),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal.shade800,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildProfileInfoRow(String label, String value, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
