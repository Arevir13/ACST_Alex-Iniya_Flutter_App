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
    ColorWidget('pink', Colors.pink),
    ColorWidget('purple', Colors.purple),
  ];
  //creates list ColorWidgets of available theme colors (for dropdown menu)
  ColorWidget colorSelected = ColorWidget('purple', Colors.purple);
  //starting value for color is purple

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        DropdownButton<ColorWidget>(
            hint: Text(
              'Choose your theme color',
            ), // words of dropdown
            items: themeOptions.map((ColorWidget dropdownColor) {
              return DropdownMenuItem<ColorWidget>(
                value: dropdownColor,
                child: Text(
                  dropdownColor.colorName,
                  style: TextStyle(color: dropdownColor.iconColor),
                ),
              );
            }).toList(),
            //creates map to go through list of ColorWidgets (themeOptions)
            //sets value of each button in dropdown to the ColorWidget
            //sets text of each button in dropdown to name of the ColorWidget
            onChanged: (ColorWidget dropdownValue) {
              setState(() {
                colorSelected = dropdownValue;
              });
              //when dropdown option pressed, changes value of colorSelected
              // to the selected color widget
            }),
      ]),
    );
  }
}
