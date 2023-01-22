import 'package:flutter/material.dart';

class FacilityMonitorMenuView extends StatelessWidget {
  final String dropdownValue;
  final List<String> options;
  final Function onChange;
  const FacilityMonitorMenuView(
      {super.key,
      required this.dropdownValue,
      required this.options,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      dropdownColor: const Color(0xFFF0EBCE),
      value: dropdownValue,
      onChanged: (String? value) {
        onChange(value);
      },
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      selectedItemBuilder: (BuildContext context) {
        return options.map((String value) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dropdownValue,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList();
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
