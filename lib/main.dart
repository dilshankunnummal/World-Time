import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingPage(),
      '/home': (context) => HomePage(),
      '/location': (context) => LocationPage()
    },
  ));
}
