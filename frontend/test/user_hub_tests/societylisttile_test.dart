import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListTile.dart';

void main(){
  var testname = "SocName";
  var testlocation = "Test summary";
  var testuni = "Test Uni";
  testWidgets(
    "EventListTile has name, price, date, location, and organisation", 
    (tester) async {
      await tester.pumpWidget(
         MaterialApp(
          home:Scaffold(
            body: ListView(
              children: [
                SocietyListTile(
                  societyName: testname,
                  summary: testlocation,
                  uni: testuni,
                )
              ],
            ),
          )
        )
        );

        final nameFinder = find.text("SocName");
        final summaryFinder = find.text("Test summary");
        final orgFinder = find.text("Test Uni");
        final widgetFinder = find.byType(SocietyListTile);

        expect(nameFinder, findsOneWidget);
        expect(summaryFinder, findsOneWidget);
        expect(orgFinder, findsOneWidget);
        expect(widgetFinder, findsOneWidget);
    }
  );
}