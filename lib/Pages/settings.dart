import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Color dropdownValue = Colors.purple;
  //final List<Color> colors = <Color>[Colors.purple, Colors.blue, Colors.red];
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Settings'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            DropdownButton<Color>(
              value: dropdownValue,
              icon: Icon(Icons.palette),
              onChanged: (Color newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <Color>[Colors.purple, Colors.blue, Colors.red]
                  .map<DropdownMenuItem<Color>>((Color value) {
                return DropdownMenuItem<Color>(
                  value: value,
                  child: Container(
                    color: value,
                  ),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
