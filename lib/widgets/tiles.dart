import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Tiles extends StatelessWidget {
  Tiles({
    super.key,
    required this.tiletext,
    required this.tilebool,
    required this.onChanged,
    required this.deletefunc,
    required this.editfunc,
  });
  String tiletext;
  bool tilebool;
  void Function(bool?)? onChanged;
  VoidCallback deletefunc;
  VoidCallback editfunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, right: 14.0, left: 14.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                editfunc();
              },
              borderRadius: BorderRadius.circular(10),
              icon: Icons.edit,
              backgroundColor: Colors.blue,
            ),
            SlidableAction(
              onPressed: (context) {
                deletefunc();
              },
              borderRadius: BorderRadius.circular(10),
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.yellow,
          ),
          // height: 80,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Checkbox(
                  value: tilebool,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                Expanded(
                  child: Text(
                    tiletext,
                    style: TextStyle(
                      decoration: tilebool
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
