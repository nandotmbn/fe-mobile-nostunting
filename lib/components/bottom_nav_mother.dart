// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MotherNav extends StatelessWidget {
  final int selectedIndex;
  final Function setSelectedIndex;
  const MotherNav(this.selectedIndex, this.setSelectedIndex);

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
          icon: Icon(Icons.calendar_month),
          label: 'Kalendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Pengaturan',
        ),
      ],
      selectedItemColor: const Color(0xffffffff),
      unselectedItemColor: const Color.fromARGB(255, 237, 216, 181),
      backgroundColor: const Color(0xff395144),
    );
  }
}
