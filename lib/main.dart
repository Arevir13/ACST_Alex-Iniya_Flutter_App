import 'package:flutter/material.dart';
import 'package:practice_app/Pages/createNewScreen.dart';
import 'package:practice_app/Pages/homeScreen.dart';
import 'package:practice_app/Pages/viewUnfinished.dart';
import 'package:practice_app/pages/calendarScreen.dart';
import 'package:practice_app/pages/settings.dart';
//these imports are needed to allow the routing to work

void main() {
  runApp(MaterialApp(
    initialRoute: '/homeScreen',
    //sets the initial route that the app goes to when it opens
    routes: {
      '/homeScreen': (context) => HomeScreen(),
      '/viewUnfinished': (context) => ViewUnfinished(),
      '/createNewScreen': (context) => CreateNewScreen(),
      '/calendarScreen': (context) => CalendarScreen(),
      '/settings': (context) => Settings(),
      //sets the '/routename' to point to the widgets in the other dart
      //files
    },
  ));
}
