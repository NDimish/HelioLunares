import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListTile.dart';
import 'package:university_ticketing_system/user_hub/widgets/EventsList/EventListView.dart';
import 'dart:io';
void main(){
  setUpAll(() => {HttpOverrides.global = null}); 
  group("EventListView tests", () { 
    testWidgets("EventListView is of type EventListView", (tester) async{
      await tester.pumpWidget(MaterialApp(
        home:Scaffold(
          body:EventListView()
        )
      ));
      final typeFinder = find.byType(EventListView);

      await tester.pumpAndSettle();

      expect(typeFinder, findsOneWidget);
    });
    // testWidgets("EventListView has child of EventListTile type", (tester) async{
    //   await tester.pumpWidget(MaterialApp(
    //     home:Scaffold(
    //       body:EventListView()
    //     )
    //   ));
    //   final childFinder = find.byType(EventListTile);

    //   await tester.pumpAndSettle();

    //   expect(childFinder, findsWidgets);
    // });
  });
  
}