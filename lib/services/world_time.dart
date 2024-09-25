
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

 class WorldTime{

  String location; //location name for UI
  String time=''; // time for that lacation
  String flag ; // assets flag icon
  String url; // location url for api endpoint
  late bool  isDayTime; // true /false for daytime

  WorldTime({required this.location, required this.flag ,required this.url});


  Future<void> getTime() async{

    try{
      // Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      // print(response.body ); // prints the string
      Map data =jsonDecode(response.body);

      // get the property from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print('datetime ' + datetime + ' offset '+ offset); // prints the string
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      // time = now.toString();


      //6 am and 8pm
      isDayTime = now.hour >6 && now.hour <20  ? true : false;
      time = DateFormat.jm().format(now);

    }
    catch(error){
      print(' Caught error ==> $error' );
      time='Could not get the time data';
    }


    // print(response.body[title] ); //error
    // Map data =jsonDecode(response.body);
    // print(data); // print the object
    // print(data['title'] ); // print the object

  }
}

