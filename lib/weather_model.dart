class WeatherModel {
  final double? temp;
  final int? pressure;
  final int? humidity;
  final double? tempMax;
  final double? tempMin;

  double get getTemp => temp! - 272.5;
  double get getMaxTemp => tempMax! - 272.5;
  double get getMinTemp => tempMin! - 272.5;

  const WeatherModel({
    this.temp,
    this.pressure,
    this.humidity,
    this.tempMax,
    this.tempMin,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json["temp"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      tempMax: json["temp_max"],
      tempMin: json["temp_min"],
    );
  }
}
