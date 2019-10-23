import 'package:flutter/material.dart';
import 'package:main_app_ft/pages/registrationPage.dart';
import 'package:main_app_ft/scopedModel/mainModel.dart';
import 'package:scoped_model/scoped_model.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<mainModel>(
      model: mainModel(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {




  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'Fitness Tracker',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20.0,
          child: Image(
            image: AssetImage('assets/stepcounter.png'),
          )),
    );

    final emailIdField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email Id',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );



    final forgotLabel = FlatButton(
      child: Text('Forgot Password', style: TextStyle(color: Colors.black)),
      onPressed: () {},
    );
    return ScopedModelDescendant<mainModel>(
        builder: (context, child, mainModel) {
          return
      Scaffold(
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
            padding: EdgeInsets.only(top: 40.0, left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              Text('Fitness Tracker',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 10.0,
              ),
              emailIdField,
              SizedBox(
                height: 20.0,
              ),
              passwordField,
              SizedBox(
                height: 15.0,
              ),
              loginButton(context),
              SizedBox(
                height: 5.0,
              ),
              forgotLabel,
              SizedBox(
                height: 5.0,
              ),
              registerButton(context),
            ],
          ),
        ),
      ),
    );
        });
  }

  Widget loginButton(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 7.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {

          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
  Widget registerButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 7.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RegistrationScreen()));
          },
          color: Colors.lightBlueAccent,
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
