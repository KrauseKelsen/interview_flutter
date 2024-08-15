import 'package:interview_flutter/infrastructure/models/citydb/citydb_response.dart';

import '../../domain/entities/city.dart';

class CityMapper {
  static City cityDBTOoEntity(CityDbResponse citydbresponse) =>
    City(
      key: citydbresponse.key, 
      localizedName: citydbresponse.localizedName, 
      countryName: citydbresponse.country.localizedName
    );
}
