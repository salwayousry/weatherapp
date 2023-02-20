import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weatherprovider.dart';
import 'package:weatherapp/screens/home.dart';
import 'package:weatherapp/screens/searchscreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 WeatherModel?weather;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        return WeatherProvider();
      },
      child: MaterialApp(
        title: 'weather app',
        theme: ThemeData(

        primaryColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Home.routeName,
        routes: {
         Home.routeName:(context)=>Home(),
          SearchScreen.routeName:(context)=>SearchScreen()
        },
      ),
    );
  }
}


