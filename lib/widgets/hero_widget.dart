import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final double height;

  const HeroWidget({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'logo',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: Image.asset('assets/images/logo.png'),
          height: height,
        ),
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Hero(
      tag: 'text',
      child: Text(
        'Go Chat',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
