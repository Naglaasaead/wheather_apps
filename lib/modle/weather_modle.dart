import 'dart:convert';

class WeatherModle{
  final String cityName;
  final String? image;
  final DateTime date;
  final double mxaTemp;
  final double minTemp;
  final String status;
  final double temp;


  WeatherModle(
      {required this.cityName,

      required this.date,
     required this.mxaTemp,
      required this.minTemp,
     required this.status,
      required this.temp,
        required this.image});

  factory WeatherModle.fromJson(json){
    return WeatherModle(
        image :json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        mxaTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        status:json['forecast']['forecastday'][0]['day']['condition']['text'] ,
        temp:json['forecast']['forecastday'][0]['day']['avgtemp_c'] );
  }
}