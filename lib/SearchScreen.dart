import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {

  var text;
  var text1 = '';
  var text2 = '';
  var text3 = '';
  var text4 ;


  SearchScreen(this.text,this.text1,this.text2,this.text3,this.text4);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: Text('Recordes'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(padding: const EdgeInsets.symmetric(vertical: 50 , horizontal:  50),
                child: Text('Name:   $text1\n\nLastname:   $text2\n\nEmail:   $text3\n\nPhone Number:   $text4')
            )
          ],
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}
