import 'package:flutter/material.dart';
import 'package:main_app_ft/scopedModel/methods.dart';
import 'package:main_app_ft/scopedModel/mainModel.dart';
import 'package:main_app_ft/scopedModel/methods.dart';
import 'package:scoped_model/scoped_model.dart';

class Login extends StatefulWidget{
  @override
  _LoginState createState() => _LoginState();
}
GlobalKey<FormState>validatekey=GlobalKey<FormState>();
class _LoginState extends State<Login> {
  String email,pass="default";
        @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(key: validatekey,
            child: TextFormField(onSaved: (value){
              email=value;
              setState(() {
              });
            },),
          ),
          Form(key: validatekey,
            child: TextFormField(onSaved: (value){
              pass=value;
              setState(() {
              });
            },),
          ),
          Submit(),
//          Center(child: RaisedButton(onPressed: (){
//            validatekey.currentState.save();
//            if(pass!=null&&email!=null) {
//              Methods.emailSet();
//            }
//          },child: Text("Submit"),),),

        ],
      ),);

  }
}

Widget Submit(){

  return ScopedModelDescendant( builder: (context, child, mainModel) {

    return Container(
        child:RaisedButton(
          child: Text("submit"),
            onPressed:(){
              mainModel.emailSet();
              mainModel.passSet();
            }
        )
    );


  }
  );
}