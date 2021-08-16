import 'package:flutter/material.dart';

class ToDo extends StatelessWidget {
  final String title;
  final String desc;

  const ToDo({Key? key, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
          backgroundColor: Colors.purple,
        ),
        body:
        Center(child: Text("$title $desc"))
    );
  }
}
