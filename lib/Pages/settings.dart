import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/ColorWidget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.colorSelected.getColor(),
        title: Text('Settings'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/homeScreen');
          },
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            DropdownButton<ColorWidget>(
                hint: Text(
                  'Choose your theme color',
                ), // words of dropdown
                items: globals.themeOptions.map((ColorWidget dropdownColor) {
                  return DropdownMenuItem<ColorWidget>(
                      value: dropdownColor,
                      //value of selected dropdown is the ColorWidget
                      child: Row(
                        children: <Widget>[
                          dropdownColor
                              .colorIcon, //circle icon to display oolor
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            dropdownColor
                                .colorName, //name of color of dropdown option
                            style: TextStyle(color: dropdownColor.iconColor),
                          ),
                        ],
                      ));
                }).toList(),
                //creates map to go through list of ColorWidgets (themeOptions)
                //sets value of each button in dropdown to the ColorWidget
                //sets text of each button in dropdown to name of the ColorWidget
                onChanged: (ColorWidget dropdownValue) {
                  setState(() {
                    globals.colorSelected = dropdownValue;
                  });
                  //when dropdown option pressed, changes value of colorSelected
                  //to the selected color widget
                }),
            Checkbox(
                value: false,
                onChanged: (bool checked) {
                  setState(() {
                    globals.notifications = checked;
                  });
                }),
            Text("do you want notifications?"),
          ],
        ),
      ),
    );
  }
}
