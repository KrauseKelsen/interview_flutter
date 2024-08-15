import 'package:interview_flutter/domain/datasources/cities_datasource.dart';
import 'package:interview_flutter/domain/entities/city.dart';
import 'package:interview_flutter/domain/repositories/cities_repository.dart';

class CityRepositoryImpl extends CitiesRepository {
  final CitiesDataSource dataSource;

  CityRepositoryImpl(this.dataSource);

  @override
  Future<List<City>> getCities(String query) {
    return dataSource.getCities(query);
  }
}
