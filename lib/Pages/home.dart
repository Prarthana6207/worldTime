// import 'dart:html';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic> data = {};
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments != null) {
      // Cast the arguments to Map<dynamic, dynamic>
      data = data.isNotEmpty
          ? data
          : ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    }

    //print(data);
    // String bgImage = data['isDayTime'] ? 'Colors.black' : 'Colors.white';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: data['isDayTime']
              ? const Color.fromARGB(255, 49, 49, 49)
              : Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/Location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag']
                        };
                      });
                    },
                    label: Text(
                      'Edit Location',
                      style: TextStyle(
                          color: data['isDayTime']
                              ? Colors.white
                              : const Color.fromARGB(255, 49, 49, 49)),
                    ),
                    icon: Icon(Icons.edit_location),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'] ?? 'Unknown Location',
                        style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: data['isDayTime']
                                ? Colors.white
                                : const Color.fromARGB(255, 49, 49, 49)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    data['time'] ?? 'Unknown Time',
                    style: TextStyle(
                        fontSize: 66.0,
                        color: data['isDayTime']
                            ? Colors.white
                            : const Color.fromARGB(255, 49, 49, 49)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
