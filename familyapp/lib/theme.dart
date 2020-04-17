import 'package:flutter/material.dart';

Color primaryColor = Color(0xFFFFFFFC);
Color primaryText = Color(0xFF757575);
Color buttonHeader = Color(0xFFEDEDFA);

final List<Color> categoriesColor = [
  Color(0xFFFA382C),
  Color(0xFF6158EC),
  Color(0xFF34BFCB),
  Color(0xFF4B547E),
];

TextStyle headlines = TextStyle(fontSize: 20, color: primaryText, fontFamily: 'PTsans', fontWeight: FontWeight.w600);
TextStyle headCategories = TextStyle(fontSize: 15, color: primaryText, fontFamily: 'PTsans', fontWeight: FontWeight.w500);

class CustomIcons {
  static const IconData notify = IconData(0xe800, fontFamily: "CustomIcon");
  static const IconData home = IconData(0xe802, fontFamily: "CustomIcon");
}
