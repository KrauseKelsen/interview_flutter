import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_flutter/infrastructure/datasources/citydb_datasource.dart';
import 'package:interview_flutter/infrastructure/repositories/city_repository_impl.dart';

//Es inmutable, es provider de lectura
final cityRepositoryProvider = Provider((ref) {
  
  return CityRepositoryImpl(CityDBDatasource());

});
