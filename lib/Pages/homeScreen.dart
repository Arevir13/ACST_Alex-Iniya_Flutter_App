import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

//make sure to import this
class HomeScreen extends StatefulWidget {
  //stateful widgets are widgets that will be able to have
  //parts of them changed
  @override
  HomeScreenState createState() => HomeScreenState();
  //this is also the class widget that the route is linked to on main
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //this is the basic widget that contains the other widgets
        appBar: AppBar(
          //appbar widget is premade and has useful features
          //like a back button to link widgets
          backgroundColor: globals.colorSelected.getColor(),
          title: Text(
            'Welcome to the Agenda App',
            style: TextStyle(
              fontFamily: globals.fontFamily,
              fontWeight: globals.weight,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            //creates settings button on top right of app bar
            IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/settings');
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          //create new button ("+" at the bottom of the screen)
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/createNewScreen');
          },
          child: Text('+',
              style: TextStyle(
                fontSize: 30.0,
              )),
          backgroundColor: globals.colorSelected.getColor(),
        ),
        body: Center(
            child: Column(
          //child is a column widget because the buttons will be
          //displayed in a column format
          children: <Widget>[
            //children of type widget
            FlatButton.icon(
              //button to bring to Calendar Screen
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/calendarScreen');
              },
              icon: Icon(Icons.calendar_today),
              //height: 60.0, //height of button
              label: Text(
                'View Calendar',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: globals.fontFamily,
                  fontWeight: globals.weight,
                ),
              ),
              highlightColor: Colors.blue,
            ),
            FlatButton.icon(
              //button to bring to viewUnfinished Screen
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/viewUnfinished');
              },
              icon: Icon(Icons.assignment),
              //height: 60.0, //height of button
              label: Text(
                'View Unfinished',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: globals.fontFamily,
                  fontWeight: globals.weight,
                ),
              ),
              highlightColor: Colors.blue,
            ),
            FlatButton.icon(
              //button to bring to displayScreen
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/displayScreen');
              },
              icon: Icon(Icons.view_list),
              //height: 60.0, //height of button
              label: Text(
                'View Agendas',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: globals.fontFamily,
                  fontWeight: globals.weight,
                ),
              ),
            ),
          ],
        )));
  }
}
