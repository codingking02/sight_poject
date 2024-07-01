import 'package:flutter/material.dart';

Widget pngimage(String imagename) {
  return Image.asset("assets/$imagename.png");
}

Widget svgimage(String imagename) {
  return Image.asset("assets/$imagename.svg");
}

Widget getbutton(String text) {
  return Container(
    width: 276,
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
        text,
        style: TextStyle(
          fontFamily: "Jost",
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Color(
            0xffFFFFFF,
          ),
        ),
      ),
    ),
  );
}

Widget getfield(
  String text,
) {
  return Container(
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
            0.05,
          ),
        ),
      ],
    ),
    height: 38,
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
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 20,
            fontFamily: "Jost",
            decoration: TextDecoration.none,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 5, 5, 5),
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
  );
}
