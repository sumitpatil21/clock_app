import 'package:clock_app/AnlogWatch.dart';
import 'package:clock_app/HomePage.dart';
import 'package:clock_app/srtrapwatch.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyClockApp());
}
class MyClockApp extends StatelessWidget {
  const MyClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => HomePage(),
        "/anlog":(context) =>AnlogWatch(),
        "/strap":(context) =>strapwatch(),
      },
    );
  }
}
