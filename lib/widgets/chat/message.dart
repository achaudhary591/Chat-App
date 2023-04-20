import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return FutureBuilder(
      future: Future.value(FirebaseAuth.instance.currentUser),
      builder: (ctx, futureSnapshot) {
        if (futureSnapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: loadingWidget(90),
          );
        }
        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chat')
              .orderBy(
                'createdAt',
                descending: true,
              )
              .snapshots(),
          builder: (ctx, chatSnapshot) {
            if (chatSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: loadingWidget(90),
              );
            }
            final chatDocs = chatSnapshot.data?.docs;
            return ListView.builder(
              reverse: true,
              itemCount: chatDocs?.length,
              itemBuilder: (ctx, index) => MessageBubble(
                chatDocs?[index]['text'],
                chatDocs?[index]['userId'] == futureSnapshot.data?.uid,
              ),
            );
          },
        );
      },
    );
  }
}
