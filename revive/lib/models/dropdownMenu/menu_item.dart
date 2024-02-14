import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menu.dart';

class MenuItems {
  static List<MenuItem> items = [
    itemSave,
    itemReport,
  ];
  static const MenuItem itemSave = MenuItem(
    text: "Save",
    icon: Icons.save_outlined,
  );
  static const MenuItem itemReport = MenuItem(
    text: "report",
    icon: Icons.report,
  );
}
