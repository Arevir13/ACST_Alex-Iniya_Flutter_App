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
          automaticallyImplyLeading: false,
          backgroundColor: globals.colorSelected.getColor(),
          title: Text('Welcome to the Agenda App'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            //creates settings button on top right of app bar
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          //create new button ("+" at the bottom of the screen)
          onPressed: () {
            Navigator.pushNamed(context, '/createNewScreen');
          },
          child: Text('+',
              style: TextStyle(
                fontSize: 30.0,
              )),
          backgroundColor: Colors.purple[500],
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
                Navigator.pushNamed(context, '/calendarScreen');
              },
              icon: Icon(Icons.calendar_today),
              label: Text('View Calendar'),
              highlightColor: Colors.blue,
            ),
            FlatButton.icon(
              //button to bring to viewUnfinished Screen
              onPressed: () {
                Navigator.pushNamed(context, '/viewUnfinished');
              },
              icon: Icon(Icons.assignment),
              label: Text('View Unfinished'),
              highlightColor: Colors.blue,
            ),
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/displayScreen');
                },
                icon: Icon(Icons.view_list),
                label: Text('View Agendas'))
          ],
        )));
  }
}
