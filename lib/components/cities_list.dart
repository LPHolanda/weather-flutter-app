import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/models/city_screen_arguments.dart';

class CitiesList extends StatefulWidget {
  const CitiesList({super.key, required this.filtedList});

  final List<CityScreenArguments> filtedList;

  @override
  State<CitiesList> createState() => _ListComponentState();
}

class _ListComponentState extends State<CitiesList> {
  late CityScreenArguments cityScreenArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.filtedList.length,
        itemBuilder: (BuildContext context, int index) { 
          return ListTile(
            title: Center(child: Text(widget.filtedList[index].name)),
            onTap: () => setState(() {
              cityScreenArguments = widget.filtedList[index];
              Navigator.pushNamed(
                context,
                '/weather',
                arguments: cityScreenArguments
              );
            }),
          );
        },
      )
    );
  }
}
