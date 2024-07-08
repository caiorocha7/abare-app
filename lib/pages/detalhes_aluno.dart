import 'package:flutter/material.dart';

class AlunoDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> aluno;

  const AlunoDetailsScreen({super.key, required this.aluno});

  @override
  _AlunoDetailsScreenState createState() => _AlunoDetailsScreenState();
}

class _AlunoDetailsScreenState extends State<AlunoDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, String>> atividades = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  void _addAtividade(String titulo, String descricao, String professor) {
    setState(() {
      atividades.add({
        'titulo': titulo,
        'descricao': descricao,
        'dataHora': DateTime.now().toString(),
        'professor': professor
      });
    });
  }

  void _showAddAtividadeDialog() {
    final TextEditingController tituloController = TextEditingController();
    final TextEditingController descricaoController = TextEditingController();
    final TextEditingController professorController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Atividade'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tituloController,
                decoration: const InputDecoration(hintText: "Título da Atividade"),
              ),
              TextField(
                controller: descricaoController,
                decoration: const InputDecoration(hintText: "Descrição da Atividade"),
              ),
              TextField(
                controller: professorController,
                decoration: const InputDecoration(hintText: "Nome do Professor"),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Adicionar'),
              onPressed: () {
                _addAtividade(tituloController.text, descricaoController.text, professorController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDetalhesAtividadeDialog(Map<String, String> atividade) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(atividade['titulo'] ?? 'Detalhes da Atividade'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Descrição: ${atividade['descricao']}'),
              const SizedBox(height: 10),
              Text('Professor: ${atividade['professor']}'),
              const SizedBox(height: 10),
              Text('Data/Hora: ${atividade['dataHora']}'),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.aluno['nome']),
        backgroundColor: Colors.teal.shade800,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,  // Cor do texto selecionado
          unselectedLabelColor: Colors.white70,  // Cor do texto não selecionado
          indicatorColor: Colors.white,  // Cor do indicador
          tabs: const [
            Tab(text: 'Informações'),
            Tab(text: 'Diário'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildInformacoesTab(),
          _buildDiarioTab(),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              onPressed: _showAddAtividadeDialog,
              backgroundColor: Colors.teal.shade800,
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildInformacoesTab() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.teal.shade200],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile_placeholder.png'), // Placeholder para a foto do aluno
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.aluno['nome'],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal.shade800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Resumo: Breve resumo sobre o aluno será exibido aqui.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.teal.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiarioTab() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.teal.shade200],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: atividades.length,
              itemBuilder: (context, index) {
                final atividade = atividades[index];
                return GestureDetector(
                  onTap: () => _showDetalhesAtividadeDialog(atividade),
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(atividade['titulo']!),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
