import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_mobile_engineer_test_1/main.dart';

void main() {
  testWidgets('utilizou a MyHomePage como rota principal e exibiu o título na Appbar', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ROCK THAT WEATHER'), findsOneWidget);
  });

  testWidgets('exibiu uma lista com todas as cidades', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Silverstone, UK'), findsOneWidget);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsOneWidget);
  });

  testWidgets('ao digitar o nome de uma cidade no TextField, a lista é filtrada', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Silverstone, UK'), findsOneWidget);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsOneWidget);

    await tester.tap(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'São Paulo');
    await tester.pump();

    expect(find.text('Silverstone, UK'), findsNothing);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsNothing);
    expect(find.text('Monte Carlo, Monaco'), findsNothing);

    await tester.tap(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'Australia');
    await tester.pump();

    expect(find.text('Silverstone, UK'), findsNothing);
    expect(find.text('São Paulo, Brazil'), findsNothing);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsNothing);
  });

  testWidgets('ao clicar no ícone clear do TextField o texto inserido é apagado e a lista exibe todas as cidades', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Silverstone, UK'), findsOneWidget);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsOneWidget);

    await tester.tap(find.byType(TextField));
    await tester.enterText(find.byType(TextField), 'São Paulo');
    await tester.pump();

    expect(find.text('Silverstone, UK'), findsNothing);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsNothing);
    expect(find.text('Monte Carlo, Monaco'), findsNothing);

    await tester.tap(find.byType(TextField));
    await tester.tap(find.byIcon(Icons.clear));
    await tester.pump();

    expect(find.text('Silverstone, UK'), findsOneWidget);
    expect(find.text('São Paulo, Brazil'), findsOneWidget);
    expect(find.text('Melbourne, Australia'), findsOneWidget);
    expect(find.text('Monte Carlo, Monaco'), findsOneWidget);
  });

}
