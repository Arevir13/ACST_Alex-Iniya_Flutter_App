import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;
import 'package:practice_app/main.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
  //this is where the route is linked
}

class CalendarScreenState extends State<CalendarScreen> {
  Widget agendaTemplate(Agenda agenda) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            agenda.getTitle(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            agenda.itemString(),
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 30,
            child: FlatButton(onPressed: null, child: Text('Edit')),
          ),
        ],
      ),
    );
  }

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
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: globals.agendaDisplay
                .map((agenda) => agendaTemplate(agenda))
                .toList()),
      ),
    );
  }
}
