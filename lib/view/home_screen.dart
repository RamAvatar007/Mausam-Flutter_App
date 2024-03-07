import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam_weather_app_flutter/view_model/weather_view_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_icons/weather_icons.dart';
import '../model/mausam_app_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherViewModel weatherViewModel = WeatherViewModel();
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: FutureBuilder(
            future: weatherViewModel.fetchWeatherApi(searchController.text),
            builder: (context, AsyncSnapshot<MausamAppModel> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: SpinKitCircle(
                  color: Colors.blue,
                  size: 50,
                ));
              } else {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .04),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * .021,
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31), border: Border.all(color: Colors.blue.withOpacity(.99))),
                          child: TextFormField(
                              onTap: () {
                                setState(() {
                                  if (searchController.text == "") {
                                  } else {
                                    searchController.text;
                                  }
                                });
                              },
                              controller: searchController,
                              cursorColor: Colors.blue,
                              decoration: InputDecoration(
                                  hintText: 'Search city name',
                                  prefixIcon: const Icon(Icons.search_outlined, color: Colors.blue),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(31),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: .5,
                                      )))),
                        ),
                        SizedBox(
                          height: height * .015,
                        ),
                        Container(
                          height: height * .15,
                          width: width,
                          padding: EdgeInsets.only(left: width * .03),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(.5), borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: "https://openweathermap.org/img/wn/${snapshot.data!.weather![0].icon.toString()}@2x.png",
                                fit: BoxFit.fill,
                                errorWidget: (context, url, error) => const Icon(
                                  Icons.error_outline_rounded,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                placeholder: (context, url) => const Center(
                                  child: SpinKitCircle(
                                    size: 50,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .07,
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    snapshot.data!.weather![0].main.toString().text.bold.size(19).make(),
                                    snapshot.data!.name.toString().text.size(19).fontWeight(FontWeight.w700).make(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .015,
                        ),
                        Container(
                          height: height * .3,
                          width: width,
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(color: Colors.white.withOpacity(.5), borderRadius: BorderRadius.circular(11)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.thermostat_outlined,
                                size: 41,
                              ),
                              SizedBox(
                                width: width * .12,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    (snapshot.data!.main!.temp.toString()).substring(0, 5).text.size(51).fontWeight(FontWeight.w500).make(),
                                    'C'.text.size(31).make(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .015,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: height * .2,
                                width: width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(.5), borderRadius: BorderRadius.circular(11)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(WeatherIcons.day_windy),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          snapshot.data!.wind!.speed.toString().text.size(31).bold.make(),
                                          'km/hr'.text.size(21).make(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * .041,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: height * .2,
                                width: width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(color: Colors.white.withOpacity(.5), borderRadius: BorderRadius.circular(11)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(WeatherIcons.humidity),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          snapshot.data!.main!.humidity.toString().text.size(31).bold.make(),
                                          'percent'.text.size(21).make(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        'Data Provided By OpenWeatherMap.org'.text.size(13).bold.makeCentered(),
                        SizedBox(
                          height: height * .015,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
