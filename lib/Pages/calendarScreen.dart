import 'package:flutter/material.dart';
import 'package:practice_app/Pages/createNewScreen.dart';

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
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pushNamed(context, '/homeScreen');
          },
        ),
      ),
      body: Center(
        child: Card(
          child: Text(CreateNewScreenState.agenda.toString()),
        ),
      ),
    );
  }
}
