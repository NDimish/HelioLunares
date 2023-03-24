import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/constants/style.dart';
import 'package:university_ticketing_system/widgets/custom_text.dart';

void main() {
  group('CustomText widget tests', () {
    testWidgets('CustomText can be instantiated with required parameters',
        (WidgetTester tester) async {
      // ignore: prefer_const_constructors
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Container(
          child: CustomText(text: "Hello World", colour: Colors.pink, size: 20),
        )),
      ));

      final customTextFinder = find.text("Hello World");
      expect(customTextFinder, findsOneWidget);
    });

    testWidgets('CustomText can be instantiated with all parameters',
        (WidgetTester tester) async {
      final text = 'Hello World';
      final size = 18.0;
      final color = Colors.red;
      final fontWeight = FontWeight.bold;
      final textAlign = TextAlign.center;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Container(
          child: CustomText(
            text: text,
            size: size,
            colour: Colors.red,
            weight: fontWeight,
            align: textAlign,
          ),
        )),
      ));

      final customTextFinder = find.text(text);
      expect(customTextFinder, findsOneWidget);

      final customTextStyle = tester.widget<Text>(customTextFinder).style;

      expect(customTextStyle?.fontSize, equals(size));
      expect(customTextStyle?.color, equals(Colors.red));
      expect(customTextStyle?.fontWeight, equals(fontWeight));
    });

    testWidgets(
        'CustomText uses default values for optional parameters when not provided',
        (WidgetTester tester) async {
      final text = 'Hello World';

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
            body: Container(
          child: CustomText(text: text),
        )),
      ));

      final customTextFinder = find.text(text);
      expect(customTextFinder, findsOneWidget);

      final customTextStyle = tester.widget<Text>(customTextFinder).style;
      expect(customTextStyle?.fontFamily, equals('Arvo'));
      expect(customTextStyle?.fontSize, equals(16.0));
      expect(customTextStyle?.color, equals(Colors.black.withOpacity(0.75)));
      expect(customTextStyle?.fontWeight, equals(FontWeight.normal));
    });
  });
}
