import 'package:flutter/material.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
  //this is where the route is linked
}

class CalendarScreenState extends State<CalendarScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Calendar'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('To Be implemented'),
      ),
    );
  }
}
