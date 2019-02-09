import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Scheduling App For Colleges",
      theme: new ThemeData(
        primaryColor: Colors.lightBlue[900],
      ),
      home: EventList()
    );
  }
}

void calendarShow(){}

class EventListState extends State<EventList>{
  String weekday = new DateFormat.EEEE().format(DateTime.now());
  String date = new DateFormat.MMMMd().format(DateTime.now());
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text(weekday + ", " + date),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: calendarShow,
          )
        ],
      ),
    );
  }
}


class EventList extends StatefulWidget{
  @override
  EventListState createState() => new EventListState();
}