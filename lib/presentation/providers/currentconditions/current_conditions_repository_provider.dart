import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infrastructure/datasources/currentconditiondb_datasource.dart';
import '../../../infrastructure/repositories/currentcondition_repository_impl.dart';

//Es inmutable, es provider de lectura
final currentConditionRepositoryProvider = Provider((ref) {
  
  return CurrentConditionRepositoryImpl(CurrentConditionDBDatasource());

});
