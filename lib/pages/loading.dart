import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/service/world_time.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String time = "loading";

  Future<void> setupWorldTime() async {
    WorldTime instance =
        WorldTime(location: 'Kolkata', url: "Asia/Kolkata", flag: 'ind.png');
    await instance.getTime();
     print(instance.time);
    Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time' : instance.time,
        'isDayTime' : instance.isDayTime
    });
    // setState(() {
    //   time = instance.time!;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: SpinKitCubeGrid(
            color: Colors.white,
            size: 80.0,
          ),
        )
      ),
    );
  }
}
