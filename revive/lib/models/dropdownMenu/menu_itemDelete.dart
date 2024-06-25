import 'package:flutter/material.dart';
import 'package:revive/models/dropdownMenu/menuDelete.dart';

class MenuDeleteItems {
  static List<MenuDeleteItem> items = [
    itemSaves,
    itemDelete,
  ];
  static const MenuDeleteItem itemSaves = MenuDeleteItem(
    txt: "Save",
    icon: Icons.save_outlined,
  );
  static const MenuDeleteItem itemDelete = MenuDeleteItem(
    txt: "Delete",
    icon: Icons.delete,
  );
}