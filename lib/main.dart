import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/choose_location.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context) => loading(),
      '/home':(context) => Home(),
      '/location':(context) =>chooseLocation (),

    },



    // home: Home(),    // its without proper url  eg http://localhost:54032/
  ));
}
