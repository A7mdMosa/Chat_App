import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    required this.text,
    required this.color,
    required this.onPressed,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: color,
      elevation: 5,
      constraints: const BoxConstraints(
        minWidth: 300,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: textColor)),
      ),
    );
  }
}
