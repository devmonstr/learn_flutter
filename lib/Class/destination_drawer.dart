import 'package:flutter/material.dart';

class MyDestination {
  const MyDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<MyDestination> destinations = <MyDestination>[
  MyDestination(
    'Profile',
    Icon(Icons.person_2_outlined),
    Icon(Icons.person_2),
  ),
  MyDestination(
    'To-Do List',
    Icon(Icons.list_alt_outlined),
    Icon(Icons.list_alt),
  ),
  MyDestination(
    'Settings',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
  MyDestination(
    'Logout',
    Icon(Icons.logout_outlined),
    Icon(Icons.logout),
  )
];
