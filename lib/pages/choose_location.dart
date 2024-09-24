import 'package:flutter/material.dart';

class chooseLocation extends StatefulWidget {


  @override
  State<chooseLocation> createState() => _chooseLocationState();
}

class _chooseLocationState extends State<chooseLocation> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:Text( 'Choose a Location'),
          centerTitle: true,
        elevation: 0.0,
      ),


      body: ElevatedButton(

        onPressed: ()
      { setState(() {
        counter += 1;
      });
        },
        child:  Text('Counter is  $counter'),
      ),

    );
  }
}
