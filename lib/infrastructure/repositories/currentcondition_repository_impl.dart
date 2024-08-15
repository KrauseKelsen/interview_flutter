

import '../../domain/datasources/current_conditions_datasource.dart';
import '../../domain/entities/current_conditon.dart';
import '../../domain/repositories/current_conditions_repository.dart';

class CurrentConditionRepositoryImpl extends CurrentConditionsRepository {
  final CurrentConditionsDataSource dataSource;

  CurrentConditionRepositoryImpl(this.dataSource);

  @override
  Future<List<CurrentCondition>> getCurrentConditions(String key) {
    return dataSource.getCurrentConditions(key);
  }
}
