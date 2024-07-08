import 'package:abare/pages/home_escola.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController _controller = TextEditingController();
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    _sendInitialBotMessage();
  }

  void _sendInitialBotMessage() {
    setState(() {
      messages.add({'text': '1 - Atualizações Diárias', 'sender': 'Bot', 'isUser': 'false', 'option': 'Atualizações Diárias'});
      messages.add({'text': '2 - Comunicação com Escola', 'sender': 'Bot', 'isUser': 'false', 'option': 'Comunicação com Escola'});
      messages.add({'text': '3 - Eventos Escolares', 'sender': 'Bot', 'isUser': 'false', 'option': 'Eventos Escolares'});
    });
  }

  void _sendMessage() {
    final String text = _controller.text;
    if (text.isNotEmpty) {
      setState(() {
        messages.add({'text': text, 'sender': 'Você', 'isUser': 'true'});
        messages.add({'text': 'Resposta automática do bot', 'sender': 'Bot', 'isUser': 'false'});
        _controller.clear();
      });
    }
  }

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
      messages.clear();
    });
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    final bool isUser = message['isUser'] == 'true';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: message['option'] != null ? () => _selectOption(message['option']!) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            color: isUser ? Colors.teal.shade800 : (message['option'] != null ? Colors.blue.shade100 : Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message['sender']!,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                message['text']!,
                style: TextStyle(
                  fontSize: 16,
                  color: isUser ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChat() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[messages.length - 1 - index];
              return _buildMessage(message);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Digite sua mensagem...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedOption.isEmpty ? 'Chat' : _selectedOption),
        backgroundColor: Colors.teal.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_selectedOption.isEmpty) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TurmaScreen()),
              );
            } else {
              setState(() {
                _selectedOption = '';
                messages.clear();
                _sendInitialBotMessage();
              });
            }
          },
        ),
      ),
      body: _buildChat(),
    );
  }
}
