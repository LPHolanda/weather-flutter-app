import 'package:weather_mobile_engineer_test_1/models/city_screen_arguments.dart';

List<CityScreenArguments> filterNextConcertCities(String searchValue, List<CityScreenArguments> cityScreenArgumentsList, List<CityScreenArguments> cityScreenArgumentsFiltered) {
  return cityScreenArgumentsFiltered = cityScreenArgumentsList
    .where((item) => item.name.toLowerCase().contains(searchValue.toLowerCase()))
    .toList();
}