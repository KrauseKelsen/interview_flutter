import 'package:interview_flutter/domain/entities/current_conditon.dart';

abstract class CurrentConditionsRepository {
  Future<List<CurrentCondition>> getCurrentConditions( String key );
}
