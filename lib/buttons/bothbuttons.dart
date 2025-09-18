import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonsScreen extends StatefulWidget {
  String child;
  VoidCallback onPressed;
    ButtonsScreen({super.key,required this.child, required this.onPressed});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(


        onPressed: widget.onPressed, child:  Text(widget.child));
  }
}
