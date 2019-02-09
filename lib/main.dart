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
void getNotification(){}
class EventListState extends State<EventList>{
  String weekday = new DateFormat.EEEE().format(DateTime.now());
  String date = new DateFormat.MMMMd().format(DateTime.now());
 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar(
        title: Text(weekday + ", " + date),
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: calendarShow,
          )
        ],
      ),
      body: Container(
        color: Colors.lightBlue[900],
        child: ListView(
          children: <Widget>[
            Container(
              color: Color(0xff4C9ACF),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("8.00 to 9.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Discrete Mathematics\n\nLT-3", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff4874A9),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("9.00 to 1.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Data Structures\n\nLT-3", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff5A5388),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("11.00 to 12.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Approaches To Indian Society\n\nLT-3", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),  
            Container(
              color: Color(0xff544267),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("12.00 to 11.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Digital Logic Design\n\nLT-3", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff4C99CF),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("14.00 to 17.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Digital Logic Design Lab\n\nLab 107", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff4874A9),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("18.00 to 21.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Debate Club\n\nCEP 106", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff5A5388),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("22.00 to 21.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Synapse Meeting\n\nCEP 110", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),
            Container(
              color: Color(0xff544267),
              margin: const EdgeInsets.all(1.0),
              child: ListTile(
              isThreeLine: true,
              title: Text("21.00 to 00.00", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              subtitle: Text("Programming Club Session\n\nCEP 108", style: TextStyle(color: Colors.white),),
              trailing: new IconButton(
                icon: Icon(Icons.notifications_none),
                color: Colors.white,
                onPressed: getNotification,
              )
              ),
            ),

          ],
        ),
      )
    );
  }

}


class EventList extends StatefulWidget{
  @override
  EventListState createState() => new EventListState();
}