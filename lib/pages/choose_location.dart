import 'package:flutter/material.dart';

import '../service/world_time.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  List<WorldTime> location = [
    WorldTime(location: 'London', url: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Athens', url: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(location: 'Madrid', url: 'Europe/Madrid', flag: 'spain.png'),
  ];

  Future<void> updateTime(index) async {
    WorldTime instance  = location[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time' : instance.time,
      'isDayTime' : instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location'),
        ),
        body: ListView.builder(
          itemCount: location.length,
          itemBuilder: (Context, index) {
            return Card(
              child: ListTile(
                onTap: (){

                },
                title: Text(location[index].location),
              ),

            );
          },
        ),
      ),
    );
  }
}
