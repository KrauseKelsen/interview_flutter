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

  IconData _getWeatherIcon(String weatherText) {
    print(weatherText);
    switch (weatherText.toLowerCase()) {
      case 'Partly sunny':
        return Icons.wb_sunny;
      case 'Partly cloudy':
        return Icons.wb_cloudy;
      case 'Partly rainy':
        return Icons.beach_access;
      case 'Mostly sunny':
        return Icons.sunny_snowing;
      case 'Mostly cloudy':
        return Icons.cloudy_snowing;
      case 'Mostly rainy':
        return Icons.ramen_dining;
      default:
        return Icons.wb_sunny; // Ícono por defecto
    }
  }
}