import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/cubit-wither/wither-state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WitherCubit extends Cubit<WitherState>{
  WitherCubit(this.weatherService ) : super(WitherInitial());
   WeatherService weatherService ;
   String? cityName;
   String? weatherData;
  WeatherModel? weatherModel;
  void getWither({required String cityName}) async{
    emit(WitherLoading());
   try{
   WeatherModel weatherModel= await weatherService.getWeather(cityName: cityName);
     emit(WitherSuccess(weatherModel: weatherModel));
   }on Exception catch(e){
     emit(WitherFailure());
   }

  }

}