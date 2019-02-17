import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';



Future main() async => runApp(MainApp());

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

class Calendar{
  final String name;
  final DocumentReference reference;

  Calendar.fromMap(Map<String, dynamic>map,{this.reference})
    : assert(map['name'] != null),
      name = map['name'];

  Calendar.fromSnapshot(DocumentSnapshot snapshot)
  : this.fromMap(snapshot.data, reference:snapshot.reference);

  @override
  String toString() => "Calendar<$name>";
}

class Event{
  String _title;
  String _place;
  DateTime _dateAndTime;
  Calendar calendar;
}

class CalendarList extends StatefulWidget{
  @override
  CalendarListState createState() => new CalendarListState();
}

class CalendarListState extends State<CalendarList>{
  Widget build(BuildContext context){
      return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('calendars').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return LinearProgressIndicator();
          
          return _buildList(context, snapshot.data.documents);
        },
      );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    return ListView(
      padding: const EdgeInsets.only(top:20.0),
      children: snapshot.map((data) => _buildListItem(context,data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data){
    final calendar = Calendar.fromSnapshot(data);

    return Padding(
      key:ValueKey(calendar.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(calendar.name),
          trailing:new Icon(
            Icons.check
          ),
          onTap: (){

          },
        ),
      ),
    );

  }
}

Widget getNotification(){}



class EventListState extends State<EventList>{
  String weekday = new DateFormat.EEEE().format(DateTime.now());
  String date = new DateFormat.MMMMd().format(DateTime.now());
  
  void calendarShow(){
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context){
           return new Scaffold(
             appBar: new AppBar(
               title: const Text("Calendars"),
             ),
             body: CalendarList(),
           ); 
        }
      ),
    );
  }





  Widget build(BuildContext context){

   //Appbar
    return Scaffold(
        drawer : Drawer(

          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Thanks for using our App', style : TextStyle(fontSize : 18.0, color :Colors.white)),
                decoration: BoxDecoration(
                  color: Color(0xff4C9ACF),
                ),
              ),


              ListTile(
                title: Text('My Account', style : TextStyle(fontSize : 18.0 , color : Color(0xff5A5388) )),
                leading: const Icon(Icons.account_box),

                onTap: () {

                 Navigator.push(context, MaterialPageRoute(builder: (_) => My_Account()));

                },
              )
            ],
          ),
        )


        ,appBar: new AppBar(
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



class My_Account extends StatefulWidget{
  @override
  My_Account_State createState() => new My_Account_State();
}


class My_Account_State extends State<My_Account> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),


    );
  }

}
