import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_apps/cubit/get_current_weather/get_current_state.dart';
import 'package:wheather_apps/view/search_view.dart';
import 'package:wheather_apps/view/wheather_info_body.dart';
import '../cubit/get_current_weather/get_current_cubit.dart';
import '../main.dart';
import 'new_weather_body.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor:getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weatherModle?.status ?? 'Unknown'),
       // backgroundColor: getAppBarColor(WeatherState()),
        title: Text("Weather App",
            style: TextStyle(fontSize: 19,
                color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:
                  (context) {
                return SearchView();
              },
              ));
            }, icon: Icon(Icons.search, size: 25, color: Colors.white),),
          ),

        ],
      ),

      body:
      BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if(state is WeatherinitialState){
            return NoWeatherBody();
          }
          else if(state is WeatherLodedSucessStaate){
            return WeatherInformationBody(weatherModle:state.weatherModle ,);
          }
          else {
            return Center(child: Text("oppes there was an error ",style: TextStyle(color: Colors.redAccent,
            fontSize: 22,fontWeight: FontWeight.bold),));
          }

        },
      ),

    );
  }
  MaterialColor getAppBarColor(WeatherState state) {
    if (state is WeatherLodedSucessStaate) {
      final condition = state.weatherModle.status;
      return getThemeColor(condition) ?? Colors.blue; // Use the getThemeColor function you've defined earlier
    }
    return Colors.grey; // Default color if state is not WeatherLodedSucessStaate
  }

}
