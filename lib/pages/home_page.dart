import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit-wither/cubit-wither.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/success_body.dart';
import '../bloc/cubit-wither/wither-state.dart';
import 'defualt_body.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = BlocProvider.of<WitherCubit>(context).weatherData as WeatherModel?;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage(
                );
              }));
            },
            icon: Icon(Icons.search),
          ),
        ],
        title: Text('Weather App'),
      ),
      body:BlocBuilder<WitherCubit,WitherState>(
        builder: (context, state)
      {
        if(state is WitherLoading)
          {
            return Center(child: CircularProgressIndicator());
          }
        else if (state is WitherSuccess)
          {
            return SuccessBody(weatherData: state.weatherModel);
          }
        else if (state is WitherFailure)
          {
            return Text("Wither Failure");
          }
        else
        {
          return DefultBody();
        }
      },
      ),
    );
  }
}
