import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theWeatherKey =
      dotenv.env['THE_WEATHER_KEY'] ?? 'There is not API_KEY';
}
