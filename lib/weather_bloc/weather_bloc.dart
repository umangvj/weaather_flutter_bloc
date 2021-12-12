import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather_repository.dart';

import '../weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherState.initial()) {
    on<WeatherEvent>((event, emit) async {
      if (event is FetchWeather) {
        emit(const WeatherState().copyWith(status: WeatherStatus.loading));
        try {
          WeatherModel weather = await weatherRepository.getWeather(event.city);
          emit(const WeatherState().copyWith(
            weather: weather,
            status: WeatherStatus.loaded,
          ));
        } catch (_) {
          emit(const WeatherState().copyWith(status: WeatherStatus.notLoaded));
        }
      } else if (event is ResetWeather) {
        emit(const WeatherState().copyWith(status: WeatherStatus.initial));
      }
    });
  }
}
