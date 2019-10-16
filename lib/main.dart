import 'package:flutter/material.dart';
import 'mobileLogin.dart';
import 'LoginOptions.dart';


void main() => runApp(
  MaterialApp(
    initialRoute: '/',
  routes: {
    '/': (context) => LoginOptions(),
    '/second': (context) => MobileLogin(),
  },
    debugShowCheckedModeBanner: false,
  )
);

