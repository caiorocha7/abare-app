import 'package:flutter/material.dart';
import 'perfil.dart'; // Certifique-se de importar a tela de perfil corretamente
import 'detalhes_aluno.dart'; // Se necessário, você pode manter ou remover conforme sua estrutura de navegação.

class TurmaScreen extends StatefulWidget {
  const TurmaScreen({super.key});

  @override
  _TurmaScreenState createState() => _TurmaScreenState();
}

class _TurmaScreenState extends State<TurmaScreen> {
  final int _selectedIndex = 0; // Home será a primeira aba

  // Mocked profile data
  final String userName = "Ana Souza";
  final String userRole = "Responsável";
  final String userEmail = "ana.souza@email.com";
  final String userPhone = "(86) 9 1234-5678";

  // Dados mockados para diários recentes
  final List<Map<String, String>> recentDiaries = [
    {
      'title': 'Avanço na Comunicação',
      'content': 'Iniciou a combinação de duas palavras em frases simples.',
      'date': '2024-02-10'
    },
    {
      'title': 'Progresso na Interação Social',
      'content': 'Mostrou interesse em brincar com outras crianças na escola.',
      'date': '2024-02-08'
    },
  ];

  // Função para abrir o formulário de diário
  void _fillDiario() {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();
    TextEditingController _dateController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Preencher Diário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: "Título do Diário"),
              ),
              TextField(
                controller: _descriptionController,
                decoration:
                    const InputDecoration(hintText: "Descrição do Diário"),
                maxLines: 3,
              ),
              TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                    hintText: "Data do Diário (ex: 25/10/2024)"),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Fechar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode salvar o diário preenchido
                setState(() {
                  recentDiaries.add({
                    'title': _titleController.text,
                    'content': _descriptionController.text,
                    'date': _dateController.text,
                  });
                });
                Navigator.of(context).pop();
              },
              child: const Text('Salvar Diário'),
            ),
          ],
        );
      },
    );
  }

  // Função de navegação para outras telas
  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        // Estamos na tela de Home
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const PerfilScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/abare_logo.png', // Caminho para o asset da imagem
          width: 100, // Largura ajustada para o AppBar
          height: 40, // Altura ajustada
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const PerfilScreen()),
              );
            },
          ),
        ],
      ),
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
          children: [
            // Perfil do usuário (Quem está acessando)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('assets/images/profile_placeholder.png'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userName,
                          style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold)),
                      Text(userRole,
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey)),
                      Text(userEmail,
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey)),
                      Text(userPhone,
                          style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),

            // Card com a próxima sessão
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                title: const Text('Próxima Sessão',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Data: 25/10/2024'),
                    Text('Hora: 10:00 AM'),
                    Text('Psicólogo: Dra. Mariana'),
                  ],
                ),
              ),
            ),

            // Lista de diários recentes
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Últimos Diários',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: recentDiaries.length,
                itemBuilder: (context, index) {
                  final diary = recentDiaries[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(diary['title']!),
                      subtitle: Text(diary['content']!),
                      trailing: Text(diary['date']!),
                    ),
                  );
                },
              ),
            ),

            // Botão de ver mais diários
            ElevatedButton(
              onPressed: () {
                // Navegar para a tela de mais diários ou detalhes
                // (Essa parte pode ser detalhada mais adiante)
              },
              child: const Text('Ver Mais'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade800,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
          ],
        ),
      ),
      // Botão flutuante para preencher o diário
      floatingActionButton: FloatingActionButton(
        onPressed: _fillDiario,
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal.shade800,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
}
