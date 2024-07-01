import 'package:flutter/material.dart';
import 'package:sight_poject/assets.dart';
import 'package:sight_poject/details.dart';

class Devices extends StatefulWidget {
  Devices({super.key});

  @override
  State<Devices> createState() => _DevicesState();
}

class _DevicesState extends State<Devices> {
  bool ischanaged = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(
        0xffFFFFFF,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 310,
            top: 80,
            child: Text(
              "Ahmed",
              style: TextStyle(
                fontFamily: "Jost",
                fontSize: 20,
                color: Color(
                  0xff8EB870,
                ),
              ),
            ),
          ),
          Positioned(
            left: 40,
            child: Image.asset(
              "assets/sightlogosmall.png",
            ),
          ),
          Positioned(
            left: 320,
            top: 40,
            child: Image.asset(
              "assets/usericon.png",
            ),
          ),
          Positioned(
            top: 110,
            left: 1,
            right: 1,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 1,
              ),
              height: 879.75,
              width: 410,
              decoration: BoxDecoration(
                color: Color(
                  0xffEFF5EE,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            left: 5,
            right: 5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(
                      0,
                      5,
                    ),
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Color(
                      0xff000000,
                    ).withOpacity(
                      0.25,
                    ),
                  ),
                ],
              ),
              height: 37,
              child: Material(
                color: Color(0xffF0F6EF),
                elevation: 15,
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Jost",
                    decoration: TextDecoration.none,
                  ),
                  cursorColor: Color(
                    0xff84AB68,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: pngimage(
                      "searchicon",
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontFamily: "Jost",
                      decoration: TextDecoration.none,
                      color: Color(
                        0xff9E9A9A,
                      ),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide: BorderSide(
                        color: Color(
                          0xffF0F6EF,
                        ),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide: BorderSide(
                        color: Color(
                          0xffF0F6EF,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide: BorderSide(
                        color: Color(
                          0xffF0F6EF,
                        ),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      borderSide: BorderSide(
                        color: Color(
                          0xffF0F6EF,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 136,
            right: 10,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Go",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Jost",
                    color: Color(
                      0xffFFFFFF,
                    ),
                  ),
                ),
                width: 66,
                height: 19,
                decoration: BoxDecoration(
                  color: Color(
                    0xff8EB870,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(
                        0,
                        4,
                      ),
                      blurRadius: 4,
                      spreadRadius: 0,
                      color: Colors.black.withOpacity(
                        0.25,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1,
            right: 1,
            top: 180,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              height: 500,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 118,
                    width: 409,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        10,
                        20,
                        0,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sightseer ${index}",
                                style: TextStyle(
                                  color: Color(
                                    0xff84AB68,
                                  ),
                                  fontFamily: "Jost",
                                  fontSize: 32,
                                ),
                              ),
                              Switch(
                                activeColor: Color(
                                  0xff8EB870,
                                ),
                                inactiveThumbColor: Color(
                                  0xff9E9A9A,
                                ),
                                value: ischanaged,
                                onChanged: (value) {
                                  setState(() {
                                    ischanaged = value;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                ),
                                alignment: Alignment.center,
                                width: 51,
                                height: 41,
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
                                  size: 30,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Details(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: 10,
                                  ),
                                  width: 264,
                                  height: 41,
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
                                      "Info",
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.12,
            left: 5,
            right: 5,
            child: Container(
              alignment: Alignment.centerRight,
              width: 388,
              height: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: Color(
                  0xff8EB870,
                ),
              ),
              child: pngimage(
                "user",
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 1.19,
            left: MediaQuery.of(context).size.width / 2.5,
            child: Container(
              alignment: Alignment.center,
              height: 68,
              width: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                color: Color(
                  0xffFFFFFF,
                ),
              ),
              child: pngimage(
                "add",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
