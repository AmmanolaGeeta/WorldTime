import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({super.key});

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

// String time = 'Loading';

void setupWorldTime() async{
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
  await instance.getTime();
  // print(instance.time);
  // setState((){
  //   time = instance.time;
  // });

  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location':instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime':instance.isDayTime,
  });
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
    setupWorldTime();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[700] ,
      body:  const Center(
        // padding: EdgeInsets.all(50.0),
        // child: Text(time),
        // child: Text('loading'),
        child:  SpinKitPouringHourGlass	 (
          color: Colors.white,
          size: 80.0,
         ),
      ),
    );
  }
}

