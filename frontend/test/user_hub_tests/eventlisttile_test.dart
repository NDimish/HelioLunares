import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart';
import 'package:flutter/material.dart';
import 'dart:io';
void main(){
  setUpAll(() => {HttpOverrides.global = null}); 
  var testname = "EventName";
  var testprice = 0.0;
  var testdate = "12-12-2023";
  var testlocation = "New York";
  var testorg = "Nameless";
  testWidgets(
    "EventListTile has name, price, date, location, and organisation", 
    (tester) async {
      await tester.pumpWidget(
         MaterialApp(
          home:Scaffold(
            body: ListView(
              children: [
                EventListTile(
                  eventName: testname, 
                  price: testprice, 
                  dateTime: testdate, 
                  location: testlocation, 
                  org: testorg,
                  eventID: 0,
                )
              ],
            ),
          )
        )
        );

        final nameFinder = find.text("EventName");
        final locFinder = find.text("New York");
        final orgFinder = find.text("Nameless");
        final widgetFinder = find.byType(EventListTile);

        expect(nameFinder, findsOneWidget);
        expect(locFinder, findsOneWidget);
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
                EventListTile(
                  eventName: testname, 
                  price: testprice, 
                  dateTime: testdate, 
                  location: testlocation, 
                  org: testorg,
                  eventID: 0,
                )
              ],
            ),
          )
        )
      );

      final finder = find.byType(EventListTile);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);

    }
  );
}