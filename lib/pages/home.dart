import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // data = ModalRoute.of(context)!.settings.arguments as Map;
    data = data.isNotEmpty? data: ModalRoute.of(context)!.settings.arguments as Map;

    print(data);

    //  set background based on day and night
    String bgImage = data['isDayTime']? 'day.jpg':'night.jpg';
    Color bgColor =  data['isDayTime']? Colors.blue: Colors.indigo;
    return Scaffold(
    body: SafeArea(
        child: Container(
           decoration:BoxDecoration(
              image: DecorationImage(
                  image:AssetImage('assets/$bgImage'),
                  fit:BoxFit.cover,
          )
        ),
            child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
            children:<Widget> [
              TextButton.icon(
                  onPressed: () async {
                 dynamic result=  await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = {
                    'time': result['time'],
                    'location': result['location'],
                    'isDayTime': result['isDayTime'],
                    'flag': result['flag'],

                  };
                });
                  },
                  icon: Icon(Icons.edit_location ,
                    color:Colors.grey[300],
                  ),

                  label: Text('Edit Location',
                    style: TextStyle(
                    color:Colors.grey[300],
                  ) ,
              ),
        ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Text(
                    data['location'],
                    style: TextStyle(
                        color:Colors.grey[300],
                          fontSize: 28.0,
                          letterSpacing: 2.0
                    ),
                  )
                ],
              ),
               SizedBox(height: 16.0),
            Text(
        data['time'],
      style: TextStyle(
        color:Colors.grey[300],
        fontSize:66.0,
      )
    )
            ],
          ),
        )

    ),
    ),
    );
  }
}
