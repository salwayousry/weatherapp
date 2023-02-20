import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weatherprovider.dart';
import 'package:weatherapp/screens/searchscreen.dart';

class Home extends StatefulWidget{
  static String routeName='Home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 WeatherModel?weatherData;

  void UpdateUi(){
    setState((){});
  }
  @override
  Widget build(BuildContext context) {
    weatherData= Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
       actions: [
         InkWell(
           onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(
               UpdateUi: UpdateUi,
             )));
           },
             child: Icon(Icons.search))
       ],
        title: Center(
          child: Text('Weather App',style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
        ),

      ),
      body:weatherData==null? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            Spacer(flex: 2,),
          Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0uenmzETfrdFi32WjLv51LVLaZZMdFAkOmQ&usqp=CAU'),
            Center(
              child: Text('Start your search to Know the weather',style: TextStyle(
                color: Colors.white,
                fontSize:32,
                  fontFamily: 'pacifico'
              ),),
            ),
            Spacer(flex: 3,)
          ],

        ),
      ):Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3,),
            Text(Provider.of<WeatherProvider>(context).CityName!,style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),),
            Text('updated at:${weatherData!.date.toString()}',style: TextStyle(
                fontSize: 22,
            )),
            Spacer()
            ,Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(weatherData!.getImage()),
                Text(weatherData!.temp.toInt().toString(),style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),),
              ],
            )
            ,Column(
              children: [
                Text('maxTemp:${weatherData!.maxtemp.toInt()}'),
                Text('minTemp:${weatherData!.mintemp.toInt()}')
              ],
            ),
            Spacer(),
            Text(weatherData!.weatherstatename,style: TextStyle(
              fontWeight: FontWeight.bold
                  ,fontSize: 32
            ),),
            Spacer(flex: 5,)
          ],

        ),

      ),
    );
  }
}