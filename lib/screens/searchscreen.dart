import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/providers/weatherprovider.dart';
import 'package:weatherapp/services/wearher_service.dart';

class SearchScreen extends StatelessWidget{
  VoidCallback?UpdateUi;

  SearchScreen({this.UpdateUi});

  String? CityName;
  static String routeName='SearchScreen';

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.indigo,
     appBar: AppBar(
       backgroundColor: Colors.indigo,
       title: Center(
         child: Text('Search City',style: TextStyle(
           color: Colors.white,
           fontWeight: FontWeight.bold,
           fontSize: 24,

         ),),
       ),
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 16),
       child: Column(
         children: [
           Spacer(flex: 2,),
           Center(
               child: TextField(
                 onSubmitted: (data)async{
                   CityName=data;
                   WeatherServices service=WeatherServices();
                WeatherModel? weather=await service.getWeather(CityName: CityName!);
                Provider.of<WeatherProvider>(context,listen: false).weatherData=weather;
                Provider.of<WeatherProvider>(context,listen: false).CityName=CityName;
                UpdateUi!();
                Navigator.pop(context);
                 },

                 decoration: InputDecoration(
                   contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 24),
                   label: Text(
                     'Search'
                   ),
                   labelStyle: TextStyle(
                     color: Colors.yellow
                   ),
                   suffixIcon: Icon(Icons.search),
                     enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(
                             color: Colors.yellow
                         )
                     ),
                     border: OutlineInputBorder(
                         borderSide: BorderSide(
                             color: Colors.yellow
                         )
                     ),
                     hintText: 'Enter a city',
                     hintStyle: TextStyle(
                         color: Colors.grey
                     ),

                 ),
               ),
             ),

           Spacer(flex:3 )
         ],
       ),
     ),
   );
  }

}
