import 'package:flutter/material.dart';

Widget CurrentWearher(String location, String data, IconData icon, String temp) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "$location",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 29,
              color: Colors.white),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
            "$data",
          style: TextStyle(

              fontSize: 14,
              color: Colors.white),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/moon_cloud.png'),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
        ),

        SizedBox(
          height: 15,
        ),
        //Icon(Icons.wb_sunny_rounded),
        Text(
          "$temp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 55,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}