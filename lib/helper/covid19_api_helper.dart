import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/cowid_19_data_model.dart';

class CovidApi {
  CovidApi._();

  static final CovidApi covidAPI = CovidApi._();

  Future<List<Covid19Data>?> fetchCovidDataAPI() async {
    String url = "https://covid-19.dataflowkit.com/v1";

    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {

      List data = jsonDecode(res.body);


      List<Covid19Data> covidDataList = data.map((e) {
        return Covid19Data.fromJSON(json: e);
      }).toList();
      return covidDataList;
    }
    return null;
  }
}
