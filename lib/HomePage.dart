import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
      switch (dateTime.weekday) {
        case 1:
          week = 'Mon';
          break;
        case 2:
          week = 'Tues';
          break;
        case 3:
          week = 'Wed';
          break;
        case 4:
          week = 'Thur';
          break;
        case 5:
          week = 'Fri';
          break;
        case 6:
          week = 'Sat';
          break;
        case 7:
          week = 'Sun';
          break;
      }
      switch (dateTime.month) {
        case 1:
          mon = 'Jan';
          break;
        case 2:
          mon = 'Feb';
          break;
        case 3:
          mon = 'Mar';
          break;
        case 4:
          mon = 'Apr';
          break;
        case 5:
          mon = 'May';
          break;
        case 6:
          mon = 'June';
          break;
        case 7:
          mon = 'July';
          break;
        case 8:
          mon = 'Aug';
          break;
        case 9:
          mon = 'Sep';
          break;
        case 10:
          mon = 'Out';
          break;
        case 11:
          mon = 'Nov';
          break;
        case 12:
          mon = 'Dec';
          break;
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2F40),
      appBar: AppBar(
        backgroundColor: Color(0xff2F2F40),
centerTitle: true,
        title: Text(
          "Smart Watch",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              letterSpacing: 2),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 40,top: 100),
            child: Column(
              children: [
                Text(
                  "${dateTime.hour}:${dateTime.minute}:${dateTime.second}  ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 70,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "${week}, ${dateTime.day} ${mon}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: InkWell(
              onTap: () {
                setState(() {
                Navigator.of(context).pushNamed("/anlog");
                });
              },
                child: Icon(Icons.arrow_forward,size: 30,color: Colors.white,)),
          ),
        ],
      ),
    );
  }
}

DateTime dateTime = DateTime.now();
String week='';
String mon='';