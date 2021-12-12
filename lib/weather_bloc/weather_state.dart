part of 'weather_bloc.dart';

enum WeatherStatus { initial, loading, loaded, notLoaded }

class WeatherState extends Equatable {
  final WeatherModel? weather;
  final WeatherStatus? status;

  const WeatherState({
    this.weather,
    this.status,
  });

  factory WeatherState.initial() {
    return const WeatherState(
        weather: WeatherModel(), status: WeatherStatus.initial);
  }

  @override
  List<Object?> get props => [weather, status];

  WeatherState copyWith({
    WeatherModel? weather,
    WeatherStatus? status,
  }) {
    return WeatherState(
      weather: weather ?? this.weather,
      status: status ?? this.status,
    );
  }
}
