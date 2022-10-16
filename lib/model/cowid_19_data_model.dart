class Covid19Data {
  final String countryName;
  final String todayDeaths;
  final String todayConfirmed;
  final String totalDeaths;
  final String totalConfirmed;
  final String totalRecovered;

  Covid19Data({
    required this.countryName,
    required this.todayDeaths,
    required this.todayConfirmed,
    required this.totalDeaths,
    required this.totalConfirmed,
    required this.totalRecovered,
  });

  factory Covid19Data.fromJSON({required Map json}) {
    return Covid19Data(
        countryName: json["Country_text"] ?? " - ",
        todayDeaths: json["New Deaths_text"] ?? " - ",
        todayConfirmed: json["New Cases_text"] ?? " - ",
        totalDeaths: json["Total Deaths_text"] ?? " - ",
        totalConfirmed: json["Total Cases_text"] ?? " - ",
        totalRecovered: json["Total Recovered_text"] ?? " - "
    );
  }
}
