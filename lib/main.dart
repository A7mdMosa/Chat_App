import 'package:chat_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '/screens/sign_screen.dart';
import '/screens/home_page.dart';
import '/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  ChatApp({Key? key}) : super(key: key);

  final ThemeData chatTheme = ChatTheme.light();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: chatTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        ChatScreen.route: (context) => const ChatScreen(),
        SignScreen.logIn: (contect) => const SignScreen(selectedIndex: 0),
        SignScreen.signUp: (contect) => const SignScreen(selectedIndex: 1),
      },
    );
  }
}
