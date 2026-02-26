import 'package:hive_flutter/hive_flutter.dart';

class Tododatabase{
  final _mybox= Hive.box('mybox');
  List items=[];
  void  createinitialdata(){
    items=[
      ['Slide to edit/delete tasks',false]
    ];
  }
  void loaddata(){
    items=_mybox.get("TODOLIST");
  }
  void updatedata(){
    _mybox.put("TODOLIST",items);
  }
}