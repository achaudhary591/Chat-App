import 'package:chat_app/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          backgroundColor: Colors.white,
          accentColor: Colors.amber,
          errorColor: Colors.orange,
        ).copyWith(secondary: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: ChatScreen(),
    );
  }
}
