import 'dart:convert';

AllResult allResultFromJson(String str) => AllResult.fromJson(json.decode(str));

String allResultToJson(AllResult data) => json.encode(data.toJson());

class AllResult {
    int cases;
    int deaths;
    int recovered;
    int updated;

    AllResult({
        this.cases,
        this.deaths,
        this.recovered,
        this.updated,
    });

    factory AllResult.fromJson(Map<String, dynamic> json) => AllResult(
        cases: json["cases"] == null ? null : json["cases"],
        deaths: json["deaths"] == null ? null : json["deaths"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        updated: json["updated"] == null ? null : json["updated"],
    );

    Map<String, dynamic> toJson() => {
        "cases": cases == null ? null : cases,
        "deaths": deaths == null ? null : deaths,
        "recovered": recovered == null ? null : recovered,
        "updated": updated == null ? null : updated,
    };
}
