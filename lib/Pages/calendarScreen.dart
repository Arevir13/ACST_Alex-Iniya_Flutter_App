import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('W.I.P'),
      ),
    );
  }
}
