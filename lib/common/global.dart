import 'package:flutter/material.dart';


const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red
];

class Global {
  BuildContext context;




  static Global _global;

  static Global getInstance() {
    if (_global == null) {
      _global = Global();
    }
    return _global;
  }

  void init(BuildContext context){
    this.context =context;
  }


}
