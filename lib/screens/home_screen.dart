import 'package:flutter/material.dart';
import '../helper/covid19_api_helper.dart';
import '../model/cowid_19_data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var appColor = const Color(0xff937DA8);
  var appColor2 = const Color(0xff937DA8);

  dynamic selectedCountry;
  List country = [];
  int? index;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text("Covid 19 Cases Tracking"),
      ),
      body: FutureBuilder(
        future: CovidApi.covidAPI.fetchCovidDataAPI(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<Covid19Data> data = snapshot.data as List<Covid19Data>;
            country = data.map((e) => e.countryName).toList();

            return Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 10),
                        Icon(Icons.location_on, size: 40, color: appColor),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: DropdownButtonFormField(
                            hint: const Text("Please Select Country."),
                            style: TextStyle(
                              color: appColor2,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            value: selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                                index = country.indexOf(value);
                              });
                            },
                            items: country.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.50,
                                  child: Text(e),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    (index != null)
                        ? Column(
                            children: [
                              const SizedBox(height: 20),
                              Text("Today", style: TextStyle(
                                color: appColor2,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              )),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: appColor2.withOpacity(0.2),
                                  ),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Confirmed : ${data[index!].todayConfirmed}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Deaths : ${data[index!].todayDeaths}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text("Over All Cases", style: TextStyle(
                                color: appColor2,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              )),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                  color: appColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: appColor2.withOpacity(0.2),
                                  ),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Confirmed : ${data[index!].totalConfirmed}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Deaths : ${data[index!].totalDeaths}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "Recovered : ${data[index!].totalRecovered}",
                                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(height: 160),
                              Icon(
                                Icons.coronavirus_outlined,
                                size: 60,
                                color: appColor.withOpacity(0.3),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
