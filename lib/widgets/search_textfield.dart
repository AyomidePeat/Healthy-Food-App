import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final controller;
  final bool obscure;
  final String hint;
  const SearchTextField({ this.controller,  this.obscure,  this.hint,key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
     controller:widget.controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(
            color: Colors.black,
            width:0.4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
      // keyboardType: TextInput,
    );
  }
}

   