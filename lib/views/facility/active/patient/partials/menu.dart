import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class FacilityPatientMenuView extends StatelessWidget {
  final String dropdownValue, title;
  final List<String> options;
  final Function onChange;
  const FacilityPatientMenuView(
      {super.key,
      required this.title,
      required this.dropdownValue,
      required this.options,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(color: MyColor.level4, fontSize: 10),
          ),
        ),
        DropdownButton<String>(
          isExpanded: true,
          dropdownColor: MyColor.level1,
          value: dropdownValue,
          onChanged: (String? value) {
            onChange(value);
          },
          style: TextStyle(color: MyColor.level4),
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
        )
      ],
    );
  }
}
