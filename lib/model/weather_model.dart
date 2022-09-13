class Weather {
  String? city;
  int? humidy;
  double? wind;
  String? temp;


  Weather(
  {
    this.city,
    this.temp,
    this.humidy,
    this.wind,

});
  Weather.fromJson(Map<String, dynamic> json) {

    city = json['name'];
    temp= json["main"]["temp"].toStringAsFixed(0);
    humidy = json["main"]["humidity"];
    wind = json["wind"]["speed"];
  }
}