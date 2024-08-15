import 'package:dio/dio.dart';
import 'package:interview_flutter/config/constants/environment.dart';

import '../../domain/datasources/current_conditions_datasource.dart';
import '../../domain/entities/current_conditon.dart';
import '../mappers/currentcondition_mapper.dart';
import '../models/currentconditiondb/currentconditiondb_response.dart';

class CurrentConditionDBDatasource extends CurrentConditionsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'http://dataservice.accuweather.com',
      queryParameters: {'apikey': Environment.theWeatherKey}));
  @override
  Future<List<CurrentCondition>> getCurrentConditions(String key) async {
    
    final response = await dio.get('/currentconditions/v1/$key');
    
    // Verificar si response.data es nulo o está vacío
    if (response.data == null || response.data.isEmpty) {
      return [];
    }
    
    final results = CurrentConditionDbResponse.fromJsonList(response.data);

    final List<CurrentCondition> currentConditions = results.map((currentConditionDb) => CurrentConditionMapper.currentConditionDBToEntity(currentConditionDb)).toList();
    return currentConditions;
  }
}
