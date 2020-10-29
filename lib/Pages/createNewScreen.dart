import 'package:flutter/material.dart';
import 'dart:io';

class CreateNewScreen extends StatefulWidget {
  @override
  CreateNewScreenState createState() => CreateNewScreenState();
  //this is where the route is linked
}

class CreateNewScreenState extends State<CreateNewScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Create new'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        //currently WIP
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[],
      )),
    );
  }

//everything below this is currently a W.I.P
  List agenda;
  Agenda() {
    agenda = <Item>[];
  }

  void addItem(String name, String desc, bool check, bool rep) {
    Item x = Item(name, desc, check, rep);
    setState(() {
      agenda.add(x);
    });
  }

  void setName(int index, String newName) {
    setState(() {
      agenda[index].setName(newName);
    });
  }

  void setDescription(int index, String newDesc) {
    setState(() {
      agenda[index].setDescription(newDesc);
    });
  }

  void setChecked(int index, bool c) {
    setState(() {
      agenda[index].setChecked(c);
    });
  }

  void setRepeat(int index, bool r) {
    setState(() {
      agenda[index].setChecked(r);
    });
  }

  void removeItem(int index) {
    setState(() {
      agenda.removeAt(index);
    });
  }

  String getName(int index) {
    return agenda[index].getName();
  }

  String getDescription(int index) {
    return agenda[index].getDescription();
  }

  bool getChecked(int index) {
    return agenda[index].getChecked();
  }

  bool getRepeat(int index) {
    return agenda[index].getRepeat();
  }
}

class Item {
  String name;
  String description;
  bool checked;
  bool repeat;

  Item(String n, String d, bool c, bool r) {
    name = n;
    description = d;
    checked = c;
    repeat = r;
  }
  void setName(String newName) {
    name = newName;
  }

  void setDescription(String newDesc) {
    description = newDesc;
  }

  void setChecked(bool newCheck) {
    checked = newCheck;
  }

  void setRepeat(bool newRep) {
    repeat = newRep;
  }

  String getName() {
    return name;
  }

  String getDescription() {
    return description;
  }

  bool getChecked() {
    return checked;
  }

  bool getRepeat() {
    return repeat;
  }

  String toString() {
    if (checked == false) {
      if (repeat == true) {
        return name + ': ' + description + ', Unchecked, Repeat ON';
      }
      return name + ': ' + description + ', Unchecked, Repeat OFF';
    } else if (checked && repeat == true) {
      return name + ': ' + description + ', Checked, Repeat ON';
    }
    return name + ': ' + description + ', Checked, Repeat OFF';
  }
}
