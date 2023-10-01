import 'dart:math';

import 'package:dio/dio.dart';
import 'package:wheather_apps/modle/weather_modle.dart';

class WeatherService{
 final Dio dio;
 String apiKey="e043addb330c4c2886e10004232509";
String baseUrl="https://api.weatherapi.com/v1";
 WeatherService(this.dio);
 
 Future <WeatherModle> getCurrentState({required String cityName}) async{
   try {
     Response response=await dio.get("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");

     WeatherModle weatherModle=WeatherModle.fromJson(response.data);
     return weatherModle;
   }
  on DioException catch (e) {
    final String  errorMessage= e.response?.data['error']['message']??
        "oops there was an error ..try later";
    throw Exception(errorMessage);

   }
   catch (e){

     throw Exception( "oops there was an error ..try later");
   }
 }
}