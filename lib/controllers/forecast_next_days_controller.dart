import 'package:weather_mobile_engineer_test_1/controllers/is_same_date_controller.dart';
import 'package:weather_mobile_engineer_test_1/models/forecast_model.dart';

void setNextDaysTemp(Future<Forecast> futureForecast, List<double> maxTempList, List<double> minTempList) async {
    final today = DateTime.now();
    // ignore: prefer_typing_uninitialized_variables
    var date;
    // ignore: prefer_typing_uninitialized_variables
    var maxTemp;
    // ignore: prefer_typing_uninitialized_variables
    var minTemp;
    
    futureForecast.then((value) => value.list!.asMap().forEach((index, value) {
      if (index == 39) { //última iteração
          maxTempList.add(maxTemp);
          minTempList.add(minTemp);

      } else if (isSameDateController(today, DateTime.parse(value.dtTxt as String)) || DateTime.parse(value.dtTxt as String).isBefore(today)) { // se for a data de hoje ou anterior, não faz nada
      } else if (!isSameDateController(today, DateTime.parse(value.dtTxt as String))) {
        if (date == null ) { // se for nulo (primeira iteração)
          date = DateTime.parse(value.dtTxt as String);
          maxTemp = value.main!.tempMax;
          minTemp = value.main!.tempMin;

        } else if (!isSameDateController(date, DateTime.parse(value.dtTxt as String))) { // se a data guardada não é igual a data da iteração atual então a lista de dias acabou e já podemos guardar a tempMin e tempMax
          date = DateTime.parse(value.dtTxt as String);
          maxTempList.add(maxTemp);
          minTempList.add(minTemp);
          maxTemp = value.main!.tempMax;
          minTemp = value.main!.tempMin;

        } else { // o valor das variáveis de fora do loop correspondem ao mesmo dia da iteração atual
          if (value.main!.tempMax > maxTemp) maxTemp = value.main!.tempMax;
          if (value.main!.tempMin < minTemp) minTemp = value.main!.tempMin;
        }
      }
    }));
  }