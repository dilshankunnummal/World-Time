import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Safely cast arguments to Map
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is Map) {
      data = arguments;
      print(data);
    }

    String bgImage = data['isDayTime'] ? 'day1.jpg' : 'night.jpeg';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/night.jpeg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                  label: const Text('Edit Location'),
                  icon: const Icon(CupertinoIcons.location_solid),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data['location'] ?? '',
                  style: const TextStyle(fontSize: 28, letterSpacing: 2),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data['time'] ?? '',
                  style: const TextStyle(fontSize: 50, letterSpacing: 2),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
