import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_apps/view/home.dart';

import 'cubit/get_current_weather/get_current_cubit.dart';
import 'cubit/get_current_weather/get_current_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: CustomMatrialApp(),
    );
  }
}

class CustomMatrialApp extends StatelessWidget {
  const CustomMatrialApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            final weatherCondition = BlocProvider.of<GetWeatherCubit>(context).weatherModle?.status ?? 'Unknown';
            final appBarColor = getThemeColor(weatherCondition) ?? Colors.grey; // Default color if condition is not recognized

            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  backgroundColor: appBarColor,
                ),
                primarySwatch: getThemeColor(weatherCondition),
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                ),
                useMaterial3: true,
              ),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}


MaterialColor? getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.amber;
    case 'Cloudy':
    case 'Overcast':
    case 'Partly cloudy':
      return Colors.blueGrey;
    case 'Fog':
    case 'Freezing fog':
    case 'Mist':
      return Colors.blueGrey;
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.lightBlue;

    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Moderate snow':
      return Colors.lightGreen;
  }
}
