
class CurrentConditionDbResponse {
    final DateTime localObservationDateTime;
    final int epochTime;
    final String weatherText;
    final int weatherIcon;
    final bool hasPrecipitation;
    final dynamic precipitationType;
    final bool isDayTime;
    final Temperature temperature;
    final String mobileLink;
    final String link;

    CurrentConditionDbResponse({
        required this.localObservationDateTime,
        required this.epochTime,
        required this.weatherText,
        required this.weatherIcon,
        required this.hasPrecipitation,
        required this.precipitationType,
        required this.isDayTime,
        required this.temperature,
        required this.mobileLink,
        required this.link,
    });

    factory CurrentConditionDbResponse.fromJson(Map<String, dynamic> json) => CurrentConditionDbResponse(
        localObservationDateTime: DateTime.parse(json["LocalObservationDateTime"]),
        epochTime: json["EpochTime"],
        weatherText: json["WeatherText"],
        weatherIcon: json["WeatherIcon"],
        hasPrecipitation: json["HasPrecipitation"],
        precipitationType: json["PrecipitationType"],
        isDayTime: json["IsDayTime"],
        temperature: Temperature.fromJson(json["Temperature"]),
        mobileLink: json["MobileLink"],
        link: json["Link"],
    );

    

    static List<CurrentConditionDbResponse> fromJsonList(List<dynamic> jsonList) {
      return jsonList.map((json) => CurrentConditionDbResponse.fromJson(json)).toList();
    }


    Map<String, dynamic> toJson() => {
        "LocalObservationDateTime": localObservationDateTime.toIso8601String(),
        "EpochTime": epochTime,
        "WeatherText": weatherText,
        "WeatherIcon": weatherIcon,
        "HasPrecipitation": hasPrecipitation,
        "PrecipitationType": precipitationType,
        "IsDayTime": isDayTime,
        "Temperature": temperature.toJson(),
        "MobileLink": mobileLink,
        "Link": link,
    };
}

class Temperature {
    final Imperial metric;
    final Imperial imperial;

    Temperature({
        required this.metric,
        required this.imperial,
    });

    factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
        metric: Imperial.fromJson(json["Metric"]),
        imperial: Imperial.fromJson(json["Imperial"]),
    );

    Map<String, dynamic> toJson() => {
        "Metric": metric.toJson(),
        "Imperial": imperial.toJson(),
    };
}

class Imperial {
    final double value;
    final String unit;
    final int unitType;

    Imperial({
        required this.value,
        required this.unit,
        required this.unitType,
    });

    factory Imperial.fromJson(Map<String, dynamic> json) => Imperial(
        value: json["Value"]?.toDouble(),
        unit: json["Unit"],
        unitType: json["UnitType"],
    );

    Map<String, dynamic> toJson() => {
        "Value": value,
        "Unit": unit,
        "UnitType": unitType,
    };
}
