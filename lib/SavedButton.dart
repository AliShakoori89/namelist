import 'package:flutter/material.dart';

import 'Person.dart';
import 'database.dart';

class SavedButton extends StatefulWidget {
  final Person person;
  const SavedButton({Key key, this.person}) : super(key: key);

  @override
  _SavedButtonState createState() => _SavedButtonState(person);
}

class _SavedButtonState extends State<SavedButton> {

  final controller = new TextEditingController();
  final controller1 = new TextEditingController();
  final controller2 = new TextEditingController();
  final controller3 = new TextEditingController();
  Person person;

  _SavedButtonState(this.person);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.only(
              left: 20, top: 50),
          child: RaisedButton(
            color: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    18.0),
                side: BorderSide(
                    color: Colors.deepOrange)
            ),
            onPressed:(){ _saveTodo(
                controller.text, controller1.text,
                controller2.text, controller3.text);},
            child: Text('Save'),
          )
      ),
    );
  }
  _saveTodo( String name, String lastname , String email, String phonenumber) async {
    print('$phonenumber');
    if (person == null) {
      DatabaseHelper.instance.insertTodo(Person(
          name: controller.text,
          lastname: controller1.text,
          email: controller2.text,
          phonenumber: controller3.text));
      print('naaaame: $name   lastnaaame:$lastname   phon:$phonenumber');
//      Navigator.pop(context, "Your todo has been saved.");
    } else {
      await DatabaseHelper.instance
          .updateTodo(Person( name: name, lastname: lastname, email: email, phonenumber: phonenumber));
//      Navigator.pop(context);
    }
  }
}

