import 'package:flutter/material.dart';

class FacilityPatientMenuView extends StatelessWidget {
  final String dropdownValue;
  final List<String> options;
  final Function onChange;
  const FacilityPatientMenuView(
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
        // This is the widget that will be shown when you select an item.
        // Here custom text style, alignment and layout size can be applied
        // to selected item string.
        return options.map((String value) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Text(
              dropdownValue,
              style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
