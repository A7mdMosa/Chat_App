import 'package:flutter/material.dart';

import '../widgets/hero_widget.dart';
import '../widgets/sign_button.dart';
import '../screens/sign_screen.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: const <Widget>[
                HeroWidget(
                  height: 30,
                ),
                HeroText(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Stay connect with your favorite people ... ',
                        style: Theme.of(context).textTheme.headline1),
                  ),
                  Image.asset(
                      '/Users/Moussa/Developer/VSCode/chat_app/assets/images/chat.png'),
                ],
              ),
            ),
            SignButton(
              text: 'Log In',
              color: Colors.white,
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.pushNamed(context, SignScreen.logIn);
              },
            ),
            const SizedBox(height: 13),
            SignButton(
              text: 'Sign Up',
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, SignScreen.signUp);
              },
            ),
          ],
        ),
      ),
    );
  }
}
