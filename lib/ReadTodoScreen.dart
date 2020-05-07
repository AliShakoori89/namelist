import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailTodoScreen.dart';
import 'Person.dart';
import 'database.dart';

class  ReadTodoScreen extends StatefulWidget {
  @override
  _ReadTodoScreenState createState() => _ReadTodoScreenState();
}

class _ReadTodoScreenState extends State<ReadTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
          appBar: AppBar(
            title: Text('Saved Person'),
            actions: <Widget>[
              IconButton(icon:Icon(Icons.arrow_back),
                  onPressed:(){
                    Navigator.push(context, new MaterialPageRoute(builder: (context)=>new DetailTodoScreen()));
                  })
            ],
          ),
          body: FutureBuilder<List<Person>>(
            future: DatabaseHelper.instance.retrieveTodos(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0),
                  padding: new EdgeInsets.all(7.0),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new Card(
                            child: ListTile(
                                title: Padding(padding: const EdgeInsets.only(top: 30),
                                  child: Text(snapshot.data[index].lastname),),
                                leading: Text(snapshot.data[index].nationalcode.toString()),
                                subtitle:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(padding: const EdgeInsets.only(top: 4),
                                      child: Text(snapshot.data[index].name),
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 4),
                                      child: Text(snapshot.data[index].email),
                                    ),
                                    Padding(padding: const EdgeInsets.only(top: 4 , bottom: 15),
                                      child: Text(snapshot.data[index].phonenumber.toString()),
                                    ),
                                  ],
                                ),
                                onTap: () => _navigateToDetail(context, snapshot.data[index]),
                                  trailing: IconButton(
                                      alignment: Alignment.center,
                                      icon: Icon(Icons.delete),
                                      onPressed: () async {
                                        _deleteTodo(snapshot.data[index]);
                                        setState(() {});
                                      }),
                            ),
                          );
                        },
                      ),
                );
              } else if (snapshot.hasError) {
                return Text("Oops!");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      theme: ThemeData.dark(),
    );
  }
}

_deleteTodo(Person person) {
  print('${person.id}');
  DatabaseHelper.instance.deleteTodo(person.id);
  print('${person.id}');
}

_navigateToDetail(BuildContext context, Person person) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => DetailTodoScreen(person: person,)),
  );
}
