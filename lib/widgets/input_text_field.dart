// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

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
                style: TextStyle(fontSize: 18, color: MyColor.level4)),
          ),
        ),
        TextFormField(
          style: const TextStyle(fontSize: 18),
          controller: widget.serialNumberController,
          onChanged: (text) {
            widget.setSerialNumber(text);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
            filled: true,
            fillColor: Colors.white,
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
