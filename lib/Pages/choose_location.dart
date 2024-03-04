import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   print('InitState function run');
  List<WorldTime> locations = [
    WorldTime(
        location: "Tunis",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'Africa/Tunis'),
    WorldTime(
        location: "Cuiaba",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'America/Cuiaba'),
    WorldTime(
        location: "Fort_Nelson",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'America/Fort_Nelson'),
    WorldTime(
        location: "Indianapolis",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'America/Indiana/Indianapolis'),
    WorldTime(
        location: "Dhaka",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'Asia/Dhaka'),
    WorldTime(
        location: "Singapore",
        flag: 'https://cdn.britannica.com/97/1597-004-05816F4E/Flag-India.jpg',
        url: 'Asia/Singapore')
  ];
  void updatTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('Build is running');
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text("Choose a Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updatTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(locations[index].flag),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
