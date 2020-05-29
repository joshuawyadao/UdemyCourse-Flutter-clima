import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '4cd78c5df2de1e3381a483fb4a800fbd';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  /// Returns current location weather from the openweathermap.org API
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=51.5&lon=-0.2&appid=$apiKey&units=imperial');

    // $openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial'

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  /// Return a weather icon based on the [condition]
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  /// Return a String message based on the [temp] in Fahrenheit
  String getMessage(int temp) {
    if (temp > 77) {
      return 'It\'s 🍦 time';
    } else if (temp > 68) {
      return 'Time for shorts and 👕';
    } else if (temp < 50) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
