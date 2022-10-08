import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit-wither/cubit-wither.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title:const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
               cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              BlocProvider.of<WitherCubit>(context).
              getWither(cityName: cityName!);
              BlocProvider.of<WitherCubit>(context).cityName=cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label:const Text('search'),
              suffixIcon: GestureDetector(
                onTap : () async {
                    WeatherService service = WeatherService();

                    WeatherModel? weather =
                    await service.getWeather(cityName: cityName!);

                    BlocProvider.of<WitherCubit>(context,listen: false).weatherData;
                    BlocProvider.of<WitherCubit>(context,listen: false).cityName = cityName;

                     Navigator.pop(context);},

                     child:const Icon(Icons.search)),
                     border:const OutlineInputBorder(),
                     hintText: 'Enter a city',

            ),
          ),

        ),
      ),
    );
  }
}

