import 'package:flutter/material.dart';
import 'Person.dart';
import 'ReadTodoScreen.dart';
import 'SearchBar.dart';
import 'database.dart';

class DetailTodoScreen extends StatefulWidget {
  static const routeName = '/detailTodoScreen';
  final Person person;

  const DetailTodoScreen( {Key key, this.person}) : super(key: key);

  @override
State<StatefulWidget> createState() => _CreateTodoState(person);
}

class _CreateTodoState extends State<DetailTodoScreen> {
  Person person;
  final controller = new TextEditingController();
  final controller1 = new TextEditingController();
  final controller2 = new TextEditingController();
  final controller3 = new TextEditingController();
  final controller4 = new TextEditingController();

  _CreateTodoState(this.person);

  @override
  void initState() {
    super.initState();
    if (person != null) {
      controller.text = person.name;
      controller1.text = person.lastname;
      controller2.text = person.email;
      controller3.text = person.phonenumber;
      controller4.text = person.nationalcode;
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Name List'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, bottom: 25.0),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image.network(
                          'https://www.w3schools.com/howto/img_avatar.png',
                          fit: BoxFit.cover,),
                      ),
                      radius: 50.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5.0, right: 5.0),
                    padding: new EdgeInsets.all(7.0),
                    child: new Card(
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 250, top: 25),
                              child: Container(
                                height: 35,
                                width: 35,
                                child: FloatingActionButton(
                                  onPressed: () {
                                        _search();
                                  },
                                  child: Icon(
                                    Icons.search, color: Colors.white,),
                                  backgroundColor: Colors.grey,
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 25),
                              child: Container(
                                child: Padding(padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5.0),
                                  child: TextField(
                                    cursorColor: Colors.deepOrange,
                                    maxLength: 30,
                                    controller: controller,
                                    decoration: InputDecoration(
                                      hintText: 'Name',
                                      icon: Icon(
                                        Icons.person, color: Colors.grey,),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                 top: 25),
                              child: Container(
                                child: Padding(padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5.0),
                                  child: TextField(
                                    cursorColor: Colors.deepOrange,
                                    maxLength: 30,
                                    controller: controller1,
                                    decoration: InputDecoration(
                                      hintText: 'Lastname',
                                      icon: Icon(
                                        Icons.person, color: Colors.grey,),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 25),
                              child: Container(
                                child: Padding(padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5.0),
                                  child: TextField(
                                    cursorColor: Colors.deepOrange,
                                    maxLength: 30,
                                    controller: controller4,
                                    decoration: InputDecoration(
                                      hintText: 'National Code',
                                      icon: Icon(
                                        Icons.code, color: Colors.grey,),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 25),
                              child: Container(
                                child: Padding(padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5.0),
                                  child: TextField(
                                    cursorColor: Colors.deepOrange,
                                    maxLength: 30,
                                    controller: controller2,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      icon: Icon(
                                        Icons.email, color: Colors.grey,),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                 top: 25),
                              child: Container(
                                child: Padding(padding: const EdgeInsets.only(
                                    top: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    bottom: 5.0),
                                  child: TextField(
                                    cursorColor: Colors.deepOrange,
                                    maxLength: 30,
                                    controller: controller3,
                                    decoration: InputDecoration(
                                      hintText: 'Phone Number',
                                      icon: Icon(
                                        Icons.phone_android, color: Colors.grey,),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80, top: 50),
                                  child: RaisedButton(
                                    color: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(
                                            18.0),
                                        side: BorderSide(
                                            color: Colors.deepOrange)
                                    ),
                                    onPressed:() async {
                                      await _saveTodo(
                                        controller.text, controller1.text,
                                        controller2.text, controller3.text, controller4.text)
                                          .then((value){
                                          controller.clear();
                                          controller1.clear();
                                          controller2.clear();
                                          controller3.clear();
                                          controller4.clear();
                                      });
                                      setState(() {});
//                                      if (res != true){
//                                        final snackBar =SnackBar(
//                                          content: Text('No ID available'),
//                                          action: SnackBarAction(
//                                            label: 'Undo',
//                                            onPressed: () {
//                                              // Some code to undo the change.
//                                            },
//                                          ),
//                                        );
//                                        Scaffold.of(context).showSnackBar(snackBar);
//                                      }
//                                      else {
//                                        final snackBar = SnackBar (
//                                          content: Text ('Delete Successfuly!'),
//                                          action: SnackBarAction (
//                                            label: 'Undo',
//                                            onPressed: () {
//// Some code to undo the change.
//                                            },
//                                          ),
//                                        );
//                                        Scaffold.of (context).showSnackBar (snackBar);
//                                      }
                                      },
                                    child: Text('Save'),
                                  )
                              ),
                              Padding(
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
                                    onPressed: () {
                                      _navigateToReadTodoScreen(context);
                                    },
                                    child: Text("Show All"),
                                  )
                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(
//                                    left: 20, top: 50),
//                                child: RaisedButton(
//                                  color: Colors.grey,
//                                  shape: RoundedRectangleBorder(
//                                      borderRadius: new BorderRadius.circular(
//                                          18.0),
//                                      side: BorderSide(color: Colors.deepOrange)
//                                  ),
//                                  onPressed: () {
//                                    _delete();
//                                  },
//                                  child: Text('Delete'),
//                                ),
//                              ),

                            ],
                          ),
//                          )
                        ],
                      ),
                      color: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }

  _navigateToReadTodoScreen(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ReadTodoScreen()),
    );
  }

  Future<bool> _saveTodo( String name, String lastname , String email, String phonenumber, String nationalcode) async {
    print('$phonenumber');
    if (person == null) {
      DatabaseHelper.instance.insertTodo(Person(
        name: controller.text,
        lastname: controller1.text,
        nationalcode: controller4.text,
        email: controller2.text,
        phonenumber: controller3.text));
    } else {
      await DatabaseHelper.instance
          .updateTodo(Person(id: person.id, name: name, lastname: lastname, nationalcode: nationalcode, email: email, phonenumber: phonenumber));
//      Navigator.pop(context);
    }
    return true;
  }

  void _search() async{
    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new SearchBar()));
  }
}
