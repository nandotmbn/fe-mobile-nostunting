// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:no_stunting/constant/color.dart';

class ChildNav extends StatelessWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const ChildNav(this.selectedIndex, this.setSelectedIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) => setSelectedIndex(value),
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Beranda',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.scale),
          label: 'Pengukuran',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month),
          label: 'Kalendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
      selectedItemColor: const Color(0xffffffff),
      unselectedItemColor: MyColor.level1,
      backgroundColor: const Color(0xff1363DF),
    );
  }
}
