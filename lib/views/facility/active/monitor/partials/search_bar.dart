// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class FacilityMonitorTextField extends StatefulWidget {
  Function onChange, onFilterChange;
  bool filter;
  FacilityMonitorTextField(
      {required this.onChange,
      required this.onFilterChange,
      required this.filter});

  @override
  State<FacilityMonitorTextField> createState() =>
      _FacilityMonitorTextFieldState();
}

class _FacilityMonitorTextFieldState extends State<FacilityMonitorTextField> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Row(
      children: [
        Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => widget.onFilterChange(),
              child: Container(
                  margin: const EdgeInsets.fromLTRB(5, 6, 0, 6),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: widget.filter ? MyColor.level4 : MyColor.level1),
                  alignment: Alignment.center,
                  child: Icon(
                    widget.filter ? Icons.filter_list_off : Icons.filter_list,
                    color: !widget.filter ? Colors.white : MyColor.level3,
                  )),
            )),
        Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.fromLTRB(5, 6, 0, 6),
              child: TextField(
                onChanged: (text) {
                  widget.onChange(text);
                },
                style: TextStyle(fontSize: 18, color: MyColor.level1),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                    filled: true,
                    border: InputBorder.none,
                    hintText: "Cari nama bayi/balita",
                    fillColor: MyColor.level4),
              ),
            )),
      ],
    ));
  }
}
