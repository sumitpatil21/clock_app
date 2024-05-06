import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class strapwatch extends StatefulWidget {
  const strapwatch({super.key});

  @override
  State<strapwatch> createState() => _strapwatchState();
}

class _strapwatchState extends State<strapwatch> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2F2F40),
      body:Column(
        children: [
          SizedBox(
            height: 100,
            width: 500,
          ),
          Stack(
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  color: Colors.orange,
                  value: (dateTime.hour%12+((dateTime.minute/60)/160)),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 120,left: 60),
                child: Text(
                  "${dateTime.hour}" +
                      " : ${dateTime.minute}" +
                      " : ${dateTime.second}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 8,
                  color: Colors.green,
                  value: dateTime.minute/60,
                ),
              ),

              SizedBox(
                width: 300,
                height: 300,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                  value: dateTime.second/60,
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
DateTime dateTime=DateTime.now();