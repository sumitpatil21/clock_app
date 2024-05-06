import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnlogWatch extends StatefulWidget {
  const AnlogWatch({super.key});

  @override
  State<AnlogWatch> createState() => _AnlogWatchState();
}

class _AnlogWatchState extends State<AnlogWatch> {
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
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: 0,
                ),
                Text(
                  "Alarm",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,width: 5,strokeAlign: BorderSide.strokeAlignInside
                      )
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      Transform.rotate(
                        angle:(dateTime.second*6*pi/180),
                        child: VerticalDivider(
                          thickness: 4,
                          color: Colors.white,
                          indent: 10,
                          endIndent: 75,
                        ),
                      ),
                      Transform.rotate(
                        angle:(dateTime.minute*6*pi/180),
                        child: VerticalDivider(
                          thickness: 5,
                          color: Colors.blue,
                          indent: 15,
                          endIndent:100,
                        ),
                      ),
                      Transform.rotate(
                        angle:(dateTime.hour + dateTime.minute/60) * 30 * pi / 180,
                        child: VerticalDivider(
                          thickness: 3,
                          color: Colors.red,
                          indent: 20,
                          endIndent:95,
                        ),

                      ),
                      Container(
                        height: 10,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),

                      ...List.generate(60, (index) =>  Stack(
                          children:[
                            Transform.rotate(
                              angle:(index*30*pi/180),
                              child: VerticalDivider(
                                thickness: 5,
                                color: Colors.red,
                                indent: 1,
                                endIndent:175,
                              ),
                            ),
                            Transform.rotate(
                              angle:(index*6*pi/180),
                              child: VerticalDivider(
                                thickness: 3,
                                color: Colors.yellow,
                                indent: 1,
                                endIndent:180,
                              ),
                            ),
                          ])),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Transform.rotate(
                    angle: pi + 15,
                    child: Icon(
                      Icons.notifications_active_sharp,
                      size: 40,
                      color: Colors.white,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${dateTime.hour}" +
                      " : ${dateTime.minute}" +
                      " : ${dateTime.second}"+
                      " $week ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${dateTime.day}" +
                      "/${dateTime.month}" +
                      "/${dateTime.year}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  mon,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w700),
                ),

              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed("/strap");
            },
              child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,))
        ],
      ),
    );
  }
}

DateTime dateTime = DateTime.now();
String week='';
String mon='';