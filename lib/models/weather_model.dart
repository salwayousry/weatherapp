class WeatherModel {
  String date;
  double temp;
  double maxtemp;
  double mintemp;
  String weatherstatename;

 WeatherModel(
     {required this.weatherstatename, required this.date, required this.maxtemp, required this.mintemp, required this.temp});

 factory WeatherModel.fromJson( dynamic data) {
   var jsonDate= data['forecast']['forecastday'][0]['day'];
  // date=data['location']['localtime'];
   //  maxtemp= jsonDate['maxtemp_c'];
   // mintemp=jsonDate['mintemp_c'] ;
   // temp= jsonDate['avgtemp_c'];
   // weatherstatename=jsonDate['condition']['text'];
   return WeatherModel(
       weatherstatename:jsonDate['condition']['text'],
       date: data['location']['localtime'],
       maxtemp: jsonDate['maxtemp_c'],
       mintemp: jsonDate['mintemp_c'],
       temp: jsonDate['avgtemp_c']);
 }
@override
  String toString() {

    return 'weathername=$weatherstatename, date=$date';
  }

String getImage(){
   if(weatherstatename=='Thunderstorm'){
     return 'https://th.bing.com/th/id/OIP.ERaD2zD5uIWZ-PI8gaYk5QHaHM?w=222&h=216&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }
   else if(weatherstatename=='Snow'){
     return 'https://th.bing.com/th/id/OIP.nyewS-jlHJdwyMEBwFY5IwHaH2?w=201&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Hail'){
     return 'https://th.bing.com/th/id/OIP.nyewS-jlHJdwyMEBwFY5IwHaH2?w=201&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Clear'){
     return'data:image/jpeg;base64,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'
         'k=';
   }else if(weatherstatename=='Light cloud'){
     return 'data:image/jpeg;base64,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';
   }else if(weatherstatename=='Sunny'){
     return 'data:image/jpeg;base64,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';
   }else if(weatherstatename=='Sleet'){
     return 'https://th.bing.com/th/id/OIP.nyewS-jlHJdwyMEBwFY5IwHaH2?w=201&h=213&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Light rain'){
     return 'https://th.bing.com/th/id/OIP.YTKOENWw-TwhYX3ggLiTpQHaHq?w=173&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Heavy rain'){
     return 'https://th.bing.com/th/id/OIP.YTKOENWw-TwhYX3ggLiTpQHaHq?w=173&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Showers'){
     return 'https://th.bing.com/th/id/OIP.YTKOENWw-TwhYX3ggLiTpQHaHq?w=173&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Thunder'){
     return 'https://th.bing.com/th/id/OIP.TrmkQNxTtGRW_-vrVlN48AHaHg?w=193&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Heavy cloud'){
     return 'https://th.bing.com/th/id/OIP.0Wvmj6tWaGslQOPU7W99OAHaHc?w=163&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Partly cloudy'){
     return 'https://th.bing.com/th/id/OIP.1YC9HXlXs_P6eD1zC5GY6QHaFZ?w=250&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Cloudy'){
     return'data:image/jpeg;base64,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'
         'BljwMseAABljwMseAABljwMseAABljroMseAABljwMseAABljwMseAABljwMseAABljwMseAABljwMseAABljwMseAABljwMseAABljwMseAABljwMseAAD/9k=';
   }else if(weatherstatename=='Overcast'){
     return 'https://th.bing.com/th/id/OIP.JO7LGsIR2XexXEL41OPbUgHaHa?w=166&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Patchy rain possible'){
     return 'https://th.bing.com/th/id/OIP.hTZ4yuNkPfyCX1bYQVi0agAAAA?w=166&h=179&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }else if(weatherstatename=='Moderate or heavy snow showers'){
     return 'https://th.bing.com/th/id/OIP.2Bj17p60FKoFxROm5XVhDAAAAA?w=126&h=162&c=7&r=0&o=5&dpr=1.3&pid=1.7';
   }
   else{
     return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0uenmzETfrdFi32WjLv51LVLaZZMdFAkOmQ&usqp=CAU';
   }
}
}
