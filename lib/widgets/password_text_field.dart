// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class PasswordTextField extends StatefulWidget {
  TextEditingController controller;
  Function setter;
  bool isPasswordSecure;
  String title, message;
  PasswordTextField(
      {required this.controller,
      required this.setter,
      required this.isPasswordSecure,
      required this.message,
      required this.title});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(widget.title,
                style: TextStyle(fontSize: 18, color: MyColor.level4)),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          onChanged: (text) {
            widget.setter(text);
          },
          obscureText: !widget.isPasswordSecure,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            filled: true,
            fillColor: Colors.white,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return widget.message;
            }
            return null;
          },
        ),
      ],
    );
  }
}
