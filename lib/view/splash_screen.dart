import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mausam_weather_app_flutter/view/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../view_model/weather_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  WeatherViewModel weatherViewModel = WeatherViewModel();
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: height * .3,
                width: width * .8,
                child: Image.asset(
                  'assets/images/mausam.png',
                  fit: BoxFit.fill,
                )),
            "Mausam App".text.size(36).color(Colors.white).bold.make(),
            const SizedBox(
              height: 20,
            ),
            const SpinKitSpinningLines(
              color: Colors.white,
              size: 80,
            )
          ],
        ),
      ),
    );
  }
}
