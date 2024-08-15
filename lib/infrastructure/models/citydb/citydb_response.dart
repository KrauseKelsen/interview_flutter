
class CityDbResponse {
    final int version;
    final String key;
    final String type;
    final int rank;
    final String localizedName;
    final AdministrativeArea country;
    final AdministrativeArea administrativeArea;

    CityDbResponse({
        required this.version,
        required this.key,
        required this.type,
        required this.rank,
        required this.localizedName,
        required this.country,
        required this.administrativeArea,
    });

    factory CityDbResponse.fromJson(Map<String, dynamic> json) => CityDbResponse(
        version: json["Version"],
        key: json["Key"],
        type: json["Type"],
        rank: json["Rank"],
        localizedName: json["LocalizedName"],
        country: AdministrativeArea.fromJson(json["Country"]),
        administrativeArea: AdministrativeArea.fromJson(json["AdministrativeArea"]),
    );

    static List<CityDbResponse> fromJsonList(List<dynamic> jsonList) {
      return jsonList.map((json) => CityDbResponse.fromJson(json)).toList();
    }

    Map<String, dynamic> toJson() => {
        "Version": version,
        "Key": key,
        "Type": type,
        "Rank": rank,
        "LocalizedName": localizedName,
        "Country": country.toJson(),
        "AdministrativeArea": administrativeArea.toJson(),
    };
}

class AdministrativeArea {
    final String id;
    final String localizedName;

    AdministrativeArea({
        required this.id,
        required this.localizedName,
    });

    factory AdministrativeArea.fromJson(Map<String, dynamic> json) => AdministrativeArea(
        id: json["ID"],
        localizedName: json["LocalizedName"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "LocalizedName": localizedName,
    };
}
