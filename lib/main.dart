import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/DetailsScreen.dart';
import 'package:flutter_pokedex/pages/HomeScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{
  @override  
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}