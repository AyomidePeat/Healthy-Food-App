import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final controller;
  final bool obscure;
  final String hint;
  const TextFieldWidget({ this.controller,  this.obscure,  this.hint, key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TextField(
        obscureText: widget.obscure,
       controller:widget.controller,
        cursorColor: Colors.black,
        
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 236, 233, 233),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color.fromARGB(255, 236, 233, 233),
              width: 0.5,
            ),
          ),
        ),
        // keyboardType: TextInput,
      ),
    );
  }
}

   