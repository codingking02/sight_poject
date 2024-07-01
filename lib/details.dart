import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sight_poject/assets.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffEFF5EE,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Material(
              elevation: 0,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  48,
                ),
              ),
              child: Container(
                width: 430,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(
                        0xffcae6b5,
                      ),
                      Color(
                        0xffcee5be,
                      ),
                      Color(
                        0xffd7e7cb,
                      ),
                      Color(
                        0xffdfecd5,
                      ),
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(
                      48,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(
                        0,
                        0,
                        0,
                        0.25,
                      ),
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.height / 10,
            child: Image.asset(
              "assets/gradientsightlogo.png",
            ),
          ),
          Positioned(
            top: 30,
            left: 23,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/arrow.png",
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: MediaQuery.of(context).size.width / 6,
            child: Image.asset(
              "assets/switch.png",
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.13,
            left: 23,
            child: Text(
              "Sightseer 1",
              style: TextStyle(
                color: Color(
                  0xff84AB68,
                ),
                fontFamily: "Jost",
                fontSize: 32,
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: MediaQuery.of(context).size.height / 1.85,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 25,
                ),
                width: 409,
                height: 118,
                decoration: BoxDecoration(
                  color: Color(
                    0xffFFFFFF,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "connected",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "4:20:00",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Processing...",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "20%",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.42,
            left: 10,
            right: 10,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                width: 409,
                height: 368,
                decoration: BoxDecoration(
                  color: Color(
                    0xffFFFFFF,
                  ),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 140,
                      ),
                      child: Text(
                        "Models",
                        style: TextStyle(
                          fontFamily: "Jost",
                          fontWeight: FontWeight.w600,
                          color: Color(
                            0xff707070,
                          ),
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            pngimage(
                              "check",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Obstacle Detection",
                              style: TextStyle(
                                fontFamily: "Jost",
                                fontWeight: FontWeight.w600,
                                color: Color(
                                  0xff707070,
                                ),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "03:10:00",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            pngimage(
                              "check",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Text Recognition",
                              style: TextStyle(
                                fontFamily: "Jost",
                                fontWeight: FontWeight.w600,
                                color: Color(
                                  0xff707070,
                                ),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "04:10:00",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            pngimage(
                              "check",
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Face Detection",
                              style: TextStyle(
                                fontFamily: "Jost",
                                fontWeight: FontWeight.w600,
                                color: Color(
                                  0xff707070,
                                ),
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "06:10:00",
                          style: TextStyle(
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff707070,
                            ),
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: 5,
                          ),
                          height: 55,
                          width: 68,
                          decoration: BoxDecoration(
                            color: Color(
                              0xff8EB870,
                            ),
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 250,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Color(
                                0xff8EB870,
                              ),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Disconnect",
                                style: TextStyle(
                                  fontFamily: "Jost",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(
                                    0xffFFFFFF,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
