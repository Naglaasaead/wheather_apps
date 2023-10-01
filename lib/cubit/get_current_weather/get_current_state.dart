
import 'package:wheather_apps/modle/weather_modle.dart';

class WeatherState{}
class WeatherinitialState extends WeatherState{}
class WeatherLodedSucessStaate extends WeatherState{
  final WeatherModle weatherModle;

  WeatherLodedSucessStaate(this.weatherModle);
}
class weatherErrorState extends WeatherState{}
