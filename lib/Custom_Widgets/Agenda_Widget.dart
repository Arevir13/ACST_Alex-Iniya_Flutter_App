class Agenda {
  List agenda;
  String title;
  Agenda() {
    agenda = <Item>[];
    title = '';
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

  void setTitle(String t) {
    title = t;
  }

  String getTitle() {
    return title;
  }

  String itemString() {
    String s = '';
    for (Item x in agenda) {
      s += (x.toString() + "\n");
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
