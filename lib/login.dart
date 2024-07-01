import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sight_poject/assets.dart';
import 'package:sight_poject/devices.dart';
import 'package:sight_poject/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF5EE),
      body: Container(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/sightlogolarge.png",
              ),
            ),
            Positioned(
              top: 220,
              left: 5,
              right: 5,
              child: Material(
                color: Color(
                  0xffFFFFFF,
                ),
                borderRadius: BorderRadius.circular(
                  20,
                ),
                elevation: 20,
                child: Container(
                  height: 346,
                  width: 380,
                  decoration: BoxDecoration(
                    color: Color(
                      0xffFFFFFF,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(
                          0xff000000,
                        ).withOpacity(
                          0.25,
                        ),
                        blurRadius: 1,
                        spreadRadius: 1,
                        offset: Offset(
                          0,
                          5,
                        ),
                      )
                    ],
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: "Jost",
                            fontWeight: FontWeight.w600,
                            color: Color(
                              0xff84AB68,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        getfield(
                          "ID",
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        getfield(
                          "Password",
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Devices(),
                              ),
                            );
                          },
                          child: Container(
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
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Devices(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Continue",
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height / 1.17,
              left: MediaQuery.sizeOf(context).width / 6,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  );
                },
                child: getbutton(
                  "Sign Up",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
