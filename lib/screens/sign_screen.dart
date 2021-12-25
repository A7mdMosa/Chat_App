import 'package:flutter/material.dart';

import '../services/login.dart';
import '../services/signup.dart';
import '../widgets/hero_widget.dart';

class SignScreen extends StatefulWidget {
  static const String logIn = 'log_screen';
  static const String signUp = 'sign_screen';
  final int selectedIndex;

  const SignScreen({required this.selectedIndex, Key? key}) : super(key: key);

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  late final int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: selectedIndex,
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const HeroText(),
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Log In',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Sign Up',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ),
        body: const SafeArea(
            child: TabBarView(
          children: [LogIn(), SignUp()],
        )),
      ),
    );
  }
}
