import 'package:flutter/material.dart';

class ViewUnfinished extends StatefulWidget {
  @override
  ViewUnfinishedState createState() => ViewUnfinishedState();
  //this is where the route is linked
}

class ViewUnfinishedState extends State<ViewUnfinished> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('All unfinished Items'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('To Be implemented'),
      ),
    );
  }
}
