import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_apps/cubit/get_current_weather/get_current_cubit.dart';

import '../main.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCondition = BlocProvider.of<GetWeatherCubit>(context).weatherModle?.status ?? 'Unknown';
    final appBarColor = getThemeColor(weatherCondition) ?? Colors.grey;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: getThemeColor(weatherCondition) ?? Colors.blue,
        title: Text("Search",
            style: TextStyle(fontSize: 19,color: Colors.white)),
        iconTheme: CupertinoIconThemeData(color: Colors.white),),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: TextField(
            /*onChanged: (value){
               log(value);
             },*/
            onSubmitted: (value) async{
              var getweathercubit =  BlocProvider.of<GetWeatherCubit>(context);
              getweathercubit.getWeather(cityName: value);
              Navigator.pop(context);

            },
            decoration: InputDecoration(
              labelText: "Search",
              hintText: "Enter City Name",
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 32),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent)
              ),
            ),
          ),
        ),
      ),
    );
  }
}
