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

  ApiResponse? response;
  bool inProgress=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchWidget(),
            if(inProgress)
              CircularProgressIndicator()
            else _buildWeatherWidget(),
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

  Widget _buildWeatherWidget(){
 if(response==null){
   return Text("Search for the location to get Weather");
 }
 else{
   return Column();
 }
  }
  //return Text(response?.toJson().toString() ??"");
  _getWeatherData(String location)async{
    setState(() {
      inProgress=true;
    });

    try{
      response = await WeatherAPI().getCurrentWeather(location);
    }catch(e){
    }finally{
      setState(() {
        inProgress=false;
      });
    }
  }
}
