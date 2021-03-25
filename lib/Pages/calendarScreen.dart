import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;
import 'package:calendar_timeline/calendar_timeline.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.colorSelected.getColor(),
        title: Text('Calendar'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/homeScreen');
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Calendar Timeline',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime(2020, 2, 20),
              firstDate: DateTime(2020, 2, 15),
              lastDate: DateTime(2021, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: globals.colorSelected.getColor(),
              dayColor: globals.colorSelected.getColor(),
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: globals.colorSelected.getColor(),
              selectableDayPredicate: (date) => date.day != 23,
            ),
          ],
        ),
      ),
    );
  }
}
