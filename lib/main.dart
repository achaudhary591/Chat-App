import 'package:chat_app/screens/screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyHomePage(),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    // TODO: implement build

    return FutureBuilder(
      future: _initialization,
      builder: (context, appSnapshot) {
        return MaterialApp(
          title: 'Chat App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            buttonTheme: ButtonTheme.of(context).copyWith(
                textTheme: ButtonTextTheme.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.indigo,
              backgroundColor: Colors.white,
              accentColor: Colors.amber,
              errorColor: Colors.orange,
            ).copyWith(secondary: Colors.indigoAccent),
            useMaterial3: true,
          ),
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if(userSnapshot.connectionState == ConnectionState.waiting){
                return SplashScreen();
              }
              if (userSnapshot.hasData) {
                return const ChatScreen();
              }
              return const AuthScreen();
            },
          ),
        );
      },
    );
  }
}
