import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

void getTime() async{

  // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
  print(response.body ); // prints the string
  Map data =jsonDecode(response.body);

  // get the property from data
  String datetime = data['datetime'];
  String offset = data['utc_offset'].substring(1,3);
  print('datetime ' + datetime + ' offset '+ offset); // prints the string
  DateTime now = DateTime.parse(datetime);
  now = now.add(Duration(hours: int.parse(offset)));
  print(now );



  // print(response.body[title] ); //error
  // Map data =jsonDecode(response.body);
  // print(data); // print the object
  // print(data['title'] ); // print the object

}

  // void getData() async{
  //   // Future.delayed(Duration(seconds: 3),(){
  //   //   print('Yoshi');
  //   // });
  //   // Future.delayed(Duration(seconds: 2),(){
  //   //   print('Vegan , musician & egg collector');
  //   // });
  //
  //   String username =  await Future.delayed(Duration(seconds: 3),(){
  //     return  'Yoshi';
  //   });
  //
  //
  //   String bio =  await Future.delayed(Duration(seconds: 2),(){
  //     return  'Vegan , musician & egg collector';
  //   });
  //   print('$username -  $bio');
  //
  // }
  @override
  void initState() {
    super.initState();
    getTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading'),
    );
  }
}

