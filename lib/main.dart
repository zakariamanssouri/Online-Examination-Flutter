import 'package:flutter/material.dart';
import 'package:online_examination/Screens/welcome/welcome.dart';
import 'package:online_examination/constraints.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Examination Project',
      theme: ThemeData(
          primaryColor: KPrimaryColor, scaffoldBackgroundColor: Colors.white
          ),
      home: const WelcomeScreen(),
    );
  }
}
