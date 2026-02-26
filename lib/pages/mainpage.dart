import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practice5/database/database.dart';
import 'package:practice5/widgets/addnewitem.dart';
import 'package:practice5/widgets/tiles.dart';

class Mainpage extends StatefulWidget {
  Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  // referencing the box
  final _mybox = Hive.box('mybox');
  Tododatabase db = Tododatabase();
  @override
  void initState() {
    super.initState();
    if (_mybox.get("TODOLIST") == null) {
      db.createinitialdata();
    } else {
      db.loaddata();
    }
  }

  void tilechange(int index) {
    setState(() {
      db.items[index][1] = !(db.items[index][1]);
    });
    db.updatedata();
  }

  final TextEditingController _controller = TextEditingController();
  void onPressed() {
    showDialog(
      context: context,
      builder: (context) {
        return Addnewitem(onsave: onsave, controllers: _controller);
      },
    );
  }

  void onsave() {
    setState(() {
      db.items.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
    db.updatedata();
  }

  void onedit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Addnewitem(
          onsave: () {
            setState(() {
              db.items[index][0] = _controller.text;
            });
            _controller.clear();
            Navigator.of(context).pop();
            db.updatedata();
          },
          controllers: _controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 35, color: Colors.black),
        onPressed: () {
          onPressed();
        },
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: db.items.length,
        itemBuilder: (context, index) {
          return Tiles(
            tiletext: db.items[index][0],
            tilebool: db.items[index][1],
            onChanged: (p0) {
              tilechange(index);
            },
            deletefunc: () {
              setState(() {
                db.items.removeAt(index);
              });
              db.updatedata();
            },
            editfunc: () {
              onedit(index);
            },
          );
        },
      ),
    );
  }
}
