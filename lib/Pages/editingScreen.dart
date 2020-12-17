import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

class EditingScreen extends StatefulWidget {
  @override
  EditingScreenState createState() => EditingScreenState();
}

class EditingScreenState extends State<EditingScreen> {
  //uses the currentIndex global variable to pull up the correct agenda
  String tempName;
  String tempDescription;
  TextEditingController name;
  TextEditingController description;

  Widget itemTemplate(Item item) {
    return Card(
      child: Column(
        children: [
          //displays the items position in the agenda(not actuall index)
          Text('Edit Name'),
          //textFormField to edit the name
          TextFormField(
            //has the field initially filled out with the previous name
            //if it exists
            controller: name,
            initialValue: item.getName(),
            //calls the function that sets the name
            onChanged: setName,
          ),
          //clear button for the field (Currently doesnt work)
          RaisedButton(
            onPressed: () {
              name.clear();
            },
            child: Text('CLEAR'),
            color: Colors.red,
          ),
          Text('Edit Description'),
          TextFormField(
            //has the field initially filled out with the previous description
            //if it exists
            controller: description,
            initialValue: item.getDescription(),
            //calls the function that sets the description
            onChanged: setDescription,
          ),
          //clear button for the field (Currently doesnt work)
          RaisedButton(
            onPressed: () {
              description.clear();
            },
            child: Text('CLEAR'),
            color: Colors.red,
          ),
          /*FlatButton(
            onPressed: () {
              int index = globals.agendaDisplay[globals.currentIndex]
                  .getItemIndex(item);
              globals.agendaDisplay[globals.currentIndex]
                  .setName(index, tempName);
              globals.agendaDisplay[globals.currentIndex]
                  .setDescription(index, tempDescription);
            },
            color: Colors.green,
            child: Text('Save Changes'),
          )*/
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(globals.agendaDisplay[globals.currentIndex].getTitle()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: globals.agendaDisplay[globals.currentIndex]
              .getItemList()
              .map((item) => itemTemplate(item))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/displayScreen');
        },
        child: Icon(Icons.view_agenda),
        backgroundColor: Colors.purple,
      ),
    );
  }

  //These are the void methods that actually change the variables using the
  //values that will be passed in by the textFormFields
  void setName(String s) {
    setState(() {
      tempName = s;
    });
  }

  void setDescription(String s) {
    setState(() {
      tempDescription = s;
    });
  }
}
