import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {

  bool a= true;

  void abc(){
    setState(() {
      a = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}