import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text(
        'Chat Screen',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.indigoAccent,
    ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (ctx, index) => Container(
          padding: const EdgeInsets.all(8),
          child: Text('This works!'),
        ),
      ),
    );
  }
}
