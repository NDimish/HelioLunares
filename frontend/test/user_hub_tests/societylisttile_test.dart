import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/SocietiesList/SocietyListTile.dart';
import 'dart:io';
void main(){
  setUpAll(() => {HttpOverrides.global = null}); 
  var testname = "SocName";
  var testlocation = "Test summary";
  var testuni = "Test Uni";
  testWidgets(
    "SocietyListTile has name, price, date, location, and organisation", 
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
                  societyID: 0,
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
  testWidgets( //This will fail
    "EventListTile onTap test", 
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
                  societyID: 0,
                )
              ],
            ),
          )
        )
      );

      final finder = find.byType(SocietyListTile);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);

    }
  );
}