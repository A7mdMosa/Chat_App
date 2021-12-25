import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../screens/chat_screen.dart';
import '../widgets/sign_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  late String userName;
  late String email;
  late String password;
  late String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Form(
          key: _formKey,
          child: Expanded(
            child: ListView(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    label: const Text(
                      'Username',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please input the username';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    userName = value;
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
                    } else if (password != confirmPassword) {
                      return 'the password is not matched';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
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
                      'confirm password',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter the password again';
                    } else if (password != confirmPassword) {
                      return 'the password is not matched';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SignButton(
              text: 'Continue',
              color: Theme.of(context).primaryColor,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    _fireStore.collection('users').add({
                      'email': _auth.currentUser!.email,
                      'userName': userName,
                      'userId': _auth.currentUser!.uid
                    });
                    Navigator.pushReplacementNamed(context, ChatScreen.route);
                  } catch (e) {
                    // print(e);
                  }
                }
              },
              textColor: Colors.white),
        ),
      ],
    );
  }
}
