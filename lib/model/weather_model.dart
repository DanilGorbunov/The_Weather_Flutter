class Weather {
  String? city;
  double? temp;
  int? humidy;
  double? wind;


  Weather(
  {
    this.city,
    this.temp,
    this.humidy,
    this.wind,
});
  Weather.fromJson(Map<String, dynamic> json) {
    city = json['name'];
    temp = json["main"]["temp"];
    humidy = json["main"]["humidity"];
    wind = json["wind"]["speed"];
  }
}