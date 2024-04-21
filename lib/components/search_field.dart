import 'package:flutter/material.dart';
import 'package:weather_mobile_engineer_test_1/models/city_screen_arguments.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key, 
    required this.label, 
    required this.cityScreenArgumentsList,
    required this.updateFilteredList
  });

  final String label;
  final List<CityScreenArguments> cityScreenArgumentsList;
  final Function(String) updateFilteredList;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  String searchCity = '';
  final searchField = TextEditingController();
  
  void clearSearchField() {
    searchField.clear();
    widget.updateFilteredList('');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: searchField,
          onChanged: (value) => setState(() {
            searchCity = value;
            widget.updateFilteredList(value);
          }),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                clearSearchField();
              }),
              icon: const Icon(Icons.clear)
            ),
            labelText: widget.label,
            border: const OutlineInputBorder()
          ),
        ),
      ) 
    );
  }
}
