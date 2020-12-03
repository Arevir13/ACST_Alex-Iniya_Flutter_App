import 'package:flutter/material.dart';

class EditingScreen extends StatefulWidget {
  @override
  EditingScreenState createState() => EditingScreenState();
}

class EditingScreenState extends State<EditingScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text('Edit'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('W.I.P'),
      ),
    );
  }
}
