import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_apps/cubit/get_current_weather/get_current_cubit.dart';
import 'package:wheather_apps/main.dart';
import 'package:wheather_apps/modle/weather_modle.dart';

class WeatherInformationBody extends StatelessWidget {
  const WeatherInformationBody({super.key, required this.weatherModle});

  final WeatherModle weatherModle;

  @override
  Widget build(BuildContext context) {

    weatherModle.image!.contains("https:");
    return Scaffold(

      body: Builder(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                getThemeColor(weatherModle.status)!,
                getThemeColor(weatherModle.status)![300] ?? Colors.grey,
                getThemeColor(weatherModle.status)![50] ?? Colors.grey,

              ], begin: Alignment.topCenter,
                end: Alignment.bottomCenter,),
            ),
            child: Column(

              children: [
                SizedBox(height: 200,),
                Text(weatherModle.cityName,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                Text("update at : ${weatherModle.date.hour} : ${weatherModle.date
                    .minute}", style: TextStyle(fontSize: 25)),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Image.network("https:${weatherModle.image}"),
                    SizedBox(width: 60,),
                    Text(weatherModle.temp.round().toString(),
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 25),),
                    SizedBox(width: 60,),
                    Column(
                      children: [
                        Text('Max Temp :${weatherModle.mxaTemp.round()}'.toString(),
                            style: TextStyle(fontSize: 20)),
                        Text('Min Temp :${weatherModle.minTemp.round()}',
                            style: TextStyle(fontSize: 20)),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Text(weatherModle.status,
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }
      ),
    );
  }

}