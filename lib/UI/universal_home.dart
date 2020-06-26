import 'package:flutter/material.dart';

class MyUniHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyUniHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink,
        title: Text("Daily Lose of PUBG"),
      ),
      body: new Container(
        color: Colors.pink,
        child: GridView.count(
          padding: EdgeInsets.only(top: 10),
          crossAxisCount: 2,
          //padding: EdgeInsets.only(left: 100,top: 20),
          children: <Widget>[
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),
           Helper(),

          ],
        ),
      ),
    );
  }
}

class Helper extends StatelessWidget {
  const Helper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child:  Card(
          color: Colors.amber,
          child:Center(
            child: Text("Hello From Flutter"),
          )
      ),
    );
  }
}
