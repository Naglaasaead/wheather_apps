

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_apps/modle/weather_modle.dart';

import '../../service/service_api.dart';

import 'get_current_state.dart';
class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherinitialState());
   WeatherModle? weatherModle;
  getWeather( {required String cityName} ) async{
  try {
    WeatherModle  weatherModle=
          await WeatherService(Dio()).getCurrentState(cityName: cityName);
          emit(WeatherLodedSucessStaate (weatherModle));
  } catch (e) {
    emit(weatherErrorState());
  }
  }


}