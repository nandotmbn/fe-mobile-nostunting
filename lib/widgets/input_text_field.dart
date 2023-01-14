// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final TextEditingController serialNumberController;
  final Function setSerialNumber;
  final String label, emptyMessage;
  const InputTextField(this.setSerialNumber, this.serialNumberController,
      this.label, this.emptyMessage);

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(widget.label,
                style: const TextStyle(
                    fontSize: 24, color: Color.fromARGB(255, 25, 47, 35))),
          ),
        ),
        TextFormField(
          controller: widget.serialNumberController,
          onChanged: (text) {
            widget.setSerialNumber(text);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            filled: true,
            fillColor: const Color(0xFFD9D9D9),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return widget.emptyMessage;
            }
            return null;
          },
        ),
      ],
    );
  }
}
