import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget{
  @override
  MyAccountState createState() => new MyAccountState();
}


class MyAccountState extends State<MyAccount> {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Sign In"),
          onPressed: sign_in,
          color: Colors.green,
        ),
      ),  
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50.0,),
      ),

    );
  }

}

void sign_in(){}