import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';
import 'bloc/cubit-wither/cubit-wither.dart';

void main()
{runApp(BlocProvider(
     create: (context) {return WitherCubit(WeatherService());},
     child: const WeatherApp()));}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primarySwatch: BlocProvider.of<WitherCubit>(context).
      weatherModel == null ?  Colors.blue :
      BlocProvider.of<WitherCubit>(context).
      weatherModel!.getThemeColor()  ,
      ),
      home: HomePage(),
    );
  }
}
