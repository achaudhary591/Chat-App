import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  Future<String?> getToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken;
  }

  String imageUrlString = '';

  Future<void> getUserImageUrl() async {

    final String userId = FirebaseAuth.instance.currentUser!.uid;

    final DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    final DocumentSnapshot userSnapshot = await userRef.get();
    final String imageUrl = await userSnapshot.get('image_url');

    setState(() {
      imageUrlString = imageUrl;
    });


    print('imageurlstring===================>$imageUrl');
  }

  @override
  void initState() {
    // TODO: implement initState
    final fbm = FirebaseMessaging.instance;
    fbm.requestPermission();
    FirebaseMessaging.onMessage.listen((message) {
      print(message);
      return;
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print(message);
      return;
    });
    getUserImageUrl();
    // print('multilinestring===================>${getUserImageUrl()}');
    print('TOKEN========>${getToken()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Chat Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigoAccent,
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              icon: CircleAvatar(
                backgroundImage: NetworkImage(imageUrlString!),
              ),
              borderRadius: BorderRadius.circular(20),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: const [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
              ],
              onChanged: (itemIdentifier) {
                if (itemIdentifier == 'logout') {
                  FirebaseAuth.instance.signOut();
                }
              },
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: Messages(),
          ),
          NewMessage(),
        ],
      ),
    );
  }
}
