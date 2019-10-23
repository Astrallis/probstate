import 'dart:convert';
import 'package:http/http.dart'as http;
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'dart:convert';



mixin APIcalls on Model {

  String MainURL =  "";


  getBrands()async{
    http.Response  Response = await http.get(
        MainURL,
    );
    print("RESPONSE = "+ Response.body.toString());

    var data  = jsonDecode(Response.body.toString());

    notifyListeners();

  }


}

//  flutter build appbundle --target-platform android-arm64
