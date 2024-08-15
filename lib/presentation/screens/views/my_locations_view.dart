import 'package:flutter/material.dart';
import 'package:interview_flutter/domain/entities/city_condition.dart';
import '../../widgets/widgets.dart';

class MyLocationsView extends StatelessWidget {
  final List<CityCondition> cityConditions;
  const MyLocationsView(this.cityConditions, {super.key});

  @override
  Widget build(BuildContext context) {
    List<CityCondition> list = [];
    for (var item in cityConditions) {
      if (!list.any((element) => element.key == item.key)) {
        list.add(item);
      }
    }

    return (list.isEmpty)
        ? const CustomBlankList() // Si la lista está vacía, muestra el widget en blanco
        : ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: list.length, // Número de elementos en la lista
            itemBuilder: (context, index) {
              // Obtiene el elemento de la lista correspondiente al índice
              final cityCondition = list[index];
              // Crea una CityCard con los datos de la lista
              return CityCard(
                cityName: cityCondition.city,
                description: cityCondition.description,
                time: cityCondition.actualTime,
                icon: _getWeatherIcon(cityCondition.weatherText),
              );
            },
          );
  }

  Icon _getWeatherIcon(String weatherText) {
    Map<String, IconData> weatherIcons = {
      'Sunny': Icons.wb_sunny,
      'Mostly Sunny': Icons.sunny,
      'Partly Sunny': Icons.sunny_snowing,
      'Intermittent Clouds': Icons.cloud,
      'Hazy Sunshine': Icons.wb_sunny_outlined,
      'Mostly Cloudy': Icons.cloudy_snowing,
      'Cloudy': Icons.wb_cloudy,
      'Dreary (Overcast)': Icons.cloud_circle,
      'Fog': Icons.blur_on,
      'Showers': Icons.grain,
      'Mostly Cloudy w/ Showers': Icons.grain,
      'Partly Sunny w/ Showers': Icons.grain,
      'T-Storms': Icons.flash_on,
      'Mostly Cloudy w/ T-Storms': Icons.flash_on,
      'Partly Sunny w/ T-Storms': Icons.flash_on,
      'Rain': Icons.beach_access,
      'Flurries': Icons.ac_unit,
      'Mostly Cloudy w/ Flurries': Icons.ac_unit,
      'Partly Sunny w/ Flurries': Icons.ac_unit,
      'Snow': Icons.ac_unit_rounded,
      'Mostly Cloudy w/ Snow': Icons.ac_unit_outlined,
      'Ice': Icons.ac_unit,
      'Sleet': Icons.ac_unit_sharp,
      'Freezing Rain': Icons.beach_access_outlined,
      'Rain and Snow': Icons.grain,
      'Hot': Icons.local_fire_department,
      'Cold': Icons.ac_unit_rounded,
      'Windy': Icons.air,
      'Clear': Icons.nights_stay,
      'Mostly Clear': Icons.nights_stay_outlined,
      'Partly Cloudy': Icons.wb_cloudy,
      'Hazy Moonlight': Icons.nights_stay_rounded,
      'Partly Cloudy w/ Showers': Icons.grain,
      'Partly Cloudy w/ T-Storms': Icons.flash_on,
    };

    Map<String, Color> iconColors = {
      'Sunny': Colors.orange,
      'Mostly Sunny': Colors.yellow,
      'Partly Sunny': Colors.yellowAccent,
      'Intermittent Clouds': Colors.blueGrey,
      'Hazy Sunshine': Colors.amber,
      'Mostly Cloudy': Colors.grey,
      'Cloudy': Colors.blueGrey,
      'Dreary (Overcast)': Colors.grey,
      'Fog': Colors.grey.shade400,
      'Showers': Colors.blueAccent,
      'Mostly Cloudy w/ Showers': Colors.lightBlue,
      'Partly Sunny w/ Showers': Colors.lightBlue,
      'T-Storms': Colors.deepPurple,
      'Mostly Cloudy w/ T-Storms': Colors.deepPurple,
      'Partly Sunny w/ T-Storms': Colors.deepPurple,
      'Rain': Colors.blue,
      'Flurries': Colors.lightBlueAccent,
      'Mostly Cloudy w/ Flurries': Colors.lightBlueAccent,
      'Partly Sunny w/ Flurries': Colors.lightBlueAccent,
      'Snow': Colors.white,
      'Mostly Cloudy w/ Snow': Colors.white70,
      'Ice': Colors.lightBlueAccent,
      'Sleet': Colors.lightBlueAccent,
      'Freezing Rain': Colors.lightBlue,
      'Rain and Snow': Colors.lightBlueAccent,
      'Hot': Colors.red,
      'Cold': Colors.lightBlueAccent,
      'Windy': Colors.lightGreenAccent,
      'Clear': Colors.blue.shade900,
      'Mostly Clear': Colors.blue.shade800,
      'Partly Cloudy': Colors.blueGrey,
      'Hazy Moonlight': Colors.blue.shade700,
      'Partly Cloudy w/ Showers': Colors.blueAccent,
      'Partly Cloudy w/ T-Storms': Colors.deepPurpleAccent,
    };

    // Obtenemos el icono y el color basado en el texto del clima
    final icon = weatherIcons[weatherText] ?? Icons.wb_sunny;
    final color = iconColors[weatherText] ?? Colors.orange;

    return Icon(
      icon,
      color: color,
      size: 24.0,
    );
  }
}
