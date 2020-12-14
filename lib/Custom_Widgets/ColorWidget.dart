import 'package:flutter/material.dart';

class ColorWidget {
  String colorName;
  Color iconColor;
  Icon colorIcon;

  ColorWidget(String colorName, Color iconColor) {
    this.colorName = colorName;
    this.iconColor = iconColor;
    colorIcon = Icon(Icons.fiber_manual_record, color: iconColor);
  }

  Color getColor() {
    return iconColor;
  }
}

/*main() {
  ColorWidget hello = ColorWidget("green", Colors.green);
  print("hi");
  print(hello.iconColor);
}
*/
