import 'dart:convert';
import 'package:http/http.dart'as http;
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';



mixin Methods on Model {
  String email,pass;
  Future<void>emailGet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    email=pref.getString("data");
  }

  Future<void> emailSet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("data", email);

  }
  Future<void>passGet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pass=pref.getString("data");
  }

  Future<void> passSet()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("data", pass);

  }
}