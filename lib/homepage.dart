import 'package:flutter/material.dart';
import 'package:weather/api.dart';
import 'package:weather/weathermodel.dart';
import 'constants.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _buildSearchWidget()
          ],
        ),
      ),
    ));
  }
  Widget _buildSearchWidget(){
    return SearchBar(
    hintText: "Search any Location",
      onSubmitted: (value){
      _getWeatherData(value);
      },
    );
  }
  _getWeatherData(String location)async{
ApiResponse response=await WeatherAPI().getCurrentWeather(location);
print(response.toJson());
  }
}
