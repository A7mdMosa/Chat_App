import 'package:chat_app/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StreamWidget extends StatelessWidget {
  const StreamWidget(
      {Key? key, required this.firebaseFirestore, required this.user})
      : super(key: key);

  final FirebaseFirestore firebaseFirestore;
  final String? user;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: firebaseFirestore
            .collection('messages')
            .orderBy('time')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snapshots = snapshot.data!.docs.reversed;

            List<ChatWidget> textWidgets = [];
            for (var snap in snapshots) {
              final String text = snap.get('text');
              final String sender = snap.get('sender');

              final textWidget = ChatWidget(
                text: text,
                sender: sender,
                isMe: user == sender,
              );

              textWidgets.add(textWidget);
            }
            return Expanded(
              child: ListView(
                reverse: true,
                children: textWidgets,
              ),
            );
          }
          return const Center(child: Text('there is no data'));
        });
  }
}
