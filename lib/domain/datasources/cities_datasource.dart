import 'package:interview_flutter/domain/entities/city.dart';

abstract class CitiesDataSource {
  Future<List<City>> getCities( String query );
}
