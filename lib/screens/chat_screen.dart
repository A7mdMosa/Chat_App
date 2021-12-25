import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/home_page.dart';
import '../widgets/hero_widget.dart';
import '../widgets/stream_widget.dart';

class ChatScreen extends StatefulWidget {
  static const String route = '/chat_screen';

  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;

  late String inputText;
  late final User loggedInUser;

  void getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      //
    }
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: const <Widget>[
            HeroWidget(
              height: 40,
            ),
            HeroText(),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.route);
                _auth.signOut();
              },
              child: const Text('Log out'))
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamWidget(
                firebaseFirestore: _firebaseFirestore,
                user: loggedInUser.email),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyText2,
                      controller: msgTextController,
                      onChanged: (value) {
                        inputText = value;
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        hintText: 'Type your message ...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    msgTextController.clear();
                    if (inputText != '') {
                      try {
                        _firebaseFirestore.collection('messages').add({
                          'sender': loggedInUser.email,
                          'text': inputText,
                          'time': Timestamp.now()
                        });
                      } catch (e) {
                        //
                      }
                    }
                    inputText = '';
                  },
                  child: const Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
