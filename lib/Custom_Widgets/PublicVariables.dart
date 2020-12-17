library app.globals;

import 'package:practice_app/Custom_Widgets/Agenda_Widget.dart';

//imported agenda widget to be able to make a list of type Agenda
//This creates the global variable named agendaDisplay used throughout the app
List<Agenda> agendaDisplay = [];
//this is the global variable that will have a different value for each agenda as
//as it increases
int agendaDisplayIndex;
//this current index will be a malleable variable that will change depending
//on the agenda selected and will serve to point the editing screen to the correct index
int currentIndex;
