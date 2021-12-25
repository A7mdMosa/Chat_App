import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/hero_widget.dart';
import '../widgets/sign_button.dart';
import '../screens/chat_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView(children: [
              const SizedBox(
                height: 10,
              ),
              const HeroWidget(height: 200),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    label: const Text(
                      'Email',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please input the email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    label: const Text(
                      'Password',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter the password';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SignButton(
              text: 'Log In',
              color: const Color(0xffF4F4F4),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    Navigator.pushReplacementNamed(context, ChatScreen.route);
                  } catch (e) {
//
                  }
                }
              },
              textColor: Theme.of(context).primaryColor),
        ),
      ],
    );
  }
}
