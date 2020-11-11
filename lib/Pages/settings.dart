import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/ColorWidget.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  List<ColorWidget> themeOptions = [
    ColorWidget('red', Colors.red),
    ColorWidget('blue', Colors.blue),
    ColorWidget('pink', Colors.pink)
  ];
  ColorWidget dropdownValue = ColorWidget('purple', Colors.purple);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        DropdownButton<ColorWidget>(
            hint: Text('Choose your color'),
            items: themeOptions.map((ColorWidget dropdownColor) {
              return DropdownMenuItem<ColorWidget>(
                value: dropdownColor,
                child: Text(dropdownColor.colorName),
              );
            }).toList(),
            onChanged: (ColorWidget colorSelected) {
              setState(() {
                dropdownValue = colorSelected;
              });
            }),
      ]),
    );
  }
}
