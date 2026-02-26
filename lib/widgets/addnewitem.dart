import 'package:flutter/material.dart';
import 'package:practice5/widgets/buttons.dart';

class Addnewitem extends StatelessWidget {
  Addnewitem({super.key, required this.onsave, required this.controllers});
  VoidCallback onsave;
  final controllers;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      actions: [
        Padding(padding: const EdgeInsets.only(left:8.0,right:8.0,top:16.0), 
        child: TextField(controller: controllers,decoration: InputDecoration(hintText: 'Enter a task'),)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Buttons(buttontext: 'save', onPressed: onsave),
            Buttons(
              buttontext: 'cancel',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ],
    );
  }
}
