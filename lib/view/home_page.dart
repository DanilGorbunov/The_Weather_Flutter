import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:theweather/model/weather_model.dart';
import '../services/api_weather.dart';
import 'current_weather.dart';
import 'more_info.dart';

DateTime datetime = DateTime.now();
String time = DateFormat.MMMMEEEEd().format(datetime);


class HomePage extends StatefulWidget {


  const HomePage({super.key, required this.title});

  final String title;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async{
    data = await client.getCurrentWeather("Lagos ");
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _widgetOptions = <Widget>[
      Container(
        child: mainFirstBody(),
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
      Text(
        'Index 3: Settings',
        style: optionStyle,
      ),
    ];

    return Scaffold(
      backgroundColor: Color(0xFF828CAE),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.place),
              label: 'My Location',
              backgroundColor: Color(0xFFA7B4E0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Color(0xFFA7B4E0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.folder_copy_outlined),
              label: 'Forecast',
              backgroundColor: Color(0xFFA7B4E0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Color(0xFFA7B4E0),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
      //body: mainFirstBody(),

    );
  }

  FutureBuilder<void> mainFirstBody() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
              return Container(
                color: Color(0xFF828CAE),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    IconsWeather(),
                    CurrentWearher('${data!.city}', time, Icons.wb_sunny_rounded, '${data!.temp}°' + ' ' + 'C'),
                    MoreInformation('${data!.temp}°', '${data!.humidy}%', '${data!.wind}'),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                              "Today",
                            style: TextStyle(
                                fontSize: 18,
                              color: Colors.white,

                            ),
                          ),
                        ),
                        Spacer(), // use Spacer
                        Padding(
                          padding: const EdgeInsets.only(right: 21),
                          child: Text(
                              "View report",
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF002688),

                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    HoursWeather(),

                  ],
                ),
              );
        }
        return Container();
      }
    );
  }



  Container HoursWeather() {
    return Container(

      height: 85,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height: 40,
              width: 30,
            ),
            Container(
              height: 70,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFA7B4E0),
                boxShadow: const [
                  BoxShadow(color: Color(0xFFA7B4E0), spreadRadius: 3,
                      blurRadius: 0.5,
                      offset: Offset(0.0, 0.75)

                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/cloud.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "10:00am",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "24c",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 70,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Color(0xFFA7B4E0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/moon_cloud.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "1:00pm",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "28c",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Container(
              height: 70,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // color: Color(0xFFA7B4E0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      height: 55.0,
                      width: 55.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/light_rain.png'),
                          fit: BoxFit.fill,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          "10:00am",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),

                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "28c",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }


  Container IconsWeather() {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Color(0xFF7882A7),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75)
            )
          ],
      ),
      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              //width: 80,
                              height: 90,

                             child: Column(
                               children: [
                                 Container(
                                   height: 60.0,
                                   width: 60.0,
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage(
                                           'assets/images/big_rain_drops.png'),
                                       fit: BoxFit.fill,
                                     ),
                                     shape: BoxShape.circle,
                                   ),
                                 ),
                                 Text(
                                     "Rain",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w500,
                                   ),

                                 ),
                               ],
                             ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              //width: 80,
                              height: 90,

                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/drizz.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Drizz",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              //width: 100,
                              height: 90,

                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/thunder.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Thunder",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              //width: 80,
                              height: 90,

                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light_rain.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Light rain",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              //width: 80,
                              height: 90,

                              child: Column(
                                children: [
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/moon_cloud.png'),
                                        fit: BoxFit.fill,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "Moon Cloud",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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



}

