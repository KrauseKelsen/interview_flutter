import '../../domain/entities/current_conditon.dart';
import '../models/currentconditiondb/currentconditiondb_response.dart';

class CurrentConditionMapper {
  static CurrentCondition currentConditionDBToEntity(
          CurrentConditionDbResponse currentConditiondbresponse) =>
      CurrentCondition(
          localObservationDataTime:
              currentConditiondbresponse.localObservationDateTime,
          weatherText: currentConditiondbresponse.weatherText);
}
