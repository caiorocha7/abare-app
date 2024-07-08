import 'package:abare/pages/chat.dart';
import 'package:abare/pages/perfil.dart';
import 'package:flutter/material.dart';
import 'detalhes_aluno.dart';

class TurmaScreen extends StatefulWidget {
  const TurmaScreen({super.key});

  @override
  _TurmaScreenState createState() => _TurmaScreenState();
}

class _TurmaScreenState extends State<TurmaScreen> {
  final int _selectedIndex = 0;  // Home será a primeira aba

  List<Map<String, dynamic>> turmas = [
    {
      'nome': '1 Ano A - Médio',
      'alunos': 2,
      'alunosDetalhes': [
        {'nome': 'João Fontenele', 'idade': 21},
        {'nome': 'Lucas Vasconcelos', 'idade': 21}
      ],
      'isExpanded': false
    },
    {
      'nome': '7 Ano B - Fundamental',
      'alunos': 3,
      'alunosDetalhes': [
        {'nome': 'Maria Silva', 'idade': 20},
        {'nome': 'Ana Santos', 'idade': 20},
        {'nome': 'Carlos Souza', 'idade': 20}
      ],
      'isExpanded': false
    },
  ];

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        // Estamos na tela de Turmas
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PerfilScreen(),
          ),
        );
      }
    }
  }

  void addTurma(Map<String, dynamic> novaTurma) {
    setState(() {
      novaTurma['isExpanded'] = false;
      turmas.add(novaTurma);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/abare_logo.png', // Caminho para o asset da imagem
          width: 100, // Largura ajustada para o AppBar
          height: 40, // Altura ajustada
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade800,
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        turmas[index]['isExpanded'] = !turmas[index]['isExpanded'];
                      });
                    },
                    children: turmas.map<ExpansionPanel>((Map<String, dynamic> turma) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(turma['nome']),
                            subtitle: Text('Alunos: ${turma['alunos']}'),
                          );
                        },
                        body: Column(
                          children: turma['alunosDetalhes'].map<Widget>((aluno) {
                            return ListTile(
                              title: Text('Nome: ${aluno['nome']}'),
                              subtitle: Text('Idade: ${aluno['idade']}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.photo),
                                onPressed: () {},
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AlunoDetailsScreen(aluno: aluno),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        isExpanded: turma['isExpanded'],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
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
}
