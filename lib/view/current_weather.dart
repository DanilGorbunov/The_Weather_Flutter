import 'package:flutter/material.dart';

Widget CurrentWearher(String location, String data, IconData icon, String temp) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        Text(
          "$location",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 29,
              color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "$data"
        ),
        Icon(Icons.wb_sunny_rounded),
        Text(
          "$temp",
          style: TextStyle(
            color: Colors.white,
            fontSize: 45,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    ),
  );
}