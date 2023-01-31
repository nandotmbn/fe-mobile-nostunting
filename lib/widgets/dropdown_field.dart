// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class DropdownField extends StatefulWidget {
  String dropdownValue, label;
  List<String> options;
  Function setter;
  DropdownField(
      {required this.dropdownValue,
      required this.setter,
      required this.options,
      required this.label});

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
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
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.white),
            child: DropdownButton<String>(
              isExpanded: true,
              dropdownColor: MyColor.level1,
              value: widget.dropdownValue,
              onChanged: (String? value) {
                widget.setter(value);
              },
              style: TextStyle(color: MyColor.level4),
              selectedItemBuilder: (BuildContext context) {
                return widget.options.map((String value) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.dropdownValue,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  );
                }).toList();
              },
              items:
                  widget.options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ))
      ],
    );
  }
}
