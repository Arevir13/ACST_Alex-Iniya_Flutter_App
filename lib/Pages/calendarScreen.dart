import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatefulWidget {
  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay;
  DateTime _focusedDay = DateTime.now();
  List _selectedEvents;

  //This is important for when we will be comparing dates
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  //This is the method that will be called every time we select a day to determine
  //what to show for that day
  List _getEventsForDay(DateTime day) {
    //initializes a temporary list with an empty string just so we can use add method
    List events = [''];

    //This iterrates through the global list of agendas and checks to see if the
    //date matches the selected date.
    //Then it adds each item in that calendar to the temporary list that this
    //method will return
    for (Agenda agenda in globals.agendaDisplay) {
      if (formatter.format(agenda.getCreationDate()) == formatter.format(day)) {
        for (Item item in agenda.getItemList()) {
          events.add(item.toCalendarString());
        }
      }
    }

    //remove the temporary empty string
    events.remove('');
    return events;
  }

  //this method is called every time a new day is selected and first checks to
  //make sure its not the same day, then it updates all the variables.
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents = _getEventsForDay(selectedDay);
      });
    }
  }

  //Sets the selected day to current date
  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = _getEventsForDay(_selectedDay);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
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
      //use SingleChildScrollView because it will allow the page to expand to
      //accomodate more items if needed
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TableCalendar(
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime(2021, 1, 1),
              lastDay: DateTime(2030, 12, 31),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
              ),
              onDaySelected: _onDaySelected,
              headerVisible: true,
              headerStyle: const HeaderStyle(formatButtonVisible: false),
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
            //Container with text separating events from the calendar
            Container(
              child: Text('For Today',
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),

            //This adds every item in selected events to the empty space below
            //the calendar.
            //NOTE: the ... symbol is used to combine sets of data within lists so
            //because the column is technically a list this is adding each event
            //in selected events to the column. This is pretty much the same thing
            //used in the display screen but the ... is needed because there are
            //other widgets aside from the map function that need to get combined into the column.
            ..._selectedEvents.map((event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                        child: Text(
                      event,
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
