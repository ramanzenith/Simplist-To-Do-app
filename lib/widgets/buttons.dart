import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  Buttons({super.key, required this.buttontext, required this.onPressed});
  String buttontext;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(child: Text(buttontext), onPressed: onPressed);
  }
}
