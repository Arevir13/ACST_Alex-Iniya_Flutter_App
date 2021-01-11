import 'package:flutter/material.dart';
import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';
import 'package:practice_app/Custom_Widgets/PublicVariables.dart' as globals;

class EditingScreen extends StatefulWidget {
  @override
  EditingScreenState createState() => EditingScreenState();
}

class EditingScreenState extends State<EditingScreen> {
  String tempName;
  String tempDescription;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    description.dispose();
    super.dispose();
  }

  //this simple itemTemplate just displays the items information
  Widget itemTemplate(Item item) {
    int index = globals.agendaDisplay[globals.currentIndex].getItemIndex(item);
    return Card(
      child: Column(
        children: [
          Text('Name: ' + item.getName()),
          Text('Description: ' + item.getDescription()),
          IconButton(
            onPressed: () {
              //option to remove the item from the agenda using setstate to update
              setState(() {
                globals.agendaDisplay[globals.currentIndex].removeItem(index);
              });
            },
            icon: Icon(Icons.delete),
            padding: const EdgeInsets.fromLTRB(350, 0, 0, 0),
          )
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    //this pulls up the correct agenda using the currentIndex set in the display page
    List<Item> itemlist =
        globals.agendaDisplay[globals.currentIndex].getItemList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: globals.colorSelected.getColor(),
        title: Text(globals.agendaDisplay[globals.currentIndex].getTitle()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
              //this first column is the list of items in the agenda being displayed
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: itemlist.map((item) => itemTemplate(item)).toList()),
          //container that contains the fields to add items to the agenda
          //in the future This will be a pop up that only appears when the
          //add item button is pressed
          Container(
            child: Column(
              children: [
                Text('New Item Name'),
                TextField(
                  controller: name,
                  onChanged: setName,
                ),
                Text('New Item Description'),
                TextField(
                  controller: description,
                  onChanged: setDescription,
                ),
                FlatButton(
                  child: Text("Add"),
                  color: Colors.green,
                  onPressed: () {
                    //actually adds the item and uses setstate so the screen
                    //updates properly
                    setState(() {
                      globals.agendaDisplay[globals.currentIndex]
                          .addItem(tempName, tempDescription, false, false);
                      name.clear();
                      description.clear();
                      //clears the text editors after an item is added
                    });
                  },
                )
              ],
            ),
          ),

          //not implemented yet
          FlatButton(
            child: Text('Add Another Item'),
            onPressed: null,
          )
        ],
      )),
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
  //values that will be passed in by the textFields
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
