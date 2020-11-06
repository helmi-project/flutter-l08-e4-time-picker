import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  TimeOfDay time1 = TimeOfDay.now();
  TimeOfDay picked;
  Future<Null> selectTime(BuildContext context) async {
    picked = await showTimePicker(
      context: context,
      initialTime: time1,
    );

    setState(() {
      time1 = picked;
      print(time1.toString());
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Time Picker'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    ('${time1.hour} : ${time1.minute}').toString(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () {
                      selectTime(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
