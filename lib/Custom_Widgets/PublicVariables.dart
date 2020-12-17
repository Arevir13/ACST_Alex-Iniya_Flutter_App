library app.globals;

import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/ColorWidget.dart';

//This creates the global variable named agendaDisplay used throughout the app
List<Agenda> agendaDisplay = [];

//creates+stores the ColorWidget that is the current color/theme for all screens
ColorWidget colorSelected = ColorWidget('purple', Colors.purple);

//creates list ColorWidgets of available theme colors (for dropdown menu)
List<ColorWidget> themeOptions = [
  ColorWidget('red', Colors.red),
  ColorWidget('blue', Colors.blue),
  ColorWidget('pink', Colors.pink),
  ColorWidget('purple', Colors.purple),
];
