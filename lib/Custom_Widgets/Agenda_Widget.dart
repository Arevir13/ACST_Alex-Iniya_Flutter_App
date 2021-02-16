//This is a class file that is meant to be imported into other files when working
//with agenda items so those files can have access to all the functions
//related to the agenda and its items.

class Agenda {
  List agenda;
  String title;
  int displayIndex;
  Agenda() {
    agenda = <Item>[];
    title = '';
    displayIndex = null;
  }
//displayIndex methods will be used in the editing screen so it knows
//what index of the global agenda list to display
  void setDisplayIndex(int i) {
    displayIndex = i;
  }

  int getLength() {
    int index = 0;
    for (Item item in agenda) {
      index++;
    }
    return index;
  }

  int getDisplayIndex() {
    return displayIndex;
  }

  int getItemIndex(Item item) {
    return agenda.indexOf(item);
  }

  List getItemList() {
    return agenda;
  }

  void addItem(String name, String desc, bool check, bool rep) {
    Item x = Item(name, desc, check, rep);
    agenda.add(x);
  }

  void setName(int index, String newName) {
    agenda[index].setName(newName);
  }

  void setDescription(int index, String newDesc) {
    agenda[index].setDescription(newDesc);
  }

  void setChecked(int index, bool c) {
    agenda[index].setChecked(c);
  }

  void setRepeat(int index, bool r) {
    agenda[index].setChecked(r);
  }

  void removeItem(int index) {
    agenda.removeAt(index);
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

  DateTime getDeadline(int index) {
    return agenda[index].getDeadline();
  }

  void setDeadline(int index, DateTime date) {
    agenda[index].setDeadline(date);
  }

  void setTitle(String t) {
    title = t;
  }

  String getTitle() {
    return title;
  }

  String itemString() {
    String s = '';
    for (Item x in agenda) {
      s += (x.toString() + "\n\n");
    }
    return s;
  }

//method to make a string of only unfinished items in Agenda
//called in viewUnfinished
  String unfinishedString() {
    String s = '';
    for (int i = 0; i < agenda.length; i++) {
      if (agenda[i] != null) {
        if (agenda[i].getChecked() == false) {
          s += (agenda[i].toString() + "\n");
        }
      } else {}
    }
    return s;
  }

  String toString() {
    return "Title: " + title + " " + itemString();
  }
}

class Item {
  String name;
  String description;
  bool checked;
  bool repeat;
  String deadline;

  Item(String n, String d, bool c, bool r) {
    name = n;
    description = d;
    checked = c;
    repeat = r;
    deadline = '';
  }

  void setDeadline(DateTime date) {
    deadline = date.month.toString() + '/' + date.day.toString();
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

  String getDeadline() {
    return deadline;
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
    /* if (deadline == null) {
      if (checked == false) {
        if (repeat == true) {
          return name + ': ' + description + '\n Unchecked, Repeat ON';
        } else
          return name + ': ' + description + '\n Unchecked, Repeat OFF';
      } else if (checked && repeat == true) {
        return name + ': ' + description + '\n Checked, Repeat ON';
      } else
        return name + ': ' + description + '\n Checked, Repeat OFF';
    } else {*/
    if (checked == false) {
      if (repeat == true) {
        return name +
            ': ' +
            description +
            '\n Unchecked, Repeat ON' +
            '\n' +
            'Due: ' +
            deadline;
      } else
        return name +
            ': ' +
            description +
            '\n Unchecked, Repeat OFF' +
            '\n' +
            'Due: ' +
            deadline;
    } else if (checked && repeat == true) {
      return name +
          ': ' +
          description +
          '\n Checked, Repeat ON' +
          '\n' +
          'Due: ' +
          deadline;
    } else
      return name +
          ': ' +
          description +
          '\n Checked, Repeat OFF' +
          '\n' +
          'Due: ' +
          deadline;
    //}
  }
}
