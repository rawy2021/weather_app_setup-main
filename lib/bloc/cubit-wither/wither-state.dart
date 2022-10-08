import 'package:weather_app/models/weather_model.dart';

abstract class WitherState {}

class WitherInitial extends WitherState {}

class WitherLoading extends WitherState {}
class WitherSuccess extends WitherState
{
  WitherSuccess({required this.weatherModel});
  WeatherModel weatherModel;

}
class WitherFailure extends WitherState {}