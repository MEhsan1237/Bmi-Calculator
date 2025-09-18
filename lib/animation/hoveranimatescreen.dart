import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverAnimationScreen extends StatefulWidget {
  final Widget child;
  VoidCallback onPressed;

  HoverAnimationScreen({super.key, required this.child,required this.onPressed});

  @override
  State<HoverAnimationScreen> createState() => _HoverAnimationScreenState();
}

class _HoverAnimationScreenState extends State<HoverAnimationScreen> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          (_) => setState(() {
            isHover = true;
          }),
      onExit:
          (_) => setState(() {
            isHover = false;
          }),
      child: InkWell(
        onTap: widget.onPressed,
        child: AnimatedContainer(

          duration: Duration(milliseconds: 200),

          decoration: BoxDecoration(
            color: isHover ? Colors.red : Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          transform:
              isHover ? Matrix4.translationValues(0, -8, 0) : Matrix4.identity(),

          child: widget.child,
        ),
      ),
    );
  }
}
