import 'package:flutter/material.dart';
import 'package:practice_app/Pages/calendarScreen.dart';
import 'package:practice_app/Pages/createNewScreen.dart';
import 'package:practice_app/Pages/homeScreen.dart';
import 'package:practice_app/Pages/viewUnfinished.dart';

import 'package:practice_app/pages/settings.dart';
import 'package:practice_app/Pages/displayScreen.dart';
import 'package:practice_app/Pages/editingScreen.dart';

//these imports are needed to allow the routing to work

void main() {
  runApp(MaterialApp(
    initialRoute: '/homeScreen',
    //sets the initial route that the app goes to when it opens
    routes: {
      '/homeScreen': (context) => HomeScreen(),
      '/viewUnfinished': (context) => ViewUnfinished(),
      '/createNewScreen': (context) => CreateNewScreen(),
      '/displayScreen': (context) => DisplayScreen(),
      '/settings': (context) => Settings(),
      '/calendarScreen': (context) => CalendarScreen(),
      '/editingScreen': (context) => EditingScreen(),
      //sets the '/routename' to point to the widgets in the other dart
      //files
    },
  ));
}
