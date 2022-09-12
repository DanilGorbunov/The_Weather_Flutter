import 'package:flutter/material.dart';
import 'package:theweather/model/weather_model.dart';
import '../services/api_weather.dart';
import 'current_weather.dart';
import 'more_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("Paris");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
                return    Container(
                  color: Color(0xFF828CAE),
                  child: Column(
                    children: [
                      CurrentWearher('${data!.city}', '12.09.2022', Icons.wb_sunny_rounded, '${data!.temp}°' + ' ' + 'C'),
                      MoreInformation('${data!.temp}°', '${data!.humidy}', '${data!.wind}'),
                    ],
                  ),
                );
          }
          return Container();
        }
      )

    );
  }


}

// Container(
// color: Color(0xFF828CAE),
// //color: Color(0xFF42A5F5),
//
// ),