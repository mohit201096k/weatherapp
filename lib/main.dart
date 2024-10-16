
import 'package:flutter/material.dart';
import 'package:weather_app/Activity/loading.dart';
import 'Activity/home.dart';

void main() {
  runApp(  MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context)=>const Loading(),
      "/home":(context)=>const Home(),
      "/loading":(context)=> const Loading()
    }
  ));
}

