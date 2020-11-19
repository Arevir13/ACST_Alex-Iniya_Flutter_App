import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

class CreateNewScreen extends StatefulWidget {
  @override
  CreateNewScreenState createState() => CreateNewScreenState();
  //this is where the route is linked
}

class CreateNewScreenState extends State<CreateNewScreen> {
  final controller = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  String title;
  String name;
  String description;
  Agenda agenda;

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Create new'),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          height: 535,
          width: 500,
          child: Column(
            children: <Widget>[
              Text(
                'Enter a Title for your agenda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                child: TextField(
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter A title'),
                  onChanged: setT,
                ),
                width: 400,
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 75),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 20),
              ),
              Row(
                children: [
                  Text(
                    '  Enter Item name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                child: TextField(
                  controller: controller2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter a Name'),
                  onChanged: setN,
                ),
                width: 500,
                height: 40,
                padding: EdgeInsets.only(right: 150),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 30),
              ),
              Row(
                children: [
                  Text(
                    '  Enter Item Description',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                child: TextField(
                  controller: controller3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a Description'),
                  onChanged: setDesc,
                ),
                width: 400,
                padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          agenda = Agenda();
          agenda.setTitle(getT());
          agenda.addItem(getN(), getDesc(), false, false);
          globals.agendaDisplay.add(agenda);
          Navigator.pushNamed(context, '/calendarScreen');
        },
        label: Text('Finish'),
        icon: Icon(Icons.check),
        backgroundColor: Colors.green[500],
      ),
    );
  }

  void setT(String s) {
    setState(() {
      title = s;
    });
  }

  void setN(String s) {
    setState(() {
      name = s;
    });
  }

  void setDesc(String s) {
    setState(() {
      description = s;
    });
  }

  String getT() {
    return title;
  }

  String getN() {
    return name;
  }

  String getDesc() {
    return description;
  }
}
