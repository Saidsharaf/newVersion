import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menuRestore.dart';

class MenuRestoreItems {
  static List<MenuRestoreItem> items = [
    
    itemRestore,
  ];

  static const MenuRestoreItem itemRestore = MenuRestoreItem(
    txt: "Restore",
    icon: Icons.restore_page_outlined,
  );
}