import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldScreen extends StatefulWidget {
  String? title;
  String? hintText;
  final TextEditingController controller;
  TextFormFieldScreen({super.key,required this.title,required this.hintText,required this.controller});

  @override
  State<TextFormFieldScreen> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            widget.title!,
            style:GoogleFonts.bowlbyOne(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w100
            )
          ),
        ),
        SizedBox(height: 14,),
        Padding(
          padding:   EdgeInsets.symmetric(horizontal: 32),
          child: TextField(


            keyboardType: TextInputType.number,
            controller: widget.controller,
            decoration: InputDecoration(
                isDense: true,

                hintText:  widget.hintText,
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26,width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black,width: 2)
              )
            ),

          ),
        )
      ],
    );
  }
}
