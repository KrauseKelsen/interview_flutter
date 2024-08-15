import 'package:interview_flutter/domain/entities/city.dart';

abstract class CitiesRepository {
  Future<List<City>> getCities(String query);
}
