import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class RouterCommand{
  static push (BuildContext context, Widget widget){
    return Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  }
}
