import 'package:interview_flutter/domain/entities/city_condition.dart';
import 'package:interview_flutter/domain/entities/current_conditon.dart';
import 'package:intl/intl.dart';

class CityConditionMapper {
  static CityCondition cityConditionDBToEntity(
          CurrentCondition currentCondition,
          String key,
          String city,
          String description) =>
      CityCondition(
          key: key,
          city: city,
          description: description,
          actualTime: _getFormattedTime(currentCondition.localObservationDataTime),
          weatherText: currentCondition.weatherText
      );


  static String _getFormattedTime(DateTime dateTime) {
    final DateTime parsedDateTime = dateTime;
    final DateFormat formatter = DateFormat('HH:mm'); // Formato de 24 horas
    return formatter.format(parsedDateTime);
  }
}
