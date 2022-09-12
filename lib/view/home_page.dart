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
      //body: bodyMainList(),

      body: FutureBuilder(

        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
                return Container(
                  color: Color(0xFF828CAE),
                  child: Column(
                    children: [
                      //bodyMainList(),
                      SizedBox(
                        height: 80,
                      ),
                      TodayWeather(),
                      CurrentWearher('${data!.city}', '12.09.2022', Icons.wb_sunny_rounded, '${data!.temp}°' + ' ' + 'C'),
                      MoreInformation('${data!.temp}°', '${data!.humidy}', '${data!.wind}'),
                      //bodyMainList(),

                      TodayWeather(),
                    ],
                  ),
                );
          }
          return Container();
        }
      )

    );
  }

  SingleChildScrollView TodayWeather() {
    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 80,
                            height: 50,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    );
  }


  Container MyArticles(String imageVal, String heading, String subHeading){

    return Container(
      width: 160.0,
      child: Card(
        child: Wrap(
          children: [
            Image.asset(
                'assets/images/456.png'
            ),
            ListTile(
              title: Text(heading),
              subtitle: Text(subHeading),
            ),
          ],
        ),
      ),
    );
  }

  ListView bodyMainList() {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            //itemCount: stories.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SizedBox(width: 10.0);
              }
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 65.0,
                height: 65.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  child: ClipOval(
                    // child: Image(
                    //   height: 63.0,
                    //   width: 63.0,
                    //   image: AssetImage(stories[index - 1]),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
              );
            },
          ),
        ),
        // _post(0),
        // _post(1),
        //_post(3),
      ],
    );
  }



}

// Container(
// color: Color(0xFF828CAE),
// //color: Color(0xFF42A5F5),
//
// ),