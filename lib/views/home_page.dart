import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/components/cities_list.dart';
import 'package:weather_mobile_engineer_test_1/components/search_field.dart';
import 'package:weather_mobile_engineer_test_1/controllers/filter_city_controller.dart';
import 'package:weather_mobile_engineer_test_1/models/city_screen_arguments.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CityScreenArguments> cityScreenArgumentsList = [
    CityScreenArguments(name: 'Silverstone, UK', lat: 52.09, lon: -1.02),
    CityScreenArguments(name: 'São Paulo, Brazil', lat: -23.55, lon: -46.63),
    CityScreenArguments(name: 'Melbourne, Australia', lat: -37.81, lon: 144.95),
    CityScreenArguments(name: 'Monte Carlo, Monaco', lat: 43.73, lon: 7.41)
  ];
  late List<CityScreenArguments> cityScreenArgumentsFiltered = cityScreenArgumentsList;

  void updateFilteredList(String searchValue) {
    setState(() {
      cityScreenArgumentsFiltered = filterNextConcertCities(searchValue, cityScreenArgumentsList, cityScreenArgumentsFiltered);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold)))
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SearchField(
            label: 'Search next concert city', 
            cityScreenArgumentsList: cityScreenArgumentsList, 
            updateFilteredList: updateFilteredList
          ),
          Expanded(
            child: CitiesList(filtedList: cityScreenArgumentsFiltered)
          )
        ],
      )
    );
  }
}
