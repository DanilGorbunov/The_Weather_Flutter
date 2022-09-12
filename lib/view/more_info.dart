import 'package:flutter/material.dart';

TextStyle textMiniStyle = TextStyle(color: Colors.white, fontSize: 12);
TextStyle textDataStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700);

Widget MoreInformation (String temp, String humidy, String wind ){
  return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Temp",
                style: textMiniStyle
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "$temp",
                style: textDataStyle,
              )
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "Humidy",
                style: textMiniStyle,
              ),
              Text(
                "$humidy",
                style: textDataStyle,
              ),
            ],
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind",
                style: textMiniStyle
              ),
              Text(
                "$wind",
                style: textDataStyle,
              ),
            ],
          ),
        ],
      ),
  );
}