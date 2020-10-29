import 'package:flutter/material.dart';

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
          backgroundColor: Colors.purple,
          title: Text('Welcome to the Agenda App'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          //child is a column widget because the buttons will be
          //displayed in a column format
          children: <Widget>[
            //children of type widget
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/createNewScreen');
                },
                //Navigator widget that used the push named method to
                // PUSH the route specified onto the screen
                child: Text('Create New'),
                //text that will appear on the button
                highlightColor: Colors.blue),
            //button will turn this color when pressed

            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calendarScreen');
                },
                child: Text('View Calendar'),
                highlightColor: Colors.blue),
            FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/viewUnfinished');
                },
                child: Text('View Unfinished'),
                highlightColor: Colors.blue),
          ],
        )));
  }
}
