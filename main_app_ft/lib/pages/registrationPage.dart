import 'package:flutter/material.dart';
class RegistrationScreen extends StatefulWidget {
  static String tag = 'Registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  final logo = Hero(
    tag: 'Fitness Tracker',
    child: CircleAvatar(

        backgroundColor: Colors.transparent,
        radius: 20.0,
        child: Text('Fitness Tracker', style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),)

    ),
  );

  final emailIdField = TextFormField(

    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
        hintText : 'Email Id',
        contentPadding : EdgeInsets.fromLTRB(20.0,10.0,20.0, 10.0),
        border : OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
        )
    ),
  );

  final passwordField = TextFormField(
    autofocus: false,
    obscureText: true,
    decoration: InputDecoration(
        hintText : 'Password',
        contentPadding : EdgeInsets.fromLTRB(20.0,10.0,20.0, 10.0),
        border : OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
        )
    ),
  );

  final confirmPasswordField = TextFormField(
    autofocus: false,
    obscureText: true,
    decoration: InputDecoration(
        hintText : ' Confirm Password',
        contentPadding : EdgeInsets.fromLTRB(20.0,10.0,20.0, 10.0),
        border : OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
        )
    ),
  );

  final registerButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      elevation: 7.0,
      child: MaterialButton(
        minWidth: 200.0,
        height: 42.0,
        onPressed: (){

        },
        color: Colors.lightBlueAccent,
        child: Text('Register', style: TextStyle(color: Colors.white)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.5,
                0.7,
                0.9
              ],
              colors: [
                Colors.blue[800],
                Colors.blue[700],
                Colors.blue[600],
                Colors.blue[400],
              ]),
        ),
        child: Card(

          elevation: 8.0,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(top:50.0,left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 15.0,),
              emailIdField,
              SizedBox(height: 15.0,),
              passwordField,
              SizedBox(height: 15.0,),
              confirmPasswordField,
              SizedBox(height: 10.0,),
              registerButton,

            ],
          ),
        ),
      ),
    );
  }
}