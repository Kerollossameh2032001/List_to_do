import 'package:flutter/material.dart';
import 'Home.dart';

void main(){
  runApp(ListTodo());
}

class ListTodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
