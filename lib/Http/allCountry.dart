// To parse this JSON data, do
//
//     final allCountry = allCountryFromJson(jsonString);

import 'dart:convert';

List<AllCountry> allCountryFromJson(String str) => List<AllCountry>.from(json.decode(str).map((x) => AllCountry.fromJson(x)));

String allCountryToJson(List<AllCountry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllCountry {
    String country;
    CountryInfo countryInfo;
    int cases;
    int todayCases;
    int deaths;
    int todayDeaths;
    int recovered;
    int active;
    int critical;
    double casesPerOneMillion;
    double deathsPerOneMillion;

    AllCountry({
        this.country,
        this.countryInfo,
        this.cases,
        this.todayCases,
        this.deaths,
        this.todayDeaths,
        this.recovered,
        this.active,
        this.critical,
        this.casesPerOneMillion,
        this.deathsPerOneMillion,
    });

    factory AllCountry.fromJson(Map<String, dynamic> json) => AllCountry(
        country: json["country"] == null ? null : json["country"],
        countryInfo: json["countryInfo"] == null ? null : CountryInfo.fromJson(json["countryInfo"]),
        cases: json["cases"] == null ? null : json["cases"],
        todayCases: json["todayCases"] == null ? null : json["todayCases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        todayDeaths: json["todayDeaths"] == null ? null : json["todayDeaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        active: json["active"] == null ? null : json["active"],
        critical: json["critical"] == null ? null : json["critical"],
        casesPerOneMillion: json["casesPerOneMillion"] == null ? null : json["casesPerOneMillion"].toDouble(),
        deathsPerOneMillion: json["deathsPerOneMillion"] == null ? null : json["deathsPerOneMillion"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "country": country == null ? null : country,
        "countryInfo": countryInfo == null ? null : countryInfo.toJson(),
        "cases": cases == null ? null : cases,
        "todayCases": todayCases == null ? null : todayCases,
        "deaths": deaths == null ? null : deaths,
        "todayDeaths": todayDeaths == null ? null : todayDeaths,
        "recovered": recovered == null ? null : recovered,
        "active": active == null ? null : active,
        "critical": critical == null ? null : critical,
        "casesPerOneMillion": casesPerOneMillion == null ? null : casesPerOneMillion,
        "deathsPerOneMillion": deathsPerOneMillion == null ? null : deathsPerOneMillion,
    };
}

class CountryInfo {
    int id;
    double lat;
    double long;
    String flag;
    String iso3;
    String iso2;

    CountryInfo({
        this.id,
        this.lat,
        this.long,
        this.flag,
        this.iso3,
        this.iso2,
    });

    factory CountryInfo.fromJson(Map<String, dynamic> json) => CountryInfo(
        id: json["_id"] == null ? null : json["_id"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        flag: json["flag"] == null ? null : json["flag"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        iso2: json["iso2"] == null ? null : json["iso2"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "flag": flag == null ? null : flag,
        "iso3": iso3 == null ? null : iso3,
        "iso2": iso2 == null ? null : iso2,
    };
}
