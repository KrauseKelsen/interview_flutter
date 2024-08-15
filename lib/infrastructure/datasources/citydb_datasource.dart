import 'package:dio/dio.dart';
import 'package:interview_flutter/config/constants/environment.dart';
import 'package:interview_flutter/domain/datasources/cities_datasource.dart';
import 'package:interview_flutter/domain/entities/city.dart';
import 'package:interview_flutter/infrastructure/mappers/city_mapper.dart';
import 'package:interview_flutter/infrastructure/models/citydb/citydb_response.dart';

class CityDBDatasource extends CitiesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://dataservice.accuweather.com',
      queryParameters: {'apikey': Environment.theWeatherKey}));
  @override
  Future<List<City>> getCities(String query) async {
    
    final response = await dio.get('/locations/v1/cities/autocomplete',
        queryParameters: {'q': query});
    
    // Verificar si response.data es nulo o está vacío
    if (response.data == null || response.data.isEmpty) {
      return [];
    }
    
    final results = CityDbResponse.fromJsonList(response.data);

    final List<City> cities = results.map((cityDb) => CityMapper.cityDBTOoEntity(cityDb)).toList();
    return cities;
  }
}
