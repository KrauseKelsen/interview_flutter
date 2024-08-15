import 'package:interview_flutter/domain/entities/current_conditon.dart';

abstract class CurrentConditionsDataSource {
  Future<List<CurrentCondition>> getCurrentConditions( String key );
}
